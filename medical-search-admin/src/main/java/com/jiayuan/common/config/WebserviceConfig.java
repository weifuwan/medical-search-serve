package com.jiayuan.common.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @Title: com.jiayuan.common.config
 * @Package: WebserviceConfig
 * @Description: webservice字典查询接口配置
 * @Author: 李建奎
 * @Date: 创建时间 2024/9/10
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "ws")
public class WebserviceConfig {

    /**
     * 接口地址
     */
    private String url;

    /**
     * 命名空间
     */
    private String namespace;

    /**
     * 字典查询方法
     */
    private String queryDict;

    /**
     * 科室字典编码
     */
    private String deptDictCode;
    /**
     * 科室字典名称
     */
    private String deptDictName;
    /**
     * 人员字典编码
     */
    private String accountDictCode;
    /**
     * 人员字典名称
     */
    private String accountDictName;
}
