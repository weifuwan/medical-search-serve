package com.jiayuan.modules.template.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Title: com.jiayuan.modules.template.dto
 * @Package: ConditionNode
 * @Description: 条件节点
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/7
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ConditionNode {


    private TemplateFieldDTO field;

    /**
     * 逻辑表达式
     */
    private String logicalOperator;

    /**
     * 子节点
     */
    private List<ConditionNode> children;


    @Override
    public String toString() {
        if (field != null) {
            return field.toString();
        } else {
            StringBuilder sb = new StringBuilder();
            if (!"root".equals(logicalOperator)) {
//                sb.append("(");
                sb.append("");
            }
            for (int i = 0; i < children.size(); i++) {
                sb.append(children.get(i).toString());
                if (i < children.size() - 1) {
                    sb.append(" ").append(children.get(i).getLogicalOperator()).append(" ");
                }
            }
            if (!"root".equals(logicalOperator)) {
//                sb.append(")");
                sb.append("");
            }
            return sb.toString();
        }
    }
}