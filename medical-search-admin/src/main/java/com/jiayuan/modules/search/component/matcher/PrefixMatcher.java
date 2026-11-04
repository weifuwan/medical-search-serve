package com.jiayuan.modules.search.component.matcher;

import cn.hutool.core.util.ReUtil;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.modules.search.dto.SearchDTO;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @Title: PrefixMatcher
 * @Package: com.jiayuan.common.component.matcher
 * @Description: 数据前缀匹配器
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/1
 */
@Order(1)
@Component
public class PrefixMatcher extends AbstractMatcher {

    @Override
    public void match(SearchDTO.Item item, String expression) {
        String multi = ReUtil.extractMulti(this.type().getRegex(), expression, "$1^$2^$3");
        final String[] split = multi.split("\\^");
        item.setType(this.type());
        item.setField(this.getFieldList(split[2], split[1]));

        // 数据以及关系符号的处理
        final String data = split[0];
        if (ReUtil.isMatch(Symbol.RelationalEnum.LIKE.getRegex(), data)) {
            // *骨科  *骨科* 骨科* 通配符查询
            item.setVal(data);
            item.setRelationalEnum(Symbol.RelationalEnum.LIKE);
        } else if (ReUtil.isMatch(Symbol.RelationalEnum.EQ.getRegex(), data)) {
            // "骨科" 精准查询
            item.setVal(data.replace("\"", ""));
            item.setRelationalEnum(Symbol.RelationalEnum.EQ);
        } else if (Symbol.RelationalEnum.IS_NOT_NULL.getRegex().equals(data)) {
            // 非空处理
            item.setRelationalEnum(Symbol.RelationalEnum.IS_NOT_NULL);
        } else {
            // 其他一律 精确查询
            item.setVal(data);
            item.setRelationalEnum(Symbol.RelationalEnum.EQ);
        }
    }


    @Override
    public Symbol.Type type() {
        return Symbol.Type.DATA_PREFIX;
    }
}
