package com.jiayuan.modules.export.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;


/**
 * 数据导出记录字段信息(高级导出)选择内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@ApiModel(value = "数据导出记录字段信息(高级导出)选择内容")
public class SeniorExportRecordFieldContentDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "字段编码")
    private String code;

    @ApiModelProperty(value = "字段名称")
    private String name;

}