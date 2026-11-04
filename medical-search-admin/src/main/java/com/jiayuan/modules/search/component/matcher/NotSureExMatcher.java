package com.jiayuan.modules.search.component.matcher;

import cn.hutool.core.util.ReUtil;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.utils.EnumExtendUtil;
import com.jiayuan.modules.search.dto.SearchDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @Title: NotSureExMatcher
 * @Package: com.jiayuan.common.component.matcher
 * @Description: 不确定表达式 年龄>8 这种
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/30
 */
//@Slf4j
//@Order(3)
//@Component
//public class NotSureExMatcher extends AbstractMatcher {
//
//    @Override
//    public void match(SearchDTO.Item item, String expression) {
//        String result = ReUtil.extractMulti(this.type().getRegex(), expression, "$1^$2^$3");
//        final String[] split = result.split("\\^");
//        final Symbol.RelationalEnum relationalEnum = EnumExtendUtil.valueOf(Symbol.RelationalEnum.class, split[1], "name");
//
//        item.setType(this.type());
//        item.setField(this.getFieldList(split[0], null));
//        item.setVal(split[2]);
//        item.setRelationalEnum(relationalEnum);
//    }
//
//    @Override
//    public Symbol.Type type() {
//        return Symbol.Type.NOT_SURE_EX;
//    }
//}
