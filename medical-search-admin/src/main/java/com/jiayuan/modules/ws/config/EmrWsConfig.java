package com.jiayuan.modules.ws.config;

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
@ConfigurationProperties(prefix = "ws.emr")
public class EmrWsConfig {

    /**
     * emr:
     *     query-url: http://192.168.30.138:8900/webservice/DOCUMENT_REGISTER?wsdl
     *     query-namespace: DOCUMENT_REGISTER
     *     query-method: DOCUMENT_REGISTERRequest
     *     query-action: DOCUMENT_REGISTER/DOCUMENT_REGISTER
     *     search-url: http://192.168.30.138:8900/webservice/DOCUMENT_REGISTER_JH?wsdl
     *     search-namespace: DOCUMENT_REGISTER_JH
     *     search-method: operation1Request
     *     search-action: DOCUMENT_REGISTER_JH/operation1
     */
    private String queryUrl;
    private String queryMethod;
    private String queryAction;
    private String queryNamespace;
    private String searchUrl;
    private String searchMethod;
    private String searchAction;
    private String searchNamespace;

}
