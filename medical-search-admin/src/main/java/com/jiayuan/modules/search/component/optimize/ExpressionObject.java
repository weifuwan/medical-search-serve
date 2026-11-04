package com.jiayuan.modules.search.component.optimize;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * @Title: com.jiayuan.common.component.optimize
 * @Package: ExpressionObject
 * @Description: 表达式元素
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/14
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ExpressionObject {
    /**
     * 值
     */
    private String value;
    /**
     * 关系符号
     */
    private Symbol.RelationalEnum relation;
    /**
     * 字段
     */
    private FieldDTO field;
    /**
     * 逻辑符号
     */
    private Symbol.LogicEnum logical;

    /**
     * 子表达式
     */
    private String itemExpress;
}
