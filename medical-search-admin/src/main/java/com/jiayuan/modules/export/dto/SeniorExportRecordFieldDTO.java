package com.jiayuan.modules.export.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

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
public class SeniorExportRecordFieldDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "表ID", required = true)
    @NotNull
    private Long tableId;

    @ApiModelProperty(value = "表编码", required = true)
    private String tableCode;

    @ApiModelProperty(value = "表名称", required = true)
    private String tableName;

    @ApiModelProperty(value = "是否循环字段")
    private Boolean isLoop;

    @ApiModelProperty(value = "主键编码")
    private String primaryCode;

    @ApiModelProperty(value = "类型(1主表2附表)")
    private Integer slaveType;

    @ApiModelProperty(value = "关联字段")
    private String relatedField;

    @ApiModelProperty(value = "主表编码")
    private String mainTableCode;

    @ApiModelProperty(value = "表排序", required = true)
    private Integer tableSort;

    @ApiModelProperty(value = "表字段ID", required = true)
    @NotNull
    private Long tableFieldId;

    @ApiModelProperty(value = "表字段编码", required = true)
    private String fieldCode;

    @ApiModelProperty(value = "表字段名称", required = true)
    private String fieldName;

    @ApiModelProperty(value = "表字段排序", required = true)
    private Integer fieldSort;

    @ApiModelProperty(value = "选择内容")
    private List<SeniorExportRecordFieldContentDTO> fieldContentDTOList;
}