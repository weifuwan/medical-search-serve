package com.jiayuan.modules.ws.dto;

import com.jiayuan.common.validator.group.DefaultGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Title: com.jiayuan.modules.ws.dto
 * @Package: EmrDTO
 * @Description: TODO
 * @Author: 李建奎
 * @Date: 创建时间 2024/9/18
 */
@Data
@Builder
@ApiModel(value = "EmrDTO", description = "电子病历查询参数")
public class EmrDTO {
    /**
     * 患者id
     */
    @NotBlank(message = "患者id不能为空", groups = DefaultGroup.class)
    @ApiModelProperty("患者id")
    private String patientId;
    /**
     * DOMAIN_ID 域ID：01门诊、02住院、03体检04急诊
     */
    @NotBlank(message = "DOMAIN_ID 域ID不能为空", groups = DefaultGroup.class)
    @ApiModelProperty("DOMAIN_ID 域ID：01门诊、02住院、03体检04急诊")
    private String domainId;

    @NotBlank(message = "就诊流水号不能为空", groups = DefaultGroup.class)
    @ApiModelProperty("就诊流水号")
    private String visitNo;
}
