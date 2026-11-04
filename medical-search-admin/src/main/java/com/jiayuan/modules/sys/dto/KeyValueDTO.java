
package com.jiayuan.modules.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 键值对
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Data
@ApiModel(value = "键值对")
public class KeyValueDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "ID")
    @NotNull
    private Long id;

    @ApiModelProperty(value = "名称")
    private String name;

}