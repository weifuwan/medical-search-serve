package com.jiayuan.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Title: com.jiayuan.common.config
 * @Package: CustomConfig
 * @Description: 项目自定义配置
 * @Author: 李建奎
 * @Date: 创建时间 2024/8/5
 */
@Data
@Component
@ConfigurationProperties(prefix = "custom")
public class CustomConfig {

    /**
     * 是否开启redis缓存 true开启 false关闭
     */
    private Boolean redisOpen;
    /**
     * 登录是否需要验证验证码
     */
    private Boolean loginCaptchaDisabled;
    /**
     * 附件路径
     */
    private String filePath;
    /**
     * 附件大小
     */
    private Integer fileImageSize;
    /**
     * 用户默认密码
     */
    private String userDefaultPassword;
    /**
     * 数据保存记录-回收站保存过期天数
     */
    private Integer recycleBinExpire;
    /**
     * es索引名称
     */
    private String esIndexName;
    /**
     * 任务用户id
     */
    private Long taskUserId;
    /**
     * 基础角色id
     */
    private Long baseRoleId;

    /**
     * 管理员角色id
     */
    private Long superRoleId;


}
