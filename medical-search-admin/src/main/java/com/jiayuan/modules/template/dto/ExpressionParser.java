package com.jiayuan.modules.template.dto;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.utils.EnumExtendUtil;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Title: com.jiayuan.modules.template.dto
 * @Package: ExpressionParser
 * @Description: 表达式解析处理器
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/7
 */
public class ExpressionParser {


    /**
     * 表达式解析 优化过
     *
     * @param template
     */
    public static void parseExpressionOfOptimized(TemplateDTO template) {
        List<TemplateFieldDTO> fieldList = template.getTemplateFieldDTOList();

        Map<String, List<TemplateFieldDTO>> map = fieldList.stream().filter(field -> StrUtil.isNotBlank(field.getMainTableCode())).collect(Collectors.groupingBy(TemplateFieldDTO::getMainTableCode));
        Map<String, List<TemplateFieldDTO>> map1 = fieldList.stream().filter(field -> StrUtil.isBlank(field.getMainTableCode())).collect(Collectors.groupingBy(TemplateFieldDTO::getTableCode));

        // map 和 map1合并，key相同的value合并
        for (Map.Entry<String, List<TemplateFieldDTO>> entry : map1.entrySet()) {
            String key = entry.getKey();
            List<TemplateFieldDTO> value = entry.getValue();

            if (map.containsKey(key)) {
                // 如果 key 已经存在，合并值列表
                map.get(key).addAll(value);
            } else {
                // 如果 key 不存在，直接添加
                map.put(key, value);
            }
        }

        ConditionNode root = parseExpression(map, true);
        template.setExpression(root.toString());
    }


    /**
     * 表达式解析
     *
     * @param map
     * @param isTopLevel
     * @return
     */
    private static ConditionNode parseExpression(Map<String, List<TemplateFieldDTO>> map, boolean isTopLevel) {
        if (isTopLevel) {
            ConditionNode root = ConditionNode.builder().build();
            List<ConditionNode> childList = new ArrayList<>();
            //多表遍历
            for (Map.Entry<String, List<TemplateFieldDTO>> entry : map.entrySet()) {
                Map<String, List<TemplateFieldDTO>> collect = entry.getValue().stream().collect(Collectors.groupingBy(TemplateFieldDTO::getTableCode));
                childList.add(parseExpression(collect, false));
            }
            root.setLogicalOperator("root");
            root.setChildren(childList);
            return childList.size() == 1 ? childList.get(0) : root;
        } else {
            ConditionNode node = ConditionNode.builder().build();
            List<ConditionNode> childList = new ArrayList<>();
            //顶多两个表 主附表
            map.entrySet().forEach(entry -> {
                ConditionNode son = ConditionNode.builder().build();
                List<TemplateFieldDTO> value = entry.getValue();
                List<ConditionNode> collect = value.stream().map(field ->
                        ConditionNode.builder().field(field).logicalOperator(EnumExtendUtil.valueOf(Symbol.LogicEnum.class, field.getLogic()).getName()).build()
                ).collect(Collectors.toList());
                son.setChildren(collect);
                son.setLogicalOperator(collect.get(collect.size() - 1).getLogicalOperator());
                childList.add(collect.size() == 1 ? collect.get(0) : son);
            });
            node.setLogicalOperator(childList.get(childList.size() - 1).getLogicalOperator());
            node.setChildren(childList);
            return childList.size() == 1 ? childList.get(0) : node;
        }
    }


    /**
     * 获取没有处理的表达式
     *
     * @param template
     * @return
     */
    public void parseExpressionOfNotOptimized(TemplateDTO template) {
        List<TemplateFieldDTO> fieldList = template.getTemplateFieldDTOList();
        if (CollectionUtil.isNotEmpty(fieldList)) {
            fieldList = fieldList.stream().sorted(Comparator.comparing(TemplateFieldDTO::getSort, Comparator.nullsLast(Integer::compareTo))).collect(Collectors.toList());
            StringBuilder expression = new StringBuilder();
            for (TemplateFieldDTO field : fieldList) {

                //优先级
                final Symbol.RelationalEnum relationalEnum = EnumExtendUtil.valueOf(Symbol.RelationalEnum.class, field.getRelation());
                final boolean isEq = Symbol.RelationalEnum.EQ.equals(relationalEnum) ||
                        Symbol.RelationalEnum.IS_NOT_NULL.equals(relationalEnum);
                final boolean isLike = Symbol.RelationalEnum.LIKE.equals(relationalEnum);
                //前缀模式组装
                if (isEq) {
                    expression.append(field.getFieldVal());
                } else if (isLike) {
                    expression.append("*" + field.getFieldVal() + "*");
                }
                expression.append("[");
                expression.append(field.getTableName());
                expression.append(".");
                expression.append(field.getFieldName());
                expression.append("]");
                //后缀模式组装
                if (!isEq && !isLike) {
                    expression.append(relationalEnum.getName());
                    expression.append(field.getFieldVal());
                }

                final Symbol.LogicEnum logicEnum = EnumExtendUtil.valueOf(Symbol.LogicEnum.class, field.getLogic());
                expression.append(" ");
                expression.append(logicEnum.getName());
                expression.append(" ");
            }
            template.setExpression(ReUtil.delLast("and|AND|OR|or", expression));

        }
    }
}
