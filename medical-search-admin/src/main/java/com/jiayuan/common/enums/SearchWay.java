package com.jiayuan.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Title: com.jiayuan.common.enums
 * @Package: SearchWay
 * @Description: 检索方式枚举类
 * @Author: 李建奎
 * @Date: 创建时间 2024/12/17
 */
@Getter
@AllArgsConstructor
public enum SearchWay {

    /**
     * 关键字检索
     */
    KEYWORD,

    /**
     * 表达式检索
     */
    EXPRESSION,

    /**
     * 模板检索
     */
    TEMPLATE,

}
