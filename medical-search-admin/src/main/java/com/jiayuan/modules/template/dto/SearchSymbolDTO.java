package com.jiayuan.modules.template.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 检索符号
 *
 * @author lijiankui
 * @since 1.0.0 2025-04-16
 */
@Data
@ApiModel(value = "检索符号")
public class SearchSymbolDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "符号值")
    private String symbolValue;

    @ApiModelProperty(value = "符号展示文本")
    private String symbolLabel;

    @ApiModelProperty(value = "排列序号")
    private Integer sort;

    @ApiModelProperty(value = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

    @ApiModelProperty(value = "最后更新时间")
    private Date updateDate;
}