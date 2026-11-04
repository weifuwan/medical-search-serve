
package com.jiayuan.modules.sys.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * 重置密码
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Data
@ApiModel(value = "重置密码")
public class ResetPasswordDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户ID")
    @NotNull
    private Long id;

    @ApiModelProperty(value = "新密码")
    @NotBlank(message = "{sysuser.password.require}")
    private String password;

}