package com.jiayuan.modules.template.dto;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jiayuan.common.exception.BizException;
import lombok.Data;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
public class TemplateSearchConfig {
    private static final ObjectMapper MAPPER = new ObjectMapper();

    private Integer dimension;
    private String scopeExpression;
    /**
     * 多字段排序，数组顺序即排序优先级。
     */
    private List<Sort> sorts;
    /**
     * 兼容历史模板中的单字段排序配置。
     */
    private Sort sort;
    private Integer pageSize;
    private String viewMode;
    private List<Column> columns;

    @Data
    public static class Sort {
        private String tableCode;
        private String fieldCode;
        private String mode;
    }

    @Data
    public static class Column {
        private String tableCode;
        private String fieldCode;
    }

    public List<Sort> getEffectiveSorts() {
        if (sorts != null && !sorts.isEmpty()) {
            return sorts;
        }
        return sort == null ? Collections.emptyList() : Collections.singletonList(sort);
    }

    public static TemplateSearchConfig parse(String json) {
        if (json == null || json.trim().isEmpty()) {
            return null;
        }
        if (json.getBytes(java.nio.charset.StandardCharsets.UTF_8).length > 3800) {
            throw new BizException("模板检索参数超过长度限制");
        }
        try {
            TemplateSearchConfig config = MAPPER.readValue(json, TemplateSearchConfig.class);
            if (config == null) {
                throw new BizException("模板检索参数不能为空对象");
            }
            config.validate();
            return config;
        } catch (JsonProcessingException e) {
            throw new BizException("模板检索参数格式错误", e);
        }
    }

    private void validateSort(Sort item) {
        if (item == null || !"ms_visit_record".equals(item.getTableCode())
                || item.getFieldCode() == null || item.getFieldCode().trim().isEmpty()
                || (!"asc".equals(item.getMode()) && !"desc".equals(item.getMode()))) {
            throw new BizException("排序仅支持就诊主表中的字段");
        }
    }

    private void validate() {
        if (dimension != null && dimension != 0 && dimension != 1) {
            throw new BizException("检索维度不合法");
        }
        if (pageSize != null && pageSize != 10 && pageSize != 20
                && pageSize != 50 && pageSize != 100) {
            throw new BizException("每页显示数量只支持10、20、50或100");
        }
        if (viewMode != null && !"TABLE".equals(viewMode) && !"CARD".equals(viewMode)) {
            throw new BizException("结果展示形式不合法");
        }
        if (scopeExpression != null && !scopeExpression.trim().isEmpty()) {
            if (scopeExpression.length() > 600
                    || scopeExpression.matches("(?s).*\\s+(AND|OR)\\s+.*")
                    || scopeExpression.contains("(") || scopeExpression.contains(")")) {
                throw new BizException("检索范围只能设置一个附加条件");
            }
        }
        if (sort != null) {
            validateSort(sort);
        }
        if (sorts != null) {
            if (sorts.size() > 5) {
                throw new BizException("排序字段最多支持5个");
            }
            Set<String> sortFields = new HashSet<>();
            for (Sort item : sorts) {
                validateSort(item);
                String key = item.getTableCode() + ":" + item.getFieldCode();
                if (!sortFields.add(key)) {
                    throw new BizException("排序字段不能重复");
                }
            }
        }
        if (columns != null) {
            if (columns.size() > 20) {
                throw new BizException("结果展示字段最多支持20个");
            }
            Set<String> codes = new HashSet<>();
            for (Column column : columns) {
                if (column == null || !"ms_visit_record".equals(column.getTableCode())
                        || column.getFieldCode() == null || column.getFieldCode().trim().isEmpty()
                        || !codes.add(column.getFieldCode())) {
                    throw new BizException("结果展示字段不合法或重复");
                }
            }
        }
    }
}
