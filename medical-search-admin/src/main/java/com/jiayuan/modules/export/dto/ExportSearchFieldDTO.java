package com.jiayuan.modules.export.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 数据保存显示字段
 *
 * @author lijiankui
 * @since 1.0.0 2024-10-08
 */
@Data
@ApiModel(value = "数据保存显示字段")
public class ExportSearchFieldDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "数据保存记录id")
    private Long saveRecordId;

    @ApiModelProperty(value = "是否患者(人)基础字段(0否，1是)")
    private Integer isBasic;

    @ApiModelProperty(value = "是否就诊(人次)基础字段(0否，1是)")
    private Integer isVisitBasic;

    @ApiModelProperty(value = "是否是字典")
    private Integer isDict;

    @ApiModelProperty(value = "字典类型")
    private String dictType;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "表编码")
    private String tableCode;

    @ApiModelProperty(value = "字段编码")
    private String fieldCode;

    @ApiModelProperty(value = "创建者")
    private Long creator;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

    @ApiModelProperty(value = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;

    @ApiModelProperty(value = "更新者")
    private String updater;

    @ApiModelProperty(value = "更新时间")
    private Date updateDate;


}