
package com.jiayuan.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.util.Date;

/**
 * 系统用户
 *
 * @author lijiankui
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_user")
@ToString
public class SysUserEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 集团编码
     */
    @TableField("GROUP_CODE")
    private String groupCode = "01";

    /**
     * 组织编码
     */
    @TableField("ORGANIZATION_CODE")
    private String organizationCode = "001";

    /**
     * 序号
     */
    @TableId(value = "USER_ID", type = IdType.AUTO)
    private Long userId;

    /**
     * 登录用户id
     */
    @TableField("LOGIN_ID")
    private String loginId;

    /**
     * 登录用户密码
     */
    @TableField("PASSWORD")
    private String password;

    /**
     * 密码失效时间
     */
    @TableField("PASSWORD_EXPIRATION_DATE")
    private Date passwordExpirationDate;

    /**
     * 密码强制修改标志
     */
    @TableField("PASSWORD_RESET")
    private Integer passwordReset;

    /**
     * 当前登录ip
     */
    @TableField("LOGIN_IP")
    private String loginIp;

    /**
     * 上次登录时间
     */
    @TableField("LAST_LOGIN_DATE")
    private Date lastLoginDate;

    /**
     * 上次登录ip
     */
    @TableField("LAST_LOGIN_IP")
    private String lastLoginIp;

    /**
     * 验证登录失败次数
     */
    @TableField("FAILED_LOGIN_ATTEMPTS")
    private Integer failedLoginAttempts;

    /**
     * 用户状态
     */
    @TableField("USER_STATUS")
    private String userStatus;

    /**
     * 状态修改时间
     */
    @TableField("MODIFIED_DATE")
    private Date modifiedDate;

    /**
     * 员工工号
     */
    @TableField("EMPLOYMENT_ID")
    private String employmentId;

    /**
     * 用户名
     */
    @TableField("USER_NAME")
    private String userName;

    /**
     * 手机号
     */
    @TableField("MOBILE")
    private String mobile;

    @TableField(exist = false)
    private String deptNo;

    /**
     * 创建时间
     */
    @TableField("CREATE_TIME")
    private Date createTime;

    /**
     * 邮箱
     */
    @TableField("EMAIL")
    private String email;

    /**
     * 属于哪个系统
     */
    @TableField("SYS_ID")
    private String sysId;

    /**
     * 性别
     */
    @TableField("GENDER")
    private String gender;

    /**
     * 身份证号
     */
    @TableField("ID_CARD")
    private String idCard;

    /**
     * 验证方式（0：帐密；1：验证码 ；2：账密+验证码） 默认密码
     */
    @TableField("IDENTIFY_TYPE")
    private String identifyType = "0";

    /**
     * 账号启用日期，默认现在
     */
    @TableField("ACCOUNT_ACTIVATION_DATE")
    private Date accountActivationDate = new Date();

    /**
     * 账号失效日期
     */
    @TableField("ACCOUNT_EXPIRATION_DATE")
    private Date accountExpirationDate;

    /**
     * token过期时间（单位小时，默认2小时）
     */
    @TableField("TOKEN_EXPIRATION_TIME")
    private Integer tokenExpirationTime = 2;

    /**
     * 新页面打开方式，1、新开一个页面，2、当前页
     */
    @TableField("NEW_PAGE_OPEN_TYPE")
    private String newPageOpenType = "1";

    /**
     * 用户api令牌号
     */
    @TableField("USER_ACCESS_TOKEN")
    private String userAccessToken;

    /**
     * 是否为管理员用户 Y/N
     */
    @TableField("FG_ADMIN")
    private String fgAdmin = "N";

    /**
     * 拼音码
     */
    @TableField("PY_CODE")
    private String pyCode;

    /**
     * 证件类型
     */
    @TableField("ID_TYPE")
    private String idType;

    /**
     * CA激活标志
     */
    @TableField("CA_ACTIVATE")
    private String caActivate;

    /**
     * ca用户ID
     */
    @TableField("CA_USER_ID")
    private String caUserId;

    /**
     * ca最后一次更新时间
     */
    @TableField("CA_USER_UPDATE_TIME")
    private String caUserUpdateTime;

    /**
     * 职员状态：0-在职、1-离职
     */
    @TableField("EMPLOYEE_STATUS")
    private Integer employeeStatus = 0;

}