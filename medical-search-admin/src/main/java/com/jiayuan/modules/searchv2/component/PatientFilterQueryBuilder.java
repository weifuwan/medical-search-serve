package com.jiayuan.modules.searchv2.component;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.searchv2.dto.PatientFilterDTO;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.stereotype.Component;

import java.util.Locale;

/** Builds safe Elasticsearch filters for ms_visit_record fields. */
@Component
public class PatientFilterQueryBuilder {

    private static final long ONE_YEAR_SECONDS = 365L * 24 * 60 * 60;

    public QueryBuilder build(PatientFilterDTO filter, TableFieldInfo field) {
        if (filter == null || field == null) {
            throw new BizException("筛选条件不能为空");
        }

        String operator = normalizeOperator(filter.getOperator());
        String fieldCode = field.getFieldCode();
        String queryField = getQueryField(field);
        String value = filter.getValue();

        switch (operator) {
            case "IS_NOT_NULL":
                return QueryBuilders.existsQuery(queryField);
            case "EQ":
                return QueryBuilders.termQuery(queryField, normalizeValue(field, requireValue(value)));
            case "NE":
                return QueryBuilders.boolQuery().mustNot(
                        QueryBuilders.termQuery(queryField, normalizeValue(field, requireValue(value))));
            case "GT":
                return QueryBuilders.rangeQuery(queryField).gt(normalizeValue(field, requireValue(value)));
            case "GE":
                return QueryBuilders.rangeQuery(queryField).gte(normalizeValue(field, requireValue(value)));
            case "LT":
                return QueryBuilders.rangeQuery(queryField).lt(normalizeValue(field, requireValue(value)));
            case "LE":
                return QueryBuilders.rangeQuery(queryField).lte(normalizeValue(field, requireValue(value)));
            case "BETWEEN":
                String[] range = resolveRange(value, filter.getSecondValue());
                return QueryBuilders.rangeQuery(queryField)
                        .gte(normalizeValue(field, range[0]))
                        .lte(normalizeValue(field, range[1]));
            case "LIKE":
                if (isAgeField(field)) {
                    throw new BizException("年龄字段不支持 LIKE 查询");
                }
                String keyword = requireValue(value);
                String wildcard = keyword.contains("*") ? keyword : "*" + keyword + "*";
                return QueryBuilders.wildcardQuery(queryField, wildcard);
            case "PREFIX":
                if (isAgeField(field)) {
                    throw new BizException("年龄字段不支持 PREFIX 查询");
                }
                return QueryBuilders.prefixQuery(queryField, requireValue(value).replace("*", ""));
            case "NOT_CONTAIN":
                if (isAgeField(field)) {
                    throw new BizException("年龄字段不支持 NOT_CONTAIN 查询");
                }
                BoolQueryBuilder notContain = QueryBuilders.boolQuery();
                notContain.mustNot(QueryBuilders.matchPhraseQuery(fieldCode, requireValue(value)));
                return notContain;
            default:
                throw new BizException("不支持的筛选操作符: " + filter.getOperator());
        }
    }

    public String getQueryField(TableFieldInfo field) {
        if (isAgeField(field)) {
            return "age_seconds";
        }
        String fieldType = field.getFieldType();
        if ("text".equalsIgnoreCase(fieldType)
                || "varchar".equalsIgnoreCase(fieldType)
                || "string".equalsIgnoreCase(fieldType)) {
            return field.getFieldCode() + ".keyword";
        }
        return field.getFieldCode();
    }

    private String normalizeOperator(String operator) {
        if (StringUtils.isBlank(operator)) {
            throw new BizException("筛选操作符不能为空");
        }
        String normalized = operator.trim().toUpperCase(Locale.ROOT).replaceAll("\\s+", "_");
        switch (normalized) {
            case "=": return "EQ";
            case "!=": return "NE";
            case ">": return "GT";
            case ">=": return "GE";
            case "<": return "LT";
            case "<=": return "LE";
            case "<>": return "NOT_CONTAIN";
            default: return normalized;
        }
    }

    private String requireValue(String value) {
        if (StringUtils.isBlank(value)) {
            throw new BizException("筛选值不能为空");
        }
        return value.trim();
    }

    private String[] resolveRange(String value, String secondValue) {
        if (StringUtils.isNotBlank(value) && StringUtils.isNotBlank(secondValue)) {
            return new String[]{value.trim(), secondValue.trim()};
        }
        if (StringUtils.isNotBlank(value)) {
            String[] parts = value.split(",", 2);
            if (parts.length == 2 && StringUtils.isNotBlank(parts[0]) && StringUtils.isNotBlank(parts[1])) {
                return new String[]{parts[0].trim(), parts[1].trim()};
            }
        }
        throw new BizException("BETWEEN 查询需要提供起始值和结束值");
    }

    private String normalizeValue(TableFieldInfo field, String value) {
        if (!isAgeField(field)) {
            return value;
        }
        try {
            return String.valueOf(Math.round(Double.parseDouble(value) * ONE_YEAR_SECONDS));
        } catch (NumberFormatException e) {
            throw new BizException("年龄格式不正确，只支持数字", e);
        }
    }

    private boolean isAgeField(TableFieldInfo field) {
        return "ms_visit_record".equalsIgnoreCase(field.getTableCode())
                && "age".equalsIgnoreCase(field.getFieldCode());
    }
}
