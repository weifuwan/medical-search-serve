package com.jiayuan.modules.search.excel;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.jiayuan.common.component.DesensitizedComponent;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.modules.searchv2.component.QueryNode;
import com.jiayuan.modules.searchv2.modal.NodeQueryVo;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.service.TableFieldService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
public class EsQueryService {

    private final RestHighLevelClient esClient;
    private final TableFieldService tableFieldService;


    /**
     * 查询ES数据并按索引分组
     *
     * @param nodeQueryVo 查询条件
     * @param batch       当前批次的结果ID列表
     * @return 按索引名称分组的查询结果
     * @throws IOException ES查询异常
     */
    public Map<String, List<Map<String, Object>>> queryEsDataGroupByIndex(NodeQueryVo nodeQueryVo, List<String> batch) throws IOException {
        if (CollectionUtils.isEmpty(batch)) {
            return Collections.emptyMap();
        }

        List<org.elasticsearch.action.search.SearchRequest> requests = buildSearchRequests(nodeQueryVo, batch);
        Map<String, List<Map<String, Object>>> indexResultsMap = new HashMap<>();

        for (org.elasticsearch.action.search.SearchRequest request : requests) {

            String indexName = request.indices()[0]; // 获取索引名称
            SearchResponse response = esClient.search(request, RequestOptions.DEFAULT);

            List<Map<String, Object>> indexResults = indexResultsMap.computeIfAbsent(indexName, k -> new ArrayList<>());

            for (SearchHit hit : response.getHits().getHits()) {
                Map<String, Object> sourceMap = hit.getSourceAsMap();
                // 添加索引名称和重新编号的ID
                sourceMap.put("_index", indexName);
                sourceMap.put("_row_id", indexResults.size() + 1); // 从1开始编号
                indexResults.add(sourceMap);
            }

            // 对整个索引的结果列表进行脱敏
            List<Map<String, Object>> desensitizedList = DesensitizedComponent.desensitization(indexResults);
            indexResultsMap.put(indexName, desensitizedList);
        }
        return indexResultsMap;
    }

    /**
     * 构建ES查询请求列表
     */
    private List<org.elasticsearch.action.search.SearchRequest> buildSearchRequests(NodeQueryVo nodeQueryVo, List<String> batch) {
        List<org.elasticsearch.action.search.SearchRequest> requests = new ArrayList<>();

        for (QueryNode queryNode : nodeQueryVo.getQueries()) {
            org.elasticsearch.action.search.SearchRequest request = createSearchRequest(
                    queryNode.getIndexNameEn(),
                    queryNode.getFieldNameEn(),
                    queryNode.getOperator(),
                    queryNode.getValue(),
                    null, // visitNo
                    queryNode.getFieldType(),
                    queryNode.getMergedConditions(),
                    batch
            );
            requests.add(request);
        }

        return requests;
    }

    /**
     * 创建ES搜索请求
     */
    private org.elasticsearch.action.search.SearchRequest createSearchRequest(
            String indexName, String fieldName,
            Symbol.RelationalEnum operator, String value,
            String visitNo, String fieldType,
            List<QueryNode> mergedConditions,
            List<String> batchIds) {

        org.elasticsearch.action.search.SearchRequest searchRequest =
                new org.elasticsearch.action.search.SearchRequest(indexName);
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();

        // 构建主查询条件
        QueryBuilder mainQuery = buildMainQuery(fieldName, operator, value, fieldType, batchIds);

        // 处理合并条件
        if (!CollectionUtils.isEmpty(mergedConditions)) {
            BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
            QueryNode queryNode = mergedConditions.get(0);
            Symbol.LogicEnum lastOperator = queryNode.getLastOperator();
            switch (lastOperator) {
                case AND:
                    boolQuery.must(mainQuery);  // AND condition
                    break;
                case OR:
                    boolQuery.should(mainQuery);  // OR condition
                    break;
                default:
                    boolQuery.must(mainQuery);  // Default to AND behavior
                    break;
            }

            for (QueryNode condition : mergedConditions) {
                QueryBuilder conditionQuery = buildConditionQuery(condition);
                if (condition.getLastOperator() == Symbol.LogicEnum.AND) {
                    boolQuery.must(conditionQuery);
                } else {
                    boolQuery.should(conditionQuery);
                }
            }
            mainQuery = boolQuery;
        }

        // Configure field inclusion/exclusion based on table definition
        List<FieldDTO> fields = tableFieldService.getShowFieldsByTableId(indexName);
        if (fields != null && !fields.isEmpty()) {
            String[] includes = fields.stream()
                    .map(FieldDTO::getFieldCode)
                    .filter(Objects::nonNull)  // Null check for safety
                    .toArray(String[]::new);

            // Explicit empty array for exclusions
            searchSourceBuilder.fetchSource(includes, new String[0]);
        }
        searchSourceBuilder.query(mainQuery)
                .size(9000); // 确保返回所有匹配结果

        searchRequest.source(searchSourceBuilder);
        return searchRequest;
    }

    /**
     * 构建主查询条件
     */
    private QueryBuilder buildMainQuery(String fieldName, Symbol.RelationalEnum operator,
                                        String value, String fieldType,
                                        List<String> batchIds) {

        // 如果字段类型是 text，则使用 .keyword 字段
        String keywordField = fieldName;
        if (fieldType.equals("text")) {
            keywordField = fieldName + ".keyword";
        }

        // 主键字段
        String primaryKey = "visit_no.keyword";

        // 如果operator是EQ且batchIds不为空，则构建terms查询(IN条件)
        if (!CollectionUtils.isEmpty(batchIds)) {
            return QueryBuilders.termsQuery(primaryKey, batchIds);
        }
        // 其他操作符的查询构建
        switch (operator) {
            case EQ:
                return QueryBuilders.termQuery(keywordField, value);
            case GT:
                return QueryBuilders.rangeQuery(keywordField).gt(value);
            case GE:
                return QueryBuilders.rangeQuery(keywordField).gte(value);
            case LT:
                return QueryBuilders.rangeQuery(keywordField).lt(value);
            case LE:
                return QueryBuilders.rangeQuery(keywordField).lte(value);
            case LIKE:
                return QueryBuilders.queryStringQuery(value)
                        .field(keywordField);
            case PREFIX:
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.prefixQuery(keywordField, value));
            case IS_NOT_NULL:
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.existsQuery(fieldName));
            case NOT_CONTAIN:
                return QueryBuilders.boolQuery()
                        .mustNot(QueryBuilders.matchPhraseQuery(fieldName, value.replace("*", "")));
            case BETWEEN:
                String[] split = value.split(",");
                String start = split[0];
                String end = split[1];
                return QueryBuilders.boolQuery()
                        .must(QueryBuilders.rangeQuery(keywordField).gte(start).lte(end));
            default:
                throw new IllegalArgumentException("Unsupported operator: " + operator);
        }
    }

    /**
     * 构建合并条件查询
     */
    private QueryBuilder buildConditionQuery(QueryNode condition) {
        return buildMainQuery(
                condition.getFieldNameEn(),
                condition.getOperator(),
                condition.getValue(),
                condition.getFieldType(),
                null // 合并条件不使用batchIds
        );
    }
}
