package com.jiayuan.common.utils;

import cn.hutool.core.util.EnumUtil;
import cn.hutool.core.util.ReflectUtil;
import com.jiayuan.common.dto.KeyValue;

import java.util.EnumSet;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Title: EnumExtendUtil
 * @Package: com.jiayuan.common.utils
 * @Description: 枚举工具类
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/14
 */
public class EnumExtendUtil extends EnumUtil {

    /**
     * 转换成List<keyValue>
     *
     * @param enumClass
     * @param <E>
     * @return
     * @throws Exception
     */
    public static <E extends Enum<E>> List<KeyValue> toList(Class<E> enumClass) {
        return EnumSet.allOf(enumClass).stream().map(m ->
                KeyValue.builder().key(ReflectUtil.getFieldValue(m, "code"))
                        .value(ReflectUtil.getFieldValue(m, "name")).build()
        ).collect(Collectors.toList());

    }

    /**
     * 获取对应枚举
     *
     * @param enumClass
     * @param code
     * @param <E>
     * @param <T>
     * @return
     */
    public static <E extends Enum<E>, T> E valueOf(Class<E> enumClass, T code) {
        return EnumSet.allOf(enumClass).stream().filter(m -> code.equals(ReflectUtil.getFieldValue(m, "code"))
        ).findFirst().orElse(null);

    }

    /**
     * 获取对应枚举
     *
     * @param enumClass
     * @param code
     * @param fieldName
     * @param <E>
     * @param <T>
     * @return
     */
    public static <E extends Enum<E>, T> E valueOf(Class<E> enumClass, T code, String fieldName) {
        return EnumSet.allOf(enumClass).stream().filter(m -> code.equals(ReflectUtil.getFieldValue(m, fieldName))
        ).findFirst().orElse(null);

    }



}
