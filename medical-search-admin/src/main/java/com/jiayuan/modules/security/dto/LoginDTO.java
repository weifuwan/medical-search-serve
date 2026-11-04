
package com.jiayuan.modules.security.dto;

import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * 登录表单
 *
 * @author lijiankui
 */
@Data
@ApiModel(value = "登录表单")
public class LoginDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "用户名", required = true)
    @NotBlank(message = "{sysuser.username.require}", groups = DefaultGroup.class)
    private String username;

    @ApiModelProperty(value = "密码")
    @NotBlank(message = "{sysuser.password.require}", groups = DefaultGroup.class)
    private String password;

    @ApiModelProperty(value = "验证码")
    @NotBlank(message = "{sysuser.captcha.require}", groups = AddGroup.class)
    private String captcha;

    @ApiModelProperty(value = "唯一标识")
    @NotBlank(message = "{sysuser.uuid.require}", groups = AddGroup.class)
    private String uuid;

}