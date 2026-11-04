package com.jiayuan.modules.search.component;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.google.common.collect.Maps;
import com.jiayuan.common.component.DesensitizedComponent;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.FieldUseType;
import com.jiayuan.common.enums.SearchWay;
import com.jiayuan.common.enums.TableSlaveType;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.dto.TableRelatedDTO;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.Query;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Title: com.jiayuan.common.component.optimize
 * @Package: SearchResultUtil
 * @Description: 检索结果处理类
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/15
 */
@Slf4j
public class SearchResultUtil {

    /**
     * 结果过滤
     *
     * @param searchHits
     * @param dto
     * @return
     */
    public static List resultFilter(SearchHits<Map> searchHits, SearchDTO dto) {
        List rows = new ArrayList<>();
        try {
            boolean isOr = false;
            final List<SearchHit<Map>> hitList = searchHits.getSearchHits();
            //按照表分组
            Map<String, List<FieldDTO>> tables = Maps.newHashMap();
            if (SearchWay.KEYWORD.equals(dto.getSearchWay())) {
                isOr = true;
                dto.getKeywordSearchFields().forEach(field -> {
                    field.setVal(dto.getSearchRequest().getExpression());
                    field.setRelationalEnum(Symbol.RelationalEnum.LIKE);
                    tables.computeIfAbsent(field.getTableCode(), k -> new ArrayList<>()).add(field);
                });
            } else {
                isOr = dto.getSuffixExpressionDtoList().stream().anyMatch(item -> Symbol.LogicEnum.OR.equals(item.getLogicEnum()));
                List<SearchDTO.Item> searchItems = dto.getSuffixExpressionDtoList().stream().filter(item -> Objects.isNull(item.getLogicEnum())).collect(Collectors.toList());
                for (SearchDTO.Item item : searchItems) {
                    FieldDTO field = item.getField();
                    field.setVal(item.getVal());
                    field.setRelationalEnum(item.getRelationalEnum());
                    tables.computeIfAbsent(field.getTableCode(), k -> new ArrayList<>()).add(field);
                }
            }


            //过滤
            for (SearchHit<Map> searchHit : hitList) {
                // Map<tableCode,Map<fieldCode,value>>
                Map<String, Object> map = searchHit.getContent();
                for (Map.Entry<String, List<FieldDTO>> entry : tables.entrySet()) {
                    if (CollectionUtil.isNotEmpty(map)) {
                        filterRowObject(map, entry.getKey(), entry.getValue(), isOr);
                    }
                }

                if (CollectionUtil.isNotEmpty(map)) {
                    rows.add(map);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        return rows;
    }


    /**
     * 填充空字段
     *
     * @param row
     * @param searchItems
     */
    private static void fillNull(Object row, List<SearchDTO.Item> searchItems) {
        try {
            searchItems.forEach(item -> fillSingleSearchValue(row, item));
        } catch (Exception e) {
            log.error("填充空字段失败", e);
        }
    }

    /**
     * 单个字段填充
     *
     * @param row
     * @param item
     */
    private static void fillSingleSearchValue(Object row, SearchDTO.Item item) {
        try {
            String searchVal = item.getVal();
            if (StrUtil.isBlank(searchVal)) {
                return;
            }

            Symbol.RelationalEnum relationalEnum = item.getRelationalEnum();
            if (Symbol.RelationalEnum.LIKE.equals(relationalEnum)) {
                searchVal = trimStart(searchVal);
            } else if (Symbol.RelationalEnum.BETWEEN.equals(relationalEnum)) {
                String[] split = searchVal.split(",");
                searchVal = split[0];
            } else if (Symbol.RelationalEnum.IS_NOT_NULL.equals(relationalEnum)) {
                return;
            }

            String finalSearchVal = searchVal;
            String finalSearchVal1 = searchVal;

            FieldDTO field = item.getField();
            String tableCode = field.getTableCode();
            String fieldCode = field.getFieldCode();
            Boolean isLoop = field.getIsLoop();

            Object o = ((Map<String, Object>) row).get(tableCode);
            if (Objects.nonNull(o)) {
                if (o instanceof List) {
                    ((List<Map<String, Object>>) o).stream().forEach(e -> {
                        Object fieldNowVal = e.get(fieldCode);
                        if (Objects.isNull(fieldNowVal)) {
                            e.put(fieldCode, finalSearchVal);
                        }
                    });
                } else {
                    Object fieldNowVal = ((Map<String, Object>) o).get(fieldCode);
                    if (Objects.isNull(fieldNowVal)) {
                        ((Map<String, Object>) o).put(fieldCode, finalSearchVal1);
                    }
                }
            } else {
                if (isLoop) {
                    ((Map<String, Object>) row).put(tableCode, new ArrayList<Map<String, Object>>() {{
                        add(new HashMap<String, Object>() {{
                            put(fieldCode, finalSearchVal1);
                        }});
                    }});

                } else {
                    ((Map<String, Object>) row).put(tableCode, new HashMap<String, Object>() {{
                        put(fieldCode, finalSearchVal1);
                    }});
                }
            }
        } catch (Exception e) {
            log.error("单个字段填充失败", e);
        }
    }

    /**
     * 单个行对象进行单个过滤条件过滤
     *
     * @param rowMap
     * @param tableCode
     */
    private static void filterRowObject(Map<String, Object> rowMap, String tableCode, List<FieldDTO> fieldList, Boolean isOr) {
        for (FieldDTO field : fieldList) {
            Integer slaveType = field.getSlaveType();
            String fieldCode = field.getFieldCode();
            Boolean isLoop = field.getIsLoop();
            String filterVal = field.getVal();
            Symbol.RelationalEnum relationalEnum = field.getRelationalEnum();

            if (!TableSlaveType.SUB.getCode().equals(slaveType)) {
                //非子表数据过滤
                if (isLoop) {
                    List<Map<String, Object>> os = (List<Map<String, Object>>) rowMap.get(tableCode);

                    if (CollectionUtil.isNotEmpty(os)) {
                        List<Map<String, Object>> afterOs = os.stream().filter(o -> filterTableObject(o, fieldCode, filterVal, relationalEnum, isOr)).collect(Collectors.toList());
                        rowMap.put(tableCode, afterOs);
                    }
                }
                // 对象只有一条说明就是检索准确的
            } else {
                //子表数据过滤
                String mainTableCode = field.getMainTableCode();
                //默认主表一般是循环表，所以这里不需要判断是否循环
                List<Map<String, Object>> mainOs = (List<Map<String, Object>>) rowMap.get(mainTableCode);
                if (CollectionUtil.isNotEmpty(mainOs)) {
                    List<Map<String, Object>> afterOs = mainOs.stream().filter(o -> {
                        List<Map<String, Object>> afterSubList = filterSubTableObject(o, tableCode, fieldCode, filterVal, relationalEnum, isOr);
                        if (CollectionUtil.isNotEmpty(afterSubList)) {
                            o.put(tableCode, afterSubList);
                            return true;
                        }
                        return false;
                    }).collect(Collectors.toList());
                    if (CollectionUtil.isNotEmpty(afterOs)) {
                        List<Map<String, Object>> subList = afterOs.stream().flatMap(o -> ((List<Map<String, Object>>) o.get(tableCode)).stream()).collect(Collectors.toList());
                        rowMap.put(tableCode, subList);
                    }
                    rowMap.put(mainTableCode, afterOs);

                }
            }
        }
    }

    /**
     * 非主附表结构数据过滤
     *
     * @param tableMap
     * @param fieldCode
     * @param filterVal
     * @param relationalEnum
     * @return
     */
    private static boolean filterTableObject(Map<String, Object> tableMap, String fieldCode, String filterVal, Symbol.RelationalEnum relationalEnum, Boolean isOr) {
        if (isOr) {
            return true;
        }
        Object fieldVal = tableMap.get(fieldCode);
        if (Objects.nonNull(fieldVal)) {
            final String value = fieldVal.toString();
            if (StrUtil.isNotBlank(value)) {
                switch (relationalEnum) {
                    case EQ:
                        return filterVal.equals(value);
                    case NE:
                        return !filterVal.equals(value);
                    case GT:
                        return filterVal.compareTo(value) < 0;
                    case GE:
                        return filterVal.compareTo(value) <= 0;
                    case LT:
                        return filterVal.compareTo(value) > 0;
                    case LE:
                        return filterVal.compareTo(value) >= 0;
                    case LIKE:
                        return value.contains(trimStart(filterVal));
                    case BETWEEN:
                        String[] split = filterVal.split(",");
                        return value.compareTo(split[0]) >= 0 && value.compareTo(split[1]) <= 0;
                    case IS_NOT_NULL:
                        return StrUtil.isNotBlank(value);
                    case NOT_CONTAIN:
                        return !value.contains(filterVal);
                    default:
                        return false;
                }
            }
        }

        return false;
    }

    /**
     * 去掉内容前后的*
     *
     * @param str
     * @return
     */
    private static String trimStart(String str) {
        if (StrUtil.isNotBlank(str)) {
            str = str.replaceFirst("\\*", "");
            str = str.replaceFirst("(?s)" + "\\*" + "(?!.*?" + "\\*" + ")", "");
        }
        return str;
    }

    /**
     * 主附表结构数据过滤
     *
     * @param tableMap
     * @param subTableCode
     * @param fieldCode
     * @param filterVal
     * @param relationalEnum
     * @return
     */
    private static List<Map<String, Object>> filterSubTableObject(Map<String, Object> tableMap, String subTableCode, String fieldCode, String filterVal, Symbol.RelationalEnum relationalEnum, Boolean isOr) {
        List<Map<String, Object>> subList = (List<Map<String, Object>>) tableMap.get(subTableCode);
        if (CollectionUtil.isNotEmpty(subList)) {
            List<Map<String, Object>> afterSubList = subList.stream().filter(subMap -> filterTableObject(subMap, fieldCode, filterVal, relationalEnum, isOr)).collect(Collectors.toList());
            if (CollectionUtil.isNotEmpty(afterSubList)) {
                return afterSubList;
            }
        }

        return null;
    }

    /**
     * innerHit数据回填
     *
     * @param hitList
     * @param dto
     */
    public static List innerHitDataBackFill(List<SearchHit<Map>> hitList, SearchDTO dto) {
        List rows = new ArrayList<>();
        try {
            Map<String, TableRelatedDTO> fieldMap = dto.getFieldMap();
            for (SearchHit<Map> searchHit : hitList) {
                // Map<tableCode,Map<fieldCode,value>>
                final Map<String, Object> map = searchHit.getContent();
                final Map<String, SearchHits<?>> outerInnerHitMap = searchHit.getInnerHits();

                if (CollectionUtil.isNotEmpty(outerInnerHitMap)) {
                    //最外层innerHit 覆盖
                    Map<String, Object> coverMap = new HashMap<>();
                    for (Map.Entry<String, SearchHits<?>> entry : outerInnerHitMap.entrySet()) {
                        final List<? extends SearchHit<?>> outerInnerSearchHits = entry.getValue().getSearchHits();
                        if (CollectionUtil.isNotEmpty(outerInnerSearchHits)) {
                            String outerTableCode = "";
                            String[] outerSplit = entry.getKey().split("\\.");
                            if (outerSplit.length > 2) {
                                outerTableCode = outerSplit[1];
                            } else {
                                outerTableCode = outerSplit[0];
                            }
                            List outerList = outerInnerSearchHits.stream().map(SearchHit::getContent).collect(Collectors.toList());
                            TableRelatedDTO tableRelatedDTO = fieldMap.get(outerTableCode);
                            Boolean isLoop = tableRelatedDTO.getIsLoop();
                            if (coverMap.containsKey(outerTableCode) && isLoop) {
                                List os = (List) coverMap.get(outerTableCode);
                                if (CollectionUtil.isNotEmpty(os)) {
                                    os.addAll(outerList);
                                    coverMap.put(outerTableCode, os);
                                } else {
                                    coverMap.put(outerTableCode, outerList);
                                }
                            } else {
                                coverMap.put(outerTableCode, isLoop ? outerList : outerList.get(0));
                            }


                            //最内层innerHit，也就是子表innerHit
                            outerInnerSearchHits.stream().forEach(outerHit -> {
                                Map<String, SearchHits<?>> innerHits = outerHit.getInnerHits();
                                if (CollectionUtil.isNotEmpty(innerHits)) {
                                    innerHits.entrySet().forEach(innerEntry -> {
                                        List<?> innerList = innerEntry.getValue().getSearchHits().stream().map(SearchHit::getContent).collect(Collectors.toList());
                                        String innerTableCode = innerEntry.getKey().split("\\.")[1];
                                        TableRelatedDTO subTableRelatedDTO = fieldMap.get(innerTableCode);
                                        Boolean subIsLoop = subTableRelatedDTO.getIsLoop();
                                        if (coverMap.containsKey(innerTableCode) && subIsLoop) {
                                            List ins = (List) coverMap.get(innerTableCode);
                                            if (CollectionUtil.isNotEmpty(ins)) {
                                                ins.addAll(innerList);
                                                coverMap.put(innerTableCode, ins);
                                            } else {
                                                coverMap.put(innerTableCode, innerList);
                                            }
                                        } else {
                                            coverMap.put(innerTableCode, subIsLoop ? innerList : innerList.get(0));
                                        }

                                    });
                                }
                            });

                        }
                    }
                    map.putAll(coverMap);
                }

                rows.add(map);
            }
        } catch (Exception e) {
            log.error("innerHitDataBackFill error", e);
        }

        return rows;
    }


    /**
     * 检索之后数据处理
     *
     * @param dto
     * @param searchHits
     * @return
     */
    public static List afterSearch(SearchDTO dto, SearchHits<Map> searchHits) {
        List rows = resultFilter(searchHits, dto);

        //innerHit回填
        //List rows = SearchResultUtil.innerHitDataBackFill(searchHits.getSearchHits(), dto);

        //自定义高亮处理
        BuilderSourceUtil.toHighlight(dto, rows);
        // 数据脱敏
        rows = DesensitizedComponent.desensitization(rows);
        return rows;
    }


    /**
     * 按照患者id分组
     *
     * @param rows
     * @return
     */
    public static Map<Object, List<Map>> groupByPatientId(List<Map> rows) {
        final Map<Object, List<Map>> map = rows.stream().collect(Collectors.groupingBy(e -> ((Map) e.get(EsConstant.MS_VISIT_RECORD)).get(EsConstant.PATIENT_ID)));
        return map;
    }


    /**
     * 构建es分页数据
     *
     * @param dto
     * @param total
     * @param rows
     * @param query
     * @param query1
     * @return
     */
    public static EsPageData buildEsPageData(SearchDTO dto, Long total, List<Map> rows, Query query, Query query1) {
        EsPageData pageData = EsPageData.builder().build();
        if (Objects.nonNull(query)) {
            pageData.setQuery(((NativeSearchQuery) query).getQuery().toString());
        }
        if (Objects.nonNull(query1)) {
            pageData.setQuery1(((NativeSearchQuery) query1).getQuery().toString());
        }
        pageData.setTotal(total);
        pageData.setRows(rows);
        if (SearchWay.KEYWORD.equals(dto.getSearchWay())) {
            pageData.setColumnList(dto.getSearchRequest().getColumnList());
        } else {
            pageData.setColumnList(dto.getSourceFieldList().stream().filter(field -> !FieldUseType.PRIMARY.getCode().equals(field.getFieldType())).collect(Collectors.toList()));
        }

        return pageData;
    }


}
