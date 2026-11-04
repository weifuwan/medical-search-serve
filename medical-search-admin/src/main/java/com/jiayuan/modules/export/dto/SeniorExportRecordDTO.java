package com.jiayuan.modules.export.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;


/**
 * 数据导出记录字段信息(高级导出)
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@ApiModel(value = "数据导出记录字段信息(高级导出)")
public class SeniorExportRecordDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "检索保存记录主键", required = true)
    @NotNull
    private Long id;

    @ApiModelProperty(value = "选择字段集合")
    @NotNull
    private List<@Valid SeniorExportRecordFieldDTO> fieldDTOList;

    @ApiModelProperty(value = "当前页码")
    private Integer page;

    @ApiModelProperty(value = "每页显示记录数")
    private Integer size;
}