package com.jiayuan.modules.template.dto;

import com.jiayuan.common.constant.Symbol;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Title: com.jiayuan.modules.template.dto
 * @Package: Condition
 * @Description: 条件类
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/7
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Condition {
    private TemplateFieldDTO field;
    private Symbol.RelationalEnum operator;
    private String value;


    @Override
    public String toString() {
        return "[" + field + "] " + operator + " " + value;
    }
}
