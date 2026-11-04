
package com.jiayuan.modules.log.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 登录日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("log_login")
public class LogLoginEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    @TableId(value = "ID", type = IdType.AUTO)
    private Long id;

    /**
     * 用户名称
     */
    private String username;

    /**
     * 登录ID（sys_user表内的登录用户ID）
     */
    private String loginId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 系统ID
     */
    private String sysId;

    /**
     * 登录IP地址
     */
    private String ip;

    /**
     * 登录时间
     */
    private Date loginTime;

    /**
     * 登录结果
     */
    private String loginResult;

    /**
     * 登录渠道
     */
    private String loginChl;

    /**
     * 登录备注
     */
    private String loginNote;

    /**
     * 登录地理位置
     */
    private String loginLocation;

}