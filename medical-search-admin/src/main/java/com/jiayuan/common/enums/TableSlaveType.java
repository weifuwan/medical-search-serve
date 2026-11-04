package com.jiayuan.common.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Title: com.jiayuan.common.enums
 * @Package: TableRelatedType
 * @Description: 表的从属类型
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/1
 */
@Getter
@AllArgsConstructor
public enum TableSlaveType {

    /**
     * 无关系表
     */
    NONE(0, "无关系表"),
    /**
     * 主表
     */
    MAIN(1, "主表"),
    /**
     * 附表
     */
    SUB(2, "附表");


    /**
     * 编码
     */
    @EnumValue
    private final Integer code;

    /**
     * 名称
     */
    @JsonValue
    private final String name;
}
