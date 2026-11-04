package com.jiayuan.common.constant;

/**
 * @Title: SysConstant
 * @Package: com.jiayuan.common.constant
 * @Description: 系统配置常量
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/14
 */
public class SysConstant {
    public static final String SYS_ID = "CBDSES";
    public static final String SSO_SERVICE_CERTIFICATE = "sso.service.certificate";
    public static final String SSO_SERVICE_REGISTRATION_ADDR = "sso.service.registration.addr";
    public static final String SSO_SERVICE_TOKENVERIFICATION_ADDR = "sso.service.tokenverification.addr";

    /**
     * 报告签收超时提醒时间设置(min)
     */
    public static final String SIGN_TIMEOUT_LIMIT = "sign.timeout.limit";
    /**
     * 自动核对是否开启
     */
    public static final String AUTO_CHECK_ENABLED = "auto.check.enabled";

    /**
     * 日志定期清理开关
     */
    public static final String LOG_CLEAR_ENABLE = "enable.periodic.log.clearing";
    /**
     * 日志保存时间
     */
    public static final String LOG_SAVE_TIME = "config.log.retention.time";


    /**
     * 是否允许修改密码与上次相同
     */
    public static final String USER_PASSWORD_UNIQUE = "config.user.password.unique";
    /**
     * 密码强度登录
     */
    public static final String USER_PASSWORD_STRENGTH = "config.user.password.strength";

    public static final String NO = "N";
    /**
     * 注册账号初始密码
     */
    public static final String REGISTER_ACCOUNT_INITIAL_PASSWORD = "register.account.initial.password";
}
