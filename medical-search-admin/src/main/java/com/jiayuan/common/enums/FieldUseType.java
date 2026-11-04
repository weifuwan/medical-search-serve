package com.jiayuan.common.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Title: com.jiayuan.common.enums
 * @Package: TableRelatedType
 * @Description: 字段使用类型
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/1
 */
@Getter
@AllArgsConstructor
public enum FieldUseType {

    /**
     * 主键
     */
    PRIMARY(1, "主键"),
    /**
     * 关联字段
     */
    RELATED(2, "关联字段"),
    /**
     * 其它
     */
    OTHER(0, "其它");


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
