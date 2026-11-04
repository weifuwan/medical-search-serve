package com.jiayuan.modules.search.component;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.ReflectUtil;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.TableSlaveType;
import com.jiayuan.modules.search.component.wrapper.QueryBuilderWrapper;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.dto.TableRelatedDTO;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.search.join.ScoreMode;
import org.elasticsearch.index.query.*;
import org.elasticsearch.search.fetch.subphase.FetchSourceContext;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Stack;
import java.util.stream.Collectors;

/**
 * @Title: com.jiayuan.common.component
 * @Package: BuilderQueryUtil
 * @Description: BuilderQuery工具类
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/15
 */
@Slf4j
public class BuilderQueryUtil {
    /**
     * 构建单个builder 无path
     *
     * @param item
     * @param field
     * @return
     */
    public static QueryBuilder buildQueryBuilderNoNested(SearchDTO.Item item, FieldDTO field) {
        QueryBuilder queryBuilder = null;
        switch (item.getRelationalEnum()) {
            case EQ:
                queryBuilder = QueryBuilders.termQuery(BuilderSourceUtil.getFieldCodeOfKeyword(field), item.getVal());
                break;
            case LIKE:
                queryBuilder = QueryBuilders.matchPhraseQuery(BuilderSourceUtil.getFieldCode(field), item.getVal().replace("*", ""));
                break;
            case NE:
                queryBuilder = QueryBuilders.boolQuery().mustNot(QueryBuilders.termQuery(BuilderSourceUtil.getFieldCodeOfKeyword(field), item.getVal()));
                break;
            case GE:
                queryBuilder = QueryBuilders.rangeQuery(BuilderSourceUtil.getFieldCodeOfKeyword(field)).gte(item.getVal());
                break;
            case GT:
                queryBuilder = QueryBuilders.rangeQuery(BuilderSourceUtil.getFieldCodeOfKeyword(field)).gt(item.getVal());
                break;
            case LE:
                queryBuilder = QueryBuilders.rangeQuery(BuilderSourceUtil.getFieldCodeOfKeyword(field)).lte(item.getVal());
                break;
            case LT:
                queryBuilder = QueryBuilders.rangeQuery(BuilderSourceUtil.getFieldCodeOfKeyword(field)).lt(item.getVal());
                break;
            case IS_NOT_NULL:
                queryBuilder = QueryBuilders.existsQuery(BuilderSourceUtil.getFieldCode(field));
                break;
            case BETWEEN:
                String[] split = item.getVal().split(",");
                queryBuilder = QueryBuilders.rangeQuery(BuilderSourceUtil.getFieldCodeOfKeyword(field)).gte(split[0]).lte(split[1]);
                break;
            case NOT_CONTAIN:
                queryBuilder = QueryBuilders.boolQuery().mustNot(QueryBuilders.matchPhraseQuery(BuilderSourceUtil.getFieldCode(field), item.getVal().replace("*", "")));
                break;
            default:
                throw new IllegalArgumentException("不支持的关系运算符["+item.getRelationalEnum().getName()+"]");
        }
        return queryBuilder;
    }

    /**
     * 批量字段构建单个builder
     *
     * @param fieldMap
     * @param wrappers
     */
    public static QueryBuilder batchFieldBuilderQuery(Map<String, TableRelatedDTO> fieldMap, List<QueryBuilderWrapper> wrappers) {
        QueryBuilder finalQueryBuilder = QueryBuilders.boolQuery();

        //主附表合并至一个key
        Map<String, List<QueryBuilderWrapper>> subMap = wrappers.stream().filter(e -> TableSlaveType.SUB.getCode().equals(e.getField().getSlaveType())).collect(Collectors.groupingBy(e -> e.getField().getMainTableCode()));
        Map<String, List<QueryBuilderWrapper>> map = wrappers.stream().filter(e -> !TableSlaveType.SUB.getCode().equals(e.getField().getSlaveType())).collect(Collectors.groupingBy(e -> e.getField().getTableCode()));
        subMap.entrySet().forEach(entry -> {
            String mainTableCode = entry.getKey();
            if (map.containsKey(mainTableCode)) {
                map.get(mainTableCode).addAll(subMap.get(mainTableCode));
            } else {
                map.put(mainTableCode, subMap.get(mainTableCode));
            }
        });

        //主附表进行合并成一个builder
        for (Map.Entry<String, List<QueryBuilderWrapper>> entry : map.entrySet()) {
            //key为一组，包含主附表就是主表tableCode, 否则就是表tableCode
            Map<String, List<QueryBuilderWrapper>> collect = entry.getValue().stream().collect(Collectors.groupingBy(e -> e.getField().getTableCode()));
            List<QueryBuilderWrapper> list = new ArrayList<>();

            //同一个表的合并成一个queryBuilder
            collect.entrySet().forEach(e -> {
                List<QueryBuilderWrapper> queryBuilders = e.getValue();
                QueryBuilder sameTableQueryBuilder = QueryBuilders.boolQuery();
                if (queryBuilders.size() > 1) {
                    for (QueryBuilderWrapper subQuery : queryBuilders) {
                        Symbol.LogicEnum logic = subQuery.getLogic();
                        if (Symbol.LogicEnum.AND.equals(logic)) {
                            ((BoolQueryBuilder) sameTableQueryBuilder).must(subQuery.getQueryBuilder());
                        } else {
                            ((BoolQueryBuilder) sameTableQueryBuilder).should(subQuery.getQueryBuilder());
                        }
                    }
                } else {
                    sameTableQueryBuilder = queryBuilders.get(0).getQueryBuilder();
                }
                FieldDTO field = e.getValue().get(0).getField();
                list.add(QueryBuilderWrapper.builder().field(field).queryBuilder(sameTableQueryBuilder).logic(queryBuilders.get(queryBuilders.size() - 1).getLogic()).build());

            });

            //主表已合并 main顶多一个元素
            List<QueryBuilderWrapper> main = list.stream().filter(e -> TableSlaveType.MAIN.getCode().equals(e.getField().getSlaveType())).collect(Collectors.toList());
            List<QueryBuilderWrapper> sub = list.stream().filter(e -> !TableSlaveType.MAIN.getCode().equals(e.getField().getSlaveType())).collect(Collectors.toList());

            //所有子表组合成一个builderQuery,并且增加innerHit返回
            QueryBuilder subBool = QueryBuilders.boolQuery();
            for (QueryBuilderWrapper e : sub) {
                final NestedQueryBuilder nestedQueryBuilder = QueryBuilders.nestedQuery(BuilderSourceUtil.getNestedPath(e.getField()), e.getQueryBuilder(), ScoreMode.None);
                //InnerHitBuilder innerHitBuilder = buildNestBuilder(e.getField(), fieldMap);
                //nestedQueryBuilder.innerHit(innerHitBuilder);
                if (sub.size() > 1) {
                    Symbol.LogicEnum logic = e.getLogic();
                    if (Symbol.LogicEnum.AND.equals(logic)) {
                        ((BoolQueryBuilder) subBool).must(nestedQueryBuilder);
                    } else {
                        ((BoolQueryBuilder) subBool).should(nestedQueryBuilder);
                    }
                } else {
                    subBool = nestedQueryBuilder;
                }
            }
            Symbol.LogicEnum subLogic = sub.size() > 0 ? sub.get(sub.size() - 1).getLogic() : null;

            //主附表合并成一个builderQuery，同一个nested下面
            QueryBuilderWrapper mergeWrapper = QueryBuilderWrapper.builder().build();
            if (CollectionUtil.isNotEmpty(main)) {
                QueryBuilderWrapper mainWrapper = main.get(0);
                FieldDTO mainField = mainWrapper.getField();
                QueryBuilder mainQueryBuilder = mainWrapper.getQueryBuilder();
                if (sub.size() > 0) {
                    BoolQueryBuilder mainMergeBool = QueryBuilders.boolQuery();
                    if (Symbol.LogicEnum.AND.equals(subLogic)) {
                        mainMergeBool.must(mainQueryBuilder);
                        mainMergeBool.must(subBool);
                    } else {
                        mainMergeBool.should(mainQueryBuilder);
                        mainMergeBool.should(subBool);
                    }
                    mainQueryBuilder = mainMergeBool;
                }
                final NestedQueryBuilder nestedQueryBuilder = QueryBuilders.nestedQuery(BuilderSourceUtil.getNestedPath(mainField), mainQueryBuilder, ScoreMode.None);
                //InnerHitBuilder innerHitBuilder = buildNestBuilder(mainField, fieldMap);
                //nestedQueryBuilder.innerHit(innerHitBuilder);


                mergeWrapper.setQueryBuilder(nestedQueryBuilder);
                mergeWrapper.setLogic(mainWrapper.getLogic());
            } else {
                mergeWrapper.setQueryBuilder(subBool);
                mergeWrapper.setLogic(subLogic);
            }

            //最后处理
            if (map.size() > 1) {
                if (Symbol.LogicEnum.AND.equals(mergeWrapper.getLogic())) {
                    ((BoolQueryBuilder) finalQueryBuilder).must(mergeWrapper.getQueryBuilder());
                } else {
                    ((BoolQueryBuilder) finalQueryBuilder).should(mergeWrapper.getQueryBuilder());
                }
            } else {
                finalQueryBuilder = mergeWrapper.getQueryBuilder();
            }
        }


        return finalQueryBuilder;
    }

    /**
     * 计算
     *
     * @param dto
     */
    public static void toCalculate(SearchDTO dto) {
        // 创建合计栈
        Stack<QueryBuilder> stack = new Stack<>();
        Map<String, TableRelatedDTO> fieldMap = dto.getFieldMap();
        // 遍历
        for (SearchDTO.Item item : dto.getSuffixExpressionDtoList()) {
            if (Symbol.Type.LOGIC.equals(item.getType())) {
                // pop出两个数，并运算， 再入栈
                QueryBuilder builder2 = stack.pop();
                QueryBuilder builder1 = stack.pop();
                BoolQueryBuilder boolQuery = QueryBuilders.boolQuery();
                if (builder1 instanceof NestedQueryBuilder && builder2 instanceof NestedQueryBuilder) {
                    //获取path TODO 后期使用包装类进行优化
                    String path1 = ReflectUtil.getFieldValue(((NestedQueryBuilder) builder1), "path").toString();
                    String path2 = ReflectUtil.getFieldValue(((NestedQueryBuilder) builder2), "path").toString();
                    String[] split2 = path2.split("\\.");
                    String[] split1 = path1.split("\\.");
                    if (split2[0].equals(split1[0])) {
                        //同一个表多字段检索
                        boolean flag1 = split1.length > 1;
                        boolean flag2 = split2.length > 1;
                        QueryBuilder query1 = builder1;
                        QueryBuilder query2 = builder2;
                        String mergePath = path1;
                        InnerHitBuilder innerHit = null;
                        if (path1.equals(path2)) {
                            query1 = ((NestedQueryBuilder) builder1).query();
                            query2 = ((NestedQueryBuilder) builder2).query();
                            mergePath = path1;
                            innerHit = ((NestedQueryBuilder) builder1).innerHit();
                        } else if (flag1) {
                            query1 = builder1;
                            query2 = ((NestedQueryBuilder) builder2).query();
                            mergePath = split1[0];
                            innerHit = ((NestedQueryBuilder) builder2).innerHit();
                        } else if (flag2) {
                            query1 = ((NestedQueryBuilder) builder1).query();
                            query2 = builder2;
                            mergePath = split2[0];
                            innerHit = ((NestedQueryBuilder) builder1).innerHit();
                        }

                        if (Symbol.LogicEnum.AND.equals(item.getLogicEnum())) {
                            boolQuery.filter(query1);
                            boolQuery.filter(query2);
                        } else if (Symbol.LogicEnum.OR.equals(item.getLogicEnum())) {
                            boolQuery.should(query1);
                            boolQuery.should(query2);
                        } else {
                            throw new RuntimeException("运算符有误");
                        }
                        NestedQueryBuilder nestedQueryBuilder = QueryBuilders.nestedQuery(mergePath, boolQuery, ScoreMode.None);
                        //if (Objects.nonNull(innerHit)) {
                        //nestedQueryBuilder.innerHit(innerHit);
                        //}
                        stack.push(nestedQueryBuilder);
                        continue;
                    }
                }

                if (Symbol.LogicEnum.AND.equals(item.getLogicEnum())) {
                    boolQuery.filter(builder1);
                    boolQuery.filter(builder2);
                } else if (Symbol.LogicEnum.OR.equals(item.getLogicEnum())) {
                    boolQuery.should(builder1);
                    boolQuery.should(builder2);
                } else {
                    throw new RuntimeException("运算符有误");
                }
                //把boolQuery 入栈
                stack.push(boolQuery);
            } else {
                //数据直接入栈
                stack.push(buildQueryBuilder(item, fieldMap));
            }

        }
        //最后留在stack中的数据是运算结果
        final QueryBuilder finalQueryBuilder = stack.pop();
        dto.setFinalResult(finalQueryBuilder);
    }


    /**
     * 构建单个builder(日期类型ES是text)
     *
     * @param item
     * @param fieldMap
     * @return
     */
    public static QueryBuilder buildQueryBuilder(SearchDTO.Item item, Map<String, TableRelatedDTO> fieldMap) {
        final FieldDTO field = item.getField();
        QueryBuilder queryBuilder = BuilderQueryUtil.buildQueryBuilderNoNested(item, field);
        final NestedQueryBuilder nestedQueryBuilder = QueryBuilders.nestedQuery(BuilderSourceUtil.getNestedPath(field), queryBuilder, ScoreMode.None);
        //InnerHitBuilder innerHitBuilder = buildNestBuilder(field, fieldMap);
        //nestedQueryBuilder.innerHit(innerHitBuilder);
        return nestedQueryBuilder;
    }


    /**
     * 构建内嵌字段检索Builder
     *
     * @param field
     * @return
     */
    public static InnerHitBuilder buildNestBuilder(FieldDTO field, Map<String, TableRelatedDTO> fieldMap) {
        InnerHitBuilder innerHitBuilder = new InnerHitBuilder();
        innerHitBuilder.setName(BuilderSourceUtil.getNestedPath(field) + "." + UUID.fastUUID().toString());
        innerHitBuilder.setSize(20);
        try {
            List<String> collect = fieldMap.get(field.getTableCode()).getFieldList().stream().map(e -> BuilderSourceUtil.getFieldCode(e)).collect(Collectors.toList());
            // collect 转化成数组
            String[] array = collect.toArray(new String[collect.size()]);
            innerHitBuilder.setFetchSourceContext(new FetchSourceContext(true, array, null));
        } catch (Exception e) {
            // 这里不抛出异常，顶多内嵌字段都返回
            log.error("构建内嵌字段检索Builder失败", e);
        }

        return innerHitBuilder;
    }

    /**
     * 构建关键字查询builder
     *
     * @param dto
     */
    public static void buildKeywordQueryBuilder(SearchDTO dto) {
        BoolQueryBuilder bool = QueryBuilders.boolQuery();
        for (FieldDTO field : dto.getKeywordSearchFields()) {
            QueryBuilder queryBuilder =  QueryBuilders.matchPhraseQuery(BuilderSourceUtil.getFieldCode(field), dto.getSearchRequest().getExpression());
            final NestedQueryBuilder nestedQueryBuilder = QueryBuilders.nestedQuery(BuilderSourceUtil.getNestedPath(field), queryBuilder, ScoreMode.None);
            //InnerHitBuilder innerHitBuilder = buildNestBuilder(field, fieldMap);
            //nestedQueryBuilder.innerHit(innerHitBuilder);
            bool.should(nestedQueryBuilder);
        }
        dto.setFinalResult(bool);
    }
}
