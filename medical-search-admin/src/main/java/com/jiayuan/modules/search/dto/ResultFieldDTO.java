package com.jiayuan.modules.search.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;


/**
 * @Title: ResultFieldDTO
 * @Package: com.jiayuan.modules.search.dto
 * @Description: 返回结果表头
 * @Author: 李建奎
 * @Date: 创建时间 2022-12-09
 */
@Data
@ApiModel(value = "返回结果表头")
public class ResultFieldDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @NotNull(message = "排序不能为空")
    @ApiModelProperty(value = "排序")
    private Integer sort;

    @NotBlank(message = "字段编码不能为空")
    @ApiModelProperty(value = "字段编码")
    private String fieldCode;

    @NotBlank(message = "表编码不能为空")
    @ApiModelProperty(value = "表编码")
    private String tableCode;

    @NotNull(message = "是否默认不能为空")
    @ApiModelProperty(value = "是否默认")
    private Integer isDefault;

    @ApiModelProperty(value = "是否是(人)基础信息")
    private Integer isBasic;

    @ApiModelProperty(value = "是否是(人次)基础字段")
    private Integer isVisitBasic;

    @ApiModelProperty(value = "是否是字典")
    private Integer isDict;

    @ApiModelProperty(value = "字典类型")
    private String dictType;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @ApiModelProperty(value = "创建者")
    private Long creator;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

    @ApiModelProperty(value = "更新者")
    private Long updater;

    @ApiModelProperty(value = "更新时间")
    private Date updateDate;

    @ApiModelProperty(value = "是否删除")
    private Integer isDeleted;
}