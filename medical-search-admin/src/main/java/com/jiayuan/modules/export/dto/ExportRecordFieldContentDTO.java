package com.jiayuan.modules.export.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;


/**
 * 数据导出记录字段信息(高级导出)选择内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(value = "数据导出记录字段信息(高级导出)选择内容")
public class ExportRecordFieldContentDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "导出记录字段信息ID")
    private Long fieldId;

    @ApiModelProperty(value = "字段编码")
    private String code;

    @ApiModelProperty(value = "字段名称")
    private String name;

    @ApiModelProperty(value = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

    @ApiModelProperty(value = "最后更新时间")
    private Date updateDate;


}