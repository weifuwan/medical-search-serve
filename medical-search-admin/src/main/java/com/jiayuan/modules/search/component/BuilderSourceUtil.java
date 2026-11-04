package com.jiayuan.modules.search.component;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.PageUtil;
import cn.hutool.core.util.StrUtil;
import com.jiayuan.common.cache.DictCache;
import com.jiayuan.common.component.EmptyPage;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.enums.TableSlaveType;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.search.join.ScoreMode;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.NestedQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.nested.NestedAggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.aggregations.metrics.CardinalityAggregationBuilder;
import org.elasticsearch.search.aggregations.pipeline.BucketSortPipelineAggregationBuilder;
import org.elasticsearch.search.sort.NestedSortBuilder;
import org.elasticsearch.search.sort.SortBuilders;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.document.NestedMetaData;
import org.springframework.data.elasticsearch.core.query.*;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Title: EsHelper
 * @Package: com.jiayuan.common.utils
 * @Description: DSL分页、排序、过滤字段、高亮类
 * @Author: 李建奎
 * @Date: 创建时间 2023/3/15
 */
@Slf4j
public class BuilderSourceUtil {


    /**
     * 构建查询参数
     *
     * @param dto
     */
    public static Query buildQuery(SearchDTO dto) {
        final NativeSearchQueryBuilder nativeSearchQueryBuilder = new NativeSearchQueryBuilder()
                .withQuery(dto.getFinalResult())
                .withTrackTotalHits(true);
        final SearchRequest searchRequest = dto.getSearchRequest();
        final Integer page = searchRequest.getPage();
        final Integer size = searchRequest.getSize();
        final Integer dimension = searchRequest.getDimension();
        if (isPersonTimes(dimension)) {
            // 人次维度
            if (isPage(page, size)) {
                nativeSearchQueryBuilder.withPageable(PageRequest.of(page, size));
            }
            // 返回字段过滤
            nativeSearchQueryBuilder.withSourceFilter(buildSourceFilter(dto.getSourceFieldList()));
            // 排序
            buildSort(searchRequest, nativeSearchQueryBuilder);
        } else {
            // 人维度
            /**
             *  --nestedAgg 内嵌聚合
             *  ----groupAgg 按照患者进行分组
             *  ------pageAgg 分页
             *  ----totalAgg 获取总数
             */
            nativeSearchQueryBuilder.withPageable(EmptyPage.INSTANCE);
            nativeSearchQueryBuilder.withSourceFilter(buildSourceFilter(new HashSet<>()));
            final TermsAggregationBuilder groupAgg = AggregationBuilders
                    .terms(EsConstant.AGG_GROUP)
                    .field(EsConstant.FIELD_GROUP + EsConstant.KEYWORD)
                    .size(Integer.MAX_VALUE);
            if (isPage(page, size)) {
                final BucketSortPipelineAggregationBuilder pageAgg = new BucketSortPipelineAggregationBuilder(EsConstant.AGG_PAGE, null)
                        .from(PageUtil.getStart(page, size)).size(size);
                groupAgg.subAggregation(pageAgg);
            }
            final CardinalityAggregationBuilder totalAgg = AggregationBuilders
                    .cardinality(EsConstant.AGG_TOTAL).field(EsConstant.FIELD_GROUP + EsConstant.KEYWORD).precisionThreshold(EsConstant.MAX_PRECISION_THRESHOLD);
            final NestedAggregationBuilder nestedAgg = AggregationBuilders.nested(EsConstant.AGG_NESTED, EsConstant.NESTED_PATH)
                    .subAggregation(groupAgg)
                    .subAggregation(totalAgg);
            nativeSearchQueryBuilder.withAggregations(nestedAgg);
        }

        final NativeSearchQuery query = nativeSearchQueryBuilder.build();
        log.info("es检索DSL-query语句：{}", query.getQuery());
        return query;
    }


    /**
     * 构建返回字段filter
     *
     * @param columnList
     * @return
     */
    public static SourceFilter buildSourceFilter(Set<FieldDTO> columnList) {
        if (CollectionUtil.isNotEmpty(columnList)) {
            final List<String> collect = columnList.stream().map(e -> BuilderSourceUtil.getFieldCode(e)).collect(Collectors.toList());
            final String[] objects = collect.toArray(new String[collect.size()]);
            SourceFilter sourceFilter = new FetchSourceFilterBuilder().withIncludes(objects).build();
            return sourceFilter;
        }
        return null;
    }


    /**
     * 按照就诊ids构建检索参数
     *
     * @param query
     * @param patientIds
     * @param dto
     * @return
     */
    public static Query buildQuery(Query query, List<String> patientIds, SearchDTO dto) {
        SearchRequest searchRequest = dto.getSearchRequest();
        BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
        final NestedQueryBuilder nestedQueryBuilder = QueryBuilders.nestedQuery(EsConstant.NESTED_PATH, QueryBuilders.termsQuery(EsConstant.FIELD_GROUP + EsConstant.KEYWORD, patientIds), ScoreMode.None);
        final QueryBuilder first = ((NativeSearchQuery) query).getQuery();
        boolQuery.filter(first);
        boolQuery.filter(nestedQueryBuilder);
        final NativeSearchQueryBuilder nativeSearchQueryBuilder = new NativeSearchQueryBuilder()
                .withQuery(boolQuery)
                // 返回字段过滤
                .withSourceFilter(buildSourceFilter(dto.getSourceFieldList()))
                .withPageable(Pageable.ofSize(200));
        // 排序
        buildSort(searchRequest, nativeSearchQueryBuilder);
        NativeSearchQuery build = nativeSearchQueryBuilder.build();
        log.info("es检索人维度DSL-query语句：{}", build.getQuery());
        return build;
    }

    /**
     * 构建排序
     *
     * @param searchRequest
     * @param nativeSearchQueryBuilder
     */
    public static void buildSort(SearchRequest searchRequest, NativeSearchQueryBuilder nativeSearchQueryBuilder) {
        final String orderTableCode = searchRequest.getOrderTableCode();
        if (Objects.nonNull(searchRequest.getOrderField())) {
            nativeSearchQueryBuilder.withSorts(SortBuilders
                    .fieldSort(getFieldCodeOfKeyword(searchRequest.getOrderField()))
                    .order(Constant.ASC.equalsIgnoreCase(searchRequest.getOrderMode()) ? SortOrder.ASC : SortOrder.DESC)
                    .setNestedSort(new NestedSortBuilder(orderTableCode)));
        } else {
            nativeSearchQueryBuilder.withSorts(SortBuilders
                    .fieldSort(EsConstant.MS_VISIT_RECORD + "." + EsConstant.VISIT_DATE  + EsConstant.KEYWORD)
                    .order(SortOrder.DESC)
                    .setNestedSort(new NestedSortBuilder(EsConstant.MS_VISIT_RECORD)));
        }
    }

    /**
     * 是否分页
     *
     * @param page
     * @param size
     * @return
     */
    public static boolean isPage(Integer page, Integer size) {
        return Objects.nonNull(page) && Objects.nonNull(size);
    }

    /**
     * 检索维度人次判断
     *
     * @param dimension
     * @return
     */
    public static boolean isPersonTimes(Integer dimension) {
        return BizConstant.Dimension.PERSON_TIMES.getCode().equals(dimension);
    }


    /**
     * 检索结果高亮处理
     *
     * @param searchHits
     */
    public static void highlightOfSearchHis(SearchHits<Map> searchHits) {
        final List<SearchHit<Map>> hitList = searchHits.getSearchHits();

        for (SearchHit<Map> searchHit : hitList) {
            // Map<tableCode,Map<fieldCode,value>>
            final Map<String, ?> map = (Map<String, Map<String, String>>) searchHit.getContent();
            final Map<String, SearchHits<?>> innerHitMap = searchHit.getInnerHits();

            if (CollectionUtil.isNotEmpty(innerHitMap)) {
                for (Map.Entry<String, SearchHits<?>> entry : innerHitMap.entrySet()) {
                    final String innerHitName = entry.getKey();
                    final List<? extends SearchHit<?>> highlightSearchHits = entry.getValue().getSearchHits();
                    if (CollectionUtil.isNotEmpty(highlightSearchHits)) {
                        final Map<String, List<String>> highlightFields = highlightSearchHits.get(0).getHighlightFields();
                        final NestedMetaData nestedMetaData = highlightSearchHits.get(0).getNestedMetaData();
                        if (CollectionUtil.isNotEmpty(highlightFields)) {
                            highlightFields.entrySet().forEach(e -> {
                                final String[] keys = e.getKey().split("\\.");
                                final List<String> value = e.getValue();
                                // map.get(keys[0])两种情况：一种是对象 一种是集合
                                final Object o = map.get(keys[0]);
                                if (o instanceof Map) {
                                    ((Map<String, String>) o).put(keys[1], value.get(0));
                                } else if (o instanceof List) {
                                    ((List<Map<String, String>>) o).get(nestedMetaData.getOffset()).put(keys[1], value.get(0));
                                }

                            });
                        }
                    }
                }
            }
        }


    }


    /**
     * 构建内嵌字段
     *
     * @param field
     * @return
     */
    public static String getFieldCode(FieldDTO field) {
        if (TableSlaveType.SUB.getCode().equals(field.getSlaveType())) {
            return field.getMainTableCode() + "." + field.getTableCode() + "." + field.getFieldCode();
        }
        return field.getTableCode() + "." + field.getFieldCode();
    }

    /**
     * 构建keyword类型的内嵌字段
     *
     * @param field
     * @return
     */
    public static String getFieldCodeOfKeyword(FieldDTO field) {
        String dataType = field.getDataType();
        if (StrUtil.isNotBlank(dataType) && EsConstant.dataTypes.contains(dataType)) {
            return getFieldCode(field);
        }
        return getFieldCode(field) + EsConstant.KEYWORD;
    }


    /**
     * 判断是否需要高亮显示
     *
     * @param field
     * @param request
     * @return
     */
    public static boolean isHighlight(FieldDTO field, SearchRequest request) {
        final List<FieldDTO> columnList = request.getColumnList();
        final Boolean highlight = Optional.ofNullable(request.getHighlight()).orElse(false);
        if (highlight && CollectionUtil.isNotEmpty(columnList)) {
            final boolean isContain = columnList.stream().anyMatch(e -> e.getTableCode().equals(field.getTableCode())
                    && e.getFieldCode().equals(field.getFieldCode()));
            return isContain;
        }
        return false;
    }


    /**
     * 字典类型内容字段转换
     *
     * @param fieldList
     * @param row
     */
    public static void convertOfDictionary(List<FieldDTO> fieldList, List row) {
        if (CollectionUtil.isNotEmpty(fieldList) && CollectionUtil.isNotEmpty(row)) {
            // 1.过滤出来需要转换的字段，并封装对应转换的字典以及字典值
            // 2.数据批量进行转换
            final List<FieldConvertData> convertDataList = fieldList.stream().filter(e -> isConvert(e)).map(field ->
                    FieldConvertData.builder()
                            .field(field)
                            .cache(DictCache.getDictCache(field.getDictType()))
                            .build()).collect(Collectors.toList());
            for (FieldConvertData con : convertDataList) {
                row.stream().forEach(e -> {
                    final FieldDTO dto = con.getField();
                    final Object o = ((Map) e).get(dto.getTableCode());
                    if (ObjectUtil.isNotEmpty(o)) {
                        if (o instanceof Map) {
                            replaceAttrs((Map) o, dto, con);
                        } else if (o instanceof List) {
                            ((List) o).forEach(el -> replaceAttrs((Map) el, dto, con));
                        }
                    }
                });
            }

        }
    }

    /**
     * 高亮显示
     *
     * @param dto
     * @return
     */
    public static void toHighlight(SearchDTO dto, List rows) {
        SearchRequest request = dto.getSearchRequest();
        final Boolean highlight = request.getHighlight();
        final List<FieldDTO> columnList = request.getColumnList();
        final List<SearchDTO.Item> items = dto.getSuffixExpressionDtoList();

        // 是否高亮初步判断
        if (Objects.isNull(highlight)) {
            return;
        }
        boolean flag = highlight && CollectionUtil.isNotEmpty(columnList)
                && CollectionUtil.isNotEmpty(items) && CollectionUtil.isNotEmpty(rows);

        if (!flag) {
            return;
        }

        // 过滤具体要高亮的字段
        final List<SearchDTO.Item> highlightItemList = items.stream().filter(e ->
                !Symbol.Type.LOGIC.equals(e.getType())
                        && (Symbol.RelationalEnum.EQ.equals(e.getRelationalEnum())
                        || Symbol.RelationalEnum.LIKE.equals(e.getRelationalEnum()))
        ).collect(Collectors.toList());

        // 高亮处理
        highlightItemList.forEach(item -> {
            rows.forEach(row -> {
                FieldDTO field = item.getField();
                final String fieldCode = field.getFieldCode();
                final String tableCode = field.getTableCode();
                final String val = item.getVal().replace("*", "");
                final boolean isContain = columnList.stream().anyMatch(e -> e.getTableCode().equals(tableCode)
                        && e.getFieldCode().equals(fieldCode));
                if (!isContain) {
                    return;
                }
                final Object o = ((Map) row).get(tableCode);
                final String finalReplaceVal = "<span style='color:red'>" + val + "</span>";
                if (o instanceof Map) {
                    final String value = ((Map<String, String>) o).get(fieldCode);
                    if (StrUtil.isNotBlank(value)) {
                        ((Map<String, String>) o).put(fieldCode, value.replace(val, finalReplaceVal));
                    }
                } else if (o instanceof List) {
                    ((List<Map<String, String>>) o).forEach(e -> {
                        final String value = e.get(fieldCode);
                        if (StrUtil.isNotBlank(value)) {
                            e.put(fieldCode, value.replace(val, finalReplaceVal));
                        }
                    });
                }
            });
        });
    }


    /**
     * 属性值替换
     *
     * @param el
     * @param dto
     * @param con
     */
    private static void replaceAttrs(Map el, FieldDTO dto, FieldConvertData con) {
        final Object fieldCodeVal = el.get(dto.getFieldCode());
        if (ObjectUtil.isNotNull(fieldCodeVal)) {
            final String s = con.getCache().get(fieldCodeVal.toString());
            el.put(dto.getFieldCode(), s);
        }
    }


    /**
     * 判断是否需要转换
     *
     * @param field
     * @return
     */
    private static boolean isConvert(FieldDTO field) {
        if (BooleanEnum.TRUE.getCode().equals(field.getIsDict())) {
            final String dictType = field.getDictType();
            if (StrUtil.isNotBlank(dictType)) {
                final Map<String, String> cache = DictCache.getDictCache(dictType);
                return CollectionUtil.isNotEmpty(cache);
            }
        }
        return false;
    }

    /**
     * 获取nested path
     *
     * @param field
     * @return
     */
    public static String getNestedPath(FieldDTO field) {
        if (TableSlaveType.SUB.getCode().equals(field.getSlaveType())) {
            return field.getMainTableCode() + "." + field.getTableCode();
        }
        return field.getTableCode();
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    private static class FieldConvertData {
        /**
         * 字典信息
         */
        private FieldDTO field;


        /**
         * 字典缓存
         */
        private Map<String, String> cache;
    }
}
