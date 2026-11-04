package com.jiayuan.modules.search.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * @Title: SortDTO
 * @Package: com.jiayuan.modules.search.dto
 * @Description: 排序dto
 * @Author: 李建奎
 * @Date: 创建时间 2024-03-06
 */
@Data
@ApiModel(value = "排序dto")
public class SortDTO implements Serializable {
    private static final long serialVersionUID = 1L;

//    @NotBlank(message = "表编码不能为空")
//    @ApiModelProperty(value = "表编码")
//    private String tableCode;
//
//    @NotBlank(message = "字段编码不能为空")
//    @ApiModelProperty(value = "字段编码")
//    private String fieldCode;

    @NotNull(message = "显示字段配置id不能为空")
    @ApiModelProperty(value = "显示字段配置id")
    private Long id;

    @NotNull(message = "排序不能为空")
    @ApiModelProperty(value = "排序")
    private Integer sort;

}
