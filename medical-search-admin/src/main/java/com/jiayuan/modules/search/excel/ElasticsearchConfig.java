package com.jiayuan.modules.search.excel;

import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.elasticsearch.ElasticsearchProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.client.ClientConfiguration;
import org.springframework.data.elasticsearch.client.RestClients;

import javax.annotation.Resource;
import java.time.Duration;

@Configuration
public class ElasticsearchConfig {

    @Resource
    private ElasticsearchProperties esProperties; // 自动注入Spring Boot的配置

    @Bean
    public RestHighLevelClient elasticsearchClient() {
        // 修正URI处理方式（去掉http://前缀）
        String[] uris = esProperties.getUris().stream()
                .map(uri -> uri.replace("http://", "").replace("https://", ""))
                .toArray(String[]::new);
        ClientConfiguration clientConfiguration = ClientConfiguration.builder()
                .connectedTo(uris) // 使用配置文件的URI
                .withConnectTimeout(esProperties.getConnectionTimeout())
                .withSocketTimeout(esProperties.getSocketTimeout())
                .withClientConfigurer(
                        RestClients.RestClientConfigurationCallback.from(httpClientBuilder -> httpClientBuilder
                                .setDefaultConnectionConfig(
                                        org.apache.http.config.ConnectionConfig.custom()
                                                .setBufferSize(419430400) // 400MB
                                                .build()
                                ))
                )
                .build();

        return RestClients.create(clientConfiguration).rest();
    }
}
