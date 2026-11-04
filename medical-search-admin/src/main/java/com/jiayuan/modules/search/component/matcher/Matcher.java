package com.jiayuan.modules.search.component.matcher;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.modules.search.dto.SearchDTO;

/**
 * @Title: Matcher
 * @Package: com.jiayuan.common.component
 * @Description: 表达式匹配器
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/22
 */
public interface Matcher {

    /**
     * 匹配
     *
     * @param item
     * @param expression
     * @return
     * @throws Exception
     */
    void match(SearchDTO.Item item, String expression);


    /**
     * 正则类型
     *
     * @return
     */
    Symbol.Type type();
}
