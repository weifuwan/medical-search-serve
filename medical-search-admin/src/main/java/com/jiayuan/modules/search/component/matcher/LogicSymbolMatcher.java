package com.jiayuan.modules.search.component.matcher;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.utils.EnumExtendUtil;
import com.jiayuan.modules.search.dto.SearchDTO;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @Title: LogicSymbolMatcher
 * @Package: com.jiayuan.common.component.matcher
 * @Description: 逻辑符号匹配
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/1
 */
@Order(0)
@Component
public class LogicSymbolMatcher extends AbstractMatcher {

    @Override
    public Symbol.Type type() {
        return Symbol.Type.LOGIC;
    }

    @Override
    public void match(SearchDTO.Item item, String expression) {
        item.setType(this.type());
        item.setLogicEnum(EnumExtendUtil.valueOf(Symbol.LogicEnum.class, expression.toUpperCase(), "name"));
    }

}
