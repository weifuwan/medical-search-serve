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
 * 数据检索保存记录回收站
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "数据检索保存记录回收站")
public class ExportRecycleBinDTO implements Serializable {
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

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "过期清除截止日期")
    private Date expireDate;

    @ApiModelProperty(value = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;

    @ApiModelProperty(value = "创建(删除)时间")
    private Date createDate;

    @ApiModelProperty(value = "创建(删除)人ID")
    private String createUserId;

    @ApiModelProperty(value = "创建(删除)人名称")
    private String createUserName;

    @ApiModelProperty(value = "最后更新时间")
    private Date updateDate;


}