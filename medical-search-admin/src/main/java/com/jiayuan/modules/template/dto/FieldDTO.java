package com.jiayuan.modules.template.dto;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.TableSlaveType;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;

/**
 * @Title: FieldDTO
 * @Package: com.jiayuan.modules.template.dto
 * @Description: 字段DTO
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/2
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class FieldDTO implements Serializable {
    private static final long serialVersionUID = 861295474191428295L;

    /**
     * 显示字段id
     */
    @ApiModelProperty(value = "显示字段id")
    private Long resultFieldId;
    /**
     * 表id
     */
    @ApiModelProperty(value = "表id")
    private Long tableId;

    /**
     * 表编码
     */
    @ApiModelProperty(value = "表编码")
    private String tableCode;

    /**
     * 表名称
     */
    @ApiModelProperty(value = "表名称")
    private String tableName;

    /**
     * 字段id
     */
    @ApiModelProperty(value = "字段id")
    private Long fieldId;

    /**
     * 字段编码
     */
    @ApiModelProperty(value = "字段编码")
    private String fieldCode;

    /**
     * 字段名称
     */
    @ApiModelProperty(value = "字段名称")
    private String fieldName;

    /**
     * 字段类型 FieldUseType枚举值
     * @see com.jiayuan.common.enums.FieldUseType
     */
    @ApiModelProperty(value = "字段类型")
    private Integer fieldType;

    @ApiModelProperty(value = "数据类型")
    private String dataType;

    /**
     * 是否显示
     */
    @ApiModelProperty(value = "是否显示")
    private Boolean isShow;

    /**
     * 排序
     */
    @ApiModelProperty(value = "排序")
    private Integer sort;

    /**
     * 是否默认
     */
    @ApiModelProperty(value = "是否默认")
    private Integer isDefault;

    /**
     * 是否是(人)基础信息（表头显示的公共字段）
     */
    @ApiModelProperty(value = "是否是(人)基础信息")
    private Integer isBasic;

    /**
     * 是否是(人次)基础信息（控制字段表头是否要显示表名称）
     */
    @ApiModelProperty(value = "是否是(人次)基础信息")
    private Integer isVisitBasic;

    /**
     * 是否是字典
     */
    @ApiModelProperty(value = "是否是字典")
    private Integer isDict;

    /**
     * 字段类型
     */
    @ApiModelProperty(value = "字段类型")
    private String dictType;


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

    @Deprecated
    @ApiModelProperty(value = "关联字段")
    private String relatedField;

    @ApiModelProperty(value = "主表编码")
    private String mainTableCode;

    /**
     * 关系符号 等于大小的判断
     */
    private Symbol.RelationalEnum relationalEnum;

    /**
     * 检索值
     */
    private String val;
}
