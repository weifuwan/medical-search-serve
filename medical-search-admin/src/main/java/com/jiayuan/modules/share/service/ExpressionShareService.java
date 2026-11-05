package com.jiayuan.modules.share.service;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.share.dao.ExpressionShareRepository;
import com.jiayuan.modules.share.dto.ExpressionShareRequest;
import com.jiayuan.modules.share.entity.ExpressionShareRecord;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@Service
public class ExpressionShareService {
    private final ExpressionShareRepository repository;

    public ExpressionShareService(ExpressionShareRepository repository) {
        this.repository = repository;
    }

    private UserDetail actor() {
        UserDetail user = SecurityUser.getUser();
        if (user.getUserId() == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "请先登录");
        }
        return user;
    }

    private static void validateContent(String title, String expression) {
        if (title == null || title.trim().isEmpty() || title.length() > 120) {
            throw new BizException("请输入不超过120字的分享标题");
        }
        if (expression == null || expression.trim().isEmpty()
                || expression.getBytes(StandardCharsets.UTF_8).length > 3800) {
            throw new BizException("检索表达式不能为空，且不得超过3800字节");
        }
    }

    private static String scope(String scope) {
        if ("USERS".equals(scope) || "HOSPITAL".equals(scope)) {
            return scope;
        }
        throw new BizException("只能分享给指定人员或本院登录人员");
    }

    private static String permission(String permission) {
        if ("READ".equals(permission) || "EDIT".equals(permission)) {
            return permission;
        }
        throw new BizException("分享权限必须是 READ 或 EDIT");
    }

    private static Timestamp expiration(Integer days) {
        if (days == null || (days != 1 && days != 7 && days != 30)) {
            throw new BizException("分享有效期只能为1、7或30天");
        }
        return Timestamp.from(Instant.now().plus(days, ChronoUnit.DAYS));
    }

    private List<Long> checkedMembers(ExpressionShareRequest request, UserDetail actor, String scope) {
        if ("HOSPITAL".equals(scope)) {
            return Collections.emptyList();
        }
        List<Long> users = request.getUserIds() == null ? Collections.emptyList() :
                new ArrayList<>(new LinkedHashSet<>(request.getUserIds()));
        if (users.isEmpty() || users.size() > 50) {
            throw new BizException("请指定1至50位接收人");
        }
        for (Long id : users) {
            if (id == null || id.equals(actor.getUserId()) ||
                    !repository.userInOrganization(id, actor.getGroupCode(), actor.getOrganizationCode())) {
                throw new BizException("接收人不存在或不属于当前院区");
            }
        }
        return users;
    }

    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> create(ExpressionShareRequest input) {
        UserDetail user = actor();
        validateContent(input.getTitle(), input.getExpression());
        String shareScope = scope(input.getScope());
        String access = permission(input.getPermission());
        List<Long> members = checkedMembers(input, user, shareScope);

        ExpressionShareRecord share = new ExpressionShareRecord();
        share.setId(UUID.randomUUID().toString());
        share.setCode(UUID.randomUUID().toString().replace("-", ""));
        share.setTitle(input.getTitle().trim());
        share.setExpression(input.getExpression().trim());
        share.setOwnerId(user.getUserId());
        share.setGroupCode(user.getGroupCode());
        share.setOrganizationCode(user.getOrganizationCode());
        share.setScope(shareScope);
        share.setPermission(access);
        share.setExpiresAt(expiration(input.getExpiresInDays()));
        repository.insert(share);
        repository.replaceMembers(share.getId(), members, access);
        repository.audit(share.getId(), user.getUserId(), "CREATE");
        return detail(share.getCode(), false);
    }

    private ExpressionShareRecord get(String code) {
        ExpressionShareRecord record = repository.find(code);
        if (record == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "分享不存在");
        }
        return record;
    }

    private boolean owner(ExpressionShareRecord record, UserDetail user) {
        return Objects.equals(record.getOwnerId(), user.getUserId());
    }

    private String memberPermission(ExpressionShareRecord record, UserDetail user) {
        if ("HOSPITAL".equals(record.getScope())) {
            if (Objects.equals(record.getGroupCode(), user.getGroupCode()) &&
                    Objects.equals(record.getOrganizationCode(), user.getOrganizationCode())) {
                return record.getPermission();
            }
            return null;
        }
        return repository.memberPermission(record.getId(), user.getUserId());
    }

    private void authorize(ExpressionShareRecord record, UserDetail user, boolean edit) {
        if (!"ACTIVE".equals(record.getStatus()) ||
                (record.getExpiresAt() != null && !record.getExpiresAt().toInstant().isAfter(Instant.now()))) {
            throw new ResponseStatusException(HttpStatus.GONE, "分享已失效或被撤销");
        }
        if (owner(record, user)) {
            return;
        }
        String granted = memberPermission(record, user);
        if (granted == null || (edit && !"EDIT".equals(granted))) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "无权访问该分享");
        }
    }

    private Map<String, Object> view(ExpressionShareRecord record, UserDetail user) {
        boolean isOwner = owner(record, user);
        String granted = isOwner ? "EDIT" : memberPermission(record, user);
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("id", record.getId());
        m.put("code", record.getCode());
        m.put("title", record.getTitle());
        m.put("expression", record.getExpression());
        m.put("ownerId", record.getOwnerId());
        m.put("scope", record.getScope());
        m.put("permission", record.getPermission());
        m.put("status", record.getStatus());
        m.put("expiresAt", record.getExpiresAt());
        m.put("createdAt", record.getCreatedAt());
        m.put("updatedAt", record.getUpdatedAt());
        m.put("version", record.getVersion());
        m.put("canManage", isOwner);
        m.put("canEdit", isOwner || "EDIT".equals(granted));
        if (isOwner) {
            m.put("userIds", repository.members(record.getId()));
        }
        return m;
    }

    public Map<String, Object> detail(String code, boolean logAccess) {
        UserDetail user = actor();
        ExpressionShareRecord record = get(code);
        authorize(record, user, false);
        if (logAccess) {
            repository.audit(record.getId(), user.getUserId(), "VIEW");
        }
        return view(record, user);
    }

    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> update(String code, ExpressionShareRequest input) {
        UserDetail user = actor();
        ExpressionShareRecord record = get(code);
        authorize(record, user, true);
        validateContent(input.getTitle(), input.getExpression());
        if (input.getVersion() == null) {
            throw new BizException("缺少版本号，请刷新后重试");
        }
        boolean isOwner = owner(record, user);
        if (isOwner) {
            String newScope = scope(input.getScope());
            String newPermission = permission(input.getPermission());
            List<Long> members = checkedMembers(input, user, newScope);
            record.setScope(newScope);
            record.setPermission(newPermission);
            if (input.getExpiresInDays() != null) {
                record.setExpiresAt(expiration(input.getExpiresInDays()));
            }
            record.setTitle(input.getTitle().trim());
            record.setExpression(input.getExpression().trim());
            if (repository.update(record, input.getVersion()) != 1) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "内容已被其他人更新");
            }
            repository.replaceMembers(record.getId(), members, newPermission);
        } else {
            if (input.getScope() != null || input.getPermission() != null ||
                    input.getExpiresInDays() != null || input.getUserIds() != null) {
                throw new ResponseStatusException(HttpStatus.FORBIDDEN, "协作者无权修改分享范围");
            }
            record.setTitle(input.getTitle().trim());
            record.setExpression(input.getExpression().trim());
            if (repository.update(record, input.getVersion()) != 1) {
                throw new ResponseStatusException(HttpStatus.CONFLICT, "内容已被其他人更新");
            }
        }
        repository.audit(record.getId(), user.getUserId(), "EDIT");
        return detail(code, false);
    }

    @Transactional(rollbackFor = Exception.class)
    public void revoke(String code) {
        UserDetail user = actor();
        ExpressionShareRecord record = get(code);
        if (!owner(record, user)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "只有创建人可以撤销分享");
        }
        if (repository.revoke(record.getId(), user.getUserId()) != 1) {
            throw new ResponseStatusException(HttpStatus.GONE, "分享已撤销");
        }
        repository.audit(record.getId(), user.getUserId(), "REVOKE");
    }

    public List<Map<String, Object>> mine() {
        UserDetail user = actor();
        List<Map<String, Object>> result = new ArrayList<>();
        for (ExpressionShareRecord record : repository.mine(user.getUserId())) {
            result.add(view(record, user));
        }
        return result;
    }

    public List<Map<String, Object>> received() {
        UserDetail user = actor();
        List<Map<String, Object>> result = new ArrayList<>();
        for (ExpressionShareRecord record : repository.received(user.getUserId(),
                user.getGroupCode(), user.getOrganizationCode())) {
            result.add(view(record, user));
        }
        return result;
    }

    public List<Map<String, Object>> users(String keyword) {
        UserDetail user = actor();
        if (keyword == null || keyword.trim().length() < 2 || keyword.length() > 40) {
            return Collections.emptyList();
        }
        return repository.findUsers(keyword.trim(), user.getGroupCode(),
                user.getOrganizationCode(), user.getUserId());
    }

    public List<Map<String, Object>> usage(String code) {
        UserDetail user = actor();
        ExpressionShareRecord record = get(code);
        if (!owner(record, user)) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "仅创建人可查看访问记录");
        }
        return repository.usage(record.getId());
    }

    @Transactional(rollbackFor = Exception.class)
    public Map<String, Object> addFavorite(ExpressionShareRequest input, String originCode) {
        UserDetail user = actor();
        String originId = null;
        if (originCode != null && !originCode.isEmpty()) {
            ExpressionShareRecord origin = get(originCode);
            authorize(origin, user, false);
            input.setTitle(origin.getTitle());
            input.setExpression(origin.getExpression());
            originId = origin.getId();
            repository.audit(originId, user.getUserId(), "COPY");
        }
        validateContent(input.getTitle(), input.getExpression());
        String id = UUID.randomUUID().toString();
        repository.favorite(id, user.getUserId(), input.getTitle().trim(),
                input.getExpression().trim(), originId);
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("id", id);
        return m;
    }

    public List<Map<String, Object>> favorites() {
        return repository.favorites(actor().getUserId());
    }

    public void deleteFavorite(String id) {
        if (!repository.deleteFavorite(id, actor().getUserId())) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "收藏不存在");
        }
    }
}
