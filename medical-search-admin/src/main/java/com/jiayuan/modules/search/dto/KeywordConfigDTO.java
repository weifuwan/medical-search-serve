package com.jiayuan.modules.search.dto;

import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.enums.EnumList;
import com.jiayuan.common.validator.group.DefaultGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;


/**
 * @Title: KeywordConfigDTO
 * @Package: com.jiayuan.modules.search.dto
 * @Description: 关键字检索配置
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-30
 */
@Data
@ApiModel(value = "关键字检索配置")
public class KeywordConfigDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "关键字")
    private String keyword;

    @NotBlank(message = "字段编码不能为空", groups = DefaultGroup.class)
    @ApiModelProperty(value = "字段编码")
    private String fieldCode;

    @NotBlank(message = "表编码不能为空", groups = DefaultGroup.class)
    @ApiModelProperty(value = "表编码")
    private String tableCode;

    //    @NotBlank(message = "不能为空", groups = DefaultGroup.class)
    @ApiModelProperty(value = "表类型")
    private String dataType;

    @EnumList(value = BizConstant.KeywordType.class, message = "关键词类型只能是0、1、2")
    @ApiModelProperty(value = "关键词类型")
    private Integer keywordType;

    @ApiModelProperty(value = "是否转化(例如查询男es存储1)")
    private Integer isConvert;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @NotNull(message = "是否通用不能为空", groups = DefaultGroup.class)
    @ApiModelProperty(value = "是否默认(是否通用)")
    private Integer isDefault;

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

    /**
     * 表id
     */
    @ApiModelProperty(value = "表id")
    private Long tableId;

    /**
     * 表名称
     */
    @ApiModelProperty(value = "表名称")
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

    /**
     * 字段id
     */
    @ApiModelProperty(value = "字段id")
    private Long fieldId;
    /**
     * 字段名称
     */
    @ApiModelProperty(value = "字段名称")
    private String fieldName;
}