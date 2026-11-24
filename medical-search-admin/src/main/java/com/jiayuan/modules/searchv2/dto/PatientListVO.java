package com.jiayuan.modules.searchv2.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/** Paged visit records projected from ms_visit_record only. */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("患者就诊记录列表")
public class PatientListVO implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("就诊主表记录")
    private List<Map<String, Object>> records;

    @ApiModelProperty("符合条件的唯一 visit_no 数量")
    private long total;

    @ApiModelProperty("当前页码")
    private int pageNum;

    @ApiModelProperty("每页数量")
    private int pageSize;
}
