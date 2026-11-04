package com.jiayuan.modules.template.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseDomain;
import lombok.Data;

/**
 * 模板和字段的映射关系
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
@TableName("cbdses_template_field")
public class TemplateFieldEntity extends BaseDomain {
    private static final long serialVersionUID = 1L;
    /**
     * 模板id
     */
    private Long templateId;
    /**
     * 字段id 考虑替换成 tableCode 和 fieldCode
     */
    @Deprecated
    private Long fieldId;
    /**
     * 字段编码
     */
    private String fieldCode;
    /**
     * 表编码
     */
    private String tableCode;
    /**
     * 字段值
     */
    private String fieldVal;

    /**
     * 逻辑符号
     */
    private Integer logic;

    /**
     * 关系符号
     */
    private Integer relation;

    /**
     * 排序
     */
    private Integer sort;
}