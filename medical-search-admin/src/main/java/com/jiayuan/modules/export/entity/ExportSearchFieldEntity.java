package com.jiayuan.modules.export.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseDomain;
import lombok.Data;

/**
 * 数据保存显示字段
 *
 * @author lijiankui
 * @since 1.0.0 2024-10-08
 */
@Data
@TableName("cbdses_export_search_field")
public class ExportSearchFieldEntity extends BaseDomain {

    /**
     * 数据保存记录id
     */
    private Long saveRecordId;
    /**
     * 是否患者(人)基础字段(0否，1是)
     */
    private Integer isBasic;
    /**
     * 是否就诊(人次)基础字段(0否，1是)
     */
    private Integer isVisitBasic;
    /**
     * 是否是字典
     */
    private Integer isDict;
    /**
     * 字典类型
     */
    private String dictType;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 表编码
     */
    private String tableCode;
    /**
     * 字段编码
     */
    private String fieldCode;
}