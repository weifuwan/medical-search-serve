package com.jiayuan.modules.export.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 数据检索保存记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@ApiModel(value = "数据检索保存记录")
public class ExportSearchResultDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "数据保存名称")
    private String name;

    @ApiModelProperty(value = "维度(0人次 1人)")
    private Integer dimension;

    @ApiModelProperty(value = "数量")
    private Integer amount;

    @ApiModelProperty(value = "检索表达式")
    private String expression;

    @ApiModelProperty(value = "排序表编码")
    private String orderTableCode;

    @ApiModelProperty(value = "排序字段编码")
    private String orderFieldCode;

    @ApiModelProperty(value = "排序方式，asc或desc")
    private String orderMode;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

    @ApiModelProperty(value = "创建者")
    private Long creator;

    @ApiModelProperty(value = "更新者")
    private Long updater;

    @ApiModelProperty(value = "最后更新时间")
    private Date updateDate;
}