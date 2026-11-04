package com.jiayuan.modules.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 系统配置表
 *
 * @author lijiankui
 * @since 1.0.0 2023-11-22
 */
@Data
@ApiModel(value = "系统配置表")
public class SysConfigDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "ID")
    private Integer id;

    @ApiModelProperty(value = "模块ID")
    private String moduleId;

    @ApiModelProperty(value = "配置编码")
    private String configCode;

    @ApiModelProperty(value = "配置名称")
    private String configName;

    @ApiModelProperty(value = "配置说明")
    private String description;

    @ApiModelProperty(value = "属性值")
    private String configValue;

    @ApiModelProperty(value = "配置类型 1：文本 2：布尔值 3：数字 4：日期")
    private String configType;

    @ApiModelProperty(value = "排序")
    private Integer sortCode;

    @ApiModelProperty(value = "删除标志 0：否 1：是")
    private String deletedFlag;

    @ApiModelProperty(value = "创建人")
    private String createBy;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "修改人")
    private String updateBy;

    @ApiModelProperty(value = "修改时间")
    private Date updateTime;

    @ApiModelProperty(value = "系统ID")
    private String sysId;

    @ApiModelProperty(value = "界面是否展示 Y：是 N：否")
    private String webShow;

    @ApiModelProperty(value = "模块名称")
    private String moduleName;


}