package com.jiayuan.modules.export.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseDomain;
import lombok.Data;

/**
 * 数据检索保存记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@TableName("cbdses_export_search_result")
public class ExportSearchResultEntity extends BaseDomain {

    /**
     * 数据保存名称
     */
    private String name;
    /**
     * 维度(0人次 1人)
     */
    private Integer dimension;
    /**
     * 数量
     */
    private Integer amount;
    /**
     * 检索表达式
     */
    private String expression;
    /**
     * 备注
     */
    private String remark;
    /**
     * 排序表编码
     */
    private String orderTableCode;
    /**
     * 排序字段编码
     */
    private String orderFieldCode;
    /**
     * 排序方式
     */
    private String orderMode;
}