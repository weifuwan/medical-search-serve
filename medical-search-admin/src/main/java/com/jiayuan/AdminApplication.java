package com.jiayuan;

import com.dtflys.forest.springboot.annotation.ForestScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;


/**
 * @Title: AdminApplication
 * @Package: com.jiayuan
 * @Description: 管理系统启动类
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-04
 */
@EnableAsync
@EnableScheduling
@SpringBootApplication
@ForestScan(basePackages = "com.scjydz.desen")
public class AdminApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(AdminApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(AdminApplication.class);
    }
}