package com.jiayuan.modules.searchv2.component;

import com.jiayuan.common.component.DesensitizedComponent;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.search.request.SearchSortDTO;
import com.jiayuan.modules.searchv2.cache.MysqlMetaCache;
import com.jiayuan.modules.searchv2.dto.PatientFilterDTO;
import com.jiayuan.modules.searchv2.dto.PatientListVO;
import com.jiayuan.modules.searchv2.dto.PatientSearchRequest;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.service.TableFieldService;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.composite.CompositeAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.composite.ParsedComposite;
import org.elasticsearch.search.aggregations.bucket.composite.TermsValuesSourceBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.elasticsearch.search.collapse.CollapseBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Patient list/count projection. Matching is performed by SearchV2Component;
 * this component only queries ms_visit_record using the resulting visit_no values.
 */
@Component
public class PatientSearchComponent {

    private static final String VISIT_RECORD_INDEX = EsConstant.MS_VISIT_RECORD;
    private static final String VISIT_NO_FIELD = "visit_no";
    private static final int COMPOSITE_PAGE_SIZE = 1000;
    private static final int TERMS_BATCH_SIZE = 10000;
    private static final int BOOL_GROUP_SIZE = 500;
    private static final int MAX_PAGE_SIZE = 200;
    private static final int MAX_RESULT_WINDOW = 10000;

    @Resource
    private RestHighLevelClient client;

    @Resource
    private MysqlMetaCache mysqlMetaCache;

    @Resource
    private TableFieldService tableFieldService;

    @Resource
    private PatientFilterQueryBuilder filterQueryBuilder;

    public long count(List<String> visitNos, List<PatientFilterDTO> filters) throws IOException {
        if (visitNos == null || visitNos.isEmpty()) {
            return 0L;
        }
        return countUniqueVisitNos(buildQuery(visitNos, filters));
    }

    public PatientListVO list(List<String> visitNos, PatientSearchRequest request) throws IOException {
        int pageNum = request.getPageNum() == null ? 1 : request.getPageNum();
        int pageSize = request.getPageSize() == null ? 10 : request.getPageSize();
        validatePage(pageNum, pageSize);

        if (visitNos == null || visitNos.isEmpty()) {
            return new PatientListVO(Collections.emptyList(), 0L, pageNum, pageSize);
        }

        QueryBuilder query = buildQuery(visitNos, request.getFilters());
        long total = countUniqueVisitNos(query);
        if (total == 0L) {
            return new PatientListVO(Collections.emptyList(), 0L, pageNum, pageSize);
        }

        List<String> includes = resolveFieldCodes(request.getFieldCodes());
        SearchSourceBuilder source = new SearchSourceBuilder()
                .query(query)
                .from((pageNum - 1) * pageSize)
                .size(pageSize)
                .trackTotalHits(true)
                .collapse(new CollapseBuilder("visit_no.keyword"))
                .fetchSource(includes.toArray(new String[0]), new String[0]);

        applySorts(source, request.getSorts());

        SearchResponse response = client.search(
                new org.elasticsearch.action.search.SearchRequest(VISIT_RECORD_INDEX).source(source),
                RequestOptions.DEFAULT
        );

        List<Map<String, Object>> records = new ArrayList<>();
        for (SearchHit hit : response.getHits().getHits()) {
            Map<String, Object> row = hit.getSourceAsMap();
            if (row != null) {
                records.add(new LinkedHashMap<>(row));
            }
        }

        @SuppressWarnings("unchecked")
        List<Map<String, Object>> desensitized =
                (List<Map<String, Object>>) (List<?>) DesensitizedComponent.desensitization(records);

        return new PatientListVO(desensitized, total, pageNum, pageSize);
    }

    private QueryBuilder buildQuery(List<String> visitNos, List<PatientFilterDTO> filters) {
        BoolQueryBuilder query = QueryBuilders.boolQuery()
                .filter(buildVisitNoQuery(visitNos));

        if (filters != null) {
            for (PatientFilterDTO filter : filters) {
                if (filter == null || StringUtils.isBlank(filter.getFieldCode())) {
                    throw new BizException("筛选字段不能为空");
                }
                TableFieldInfo field = resolveField(filter.getFieldCode());
                query.filter(filterQueryBuilder.build(filter, field));
            }
        }
        return query;
    }

    /**
     * Split large terms sets into bounded clauses and combine them as a nested OR tree.
     * This avoids Elasticsearch's per-terms max_terms_count and bool-clause limits.
     */
    private QueryBuilder buildVisitNoQuery(List<String> visitNos) {
        List<QueryBuilder> level = new ArrayList<>();
        for (int start = 0; start < visitNos.size(); start += TERMS_BATCH_SIZE) {
            int end = Math.min(start + TERMS_BATCH_SIZE, visitNos.size());
            level.add(QueryBuilders.termsQuery(
                    VISIT_NO_FIELD + ".keyword", visitNos.subList(start, end)));
        }

        while (level.size() > 1) {
            List<QueryBuilder> nextLevel = new ArrayList<>();
            for (int start = 0; start < level.size(); start += BOOL_GROUP_SIZE) {
                int end = Math.min(start + BOOL_GROUP_SIZE, level.size());
                if (end - start == 1) {
                    nextLevel.add(level.get(start));
                    continue;
                }
                BoolQueryBuilder group = QueryBuilders.boolQuery();
                for (int i = start; i < end; i++) {
                    group.should(level.get(i));
                }
                group.minimumShouldMatch(1);
                nextLevel.add(group);
            }
            level = nextLevel;
        }
        return level.get(0);
    }

    /** Exact unique visit_no count using Composite Aggregation and after_key pagination. */
    private long countUniqueVisitNos(QueryBuilder query) throws IOException {
        long total = 0L;
        Map<String, Object> afterKey = null;

        while (true) {
            CompositeAggregationBuilder aggregation = AggregationBuilders.composite(
                    "unique_visit_no",
                    Collections.singletonList(
                            new TermsValuesSourceBuilder("visit_no").field("visit_no.keyword")
                    )
            ).size(COMPOSITE_PAGE_SIZE);
            if (afterKey != null) {
                aggregation.aggregateAfter(afterKey);
            }

            SearchSourceBuilder source = new SearchSourceBuilder()
                    .query(query)
                    .size(0)
                    .aggregation(aggregation);
            SearchResponse response = client.search(
                    new org.elasticsearch.action.search.SearchRequest(VISIT_RECORD_INDEX).source(source),
                    RequestOptions.DEFAULT
            );

            ParsedComposite parsed = response.getAggregations().get("unique_visit_no");
            if (parsed == null) {
                throw new IOException("Elasticsearch response is missing unique_visit_no aggregation");
            }
            if (parsed.getBuckets().isEmpty()) {
                break;
            }
            total += parsed.getBuckets().size();
            Map<String, Object> nextAfterKey = parsed.afterKey();
            if (nextAfterKey != null && nextAfterKey.equals(afterKey)) {
                throw new IOException("Elasticsearch composite aggregation after_key did not advance");
            }
            afterKey = nextAfterKey;
            if (afterKey == null) {
                break;
            }
        }
        return total;
    }

    private List<String> resolveFieldCodes(List<String> requestedFieldCodes) {
        List<FieldDTO> visibleFields = tableFieldService.getShowFieldsByTableId(VISIT_RECORD_INDEX);
        Map<String, FieldDTO> available = new LinkedHashMap<>();
        if (visibleFields != null) {
            for (FieldDTO field : visibleFields) {
                if (field != null && StringUtils.isNotBlank(field.getFieldCode())) {
                    available.put(field.getFieldCode(), field);
                }
            }
        }

        Set<String> selected = new LinkedHashSet<>();
        if (requestedFieldCodes == null || requestedFieldCodes.isEmpty()) {
            selected.addAll(available.keySet());
        } else {
            for (String fieldCode : requestedFieldCodes) {
                if (StringUtils.isBlank(fieldCode)) {
                    throw new BizException("返回字段编码不能为空");
                }
                if (!VISIT_NO_FIELD.equals(fieldCode) && !available.containsKey(fieldCode)) {
                    throw new BizException("返回字段不存在或未配置展示: " + fieldCode);
                }
                selected.add(fieldCode);
            }
        }
        selected.add(VISIT_NO_FIELD);
        return new ArrayList<>(selected);
    }

    private void applySorts(SearchSourceBuilder source, List<SearchSortDTO> sorts) {
        Set<String> sortedFields = new HashSet<>();
        if (sorts != null && !sorts.isEmpty()) {
            if (sorts.size() > 5) {
                throw new BizException("排序字段最多支持5个");
            }
            for (SearchSortDTO sort : sorts) {
                if (sort == null || StringUtils.isBlank(sort.getFieldCode())) {
                    throw new BizException("排序配置不合法");
                }
                if (StringUtils.isNotBlank(sort.getTableCode())
                        && !VISIT_RECORD_INDEX.equalsIgnoreCase(sort.getTableCode())) {
                    throw new BizException("患者列表排序仅支持 ms_visit_record");
                }
                String fieldCode = sort.getFieldCode();
                if (!sortedFields.add(fieldCode)) {
                    throw new BizException("排序字段不能重复");
                }
                TableFieldInfo field = resolveField(fieldCode);
                String mode = StringUtils.isBlank(sort.getMode()) ? "asc" : sort.getMode();
                if (!"asc".equalsIgnoreCase(mode) && !"desc".equalsIgnoreCase(mode)) {
                    throw new BizException("排序方式仅支持 asc 或 desc");
                }
                source.sort(filterQueryBuilder.getQueryField(field),
                        "desc".equalsIgnoreCase(mode) ? SortOrder.DESC : SortOrder.ASC);
            }
        }
        if (!sortedFields.contains(VISIT_NO_FIELD)) {
            source.sort(VISIT_NO_FIELD + ".keyword", SortOrder.ASC);
        }
    }

    private TableFieldInfo resolveField(String fieldCode) {
        TableFieldInfo field = mysqlMetaCache.findTableAndFieldName(VISIT_RECORD_INDEX, fieldCode);
        if (field == null && VISIT_NO_FIELD.equals(fieldCode)) {
            return TableFieldInfo.builder()
                    .tableCode(VISIT_RECORD_INDEX)
                    .fieldCode(VISIT_NO_FIELD)
                    .fieldType("text")
                    .build();
        }
        if (field == null) {
            throw new BizException("筛选或排序字段不存在于 ms_visit_record: " + fieldCode);
        }
        return field;
    }

    private void validatePage(int pageNum, int pageSize) {
        if (pageNum < 1) {
            throw new BizException("页码必须大于等于 1");
        }
        if (pageSize < 1 || pageSize > MAX_PAGE_SIZE) {
            throw new BizException("每页数量必须在 1 到 " + MAX_PAGE_SIZE + " 之间");
        }
        long end = (long) (pageNum - 1) * pageSize + pageSize;
        if (end > MAX_RESULT_WINDOW) {
            throw new BizException("当前列表最多支持前 " + MAX_RESULT_WINDOW + " 条记录，请缩小筛选范围");
        }
    }
}
