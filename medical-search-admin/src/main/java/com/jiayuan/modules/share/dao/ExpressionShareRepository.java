package com.jiayuan.modules.share.dao;

import com.jiayuan.modules.share.entity.ExpressionShareRecord;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ExpressionShareRepository {
    private final JdbcTemplate jdbc;

    public ExpressionShareRepository(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    private final RowMapper<ExpressionShareRecord> mapper = (rs, rowNum) -> {
        ExpressionShareRecord share = new ExpressionShareRecord();
        share.setId(rs.getString("id"));
        share.setCode(rs.getString("share_code"));
        share.setTitle(rs.getString("title"));
        share.setExpression(rs.getString("expression"));
        share.setOwnerId(rs.getLong("owner_id"));
        share.setGroupCode(rs.getString("group_code"));
        share.setOrganizationCode(rs.getString("organization_code"));
        share.setScope(rs.getString("scope"));
        share.setPermission(rs.getString("permission"));
        share.setStatus(rs.getString("status"));
        share.setExpiresAt(rs.getTimestamp("expires_at"));
        share.setVersion(rs.getInt("version"));
        share.setCreatedAt(rs.getTimestamp("created_at"));
        share.setUpdatedAt(rs.getTimestamp("updated_at"));
        return share;
    };

    public void insert(ExpressionShareRecord share) {
        jdbc.update("INSERT INTO cbdses_expression_share " +
                        "(id, share_code, title, expression, owner_id, group_code, organization_code, " +
                        "scope, permission, status, expires_at, version, created_at, updated_at) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'ACTIVE', ?, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)",
                share.getId(), share.getCode(), share.getTitle(), share.getExpression(), share.getOwnerId(),
                share.getGroupCode(), share.getOrganizationCode(), share.getScope(), share.getPermission(),
                share.getExpiresAt());
    }

    public ExpressionShareRecord find(String code) {
        List<ExpressionShareRecord> result = jdbc.query(
                "SELECT * FROM cbdses_expression_share WHERE share_code = ?", mapper, code);
        return result.isEmpty() ? null : result.get(0);
    }

    public int update(ExpressionShareRecord share, int expectedVersion) {
        return jdbc.update("UPDATE cbdses_expression_share SET title = ?, expression = ?, scope = ?, " +
                        "permission = ?, expires_at = ?, version = version + 1, updated_at = CURRENT_TIMESTAMP " +
                        "WHERE id = ? AND version = ? AND status = 'ACTIVE'",
                share.getTitle(), share.getExpression(), share.getScope(), share.getPermission(),
                share.getExpiresAt(), share.getId(), expectedVersion);
    }

    public int revoke(String id, Long ownerId) {
        return jdbc.update("UPDATE cbdses_expression_share SET status = 'REVOKED', " +
                        "version = version + 1, updated_at = CURRENT_TIMESTAMP " +
                        "WHERE id = ? AND owner_id = ? AND status = 'ACTIVE'",
                id, ownerId);
    }

    public void replaceMembers(String shareId, List<Long> userIds, String permission) {
        jdbc.update("DELETE FROM cbdses_expression_share_member WHERE share_id = ?", shareId);
        for (Long userId : userIds) {
            jdbc.update("INSERT INTO cbdses_expression_share_member (share_id, user_id, permission) " +
                    "VALUES (?, ?, ?)", shareId, userId, permission);
        }
    }

    public String memberPermission(String shareId, Long userId) {
        List<String> rows = jdbc.query("SELECT permission FROM cbdses_expression_share_member " +
                        "WHERE share_id = ? AND user_id = ?",
                (rs, rowNum) -> rs.getString(1), shareId, userId);
        return rows.isEmpty() ? null : rows.get(0);
    }

    public List<Long> members(String shareId) {
        return jdbc.query("SELECT user_id FROM cbdses_expression_share_member WHERE share_id = ?",
                (rs, rowNum) -> rs.getLong(1), shareId);
    }

    public List<Map<String, Object>> memberUsers(String shareId) {
        return jdbc.query("SELECT m.user_id, u.user_name, u.login_id " +
                        "FROM cbdses_expression_share_member m " +
                        "LEFT JOIN sys_user u ON u.user_id = m.user_id AND u.sys_id = 'CBDSES' " +
                        "WHERE m.share_id = ? ORDER BY m.user_id",
                (rs, rowNum) -> {
                    Map<String, Object> user = new LinkedHashMap<>();
                    user.put("userId", rs.getLong("user_id"));
                    user.put("userName", rs.getString("user_name"));
                    user.put("loginId", rs.getString("login_id"));
                    return user;
                }, shareId);
    }

    public List<ExpressionShareRecord> mine(Long userId) {
        return jdbc.query("SELECT * FROM (SELECT * FROM cbdses_expression_share " +
                        "WHERE owner_id = ? ORDER BY updated_at DESC) WHERE ROWNUM <= 100",
                mapper, userId);
    }

    public List<ExpressionShareRecord> received(Long userId, String groupCode, String organizationCode) {
        return jdbc.query("SELECT * FROM (SELECT s.* FROM cbdses_expression_share s " +
                        "WHERE s.owner_id <> ? AND s.status = 'ACTIVE' " +
                        "AND s.expires_at > CURRENT_TIMESTAMP " +
                        "AND ((s.scope = 'HOSPITAL' AND s.group_code = ? AND s.organization_code = ?) " +
                        "OR (s.scope = 'USERS' AND EXISTS (SELECT 1 FROM cbdses_expression_share_member m " +
                        "WHERE m.share_id = s.id AND m.user_id = ?))) ORDER BY s.updated_at DESC) " +
                        "WHERE ROWNUM <= 100",
                mapper, userId, groupCode, organizationCode, userId);
    }

    public boolean userInOrganization(Long userId, String groupCode, String organizationCode) {
        Integer count = jdbc.queryForObject(
                "SELECT COUNT(*) FROM sys_user WHERE user_id = ? AND sys_id = 'CBDSES' " +
                        "AND group_code = ? AND organization_code = ? AND user_status = '1'",
                Integer.class, userId, groupCode, organizationCode);
        return count != null && count > 0;
    }

    public List<Map<String, Object>> findUsers(
            String keyword, String groupCode, String organizationCode, Long currentUserId) {
        String like = "%" + keyword.toLowerCase() + "%";
        return jdbc.query("SELECT user_id, user_name, login_id FROM sys_user " +
                        "WHERE sys_id = 'CBDSES' AND group_code = ? AND organization_code = ? " +
                        "AND user_status = '1' AND user_id <> ? " +
                        "AND (LOWER(user_name) LIKE ? OR LOWER(login_id) LIKE ?) AND ROWNUM <= 20",
                (rs, rowNum) -> {
                    Map<String, Object> user = new LinkedHashMap<>();
                    user.put("userId", rs.getLong("user_id"));
                    user.put("userName", rs.getString("user_name"));
                    user.put("loginId", rs.getString("login_id"));
                    return user;
                }, groupCode, organizationCode, currentUserId, like, like);
    }

    public void audit(String shareId, Long userId, String action) {
        jdbc.update("INSERT INTO cbdses_expression_share_log " +
                        "(id, share_id, user_id, action, created_at) " +
                        "VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)",
                java.util.UUID.randomUUID().toString(), shareId, userId, action);
    }

    public List<Map<String, Object>> usage(String shareId) {
        return jdbc.query("SELECT * FROM (SELECT l.user_id, u.user_name, l.action, l.created_at " +
                        "FROM cbdses_expression_share_log l " +
                        "LEFT JOIN sys_user u ON u.user_id = l.user_id AND u.sys_id = 'CBDSES' " +
                        "WHERE l.share_id = ? ORDER BY l.created_at DESC) WHERE ROWNUM <= 100",
                (rs, rowNum) -> {
                    Map<String, Object> item = new LinkedHashMap<>();
                    item.put("userId", rs.getLong("user_id"));
                    item.put("userName", rs.getString("user_name"));
                    item.put("action", rs.getString("action"));
                    item.put("createdAt", rs.getTimestamp("created_at"));
                    return item;
                }, shareId);
    }

    public void favorite(String id, Long userId, String title, String expression, String originShareId) {
        jdbc.update("INSERT INTO cbdses_expression_favorite " +
                        "(id, user_id, title, expression, origin_share_id, created_at) " +
                        "VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)",
                id, userId, title, expression, originShareId);
    }

    public List<Map<String, Object>> favorites(Long userId) {
        return jdbc.query("SELECT * FROM (SELECT id, title, expression, origin_share_id, created_at " +
                        "FROM cbdses_expression_favorite WHERE user_id = ? ORDER BY created_at DESC) " +
                        "WHERE ROWNUM <= 100",
                (rs, rowNum) -> {
                    Map<String, Object> item = new LinkedHashMap<>();
                    item.put("id", rs.getString("id"));
                    item.put("title", rs.getString("title"));
                    item.put("expression", rs.getString("expression"));
                    item.put("originShareId", rs.getString("origin_share_id"));
                    item.put("createdAt", rs.getTimestamp("created_at"));
                    return item;
                }, userId);
    }

    public boolean deleteFavorite(String id, Long userId) {
        return jdbc.update("DELETE FROM cbdses_expression_favorite WHERE id = ? AND user_id = ?",
                id, userId) == 1;
    }
}
