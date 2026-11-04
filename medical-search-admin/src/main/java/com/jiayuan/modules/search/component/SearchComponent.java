package com.jiayuan.modules.search.component;

import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.search.aggregations.bucket.nested.ParsedNested;
import org.elasticsearch.search.aggregations.bucket.terms.ParsedStringTerms;
import org.elasticsearch.search.aggregations.metrics.ParsedCardinality;
import org.springframework.data.elasticsearch.core.ElasticsearchAggregations;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.Query;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Title: SearchComponent
 * @Package: com.jiayuan.common.component
 * @Description: 检索组件
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/24
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class SearchComponent {


    private final ExpressionComponent expressionComponent;
    private final EsComponent esComponent;


    /**
     * 检索
     *
     * @param request
     * @return
     */
    public EsPageData search(SearchRequest request) {
        if (BuilderSourceUtil.isPersonTimes(request.getDimension())) {
            return searchOfVisit(request);
        } else {
            return searchOfPerson(request);
        }
    }


    /**
     * 人次检索
     *
     * @param request
     * @return
     */
    public EsPageData searchOfVisit(SearchRequest request) {
        // 表达式解析
        SearchDTO dto = expressionComponent.parseExpression(request);
        // 构建查询参数
        final Query query = BuilderSourceUtil.buildQuery(dto);
        final SearchHits<Map> searchHits = esComponent.search(query);
        List rows = SearchResultUtil.afterSearch(dto, searchHits);
        // 构建分页数据
        EsPageData page = SearchResultUtil.buildEsPageData(dto, searchHits.getTotalHits(), rows, query, null);
        return page;
    }


    /**
     * 人维度检索
     *
     * @param request
     * @return
     */
    public EsPageData searchOfPerson(SearchRequest request) {
        // 表达式解析
        SearchDTO dto = expressionComponent.parseExpression(request);
        // 构建查询参数
        final Query query = BuilderSourceUtil.buildQuery(dto);
        // 第一次聚合查询 获取分页患者id数据
        final SearchHits<Map> searchHits = esComponent.search(query);

        //获取第一次检索的患者ids
        final ElasticsearchAggregations aggregations = (ElasticsearchAggregations) searchHits.getAggregations();
        final ParsedNested nestedAgg = aggregations.aggregations().get(EsConstant.AGG_NESTED);
        final ParsedCardinality totalAgg = nestedAgg.getAggregations().get(EsConstant.AGG_TOTAL);
        final ParsedStringTerms groupAgg = nestedAgg.getAggregations().get(EsConstant.AGG_GROUP);
        List<String> patientIds = ((List<ParsedStringTerms.ParsedBucket>) groupAgg.getBuckets())
                .stream()
                .map(bucket -> bucket.getKeyAsString())
                .collect(Collectors.toList());

        //第二次检索 获取数据患者ids查询具体的就诊数据
        final Query query1 = BuilderSourceUtil.buildQuery(query, patientIds, dto);
        final SearchHits<Map> searchHits1 = esComponent.search(query1);


        List<Map> collect = SearchResultUtil.afterSearch(dto, searchHits1);

        //第三步按照 人维度进行分组
        final Map<Object, List<Map>> map = SearchResultUtil.groupByPatientId(collect);
        List rows = new ArrayList<>(16);
        for (Map.Entry<Object, List<Map>> entry : map.entrySet()) {
            final List<Map> subList = entry.getValue();
            final Object basic = subList.get(0).get(EsConstant.MS_VISIT_RECORD);
            final EsPageData.Group group = EsPageData.Group.builder().basic(basic).subList(subList).build();
            rows.add(group);
        }
        // 构建分页数据
        EsPageData page = SearchResultUtil.buildEsPageData(dto, totalAgg.getValue(), rows, query, query1);
        return page;
    }


    /**
     * 获取索引mapping结构
     *
     * @return
     */
    public Map<String, Object> getIndexMapping() {
        return esComponent.getIndexMapping();
    }


    /**
     * 检索scroll
     *
     * @param dto
     * @param query
     * @return
     */
    public List searchScroll(SearchDTO dto, Query query) {
        return esComponent.searchScroll(dto, query);
    }


    /**
     * 获取检索字段列表
     *
     * @param expression
     * @return
     */
    public List<FieldDTO> getSearchFields(String expression) {
        return expressionComponent.getSearchFields(expression);
    }
}
