
package com.jiayuan.common.utils;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * 国际化
 *
 * @author lijiankui
 * @since 1.0.0
 */
public class MessageUtils {
    private static MessageSource messageSource;

    static {
        messageSource = (MessageSource) SpringContextUtils.getBean("messageSource");
    }

    public static String getMessage(int code) {
        return getMessage(code, new String[0]);
    }

    public static String getMessage(int code, String... params) {
        return messageSource.getMessage(code + "", params, LocaleContextHolder.getLocale());
    }

    /**
     * 根据消息键和参数 获取消息 委托给spring messageSource
     *
     * @param code 消息键
     * @param args 参数
     * @return 获取国际化翻译值
     */
    public static String message(String code, Object... args) {
        MessageSource messageSource = SpringContextUtils.getBean(MessageSource.class);
        return messageSource.getMessage(code, args, LocaleContextHolder.getLocale());
    }
}
