package com.jiayuan.common.component;

import com.jiayuan.modules.sys.service.SysDictDataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @Title: MyCommandLineRunner
 * @Package: com.jiayuan.common.component
 * @Description: 项目启动之后加载指定逻辑
 * @Author: 李建奎
 * @Date: 创建时间 2023/3/16
 */
@Slf4j
@Component
public class MyCommandLineRunner implements CommandLineRunner, Ordered {

    @Resource
    private SysDictDataService sysDictDataService;

    @Override
    public void run(String... args) throws Exception {
        sysDictDataService.loadingDictCache();
    }

    @Override
    public int getOrder() {
        return Integer.MAX_VALUE + 1;
    }
}
