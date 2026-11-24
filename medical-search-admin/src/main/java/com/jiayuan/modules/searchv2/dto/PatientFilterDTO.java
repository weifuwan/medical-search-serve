package com.jiayuan.modules.searchv2.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/** A filter applied only to fields in ms_visit_record. */
@Data
@ApiModel("患者列表筛选条件")
public class PatientFilterDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "就诊主表字段编码", required = true, example = "visit_type")
    private String fieldCode;

    @ApiModelProperty(value = "操作符：EQ、NE、GT、GE、LT、LE、BETWEEN、LIKE、PREFIX、NOT_CONTAIN、IS_NOT_NULL",
            required = true, example = "EQ")
    private String operator;

    @ApiModelProperty(value = "筛选值；IS_NOT_NULL 不需要填写", example = "住院")
    private String value;

    @ApiModelProperty(value = "BETWEEN 的结束值", example = "60")
    private String secondValue;
}
