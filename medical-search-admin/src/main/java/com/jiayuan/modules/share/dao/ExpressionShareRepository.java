package com.jiayuan.modules.share.dao;

import com.jiayuan.modules.share.entity.ExpressionShareRecord;
import com.jiayuan.modules.share.dto.ExpressionSharePageQuery;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
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

    public long countMine(Long userId, ExpressionSharePageQuery query) {
        SqlFilter filter = mineFilter(userId, query);
        return count("SELECT COUNT(*) FROM cbdses_expression_share s" + filter.where, filter.params);
    }

    public List<ExpressionShareRecord> pageMine(Long userId, ExpressionSharePageQuery query,
                                                 long offset, int pageSize) {
        SqlFilter filter = mineFilter(userId, query);
        String baseSql = "SELECT s.* FROM cbdses_expression_share s" + filter.where;
        return pageQuery(baseSql, shareOrderBy(query, "updatedAt"), mapper,
                filter.params, offset, pageSize);
    }

    public long countReceived(Long userId, String groupCode, String organizationCode,
                              ExpressionSharePageQuery query) {
        SqlFilter filter = receivedFilter(userId, groupCode, organizationCode, query);
        return count("SELECT COUNT(*) FROM cbdses_expression_share s" + filter.where, filter.params);
    }

    public List<ExpressionShareRecord> pageReceived(Long userId, String groupCode, String organizationCode,
                                                     ExpressionSharePageQuery query,
                                                     long offset, int pageSize) {
        SqlFilter filter = receivedFilter(userId, groupCode, organizationCode, query);
        String baseSql = "SELECT s.* FROM cbdses_expression_share s" + filter.where;
        return pageQuery(baseSql, shareOrderBy(query, "updatedAt"), mapper,
                filter.params, offset, pageSize);
    }

    private SqlFilter mineFilter(Long userId, ExpressionSharePageQuery query) {
        SqlFilter filter = new SqlFilter();
        filter.where.append(" WHERE s.owner_id = ?");
        filter.params.add(userId);
        appendKeyword(filter, "s", query.getKeyword());

        if ("ACTIVE".equals(query.getStatus())) {
            filter.where.append(" AND s.status = 'ACTIVE' AND s.expires_at > CURRENT_TIMESTAMP");
        } else if ("EXPIRED".equals(query.getStatus())) {
            filter.where.append(" AND s.status = 'ACTIVE' AND s.expires_at <= CURRENT_TIMESTAMP");
        } else if ("REVOKED".equals(query.getStatus())) {
            filter.where.append(" AND s.status = 'REVOKED'");
        }

        appendEqualFilter(filter, "s.scope", query.getScope());
        appendEqualFilter(filter, "s.permission", query.getPermission());
        return filter;
    }

    private SqlFilter receivedFilter(Long userId, String groupCode, String organizationCode,
                                     ExpressionSharePageQuery query) {
        SqlFilter filter = new SqlFilter();
        filter.where.append(" WHERE s.owner_id <> ? AND s.status = 'ACTIVE' ");
        filter.where.append("AND s.expires_at > CURRENT_TIMESTAMP ");
        filter.where.append("AND s.group_code = ? AND s.organization_code = ? ");
        filter.where.append("AND (s.scope = 'HOSPITAL' OR (s.scope = 'USERS' AND EXISTS ");
        filter.where.append("(SELECT 1 FROM cbdses_expression_share_member m ");
        filter.where.append("WHERE m.share_id = s.id AND m.user_id = ?)))");
        filter.params.add(userId);
        filter.params.add(groupCode);
        filter.params.add(organizationCode);
        filter.params.add(userId);

        appendKeyword(filter, "s", query.getKeyword());
        appendEqualFilter(filter, "s.scope", query.getScope());
        appendEqualFilter(filter, "s.permission", query.getPermission());
        if (query.getSharerId() != null) {
            filter.where.append(" AND s.owner_id = ?");
            filter.params.add(query.getSharerId());
        }
        return filter;
    }

    private SqlFilter favoritesFilter(Long userId, ExpressionSharePageQuery query) {
        SqlFilter filter = new SqlFilter();
        filter.where.append(" WHERE f.user_id = ?");
        filter.params.add(userId);
        appendKeyword(filter, "f", query.getKeyword());

        if ("SELF".equals(query.getSource())) {
            filter.where.append(" AND f.origin_share_id IS NULL");
        } else if ("SHARED".equals(query.getSource())) {
            filter.where.append(" AND f.origin_share_id IS NOT NULL");
        }
        return filter;
    }

    private void appendKeyword(SqlFilter filter, String alias, String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return;
        }
        String pattern = "%" + keyword.trim().toLowerCase(Locale.ROOT) + "%";
        filter.where.append(" AND (LOWER(").append(alias).append(".title) LIKE ? ");
        filter.where.append("OR LOWER(").append(alias).append(".expression) LIKE ?)");
        filter.params.add(pattern);
        filter.params.add(pattern);
    }

    private void appendEqualFilter(SqlFilter filter, String column, String value) {
        if (value == null || value.trim().isEmpty()) {
            return;
        }
        filter.where.append(" AND ").append(column).append(" = ?");
        filter.params.add(value);
    }

    private long count(String sql, List<Object> params) {
        Long total = jdbc.queryForObject(sql, Long.class, params.toArray());
        return total == null ? 0L : total;
    }

    private <T> List<T> pageQuery(String baseSql, String orderBy, RowMapper<T> rowMapper,
                                  List<Object> params, long offset, int pageSize) {
        String sql = "SELECT * FROM (SELECT page_source.*, ROW_NUMBER() OVER (ORDER BY " +
                orderBy + ") AS rn FROM (" + baseSql + ") page_source) " +
                "WHERE rn > ? AND rn <= ? ORDER BY rn";
        List<Object> pageParams = new ArrayList<>(params);
        pageParams.add(offset);
        pageParams.add(offset + pageSize);
        return jdbc.query(sql, rowMapper, pageParams.toArray());
    }

    private String shareOrderBy(ExpressionSharePageQuery query, String defaultField) {
        String field = query.getSortField() == null || query.getSortField().trim().isEmpty()
                ? defaultField : query.getSortField();
        String column;
        if ("createdAt".equals(field)) {
            column = "page_source.created_at";
        } else if ("expiresAt".equals(field)) {
            column = "page_source.expires_at";
        } else if ("title".equals(field)) {
            column = "LOWER(page_source.title)";
        } else {
            column = "page_source.updated_at";
        }
        String direction = "ASC".equalsIgnoreCase(query.getSortOrder()) ? "ASC" : "DESC";
        return column + " " + direction + ", page_source.id ASC";
    }

    private String favoriteOrderBy(ExpressionSharePageQuery query) {
        String column = "title".equals(query.getSortField())
                ? "LOWER(page_source.title)" : "page_source.created_at";
        String direction = "ASC".equalsIgnoreCase(query.getSortOrder()) ? "ASC" : "DESC";
        return column + " " + direction + ", page_source.id ASC";
    }

    private static class SqlFilter {
        private final StringBuilder where = new StringBuilder();
        private final List<Object> params = new ArrayList<>();
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
        String like = "%" + keyword.toLowerCase(Locale.ROOT) + "%";
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

    /**
     * 查询当前用户实际可见的分享人，避免把无关人员暴露到筛选选项中。
     */
    public List<Map<String, Object>> findReceivedSharers(
            String keyword, String groupCode, String organizationCode, Long currentUserId) {
        String like = "%" + keyword.toLowerCase(Locale.ROOT) + "%";
        String sql = "SELECT * FROM (SELECT DISTINCT u.user_id, u.user_name, u.login_id " +
                "FROM cbdses_expression_share s " +
                "INNER JOIN sys_user u ON u.user_id = s.owner_id AND u.sys_id = 'CBDSES' " +
                "WHERE s.owner_id <> ? AND s.status = 'ACTIVE' " +
                "AND s.expires_at > CURRENT_TIMESTAMP " +
                "AND s.group_code = ? AND s.organization_code = ? " +
                "AND (s.scope = 'HOSPITAL' OR (s.scope = 'USERS' AND EXISTS " +
                "(SELECT 1 FROM cbdses_expression_share_member m " +
                "WHERE m.share_id = s.id AND m.user_id = ?))) " +
                "AND (LOWER(u.user_name) LIKE ? OR LOWER(u.login_id) LIKE ?) " +
                "ORDER BY u.user_name, u.user_id) WHERE ROWNUM <= 20";
        return jdbc.query(sql, (rs, rowNum) -> {
            Map<String, Object> user = new LinkedHashMap<>();
            user.put("userId", rs.getLong("user_id"));
            user.put("userName", rs.getString("user_name"));
            user.put("loginId", rs.getString("login_id"));
            return user;
        }, currentUserId, groupCode, organizationCode, currentUserId, like, like);
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

    public long countFavorites(Long userId, ExpressionSharePageQuery query) {
        SqlFilter filter = favoritesFilter(userId, query);
        return count("SELECT COUNT(*) FROM cbdses_expression_favorite f" + filter.where, filter.params);
    }

    public List<Map<String, Object>> pageFavorites(Long userId, ExpressionSharePageQuery query,
                                                    long offset, int pageSize) {
        SqlFilter filter = favoritesFilter(userId, query);
        String baseSql = "SELECT f.id, f.title, f.expression, f.origin_share_id, f.created_at " +
                "FROM cbdses_expression_favorite f" + filter.where;
        RowMapper<Map<String, Object>> rowMapper = (rs, rowNum) -> {
            Map<String, Object> item = new LinkedHashMap<>();
            item.put("id", rs.getString("id"));
            item.put("title", rs.getString("title"));
            item.put("expression", rs.getString("expression"));
            item.put("originShareId", rs.getString("origin_share_id"));
            item.put("createdAt", rs.getTimestamp("created_at"));
            return item;
        };
        return pageQuery(baseSql, favoriteOrderBy(query), rowMapper,
                filter.params, offset, pageSize);
    }

    public boolean deleteFavorite(String id, Long userId) {
        return jdbc.update("DELETE FROM cbdses_expression_favorite WHERE id = ? AND user_id = ?",
                id, userId) == 1;
    }
}
