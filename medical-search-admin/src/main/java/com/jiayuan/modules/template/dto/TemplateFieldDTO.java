package com.jiayuan.modules.template.dto;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.utils.EnumExtendUtil;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 模板和字段的映射关系
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
@ApiModel(value = "模板和字段的映射关系")
public class TemplateFieldDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "模板id")
    private Long templateId;

    /**
     * 元数据的变动平凡，code变化的情况少
     */
    @Deprecated
    @ApiModelProperty(value = "字段id")
    private Long fieldId;

    @ApiModelProperty(value = "字段编码")
    private String fieldCode;

    @ApiModelProperty(value = "字段名称")
    private String fieldName;

    @ApiModelProperty(value = "数据类型")
    private String dataType;

    @ApiModelProperty(value = "表id")
    private Long tableId;

    @ApiModelProperty(value = "表编码")
    private String tableCode;

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

    @ApiModelProperty(value = "字段值")
    private String fieldVal;

    @ApiModelProperty(value = "逻辑符号")
    private Integer logic;

    @ApiModelProperty(value = "关系符号")
    private Integer relation;

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

    @ApiModelProperty(value = "排序")
    private Integer sort;


    @Override
    public String toString() {
        StringBuilder expression = new StringBuilder();
        //优先级
        final Symbol.RelationalEnum relationalEnum = EnumExtendUtil.valueOf(Symbol.RelationalEnum.class, this.getRelation());
        final boolean isEq = Symbol.RelationalEnum.EQ.equals(relationalEnum) ||
                Symbol.RelationalEnum.IS_NOT_NULL.equals(relationalEnum);
        final boolean isLike = Symbol.RelationalEnum.LIKE.equals(relationalEnum);
        //前缀模式组装
        if (isEq) {
            expression.append(this.getFieldVal());
        } else if (isLike) {
            expression.append("*" + this.getFieldVal() + "*");
        }
        expression.append("[");
        expression.append(this.getTableName());
        expression.append(".");
        expression.append(this.getFieldName());
        expression.append("]");
        //后缀模式组装
        if (!isEq && !isLike) {
            expression.append(relationalEnum.getName());
            expression.append(this.getFieldVal());
        }
        return expression.toString();
    }
}