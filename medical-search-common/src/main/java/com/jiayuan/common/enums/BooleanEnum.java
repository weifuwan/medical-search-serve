package com.jiayuan.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Title: BooleanEnum
 * @Package: com.jiayuan.common.enums
 * @Description: boolean类型字段对应integer类型枚举
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-11
 */
@AllArgsConstructor
@Getter
public enum BooleanEnum {
    /**
     * boolean类型字段对应integer类型枚举
     */
    FALSE(0, "否"),
    TRUE(1, "是");

    private final Integer code;
    private final String name;

    /**
     * 获取枚举值
     *
     * @return
     */
    public Integer value() {
        return code;
    }
}
