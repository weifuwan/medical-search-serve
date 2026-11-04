package com.jiayuan.modules.export.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;


/**
 * 数据检索保存记录-升级/降级
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@ApiModel(value = "数据检索保存记录-升级/降级")
public class ExportSearchResultDimensionDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @NotNull
    private Long id;

    @ApiModelProperty(value = "维度(0人次 1人)")
    @NotNull
    private Integer dimension;
}