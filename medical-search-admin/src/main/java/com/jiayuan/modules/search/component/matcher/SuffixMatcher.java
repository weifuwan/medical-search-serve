package com.jiayuan.modules.search.component.matcher;

import cn.hutool.core.util.ReUtil;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.utils.EnumExtendUtil;
import com.jiayuan.modules.search.dto.SearchDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @Title: SuffixMatcher
 * @Package: com.jiayuan.common.component.matcher
 * @Description: 后缀匹配
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/1
 */
@Slf4j
@Order(2)
@Component
public class SuffixMatcher extends AbstractMatcher {

    @Override
    public void match(SearchDTO.Item item, String expression) {
        String result = ReUtil.extractMulti(this.type().getRegex(), expression, "$1^$2^$3^$4");
        final String[] split = result.split("\\^");
        item.setType(this.type());
        item.setField(this.getFieldList(split[1], split[0]));

        final Symbol.RelationalEnum relationalEnum = EnumExtendUtil.valueOf(Symbol.RelationalEnum.class, split[2], "name");
        item.setRelationalEnum(relationalEnum);
        item.setVal(split[3]);
    }


    @Override
    public Symbol.Type type() {
        return Symbol.Type.DATA_SUFFIX;
    }
}
