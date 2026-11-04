package com.jiayuan.common.enums;

/**
 * @Title: BaseEnum
 * @Package: com.jiayuan.common.enums
 * @Description: 枚举基础类
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/13
 */
public interface BaseEnum<E extends Enum<E>, T> {

    /**
     * 获取枚举标识
     *
     * @return
     */
    T getCode();

    /**
     * 获取枚举描述
     *
     * @return
     */
    String getName();
}
