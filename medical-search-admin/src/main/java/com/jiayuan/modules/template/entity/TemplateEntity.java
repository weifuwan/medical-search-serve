package com.jiayuan.modules.template.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseExDomain;
import lombok.Data;

/**
 * 模板
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
@TableName("cbdses_template")
public class TemplateEntity extends BaseExDomain {
    private static final long serialVersionUID = 1L;
    /**
     * 模板名称
     */
    private String templateName;

    /**
     * 使用范围(0-全院 1-个人)
     */
    private Integer useScope;
    /**
     * 排序
     */
    private Integer sort;

    /**
     * 检索表达式
     */
    private String expression;
}