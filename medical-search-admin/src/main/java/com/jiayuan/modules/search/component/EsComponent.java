package com.jiayuan.modules.search.component;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.map.MapUtil;
import com.google.common.collect.Lists;
import com.jiayuan.common.component.DesensitizedComponent;
import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.dto.SearchDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.indices.GetMappingsRequest;
import org.elasticsearch.client.indices.GetMappingsResponse;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.SearchScrollHits;
import org.springframework.data.elasticsearch.core.mapping.IndexCoordinates;
import org.springframework.data.elasticsearch.core.query.Query;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Title: EsComponent
 * @Package: com.jiayuan.common.component
 * @Description: ES组件
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/10
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class EsComponent {

    private final CustomConfig customConfig;
    private final ElasticsearchRestTemplate elasticsearchRestTemplate;

    /**
     * 检索
     *
     * @return
     */
    public SearchHits<Map> search(Query query) {
        final SearchHits<Map> searchHits = elasticsearchRestTemplate.search(query, Map.class, IndexCoordinates.of(customConfig.getEsIndexName()));
        return searchHits;

    }


    /**
     * 获取索引mapping结构
     *
     * @return
     */
    public Map<String, Object> getIndexMapping() {
        GetMappingsRequest request = new GetMappingsRequest().indices(customConfig.getEsIndexName());
        GetMappingsResponse response = elasticsearchRestTemplate.execute(client -> client.indices().getMapping(request, RequestOptions.DEFAULT));

        final Map<String, Object> sourceAsMap = response.mappings().get(customConfig.getEsIndexName()).getSourceAsMap();
        final Map<String, Object> map = (Map<String, Object>) sourceAsMap.get("properties");

        //处理主附表内嵌结构
        Map<String, Object> resultMap = MapUtil.newHashMap();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            String tableCode = entry.getKey();
            if (entry.getValue() instanceof Map) {
                Map<String, Object> value = (Map<String, Object>) entry.getValue();
                Map<String, Object> fieldMap = (Map<String, Object>) value.get("properties");
                if (CollectionUtil.isNotEmpty(fieldMap)){
                    for (Map.Entry<String, Object> fieldEntry : fieldMap.entrySet()) {
                        String type = ((Map<String, Object>) fieldEntry.getValue()).get("type").toString();
                        if ("nested".equals(type)) {
                            resultMap.put(fieldEntry.getKey(), fieldEntry.getValue());
                        }
                    }
                    resultMap.put(tableCode, value);
                }
            }
        }
        return resultMap;
    }




    /**
     * 检索scroll
     *
     * @param dto
     * @param query
     * @return
     */
    public List searchScroll(SearchDTO dto, Query query) {
        //保留1分钟
        long scrollTimeInMillis = 60 * 1000;

        List<SearchHit<Map>> hitRows = Lists.newArrayList();
        IndexCoordinates msIndex = IndexCoordinates.of(customConfig.getEsIndexName());
        SearchScrollHits<Map> hits = elasticsearchRestTemplate.searchScrollStart(scrollTimeInMillis, query, Map.class, msIndex);
        hitRows.addAll(hits.getSearchHits());
        // scrollId
        String scrollId = hits.getScrollId();
        while (!hits.isEmpty()) {
            hits = elasticsearchRestTemplate.searchScrollContinue(scrollId, scrollTimeInMillis, Map.class, msIndex);
            scrollId = hits.getScrollId();
            hitRows.addAll(hits.getSearchHits());
        }

        elasticsearchRestTemplate.searchScrollClear(ListUtil.of(scrollId));

        List<Map> rows = SearchResultUtil.innerHitDataBackFill(hitRows, dto);

        //人维度的需要分组
        if (!BuilderSourceUtil.isPersonTimes(dto.getSearchRequest().getDimension())) {
            //第三步按照 人维度进行分组
            final Map<Object, List<Map>> map = SearchResultUtil.groupByPatientId(rows);
            List result = new ArrayList<>(16);
            for (Map.Entry<Object, List<Map>> entry : map.entrySet()) {
                final List<Map> subList = entry.getValue();
                final Object basic = subList.get(0).get(EsConstant.MS_VISIT_RECORD);
                final EsPageData.Group group = EsPageData.Group.builder().basic(basic).subList(subList).build();
                result.add(group);
            }

            return result;
        }

        //脱敏
        return DesensitizedComponent.desensitization(rows);
    }


}
