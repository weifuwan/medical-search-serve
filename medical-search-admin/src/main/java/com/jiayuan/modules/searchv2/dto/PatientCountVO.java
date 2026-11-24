package com.jiayuan.modules.searchv2.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/** Exact count of unique visit_no values. */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("患者范围统计结果")
public class PatientCountVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("符合条件的唯一 visit_no 数量")
    private long total;
}
