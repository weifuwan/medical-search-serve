package com.jiayuan.common.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Title: com.jiayuan.common.enums
 * @Package: MetaCommentType
 * @Description: 元数据注释补充类型
 * @Author: 李建奎
 * @Date: 创建时间 2024/8/15
 */
@Getter
@AllArgsConstructor
public enum MetaCommentType {

    /**
     * 表注释
     */
    TABLE(0, "表注释"),

    /**
     * 字段注释
     */
    FIELD(1, "字段注释");

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
