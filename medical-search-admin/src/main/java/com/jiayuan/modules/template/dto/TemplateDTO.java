package com.jiayuan.modules.template.dto;

import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.enums.EnumList;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * @Title: TemplateDTO
 * @Package: com.jiayuan.modules.template.dto
 * @Description: 模板DTO
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-16
 */
@Data
@ApiModel(value = "模板")
public class TemplateDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @NotBlank(message = "模板名称不能为空")
    @ApiModelProperty(value = "模板名称")
    private String templateName;

    @ApiModelProperty(value = "表达式")
    private String expression;

    @EnumList(value = BizConstant.UseScope.class, message = "使用范围类型不合法")
    @ApiModelProperty(value = "使用范围(0-全院 1-个人)")
    private Integer useScope;

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

    @ApiModelProperty(value = "创建者用户名")
    private String creatorName;

    @ApiModelProperty(value = "更新者用户名")
    private String updaterName;

    @ApiModelProperty(value = "模板关联字段列表")
    private List<TemplateFieldDTO> templateFieldDTOList;
}