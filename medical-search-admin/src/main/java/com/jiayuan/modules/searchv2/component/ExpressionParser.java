package com.jiayuan.modules.searchv2.component;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.searchv2.cache.MysqlMetaCache;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;

@Slf4j
@Component
public class ExpressionParser {

    @Resource
    private MysqlMetaCache mysqlMetaCache;

    public void parseInput(String input, List<Symbol.LogicEnum> logicEnums, int i, List<QueryNode> queryNodes) {
        String tableAndField;
        String value;
        Symbol.RelationalEnum relation;

        if (input.startsWith("[")) {
            // 处理 [表名.字段名]关系值 的情况
            int rightBracketIndex = input.indexOf(']');
            tableAndField = input.substring(1, rightBracketIndex);
            String[] parts = tableAndField.split("\\.");
            String tableName = parts[0];
            String fieldName = parts[1];
            // 提取操作符和值
            String remainingInput = input.substring(rightBracketIndex + 1).trim();
            String relationStr = extractRelation(remainingInput); // 提取操作符
            value = remainingInput.substring(relationStr.length()).trim(); // 提取值

            // 处理 BETWEEN 操作符
            if (relationStr.equalsIgnoreCase("BETWEEN")) {
                String[] betweenValues = value.split(",");
                if (betweenValues.length == 2) {
                    String value1 = betweenValues[0].trim();
                    String value2 = betweenValues[1].trim();
                    value = value1 + "," + value2;
                } else {
                    throw new IllegalArgumentException("Invalid BETWEEN format: " + input);
                }
            } else if (relationStr.equalsIgnoreCase("PREFIX")) {
                // 对于PREFIX操作符，确保值不以通配符开头
                value = value.replaceAll("^\\*", "");
            }
            relation = Stream.of(Symbol.RelationalEnum.values())
                    .filter(enumValue -> enumValue.getName().equals(relationStr))
                    .findFirst()
                    .orElse(null);
            if (i == 0) {
                TableFieldInfo tableAndFieldCode = mysqlMetaCache.findTableAndFieldCode(tableName, fieldName);
                if (tableAndFieldCode == null) {
                    throw new BizException("表或字段不存在");
                }
                QueryNode root = new QueryNode(tableName, tableAndFieldCode.getTableCode(), fieldName,
                        tableAndFieldCode.getFieldCode(), tableAndFieldCode.getFieldType(), relation, value, null, null);
                queryNodes.add(root);
            } else {
                TableFieldInfo tableAndFieldCode = mysqlMetaCache.findTableAndFieldCode(tableName, fieldName);
                if (tableAndFieldCode == null) {
                    throw new BizException("表或字段不存在");
                }
                QueryNode root = new QueryNode(tableName, tableAndFieldCode.getTableCode(), fieldName, tableAndFieldCode.getFieldCode(),
                        tableAndFieldCode.getFieldType(), relation, value, logicEnums.get(i - 1), null);
                queryNodes.add(root);
            }


        } else {
            // 处理 值[表名.字段名] 的情况
            int index = input.indexOf('[');
            try {
                value = input.substring(0, index);
                tableAndField = input.substring(index + 1, input.length() - 1);
            } catch (Exception e) {
                throw new BizException("检索表达式错误,请检查后重新提交");
            }
            String[] parts = tableAndField.split("\\.");
            String tableName = parts[0];
            String fieldName = parts[1];

            // First check for PREFIX pattern (ends with * but doesn't start with *)
            if (value.endsWith("*") && !value.startsWith("*")) {
                relation = Symbol.RelationalEnum.PREFIX;
                value = value.substring(0, value.length() - 1); // Remove the trailing *
            } else {
                // Fall back to regex matching for other cases
                relation = Symbol.RelationalEnum.getByRegex(value);
                if (relation == null) {
                    relation = Symbol.RelationalEnum.EQ;
                }
            }
            if (i == 0) {
                TableFieldInfo tableAndFieldCode = mysqlMetaCache.findTableAndFieldCode(tableName, fieldName);
                if (tableAndFieldCode == null) {
                    throw new BizException("表或字段不存在");
                }
                QueryNode root = new QueryNode(tableName, tableAndFieldCode.getTableCode(), fieldName,
                        tableAndFieldCode.getFieldCode(), tableAndFieldCode.getFieldType(), relation, value, null, null);
                queryNodes.add(root);
            } else {
                TableFieldInfo tableAndFieldCode = mysqlMetaCache.findTableAndFieldCode(tableName, fieldName);
                if (tableAndFieldCode == null) {
                    throw new BizException("表或字段不存在");
                }
                QueryNode root = new QueryNode(tableName, tableAndFieldCode.getTableCode(), fieldName,
                        tableAndFieldCode.getFieldCode(), tableAndFieldCode.getFieldType(), relation, value, logicEnums.get(i - 1), null);
                queryNodes.add(root);
            }
        }
    }

    /**
     * 从输入字符串中提取操作符
     */
    private String extractRelation(String input) {
        // 支持的操作符列表
        String[] supportedRelations = {"BETWEEN", ">=", "<=", ">", "<", "=", "PREFIX"};

        for (String rel : supportedRelations) {
            if (input.startsWith(rel)) {
                return rel;
            }
        }

        throw new IllegalArgumentException("Unsupported relation in input: " + input);
    }

    public List<QueryNode> parseConditionToQueries(String condition) {
        // 正则表达式，匹配条件，例如 "table1.name like '五'" 或 "table2.age > 12"
        List<QueryNode> queryNodes = new ArrayList<>();

        // 先按 AND 和 OR 分割条件
        String[] conditions = condition.split("\\s+(AND|OR)\\s+");

        // 用于构建查询树
        // 正则表达式匹配 AND 或 OR 操作符
        Pattern pattern2 = Pattern.compile("\\s+(AND|OR)\\s+");
        Matcher matcher2 = pattern2.matcher(condition);

        // 用来存储操作符（AND 或 OR）
        List<Symbol.LogicEnum> operators = new ArrayList<>();

        // 找到匹配的操作符并添加到列表
        while (matcher2.find()) {
            operators.add(Symbol.LogicEnum.valueOf(matcher2.group(1)));  // 捕获的操作符是AND或OR
        }

        for (int i = 0; i < conditions.length; i++) {
            String subCondition = conditions[i];
            parseInput(subCondition, operators, i, queryNodes);
        }
        List<QueryNode> queryNodesGroupBy = mergeConditions(queryNodes);
        // 输出结果
        for (QueryNode node : queryNodesGroupBy) {
            System.out.println("===node===" + node);
        }
        return queryNodesGroupBy;
    }

    /**
     * merge node
     *
     * @param nodes nodes
     * @return nodes
     */
    public static List<QueryNode> mergeConditions(List<QueryNode> nodes) {
        Map<String, QueryNode> mergedMap = new LinkedHashMap<>();

        for (QueryNode node : nodes) {
            String tableName = node.getIndexName();
            if (mergedMap.containsKey(tableName)) {
                // 如果已经存在相同表名的条件，则合并
                QueryNode existingNode = mergedMap.get(tableName);
                existingNode.addMergedCondition(node);
            } else {
                // 否则直接放入Map中
                mergedMap.put(tableName, node);
            }
        }

        // 将Map中的值转换为List
        return new ArrayList<>(mergedMap.values());
    }
}


