package com.jiayuan.modules.template.dto;

import com.jiayuan.common.enums.TableSlaveType;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 表
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
@ApiModel(value = "表")
public class TableDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @NotBlank(message = "表名称不能为空", groups = DefaultGroup.class)
    @ApiModelProperty(value = "表名称")
    private String tableName;

    @NotBlank(message = "表编码不能为空", groups = AddGroup.class)
    @ApiModelProperty(value = "表编码")
    private String tableCode;

    @NotNull(message = "表分类不能为空", groups = DefaultGroup.class)
    @ApiModelProperty(value = "表分类ID")
    private Long classifyId;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    @ApiModelProperty(value = "是否删除")
    private Integer isDeleted;

    @ApiModelProperty(value = "创建者")
    private Long creator;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

    @ApiModelProperty(value = "更新者")
    private Long updater;

    @ApiModelProperty(value = "更新时间")
    private Date updateDate;

    @ApiModelProperty(value = "备注")
    private String remark;

    /**
     * 是否有效
     */
    @ApiModelProperty(value = "是否有效")
    private Boolean isEffective;

    @ApiModelProperty(value = "是否循环字段")
    private Boolean isLoop;

    @ApiModelProperty(value = "主键编码")
    private String primaryCode;

    /**
     * 表的从属类型(1主表2附表)
     * @see TableSlaveType
     */
    @ApiModelProperty(value = "类型(1主表2附表)")
    private Integer slaveType;

    @ApiModelProperty(value = "关联字段")
    private String relatedField;

    @ApiModelProperty(value = "主表编码")
    private String mainTableCode;

    @ApiModelProperty(value = "是否显示")
    private Boolean isShow;

    @ApiModelProperty(value = "表字段集合")
    private List<TableFieldEntity> fieldList;
}