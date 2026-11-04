package com.jiayuan.modules.search.component.optimize;

import java.util.ArrayList;
import java.util.List;

/**
 * @Title: com.jiayuan.common.component
 * @Package: ExpressionOptimizeParser
 * @Description: 表达式优化解析器
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/14
 */
public class ExpressionOptimizeParser {

    public List<ExpressionObject> parseExpression(String expression) {
        List<ExpressionObject> objects = new ArrayList<>();
        //去掉括号
        expression = expression.replaceAll("\\(", "").replaceAll("\\)", "");

        return objects;
    }
}
