package com.jiayuan.modules.search.excel;

import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

@Component
public class ThreadPoolTaskExecutorConfig {
    @Bean
    public ThreadPoolTaskExecutor taskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(5);       // 核心线程数
        executor.setMaxPoolSize(10);       // 最大线程数
        executor.setQueueCapacity(500);    // 队列容量
        executor.setThreadNamePrefix("export-"); // 线程名前缀
        executor.initialize();
        return executor;
    }
}
