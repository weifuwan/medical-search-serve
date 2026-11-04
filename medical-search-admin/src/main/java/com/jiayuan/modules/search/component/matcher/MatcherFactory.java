package com.jiayuan.modules.search.component.matcher;

import cn.hutool.core.util.ReUtil;
import com.jiayuan.common.constant.Symbol;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Title: MatcherFactory
 * @Package: com.jiayuan.common.component.matcher
 * @Description: 匹配器工厂
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/1
 */
@Slf4j
@Component
public class MatcherFactory {

    private static final Map<Symbol.Type, Matcher> MAP_MATCHERS = new ConcurrentHashMap<>(5);


    @Autowired
    public MatcherFactory(List<Matcher> matchers) {
        matchers.forEach(matcher -> MAP_MATCHERS.put(matcher.type(), matcher));
    }


    /**
     * 获取匹配器
     *
     * @param expression
     * @return
     */
    public static Matcher build(String expression) {
        for (Map.Entry<Symbol.Type, Matcher> entry : MAP_MATCHERS.entrySet()) {
            final boolean match = ReUtil.isMatch(entry.getKey().getRegex(), expression);
            if (match) {
                return entry.getValue();
            }
        }
        return MAP_MATCHERS.get(Symbol.Type.DATA_SINGLE);
    }
}
