
package com.jiayuan.modules.log.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 登录日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Data
@ApiModel(value = "登录日志")
public class LogLoginDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
    private Long id;

    @ApiModelProperty(value = "用户名称")
    private String username;

    @ApiModelProperty(value = "登录id即 sys_user表内的登录用户id字段")
    private String loginId;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @ApiModelProperty(value = "系统id")
    private Long sysId;

    @ApiModelProperty(value = "登录ip地址")
    private String ip;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

}
