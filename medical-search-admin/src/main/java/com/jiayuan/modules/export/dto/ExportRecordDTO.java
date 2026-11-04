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
 * 数据导出记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ApiModel(value = "数据导出记录")
public class ExportRecordDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "数据保存记录ID")
    private Long searchId;

    @ApiModelProperty(value = "数据保存记录名称")
    private String searchName;

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

    @ApiModelProperty(value = "导出类型(0-基本导出, 1-高级导出)")
    private Integer exportType;

    @ApiModelProperty(value = "导出字段数量")
    private Integer fieldAmount;

    @ApiModelProperty(value = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;

    @ApiModelProperty(value = "创建(导出)时间")
    private Date createDate;

    @ApiModelProperty(value = "创建(导出)人ID")
    private String createUserId;

    @ApiModelProperty(value = "创建(导出)人名称")
    private String createUserName;

    @ApiModelProperty(value = "最后更新时间")
    private Date updateDate;

    /**
     * 导出状态(1导出进行中，2成功，3失败)
     */
    @ApiModelProperty(value = "导出状态(1导出进行中，2成功，3失败)")
    private Integer status;
    /**
     * 开始时间
     */
    @ApiModelProperty(value = "开始时间")
    private Date startDate;
    /**
     * 结束时间
     */
    @ApiModelProperty(value = "结束时间")
    private Date endDate;
    /**
     * 备注
     */
    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "文件路径")
    private String path;


}