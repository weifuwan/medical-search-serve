package com.jiayuan.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @Title: CustomConfig
 * @Package: com.jiayuan.common.config
 * @Description: 项目自定义配置
 * @Author: 李建奎
 * @Date: 创建时间 2023/8/7
 */
@Data
@Component
@ConfigurationProperties(prefix = "sso")
public class SsoConfig {
    /**
     * 单点登录url
     */
    public String loginUrl;

    /**
     * 系统id
     */
    public String systemId;

    /**
     * 单点登录注册地址
     */
    public String userRegisterUrl;

    /**
     * 单点登录凭证
     */
    public String certificate;

    /**
     * 组织编码
     */
    public String groupCode;

    /**
     * 机构编码
     */
    public String orgCode;
}
