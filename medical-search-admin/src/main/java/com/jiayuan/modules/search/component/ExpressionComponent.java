package com.jiayuan.modules.search.component;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.ExConstant;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.SearchWay;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.utils.EnumExtendUtil;
import com.jiayuan.modules.search.component.matcher.KeywordMatcher;
import com.jiayuan.modules.search.component.matcher.MatcherFactory;
import com.jiayuan.modules.search.component.wrapper.QueryBuilderWrapper;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.dto.TableRelatedDTO;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.dto.TableFieldDTO;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import com.jiayuan.modules.template.service.TableFieldService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.QueryBuilder;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Title: ExpressionComponent
 * @Package: com.jiayuan.common.component
 * @Description: 表达式组件
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-22
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class ExpressionComponent {

    private final TableFieldService tableFieldService;
    private final KeywordMatcher keywordMatcher;


    /**
     * (腹部[检查数据.项目名称] and 左臂) OR 李四[基础信息.姓名] and [基础信息.年龄]>26
     * 检索表达式解)
     *
     * @param request
     * @return
     */
    public SearchDTO parseExpression(SearchRequest request) {
        SearchDTO dto = SearchDTO.builder().searchRequest(request).build();
        try {
            final boolean match = ReUtil.isMatch(Symbol.Type.DATA_SINGLE.getRegex(), request.getExpression());
            dto.setSearchWay(match ? SearchWay.KEYWORD : SearchWay.EXPRESSION);
            if (SearchWay.KEYWORD.equals(dto.getSearchWay())) {
                keywordMatcher.toSetKeywordSearchFields(dto);
                //过滤字段设置
                toSourceFilter(dto);
                BuilderQueryUtil.buildKeywordQueryBuilder(dto);
            } else if (SearchWay.EXPRESSION.equals(dto.getSearchWay())) {
                toInfixExpression(dto);
                toSuffixExpression(dto);
                toSuffixExpressionDto(dto);
                BuilderQueryUtil.toCalculate(dto);
            } else {
                // 构建一个bool查询 TODO 后期可能需要
                toBuildBoolQuery(dto);
            }
        } catch (Exception e) {
            String message = StrUtil.isNotBlank(e.getMessage()) ? e.getMessage() : "检索表达式错误,请检查后重新提交";
            log.error(message, e);
            throw new BizException(message, e);
        }
        return dto;
    }

    /**
     * 构建bool查询
     *
     * @param dto
     */
    private void toBuildBoolQuery(SearchDTO dto) {
        //分成三组，and->must组  or->should组  not->mustNot组
        List<SearchDTO.Item> mustItems = new ArrayList<>();
        List<SearchDTO.Item> shouldItems = new ArrayList<>();
        List<SearchDTO.Item> mustNotItems = new ArrayList<>();

        //直接去除括号（不支持括号）
        SearchRequest request = dto.getSearchRequest();
        String expression = request.getExpression().replaceAll("\\(", "").replaceAll("\\)", "");
        request.setExpression(expression);

        //利用中缀表达式解析
        toInfixExpression(dto);

        //划分子表达item
        List<String> infixExpressionList = dto.getInfixExpressionList();
        //infixExpressionList 两个为一组 比如 0、1为一组 2、3为一组
        final List<SearchDTO.Item> exItemList = new ArrayList<>();
        for (int i = 0; i < infixExpressionList.size(); i += 2) {
            SearchDTO.Item item = new SearchDTO.Item();
            MatcherFactory.build(infixExpressionList.get(i)).match(item, infixExpressionList.get(i));
            if (i + 1 < infixExpressionList.size()) {
                item.setLogicEnum(EnumExtendUtil.valueOf(Symbol.LogicEnum.class, infixExpressionList.get(i + 1).toUpperCase(), "name"));
            } else {
                item.setLogicEnum(Symbol.LogicEnum.AND);
            }

            Symbol.LogicEnum logicEnum = item.getLogicEnum();
            if (Symbol.LogicEnum.AND.equals(logicEnum)) {
                mustItems.add(item);
            } else if (Symbol.LogicEnum.OR.equals(logicEnum)) {
                shouldItems.add(item);
            }
            // TODO 后续补充
        }
    }

    /**
     * 表达式优化处理(同一个表的添加括号处理，包括主附表关系)
     * *彩色*[检查报告.检查项目名称] AND 1[就诊记录.性别] AND 非空[入院记录.主诉] AND *高血压*[入院记录.初步诊断] OR [入院信息.入科时间]>2023-01-01
     *
     * @param dto
     */
    private void toOptimizingExpression(SearchDTO dto) {
        //直接去除括号（不支持括号）
        SearchRequest request = dto.getSearchRequest();
        String expression = request.getExpression().replaceAll("\\(", "").replaceAll("\\)", "");
        request.setExpression(expression);

        //利用中缀表达式解析
        toInfixExpression(dto);

        //划分子表达item
        List<String> infixExpressionList = dto.getInfixExpressionList();
        //infixExpressionList 两个为一组 比如 0、1为一组 2、3为一组
        final List<SearchDTO.Item> exItemList = new ArrayList<>();
        for (int i = 0; i < infixExpressionList.size(); i += 2) {
            SearchDTO.Item item = new SearchDTO.Item();
            MatcherFactory.build(infixExpressionList.get(i)).match(item, infixExpressionList.get(i));
            if (i + 1 < infixExpressionList.size()) {
                item.setLogicEnum(EnumExtendUtil.valueOf(Symbol.LogicEnum.class, infixExpressionList.get(i + 1).toUpperCase(), "name"));
            } else {
                item.setLogicEnum(Symbol.LogicEnum.AND);
            }
            exItemList.add(item);
        }
        dto.setSuffixExpressionDtoList(exItemList);

        //过滤字段设置
        toSourceFilter(dto);

        //主附表处理
        List<QueryBuilderWrapper> wrappers = exItemList.stream().map(item ->
                QueryBuilderWrapper.builder()
                        .field(item.getField())
                        .queryBuilder(BuilderQueryUtil.buildQueryBuilderNoNested(item, item.getField()))
                        .logic(item.getLogicEnum())
                        .build()
        ).collect(Collectors.toList());

        QueryBuilder queryBuilder = BuilderQueryUtil.batchFieldBuilderQuery(dto.getFieldMap(), wrappers);
        dto.setFinalResult(queryBuilder);
    }


    /**
     * 过滤字段设置
     *
     * @param dto
     */
    private void toSourceFilter(SearchDTO dto) {
        List<FieldDTO> filterList = new ArrayList<>();
        //用户展示字段
        List<FieldDTO> userShowFieldList = dto.getSearchRequest().getColumnList();
        filterList.addAll(userShowFieldList);

        //检索字段
        if (SearchWay.KEYWORD.equals(dto.getSearchWay())) {
            filterList.addAll(dto.getKeywordSearchFields());
        } else {
            List<FieldDTO> searchFieldList = dto.getSuffixExpressionDtoList().stream()
                    .map(SearchDTO.Item::getField)
                    .filter(Objects::nonNull).collect(Collectors.toList());
            filterList.addAll(searchFieldList);
        }


        //添加主键
        List<FieldDTO> fieldList = tableFieldService.getPrimaryFieldList(filterList.stream().map(FieldDTO::getTableId).collect(Collectors.toSet()));
        filterList.addAll(fieldList);

        //filterList去重（展示字段+检索字段+主键和关联字段）
        TreeSet<FieldDTO> sourceSet = filterList.stream().collect(Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(FieldDTO::getFieldId))));
        dto.setSourceFieldList(sourceSet);

        // fieldMap
        Map<String, TableRelatedDTO> fieldMap = new HashMap<>();
        sourceSet.stream().collect(Collectors.groupingBy(FieldDTO::getTableCode)).entrySet().forEach(entry -> {
            FieldDTO fieldDTO = entry.getValue().get(0);
            fieldMap.put(entry.getKey(), TableRelatedDTO.builder()
                    .tableId(fieldDTO.getTableId())
                    .tableCode(fieldDTO.getTableCode())
                    .tableName(fieldDTO.getTableName())
                    .isLoop(fieldDTO.getIsLoop())
                    .slaveType(fieldDTO.getSlaveType())
                    .relatedFieldCode(fieldDTO.getRelatedField())
                    .primaryFieldCode(fieldDTO.getPrimaryCode())
                    .fieldList(entry.getValue())
                    .build());
        });

        dto.setFieldMap(fieldMap);
    }


    /**
     * 解析成中缀表达式
     *
     * @param dto
     */
    private void toInfixExpression(SearchDTO dto) {
        final String expression = dto.getSearchRequest().getExpression();
        final List<String> infixExpressionList = new ArrayList<>();

        final String[] split = expression.split("((?<=" + Symbol.Type.LOGIC.getRegex() + ")|(?=" + Symbol.Type.LOGIC.getRegex() + "))");
        Arrays.stream(split).forEach(e -> infixExpressionList.add(e.trim()));
        infixExpressionList.removeIf(e -> StrUtil.isBlank(e));
        dto.setInfixExpressionList(infixExpressionList);
    }

    /**
     * 解析成后缀表达式(主要是去括号)
     *
     * @param dto
     */
    private void toSuffixExpression(SearchDTO dto) {
        final List<String> infixExpressionList = dto.getInfixExpressionList();
        // 符号栈
        Stack<String> s1 = new Stack<>();
        // 储存中间结果的List-s2
        List<String> s2 = new ArrayList<>();

        for (String item : infixExpressionList) {
            if (!item.matches(Symbol.Type.LOGIC.getRegex())) {
                //不满足直接入栈
                s2.add(item);
            } else if (ExConstant.BRACKET_LEFT.equals(item)) {
                s1.push(item);
            } else if (ExConstant.BRACKET_RIGHT.equals(item)) {
                //如果是右括号“)”，则依次弹出s1栈顶的运算符，并压入s2，直到遇到左括号为止，此时将这一对括号丢弃
                while (!ExConstant.BRACKET_LEFT.equals(s1.peek())) {
                    s2.add(s1.pop());
                }
                s1.pop();//!!! 将 ( 弹出 s1栈， 消除小括号
            } else {
                //and|or没有优先级直接入栈s1
                s1.push(item);
            }
        }

        //将s1中剩余的运算符依次弹出并加入s2
        while (s1.size() != 0) {
            s2.add(s1.pop());
        }

        dto.setSuffixExpressionList(s2);
    }


    /**
     * 获取后缀传输对象
     *
     * @param dto
     */
    private void toSuffixExpressionDto(SearchDTO dto) {
        final List<SearchDTO.Item> suffixExpressionDtoList = new ArrayList<>();
        for (String ex : dto.getSuffixExpressionList()) {
            SearchDTO.Item item = new SearchDTO.Item();
            MatcherFactory.build(ex).match(item, ex);
            suffixExpressionDtoList.add(item);
        }
        dto.setSuffixExpressionDtoList(suffixExpressionDtoList);

        //过滤字段设置
        toSourceFilter(dto);

        //排序字段设置
        toSortField(dto);
    }

    /**
     * 排序字段设置
     *
     * @param dto
     */
    private void toSortField(SearchDTO dto) {
        String orderFieldCode = dto.getSearchRequest().getOrderFieldCode();
        String orderTableCode = dto.getSearchRequest().getOrderTableCode();
        if (StrUtil.isNotBlank(orderFieldCode) && StrUtil.isNotBlank(orderTableCode)) {
            //排序字段
            TableFieldDTO fieldDTO = tableFieldService.selectOne(Wrappers.<TableFieldEntity>lambdaQuery()
                    .eq(TableFieldEntity::getFieldCode, orderFieldCode)
                    .eq(TableFieldEntity::getTableCode, orderTableCode));
            if (Objects.nonNull(fieldDTO)) {
                FieldDTO field = BeanUtil.copyProperties(fieldDTO, FieldDTO.class);
                field.setFieldId(fieldDTO.getId());
                dto.getSearchRequest().setOrderField(field);
            }
        }
    }


    /**
     * 获取检索字段列表
     *
     * @param expression
     * @return
     */
    public List<FieldDTO> getSearchFields(String expression) {
        expression = expression.replaceAll("\\(", "").replaceAll("\\)", "");
        SearchDTO dto = SearchDTO.builder().searchRequest(SearchRequest.builder().expression(expression).build()).build();
        //利用中缀表达式解析
        toInfixExpression(dto);
        //划分子表达item
        final List<SearchDTO.Item> exItemList = new ArrayList<>();
        List<String> infixExpressionList = dto.getInfixExpressionList().stream().filter(e -> !e.matches(Symbol.Type.LOGIC.getRegex())).collect(Collectors.toList());
        for (String infix : infixExpressionList) {
            SearchDTO.Item item = new SearchDTO.Item();
            MatcherFactory.build(infix).match(item, infix);
            exItemList.add(item);
        }
        //检索字段
        List<FieldDTO> searchFieldList = exItemList.stream()
                .map(SearchDTO.Item::getField)
                .filter(Objects::nonNull).collect(Collectors.toList());
        return searchFieldList;
    }


}
