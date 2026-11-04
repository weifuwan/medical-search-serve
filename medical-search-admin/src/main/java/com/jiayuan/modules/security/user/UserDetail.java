
package com.jiayuan.modules.security.user;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 登录用户信息
 *
 * @author lijiankui
 */
@Data
public class UserDetail implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 登录ID
     */
    private String loginId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 真实姓名
     */
    private String realName;

    /**
     * 密码
     */
    private String password;

    /**
     * 手机号
     */
    private String mobile;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 性别(0未知 1男 2女)
     */
    private Integer gender;

    /**
     * 头像URL
     */
    private String headUrl;

    /**
     * 用户状态(0正常 1锁定 2禁用)
     */
    private Integer status;

    /**
     * 是否超级管理员(Y是 N否)
     */
    private int superAdmin;

    /**
     * 身份证号
     */
    private String idCard;

    /**
     * 最后登录IP
     */
    private String lastLoginIp;

    /**
     * 最后登录时间
     */
    private Date lastLoginDate;

    /**
     * 密码过期时间
     */
    private Date passwordExpirationDate;

    /**
     * 账号激活日期
     */
    private Date accountActivationDate;

    /**
     * 账号过期日期
     */
    private Date accountExpirationDate;

    /**
     * 集团编码
     */
    private String groupCode;

    /**
     * 组织编码
     */
    private String organizationCode;

    /**
     * 系统ID
     */
    private String sysId;

    /**
     * 员工ID
     */
    private String employmentId;

    /**
     * 拼音码
     */
    private String pyCode;

    /**
     * 用户访问令牌
     */
    private String userAccessToken;

    /**
     * 令牌过期时间(小时)
     */
    private Integer tokenExpirationTime;

}