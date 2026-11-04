package com.jiayuan.modules.template.dto;

import com.jiayuan.common.validator.group.UpdateGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;


/**
 * @Title: TableFieldDTO
 * @Package: com.jiayuan.modules.template.dto
 * @Description: 字段DTO
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-11
 */
@Data
@ApiModel(value = "字段")
public class TableFieldDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @NotNull(message = "主键不能为空", groups = UpdateGroup.class)
    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "字段名称")
    private String fieldName;

    @ApiModelProperty(value = "字段编码")
    private String fieldCode;

    @ApiModelProperty(value = "表id")
    private Long tableId;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    /**
     * 字段类型 FieldUseType枚举值
     * @see com.jiayuan.common.enums.FieldUseType
     */
    @ApiModelProperty(value = "字段类型")
    private Integer fieldType;

    /**
     * 表编码
     */
    @ApiModelProperty(value = "表编码")
    private String tableCode;

    @ApiModelProperty(value = "数据类型")
    private String dataType;

    @ApiModelProperty(value = "是否删除")
    private Integer isDeleted;

    @ApiModelProperty(value = "创建者")
    private Long creator;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

    @ApiModelProperty(value = "更新者")
    private Long updater;

    @ApiModelProperty(value = "创建者用户名")
    private String creatorName;

    @ApiModelProperty(value = "更新者用户名")
    private String updaterName;

    @ApiModelProperty(value = "更新时间")
    private Date updateDate;

    @ApiModelProperty(value = "备注")
    private String remark;

    /**
     * 是否有效
     */
    @ApiModelProperty(value = "是否有效")
    private Boolean isEffective;

    @ApiModelProperty(value = "是否显示")
    private Boolean isShow;
}