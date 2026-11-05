package com.jiayuan.modules.searchv2.component;

import cn.hutool.core.util.StrUtil;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.jiayuan.common.component.DesensitizedComponent;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.searchv2.cache.IndexStructureCache;
import com.jiayuan.modules.searchv2.cache.MysqlMetaCache;
import com.jiayuan.modules.searchv2.modal.NodeQueryVo;
import com.jiayuan.modules.searchv2.modal.SearchVo;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.service.TableFieldService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.ElasticsearchException;
import org.elasticsearch.action.search.MultiSearchRequest;
import org.elasticsearch.action.search.MultiSearchResponse;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.search.sort.SortOrder;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.composite.CompositeAggregation;
import org.elasticsearch.search.aggregations.bucket.composite.CompositeAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.composite.ParsedComposite;
import org.elasticsearch.search.aggregations.bucket.composite.TermsValuesSourceBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.TimeUnit;

@Slf4j
@Component
@RequiredArgsConstructor
public class ExpressionParserComponent {

    @Resource
    private ExpressionParser expressionParser;

    @Resource
    private IndexStructureCache indexStructureCache;

    @Resource
    private TableFieldService tableFieldService;

    @Resource
    private RestHighLevelClient client;

    private static final String ALGORITHM = "AES";
    private static final String CHARSET = "UTF-8";

    private static final String VISIT_RECORD_INDEX = "ms_visit_record";
    private static final String AGE_FIELD = "age";
    private static final String AGE_SECONDS_FIELD = "age_seconds";
    private static final long ONE_YEAR_SECONDS = 365L * 24 * 60 * 60;

    String key = "1234567890123456";

    @Resource
    private MysqlMetaCache mysqlMetaCache;

    private static final int CACHE_SIZE = 100;
    private Cache<String, NodeQueryVo> cache;
    private Cache<String, List<String>> orderCache;

    /**
     * Initializes and configures the Guava cache instance with optimal settings.
     * Executed automatically after bean construction via @PostConstruct.
     */
    @PostConstruct
    public void init() {
        log.info("Initializing search cache with size: {} and 60 minute TTL", CACHE_SIZE);
        this.cache = CacheBuilder.newBuilder()
                .maximumSize(CACHE_SIZE)
                .expireAfterAccess(60, TimeUnit.MINUTES)
                .removalListener(notification ->
                        log.debug("Cache entry removed. Key: {}, Cause: {}",
                                notification.getKey(),
                                notification.getCause()))
                .build();
        this.orderCache = CacheBuilder.newBuilder()
                .maximumSize(CACHE_SIZE)
                .expireAfterAccess(10, TimeUnit.MINUTES)
                .build();
    }

    /**
     * 判断是否是特殊年龄字段：
     *
     * ms_visit_record.age -> ms_visit_record.age_seconds
     */
    private boolean isVisitRecordAgeField(String indexNameEn, String fieldNameEn) {
        return VISIT_RECORD_INDEX.equalsIgnoreCase(indexNameEn)
                && AGE_FIELD.equalsIgnoreCase(fieldNameEn);
    }

    /**
     * 前端传入年龄数字，例如：
     *
     * 1   -> 1岁
     * 1.5 -> 1.5岁
     * 2   -> 2岁
     *
     * 这里和入库 SQL 的规则保持一致：
     * 1岁 = 365天
     */
    private long ageYearToSeconds(String value) {
        if (StringUtils.isBlank(value)) {
            throw new IllegalArgumentException("年龄不能为空");
        }

        try {
            double ageYear = Double.parseDouble(value.trim());
            return Math.round(ageYear * ONE_YEAR_SECONDS);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("年龄格式不正确，只支持数字，例如：1、1.5、2", e);
        }
    }

    /**
     * BETWEEN 年龄区间转换。
     *
     * 例如：
     * 1,2 -> 1岁到2岁
     */
    private long[] ageBetweenToSeconds(String value) {
        if (StringUtils.isBlank(value)) {
            throw new IllegalArgumentException("年龄区间不能为空");
        }

        String[] split = value.split(",");
        if (split.length != 2) {
            throw new IllegalArgumentException("年龄区间格式不正确，正确格式例如：1,2");
        }

        return new long[]{
                ageYearToSeconds(split[0]),
                ageYearToSeconds(split[1])
        };
    }

    /**
     * 根据 AND / OR 把子查询追加到 boolQuery。
     * lastOperator 为空时，默认按 AND 处理。
     */
    private void appendByLogic(BoolQueryBuilder boolQuery,
                               QueryBuilder queryBuilder,
                               Symbol.LogicEnum logicEnum) {
        if (logicEnum == Symbol.LogicEnum.OR) {
            boolQuery.should(queryBuilder);
        } else {
            boolQuery.must(queryBuilder);
        }
    }

    /**
     * Executes a search operation with proper error handling and logging.
     *
     * @param request The search request containing query parameters
     * @return SearchVo containing search results and metadata
     * @throws BizException if search execution fails or invalid request
     */
    public SearchVo search(SearchRequest request) throws BizException {
        if (request == null) {
            throw new BizException("Search request cannot be null");
        }

        try {
            long startTime = System.currentTimeMillis();
            log.debug("Initiating search for expression: {}", request.getExpression());

            SearchVo results = getOptimizedJoinedResultsCustom(
                    request.getExpression(),
                    request.getPage(),
                    request.getSize(),
                    request.getColumnList(),
                    request.getEsBatchSize(),
                    request.isExport(),
                    request.getOrderFieldCode(),
                    request.getOrderMode(),
                    request.getScopeExpression(),
                    request.getDimension()
            );

            log.info("Search completed successfully in {} ms. Results: {}",
                    System.currentTimeMillis() - startTime,
                    results.getTotal());

            return results;
        } catch (Exception e) {
            String message = StrUtil.isNotBlank(e.getMessage())
                    ? e.getMessage()
                    : "检索表达式错误,请检查后重新提交";
            log.error(message, e);
            throw new BizException(message, e);
        }
    }

    /**
     * Retrieves optimized joined search results with caching support.
     *
     * @param condition     The search query condition string
     * @param pageNum       The page number for pagination
     * @param pageSize      The number of results per page
     * @param selectColumns List of fields to include in the results
     * @param esBatchSize   ES batch size
     * @param isExport      Whether export mode is enabled
     * @return SearchVo containing paginated results and metadata
     * @throws Exception if query execution or processing fails
     */
    public SearchVo getOptimizedJoinedResultsCustom(String condition,
                                                    int pageNum,
                                                    int pageSize,
                                                    List<FieldDTO> selectColumns,
                                                    int esBatchSize,
                                                    boolean isExport) throws Exception {
        return getOptimizedJoinedResultsCustom(condition, pageNum, pageSize,
                selectColumns, esBatchSize, isExport, null, null, null, 0);
    }

    public SearchVo getOptimizedJoinedResultsCustom(String condition,
                                                    int pageNum,
                                                    int pageSize,
                                                    List<FieldDTO> selectColumns,
                                                    int esBatchSize,
                                                    boolean isExport,
                                                    String orderFieldCode,
                                                    String orderMode) throws Exception {
        return getOptimizedJoinedResultsCustom(condition, pageNum, pageSize,
                selectColumns, esBatchSize, isExport, orderFieldCode, orderMode, null, 0);
    }

    public SearchVo getOptimizedJoinedResultsCustom(String condition,
                                                    int pageNum,
                                                    int pageSize,
                                                    List<FieldDTO> selectColumns,
                                                    int esBatchSize,
                                                    boolean isExport,
                                                    String orderFieldCode,
                                                    String orderMode,
                                                    String scopeExpression,
                                                    Integer dimension) throws Exception {
        if (StringUtils.isBlank(condition)) {
            throw new IllegalArgumentException("Search condition cannot be null or empty");
        }

        if (pageNum < 1) {
            throw new IllegalArgumentException("Page number must be positive");
        }

        if (selectColumns == null) {
            throw new IllegalArgumentException("Select columns cannot be null");
        }

        String conditionHash = generateConditionHash(condition.trim());
        log.debug("Checking cache for condition hash: {}", conditionHash);

        NodeQueryVo cachedResults = cache.getIfPresent(conditionHash);

        if (cachedResults != null) {
            log.info("Cache hit for condition [{}]. Results count: {}",
                    condition, cachedResults.getResult().size());
            logCacheStatistics();

            return getOptimizedJoinedResults(
                    prepareResults(cachedResults, conditionHash, orderFieldCode, orderMode,
                            scopeExpression, dimension),
                    pageNum,
                    pageSize,
                    selectColumns,
                    esBatchSize
            );
        }

        log.info("Cache miss for condition [{}]. Executing new search...", condition);

        NodeQueryVo joinedResults = getJoinedResults(condition);

        cache.put(conditionHash, joinedResults);
        log.info("Cached new results for condition hash: {}", conditionHash);

        return getOptimizedJoinedResults(
                prepareResults(joinedResults, conditionHash, orderFieldCode, orderMode,
                        scopeExpression, dimension),
                pageNum,
                pageSize,
                selectColumns,
                esBatchSize
        );
    }

    private NodeQueryVo prepareResults(NodeQueryVo base, String conditionHash,
                                       String orderFieldCode, String orderMode,
                                       String scopeExpression, Integer dimension) throws Exception {
        NodeQueryVo filtered = applyScope(base, scopeExpression);
        String scopeKey = scopeExpression == null ? "" : scopeExpression.trim();
        String key = conditionHash + ":" + generateConditionHash(scopeKey);
        NodeQueryVo ordered = applyOrder(filtered, key, orderFieldCode, orderMode);
        return applyPatientDimension(ordered, key, orderFieldCode, orderMode, dimension);
    }

    private NodeQueryVo applyScope(NodeQueryVo base, String scopeExpression) throws Exception {
        if (StringUtils.isBlank(scopeExpression) || base.getResult().isEmpty()) {
            return base;
        }

        String condition = scopeExpression.trim();
        String cacheKey = generateConditionHash(condition);
        NodeQueryVo scope = cache.getIfPresent(cacheKey);
        if (scope == null) {
            scope = getJoinedResults(condition);
            cache.put(cacheKey, scope);
        }

        Set<String> accepted = new HashSet<>(scope.getResult());
        List<String> filtered = new ArrayList<>();
        for (String visitNo : base.getResult()) {
            if (accepted.contains(visitNo)) {
                filtered.add(visitNo);
            }
        }
        return new NodeQueryVo(filtered, base.getQueries());
    }

    private NodeQueryVo applyPatientDimension(NodeQueryVo base, String conditionHash,
                                              String fieldCode, String mode,
                                              Integer dimension) throws IOException {
        if (!Integer.valueOf(1).equals(dimension) || base.getResult().isEmpty()) {
            return base;
        }

        String cacheKey = conditionHash + ":patient:" + fieldCode + ":" + mode;
        List<String> selected = orderCache.getIfPresent(cacheKey);
        if (selected == null) {
            selected = distinctPatientVisits(base.getResult());
            orderCache.put(cacheKey, selected);
        }
        return new NodeQueryVo(selected, base.getQueries());
    }

    private List<String> distinctPatientVisits(List<String> visitNumbers) throws IOException {
        Map<String, String> patientsByVisit = new HashMap<>();
        SearchSourceBuilder source = new SearchSourceBuilder()
                .query(QueryBuilders.termsQuery("visit_no.keyword", visitNumbers))
                .fetchSource(new String[]{"visit_no", "patient_id"}, new String[0])
                .sort("visit_no.keyword", SortOrder.ASC)
                .size(1000);

        while (true) {
            org.elasticsearch.action.search.SearchRequest request =
                    new org.elasticsearch.action.search.SearchRequest(VISIT_RECORD_INDEX).source(source);
            SearchHit[] hits = client.search(request, RequestOptions.DEFAULT).getHits().getHits();
            if (hits.length == 0) {
                break;
            }
            for (SearchHit hit : hits) {
                Map<String, Object> record = hit.getSourceAsMap();
                if (record != null && record.get("visit_no") != null) {
                    String visitNo = record.get("visit_no").toString();
                    Object patientId = record.get("patient_id");
                    patientsByVisit.put(visitNo, patientId == null ? visitNo : patientId.toString());
                }
            }
            if (hits.length < 1000) {
                break;
            }
            source.searchAfter(hits[hits.length - 1].getSortValues());
        }

        Set<String> seenPatients = new HashSet<>();
        List<String> selected = new ArrayList<>();
        for (String visitNo : visitNumbers) {
            String patientId = patientsByVisit.getOrDefault(visitNo, visitNo);
            if (seenPatients.add(patientId)) {
                selected.add(visitNo);
            }
        }
        return selected;
    }

    private NodeQueryVo applyOrder(NodeQueryVo results, String conditionHash,
                                   String fieldCode, String mode) throws IOException {
        if (StringUtils.isBlank(fieldCode) || results.getResult().isEmpty()) {
            return results;
        }

        String sortMode = "desc".equalsIgnoreCase(mode) ? "desc" : "asc";
        String cacheKey = conditionHash + ":" + fieldCode + ":" + sortMode;
        List<String> ordered = orderCache.getIfPresent(cacheKey);
        if (ordered == null) {
            ordered = sortVisitNumbers(results.getResult(), fieldCode, sortMode);
            orderCache.put(cacheKey, ordered);
        }

        NodeQueryVo sorted = new NodeQueryVo();
        sorted.setQueries(results.getQueries());
        sorted.setResult(ordered);
        return sorted;
    }

    private List<String> sortVisitNumbers(List<String> visitNumbers,
                                          String fieldCode, String mode) throws IOException {
        Map<String, String> fieldTypes = indexStructureCache.getFieldTypes(VISIT_RECORD_INDEX);
        if (!fieldTypes.containsKey(fieldCode)) {
            throw new BizException("排序字段不存在: " + fieldCode);
        }

        String sortField = AGE_FIELD.equals(fieldCode) ? AGE_SECONDS_FIELD
                : "text".equals(fieldTypes.get(fieldCode)) ? fieldCode + ".keyword" : fieldCode;

        SearchSourceBuilder source = new SearchSourceBuilder()
                .query(QueryBuilders.termsQuery("visit_no.keyword", visitNumbers))
                .fetchSource(false)
                .docValueField("visit_no.keyword")
                .sort(sortField, "desc".equals(mode) ? SortOrder.DESC : SortOrder.ASC)
                .sort("visit_no.keyword", SortOrder.ASC)
                .size(1000);

        Set<String> orderedSet = new LinkedHashSet<>();
        while (true) {
            org.elasticsearch.action.search.SearchRequest request =
                    new org.elasticsearch.action.search.SearchRequest(VISIT_RECORD_INDEX).source(source);
            SearchResponse response = client.search(request, RequestOptions.DEFAULT);
            SearchHit[] hits = response.getHits().getHits();
            if (hits.length == 0) {
                break;
            }

            for (SearchHit hit : hits) {
                if (hit.getFields().containsKey("visit_no.keyword")) {
                    Object visitNo = hit.getFields().get("visit_no.keyword").getValue();
                    if (visitNo != null) {
                        orderedSet.add(visitNo.toString());
                    }
                }
            }
            if (hits.length < 1000) {
                break;
            }
            source.searchAfter(hits[hits.length - 1].getSortValues());
        }

        List<String> ordered = new ArrayList<>(orderedSet);
        for (String visitNo : visitNumbers) {
            if (!orderedSet.contains(visitNo)) {
                ordered.add(visitNo);
            }
        }
        return ordered;
    }

    /**
     * Executes a complex search query and returns joined results from multiple indices.
     *
     * @param condition The search condition string to parse and execute
     * @return NodeQueryVo containing the unified results and original query definitions
     * @throws Exception if query parsing or execution fails
     */
    public NodeQueryVo getJoinedResults(String condition) throws Exception {
        if (StringUtils.isBlank(condition)) {
            throw new IllegalArgumentException("Search condition cannot be null or empty");
        }

        long startTime = System.currentTimeMillis();
        log.info("Starting query execution for condition: {}", condition);

        List<QueryNode> queries = expressionParser.parseConditionToQueries(condition);
        log.info("Parsed {} query nodes from condition", queries.size());

        Set<String> finalResultSet = executeQueriesBatch(queries);
        log.info("Query execution returned {} unique results", finalResultSet.size());

        NodeQueryVo nodeQueryVo = new NodeQueryVo();
        nodeQueryVo.setQueries(queries);

        List<String> finalResultList = new ArrayList<>(finalResultSet);
        finalResultList.sort(Comparator.reverseOrder());
        nodeQueryVo.setResult(finalResultList);

        long duration = System.currentTimeMillis() - startTime;
        log.info("Query execution completed in {} ms", duration);

        return nodeQueryVo;
    }

    /**
     * Retrieves and joins search results from multiple indices with pagination support.
     *
     * @param joinedResults Container holding base results and query definitions
     * @param pageNum       Current page number
     * @param pageSize      Number of results per page
     * @param selectColumns List of fields to include from visit records
     * @param esBatchSize   ES batch size
     * @return SearchVo containing paginated results, columns, and metadata
     * @throws Exception if search execution or processing fails
     */
    public SearchVo getOptimizedJoinedResults(NodeQueryVo joinedResults,
                                              int pageNum,
                                              int pageSize,
                                              List<FieldDTO> selectColumns,
                                              int esBatchSize) throws Exception {
        if (joinedResults == null || selectColumns == null) {
            throw new IllegalArgumentException("Joined results and select columns cannot be null");
        }

        List<String> visitNos = joinedResults.getResult();
        List<QueryNode> queries = joinedResults.getQueries();

        if (visitNos.isEmpty()) {
            return new SearchVo();
        }

        List<Map<String, Object>> resultList = new ArrayList<>();
        List<Map<String, String>> baseColumns = new ArrayList<>();

        int startIndex = (pageNum - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, visitNos.size());

        MultiSearchRequest multiSearchRequest = new MultiSearchRequest();

        if (endIndex != 0) {
            long searchBuildStart = System.currentTimeMillis();

            for (int i = startIndex; i < endIndex; i++) {
                String visitNo = visitNos.get(i);

                SearchSourceBuilder visitQuery = new SearchSourceBuilder()
                        .query(QueryBuilders.termQuery("visit_no.keyword", visitNo))
                        .fetchSource(
                                selectColumns.stream()
                                        .map(FieldDTO::getFieldCode)
                                        .toArray(String[]::new),
                                new String[0]
                        );

                multiSearchRequest.add(
                        new org.elasticsearch.action.search.SearchRequest(VISIT_RECORD_INDEX)
                                .source(visitQuery)
                );

                for (QueryNode queryNode : queries) {
                    org.elasticsearch.action.search.SearchRequest searchRequest = createSearchRequest(
                            queryNode.getIndexNameEn(),
                            queryNode.getFieldNameEn(),
                            queryNode.getOperator(),
                            queryNode.getValue(),
                            visitNo,
                            queryNode.getFieldType(),
                            queryNode.getMergedConditions(),
                            esBatchSize
                    );
                    multiSearchRequest.add(searchRequest);
                }
            }

            log.info("Search request building took {} ms",
                    System.currentTimeMillis() - searchBuildStart);

            long searchExecStart = System.currentTimeMillis();
            MultiSearchResponse response = client.msearch(multiSearchRequest, RequestOptions.DEFAULT);
            log.info("Multi-search execution took {} ms",
                    System.currentTimeMillis() - searchExecStart);

            long processingStart = System.currentTimeMillis();
            int responsesPerVisit = queries.size() + 1;

            for (int i = 0; i < response.getResponses().length; i += responsesPerVisit) {
                SearchResponse visitResponse = response.getResponses()[i].getResponse();
                Map<String, Object> visitInfo = extractVisitInfo(visitResponse);

                Map<String, Object> resultMap = new LinkedHashMap<>(visitInfo);

                List<Map<String, Object>> subTables = new ArrayList<>(queries.size());

                for (int j = 0; j < queries.size(); j++) {
                    SearchResponse queryResponse = response.getResponses()[i + j + 1].getResponse();
                    QueryNode currentNode = queries.get(j);

                    List<Map<String, Object>> mergedResults = mergeSearchHits(queryResponse);
                    Map<String, String> fieldTypes =
                            indexStructureCache.getFieldTypes(currentNode.getIndexNameEn());

                    Map<String, Object> subTable = new LinkedHashMap<>();
                    subTable.put("tableName", currentNode.getIndexName());
                    subTable.put("columns", extractColumnsFromMergedResults(
                            mergedResults,
                            fieldTypes,
                            currentNode
                    ));
                    subTable.put("data", mergedResults);

                    subTables.add(subTable);
                }

                resultMap.put("jykj_subTables", subTables);
                resultMap.put("key", i);

                if (baseColumns.isEmpty()) {
                    baseColumns = extractColumnsFromMergedResultsMap(visitInfo);
                    Map<String, Integer> columnOrder = new HashMap<>();
                    for (int columnIndex = 0; columnIndex < selectColumns.size(); columnIndex++) {
                        columnOrder.put(selectColumns.get(columnIndex).getFieldCode(), columnIndex);
                    }
                    baseColumns.sort(Comparator.comparingInt(
                            column -> columnOrder.getOrDefault(column.get("dataIndex"), Integer.MAX_VALUE)));
                }

                resultList.add(resultMap);
            }

            long desensitizeStart = System.currentTimeMillis();
            List desensitization = DesensitizedComponent.desensitization(resultList);
            log.info("Data desensitization took {} ms",
                    System.currentTimeMillis() - desensitizeStart);

            log.info("Total response processing took {} ms",
                    System.currentTimeMillis() - processingStart);

            return new SearchVo(
                    desensitization,
                    baseColumns,
                    joinedResults.getResult().size(),
                    pageSize,
                    pageNum,
                    "",
                    joinedResults
            );
        } else {
            return new SearchVo();
        }
    }

    /**
     * Extracts and transforms column information from merged result map into UI-ready column definitions.
     *
     * @param mergedResults Map containing field names as keys and their corresponding values
     * @return List of column definition maps with title and dataIndex properties
     * @throws BizException if a field cannot be found in the ms_visit_record table metadata
     */
    private List<Map<String, String>> extractColumnsFromMergedResultsMap(Map<String, Object> mergedResults) {
        List<Map<String, String>> columns = new ArrayList<>(mergedResults.size());

        Set<String> columnNames = new LinkedHashSet<>(mergedResults.keySet());

        for (String columnName : columnNames) {
            TableFieldInfo fieldInfo = mysqlMetaCache.findTableAndFieldName(
                    VISIT_RECORD_INDEX,
                    columnName
            );

            if (fieldInfo == null) {
                throw new BizException(String.format(
                        "Field not found in visit record table. Field: %s",
                        columnName));
            }

            Map<String, String> column = new HashMap<>(3);
            column.put("title", fieldInfo.getFieldName());
            column.put("dataIndex", columnName);

            columns.add(column);
        }

        log.debug("Extracted {} columns from merged results", columns.size());
        return columns;
    }

    /**
     * Merges search hits from an Elasticsearch response into a list of result maps.
     *
     * @param response The Elasticsearch SearchResponse containing the query results
     * @return List of maps where each map represents a document's source fields
     * @throws ElasticsearchException if there are issues parsing the source maps
     */
    private List<Map<String, Object>> mergeSearchHits(SearchResponse response) {
        List<Map<String, Object>> mergedResults =
                new ArrayList<>(response.getHits().getHits().length);

        try {
            for (SearchHit hit : response.getHits()) {
                Map<String, Object> sourceMap = hit.getSourceAsMap();
                Map<String, TableFieldInfo> indexCache = mysqlMetaCache.getCacheEnToChi(hit.getIndex());

                if (sourceMap != null) {
                    Map<String, Object> orderedMap = new LinkedHashMap<>();

                    List<TableFieldInfo> sortedFields = new ArrayList<>(indexCache.values());
                    sortedFields.sort(Comparator.comparingInt(TableFieldInfo::getSort));

                    for (TableFieldInfo fieldInfo : sortedFields) {
                        String fieldCode = fieldInfo.getFieldCode();
                        if (sourceMap.containsKey(fieldCode)) {
                            orderedMap.put(fieldCode, sourceMap.get(fieldCode));
                        }
                    }

                    for (Map.Entry<String, Object> entry : sourceMap.entrySet()) {
                        if (!orderedMap.containsKey(entry.getKey())) {
                            orderedMap.put(entry.getKey(), entry.getValue());
                        }
                    }

                    mergedResults.add(orderedMap);
                    if (VISIT_RECORD_INDEX.equals(hit.getIndex())) {
                        orderedMap.remove(AGE_SECONDS_FIELD);
                    }
                } else {
                    log.warn("Null source map encountered for document ID: {}", hit.getId());
                }
            }
        } catch (ElasticsearchException e) {
            log.error("Failed to process search hits: {}", e.getMessage());
            throw e;
        }

        log.debug("Merged {} documents into results", mergedResults.size());
        return mergedResults;
    }

    /**
     * Extracts and transforms column information from merged query results.
     *
     * @param mergedResults List of merged result maps containing field data
     * @param fieldTypes    Map of field names to their corresponding types
     * @param currentNode   Current query node containing index information
     * @return List of column definition maps with metadata
     * @throws BizException if a field or table cannot be found in metadata
     */
    private List<Map<String, Object>> extractColumnsFromMergedResults(
            List<Map<String, Object>> mergedResults,
            Map<String, String> fieldTypes,
            QueryNode currentNode) {

        Set<String> columnNames = new LinkedHashSet<>();

        mergedResults.forEach(result -> columnNames.addAll(result.keySet()));

        List<Map<String, Object>> columns = new ArrayList<>();
        boolean isFirstColumn = true;

        for (String columnName : columnNames) {
            TableFieldInfo fieldInfo = mysqlMetaCache.findTableAndFieldName(
                    currentNode.getIndexNameEn(),
                    columnName
            );

            if (fieldInfo == null) {
                log.error(currentNode.toString());
                log.error(mergedResults.toString());
                throw new BizException("Table or field does not exist: "
                        + currentNode.getIndexNameEn() + "." + columnName);
            }

            Map<String, Object> column = new HashMap<>();
            column.put("title", fieldInfo.getFieldName());
            column.put("dataIndex", columnName);
            column.put("column_type", fieldTypes.get(columnName));
            column.put("checked", true);
            column.put("defaultCheck", isFirstColumn);
            column.put("width", 200);

            columns.add(column);
            isFirstColumn = false;
        }

        return columns;
    }

    /**
     * Extracts visit information from an Elasticsearch search response.
     *
     * @param visitResponse The Elasticsearch SearchResponse containing visit records
     * @return Map containing all visit fields and values, or empty map if no results found
     */
    private Map<String, Object> extractVisitInfo(SearchResponse visitResponse) {
        Map<String, Object> visitInfo = new HashMap<>();

        if (visitResponse.getHits().getTotalHits().value == 0) {
            log.debug("No visit records found in search response");
            return visitInfo;
        }

        SearchHit[] hits = visitResponse.getHits().getHits();

        if (hits.length > 1) {
            log.warn("Multiple visits ({}) found when only one was expected", hits.length);
        }

        SearchHit hit = hits[0];

        try {
            Map<String, Object> sourceMap = hit.getSourceAsMap();
            if (sourceMap != null) {
                visitInfo.putAll(sourceMap);
                visitInfo.remove(AGE_SECONDS_FIELD);
                log.debug("Extracted {} fields from visit record", sourceMap.size());
            } else {
                log.warn("Visit record source map is null");
            }
        } catch (ElasticsearchException e) {
            log.error("Failed to parse visit record source: {}", e.getMessage());
        }

        return visitInfo;
    }

    /**
     * Creates an Elasticsearch SearchRequest with dynamic query construction and field filtering.
     *
     * @param indexName        The target Elasticsearch index name
     * @param fieldName        The field to query against
     * @param operator         The relational operator for the query
     * @param value            The value to compare against
     * @param visitNo          Optional visit number for additional filtering
     * @param fieldType        The data type of the field
     * @param mergedConditions List of additional query conditions to merge
     * @param esBatchSize      ES query batch size
     * @return Configured SearchRequest ready for execution
     */
    public org.elasticsearch.action.search.SearchRequest createSearchRequest(String indexName,
                                                                             String fieldName,
                                                                             Symbol.RelationalEnum operator,
                                                                             String value,
                                                                             String visitNo,
                                                                             String fieldType,
                                                                             List<QueryNode> mergedConditions,
                                                                             int esBatchSize) {
        org.elasticsearch.action.search.SearchRequest searchRequest =
                new org.elasticsearch.action.search.SearchRequest(indexName);

        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

        QueryBuilder queryBuilder = buildQueryFromCondition2(
                indexName,
                fieldName,
                operator,
                value,
                visitNo,
                fieldType,
                mergedConditions
        );

        List<FieldDTO> fields = tableFieldService.getShowFieldsByTableId(indexName);
        if (fields != null && !fields.isEmpty()) {
            String[] includes = fields.stream()
                    .map(FieldDTO::getFieldCode)
                    .filter(Objects::nonNull)
                    .toArray(String[]::new);

            searchSourceBuilder.fetchSource(includes, new String[0]);
        }

        searchSourceBuilder.query(queryBuilder)
                .size(esBatchSize);

        searchRequest.source(searchSourceBuilder);
        return searchRequest;
    }

    /**
     * 计算 condition 的 hash 值。
     */
    private String generateConditionHash(String condition) throws Exception {
        return encrypt(condition, key);
    }

    /**
     * 构建详情查询条件，带 visit_no。
     */
    private QueryBuilder buildQueryFromCondition2(String indexName,
                                                  String fieldName,
                                                  Symbol.RelationalEnum operator,
                                                  String value,
                                                  String visitNo,
                                                  String fieldType,
                                                  List<QueryNode> mergedConditions) {
        QueryBuilder currentQuery = buildSingleQuery2(
                indexName,
                fieldName,
                operator,
                value,
                visitNo,
                fieldType
        );

        if (mergedConditions == null || mergedConditions.isEmpty()) {
            return currentQuery;
        }

        BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();

        Symbol.LogicEnum firstLogic = mergedConditions.get(0).getLastOperator();
        appendByLogic(boolQuery, currentQuery, firstLogic);

        for (QueryNode mergedCondition : mergedConditions) {
            QueryBuilder mergedQuery = buildQueryFromCondition2(
                    mergedCondition.getIndexNameEn(),
                    mergedCondition.getFieldNameEn(),
                    mergedCondition.getOperator(),
                    mergedCondition.getValue(),
                    visitNo,
                    mergedCondition.getFieldType(),
                    mergedCondition.getMergedConditions()
            );

            appendByLogic(boolQuery, mergedQuery, mergedCondition.getLastOperator());
        }

        return boolQuery;
    }

    /**
     * 构建单个条件的 Elasticsearch 查询，带 visit_no 过滤。
     *
     * 特殊逻辑：
     * ms_visit_record.age 查询时，实际查询 age_seconds。
     */
    private QueryBuilder buildSingleQuery2(String indexName,
                                           String fieldName,
                                           Symbol.RelationalEnum operator,
                                           String value,
                                           String visitNo,
                                           String fieldType) {
        boolean useAgeSeconds = isVisitRecordAgeField(indexName, fieldName);

        String queryField;
        if (useAgeSeconds) {
            queryField = AGE_SECONDS_FIELD;
        } else if ("text".equals(fieldType)) {
            queryField = fieldName + ".keyword";
        } else {
            queryField = fieldName;
        }

        String primaryKey = "visit_no.keyword";

        switch (operator) {
            case LIKE:
                if (useAgeSeconds) {
                    throw new IllegalArgumentException("年龄字段不支持 LIKE 查询，请使用 =、>、>=、<、<= 或 BETWEEN");
                }
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.queryStringQuery(value).field(queryField))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case PREFIX:
                if (useAgeSeconds) {
                    throw new IllegalArgumentException("年龄字段不支持 PREFIX 查询，请使用 =、>、>=、<、<= 或 BETWEEN");
                }
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.prefixQuery(queryField, value.replace("*", "")))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case EQ:
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.termQuery(
                                queryField,
                                useAgeSeconds ? ageYearToSeconds(value) : value
                        ))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case NE:
                return QueryBuilders.boolQuery()
                        .mustNot(QueryBuilders.termQuery(
                                queryField,
                                useAgeSeconds ? ageYearToSeconds(value) : value
                        ))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case GT:
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.rangeQuery(queryField)
                                .gt(useAgeSeconds ? ageYearToSeconds(value) : value))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case GE:
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.rangeQuery(queryField)
                                .gte(useAgeSeconds ? ageYearToSeconds(value) : value))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case LT:
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.rangeQuery(queryField)
                                .lt(useAgeSeconds ? ageYearToSeconds(value) : value))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case LE:
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.rangeQuery(queryField)
                                .lte(useAgeSeconds ? ageYearToSeconds(value) : value))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case BETWEEN:
                if (useAgeSeconds) {
                    long[] ageRange = ageBetweenToSeconds(value);
                    return QueryBuilders.boolQuery()
                            .must(QueryBuilders.rangeQuery(queryField)
                                    .gte(ageRange[0])
                                    .lte(ageRange[1]))
                            .must(QueryBuilders.termQuery(primaryKey, visitNo));
                }

                String[] split = value.split(",");
                if (split.length != 2) {
                    throw new IllegalArgumentException("BETWEEN 查询格式不正确，正确格式例如：1,2");
                }

                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.rangeQuery(queryField)
                                .gte(split[0])
                                .lte(split[1]))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case IS_NOT_NULL:
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.existsQuery(queryField))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            case NOT_CONTAIN:
                if (useAgeSeconds) {
                    throw new IllegalArgumentException("年龄字段不支持 NOT_CONTAIN 查询，请使用 =、>、>=、<、<= 或 BETWEEN");
                }
                return QueryBuilders.boolQuery()
                        .mustNot(QueryBuilders.matchPhraseQuery(fieldName, value.replace("*", "")))
                        .must(QueryBuilders.termQuery(primaryKey, visitNo));

            default:
                throw new IllegalArgumentException("Unsupported operator: " + operator);
        }
    }

    /**
     * Prints all decrypted cache keys to the log.
     */
    public void logCacheStatistics() {
        if (cache == null) {
            log.error("Cache is not initialized");
            return;
        }

        Set<String> encryptedKeys = cache.asMap().keySet();
        if (encryptedKeys.isEmpty()) {
            log.info("Cache is currently empty");
            return;
        }

        log.info("Printing {} cached keys:", encryptedKeys.size());

        encryptedKeys.forEach(encryptedKey -> {
            try {
                String decryptedKey = decrypt(encryptedKey, key);
                log.info("Decrypted key: {}", decryptedKey);
            } catch (IllegalArgumentException e) {
                log.warn("Skipping invalid key format: {}", encryptedKey);
            } catch (GeneralSecurityException e) {
                log.error("Decryption failed for key: {}. Error: {}",
                        encryptedKey, e.getMessage());
            } catch (Exception e) {
                log.error("Unexpected error processing key: {}. Error: {}",
                        encryptedKey, e.getMessage());
            }
        });
    }

    /**
     * Encrypts data using AES algorithm.
     *
     * @param data The plaintext to encrypt
     * @param key  The secret key
     * @return Base64 encoded encrypted string
     * @throws Exception If encryption fails
     */
    public static String encrypt(String data, String key) throws Exception {
        if (data == null || key == null) {
            throw new IllegalArgumentException("Data and key cannot be null");
        }

        SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(CHARSET), ALGORITHM);

        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);

        byte[] encryptedBytes = cipher.doFinal(data.getBytes(CHARSET));
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    /**
     * Decrypts AES-encrypted data.
     *
     * @param encryptedData Base64 encoded encrypted string
     * @param key           The secret key used for encryption
     * @return Original plaintext string
     * @throws Exception If decryption fails
     */
    public static String decrypt(String encryptedData, String key) throws Exception {
        if (encryptedData == null || key == null) {
            throw new IllegalArgumentException("Encrypted data and key cannot be null");
        }

        SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(CHARSET), ALGORITHM);

        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, secretKey);

        byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedData));
        return new String(decryptedBytes, CHARSET);
    }

    /**
     * 通过 multi query 来实现查询。
     */
    public Set<String> executeQueriesBatch(List<QueryNode> queries) throws IOException {
        long start = System.currentTimeMillis();

        MultiSearchRequest multiSearchRequest = new MultiSearchRequest();

        for (QueryNode query : queries) {
            String indexName = extractIndexFromQuery(query);

            org.elasticsearch.action.search.SearchRequest searchRequest =
                    new org.elasticsearch.action.search.SearchRequest(indexName);

            SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

            QueryBuilder queryBuilder = buildQueryFromCondition(query);
            searchSourceBuilder.query(queryBuilder);

            CompositeAggregationBuilder compositeAgg = AggregationBuilders.composite(
                    "distinct_visit_no",
                    Collections.singletonList(
                            new TermsValuesSourceBuilder("visit_no")
                                    .field("visit_no.keyword")
                    )
            ).size(65535);

            searchSourceBuilder.aggregation(compositeAgg);
            searchSourceBuilder.size(0);

            searchRequest.source(searchSourceBuilder);
            log.info("searchSourceBuilder = " + searchSourceBuilder);

            multiSearchRequest.add(searchRequest);
        }

        MultiSearchResponse multiSearchResponse =
                client.msearch(multiSearchRequest, RequestOptions.DEFAULT);

        Set<String> finalResultSet = new HashSet<>();
        Set<String> currentAndSet = null;

        int queryIndex = 0;
        for (MultiSearchResponse.Item item : multiSearchResponse.getResponses()) {
            if (item.getFailure() != null) {
                log.error("Error with query: " + item.getFailure().getMessage());
                throw new IOException(
                        "Elasticsearch query failed",
                        item.getFailure()
                );
            }

            SearchResponse response = item.getResponse();
            Set<String> visitNos = extractVisitNosFromAggregation(response);
            QueryNode query = queries.get(queryIndex);

            if (queryIndex == 0) {
                finalResultSet.addAll(visitNos);
            } else {
                boolean isAnd = query.getLastOperator() != null
                        && query.getLastOperator().equals(Symbol.LogicEnum.AND);

                if (isAnd) {
                    if (currentAndSet == null) {
                        currentAndSet = new HashSet<>(finalResultSet);
                        currentAndSet.retainAll(visitNos);
                        finalResultSet.clear();
                    } else {
                        currentAndSet.retainAll(visitNos);
                    }
                } else {
                    if (currentAndSet != null) {
                        finalResultSet.addAll(currentAndSet);
                        currentAndSet = null;
                    }
                    finalResultSet.addAll(visitNos);
                }
            }

            queryIndex++;
        }

        if (currentAndSet != null) {
            finalResultSet.addAll(currentAndSet);
        }

        long end = System.currentTimeMillis();
        log.info("Total time for batch queries: " + (end - start) + " ms");

        return finalResultSet;
    }

    /**
     * Helper method to extract the index from a QueryNode.
     */
    private String extractIndexFromQuery(QueryNode query) {
        return query.getIndexNameEn();
    }

    /**
     * Recursively builds an Elasticsearch query from a QueryNode structure.
     *
     * @param query The QueryNode containing the condition(s) to be converted to a query
     * @return QueryBuilder The constructed Elasticsearch query
     */
    private QueryBuilder buildQueryFromCondition(QueryNode query) {
        QueryBuilder currentQuery = buildSingleQuery(query);

        if (query.getMergedConditions() == null || query.getMergedConditions().isEmpty()) {
            return currentQuery;
        }

        BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();

        List<QueryNode> mergedConditions = query.getMergedConditions();
        Symbol.LogicEnum firstLogic = mergedConditions.get(0).getLastOperator();

        appendByLogic(boolQuery, currentQuery, firstLogic);

        for (QueryNode mergedCondition : mergedConditions) {
            QueryBuilder mergedQuery = buildQueryFromCondition(mergedCondition);
            appendByLogic(boolQuery, mergedQuery, mergedCondition.getLastOperator());
        }

        return boolQuery;
    }

    /**
     * Builds an Elasticsearch query for a single condition.
     *
     * 特殊逻辑：
     * ms_visit_record.age 查询时，实际查询 age_seconds。
     *
     * @param query The QueryNode containing field information and condition parameters
     * @return QueryBuilder The constructed Elasticsearch query
     */
    private QueryBuilder buildSingleQuery(QueryNode query) {
        String indexNameEn = query.getIndexNameEn();
        String fieldName = query.getFieldNameEn();
        Symbol.RelationalEnum operator = query.getOperator();
        String value = query.getValue();

        boolean useAgeSeconds = isVisitRecordAgeField(indexNameEn, fieldName);

        String queryField;
        if (useAgeSeconds) {
            queryField = AGE_SECONDS_FIELD;
        } else if ("text".equals(query.getFieldType())) {
            queryField = fieldName + ".keyword";
        } else {
            queryField = fieldName;
        }

        switch (operator) {
            case LIKE:
                if (useAgeSeconds) {
                    throw new IllegalArgumentException("年龄字段不支持 LIKE 查询，请使用 =、>、>=、<、<= 或 BETWEEN");
                }
                return QueryBuilders.queryStringQuery(value)
                        .field(queryField);

            case PREFIX:
                if (useAgeSeconds) {
                    throw new IllegalArgumentException("年龄字段不支持 PREFIX 查询，请使用 =、>、>=、<、<= 或 BETWEEN");
                }
                return QueryBuilders.prefixQuery(queryField, value.replace("*", ""));

            case GT:
                return QueryBuilders.rangeQuery(queryField)
                        .gt(useAgeSeconds ? ageYearToSeconds(value) : value);

            case GE:
                return QueryBuilders.rangeQuery(queryField)
                        .gte(useAgeSeconds ? ageYearToSeconds(value) : value);

            case EQ:
                return QueryBuilders.termQuery(
                        queryField,
                        useAgeSeconds ? ageYearToSeconds(value) : value
                );

            case LT:
                return QueryBuilders.rangeQuery(queryField)
                        .lt(useAgeSeconds ? ageYearToSeconds(value) : value);

            case LE:
                return QueryBuilders.rangeQuery(queryField)
                        .lte(useAgeSeconds ? ageYearToSeconds(value) : value);

            case NE:
                return QueryBuilders.boolQuery()
                        .mustNot(QueryBuilders.termQuery(
                                queryField,
                                useAgeSeconds ? ageYearToSeconds(value) : value
                        ));

            case BETWEEN:
                if (useAgeSeconds) {
                    long[] ageRange = ageBetweenToSeconds(value);
                    return QueryBuilders.rangeQuery(queryField)
                            .gte(ageRange[0])
                            .lte(ageRange[1]);
                }

                String[] split = value.split(",");
                if (split.length != 2) {
                    throw new IllegalArgumentException("BETWEEN 查询格式不正确，正确格式例如：1,2");
                }

                return QueryBuilders.rangeQuery(queryField)
                        .gte(split[0])
                        .lte(split[1]);

            case IS_NOT_NULL:
                return QueryBuilders.existsQuery(queryField);

            case NOT_CONTAIN:
                if (useAgeSeconds) {
                    throw new IllegalArgumentException("年龄字段不支持 NOT_CONTAIN 查询，请使用 =、>、>=、<、<= 或 BETWEEN");
                }
                return QueryBuilders.boolQuery()
                        .mustNot(QueryBuilders.matchPhraseQuery(fieldName, value.replace("*", "")));

            default:
                throw new IllegalArgumentException("Unsupported operator: " + operator);
        }
    }

    /**
     * Extracts unique visit numbers from an Elasticsearch aggregation response.
     *
     * @param response The SearchResponse containing aggregation results
     * @return Set<String> A collection of unique visit numbers
     */
    private Set<String> extractVisitNosFromAggregation(SearchResponse response) {
        Set<String> visitNoSet = new HashSet<>();

        ParsedComposite parsedComposite = response.getAggregations().get("distinct_visit_no");

        if (parsedComposite != null) {
            for (CompositeAggregation.Bucket bucket : parsedComposite.getBuckets()) {
                Map<String, Object> key = bucket.getKey();

                String visitNo = (String) key.get("visit_no");

                if (visitNo != null) {
                    visitNoSet.add(visitNo);
                }
            }
        }

        return visitNoSet;
    }

    /**
     * Safely checks if query uses AND operator.
     *
     * @param query The query node to check
     * @return true if AND, false otherwise
     */
    private Boolean isAndCondition(QueryNode query) {
        return query.getLastOperator() != null
                && query.getLastOperator().equals(Symbol.LogicEnum.AND);
    }

    /**
     * Performs a keyword search across multiple fields.
     *
     * @param buildList     List of fields to search against
     * @param searchRequest The search request containing the keyword expression
     * @return SearchVo containing the search results
     */
    public SearchVo keywordSearch(List<FieldDTO> buildList, SearchRequest searchRequest) {
        StringBuilder keywordExpression = new StringBuilder();

        for (FieldDTO fieldDTO : buildList) {
            QueryNode build = QueryNode.builder()
                    .indexName(fieldDTO.getTableCode())
                    .indexNameEn(fieldDTO.getTableName())
                    .fieldName(fieldDTO.getFieldCode())
                    .fieldNameEn(fieldDTO.getFieldName())
                    .lastOperator(Symbol.LogicEnum.OR)
                    .fieldType(fieldDTO.getDataType())
                    .value(searchRequest.getExpression())
                    .operator(Symbol.RelationalEnum.LIKE)
                    .build();

            keywordExpression.append(build.toString());
        }

        if (keywordExpression.length() > 0) {
            keywordExpression.setLength(keywordExpression.length() - 4);
        }

        log.info("parsed keywordExpression = " + keywordExpression);

        searchRequest.setExpression(keywordExpression.toString());

        return search(searchRequest);
    }
}