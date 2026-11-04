package com.jiayuan.modules.searchv2.component;

import com.jiayuan.common.constant.Symbol;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class QueryNode {
    private String indexName;        // 表名
    private String indexNameEn;        // 表名英文
    private String fieldName;        // 字段名
    private String fieldNameEn;        // 字段名英文
    private String fieldType;
    private Symbol.RelationalEnum operator;         // 操作符
    private String value;            // 值
    private Symbol.LogicEnum lastOperator;     // AND/OR 前一个条件操作符

    private List<QueryNode> mergedConditions; // 合并的条件

    // 添加合并条件的方法
    public void addMergedCondition(QueryNode condition) {
        if (mergedConditions == null) {
            mergedConditions = new ArrayList<>();
        }
        mergedConditions.add(condition);
    }

    @Override
    public String toString() {
        return "*" + value + "*[" + indexNameEn + "." + fieldNameEn + "] OR ";
    }
}

