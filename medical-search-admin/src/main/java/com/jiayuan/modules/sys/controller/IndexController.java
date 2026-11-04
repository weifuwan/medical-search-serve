package com.jiayuan.modules.sys.controller;

import com.jiayuan.common.utils.Result;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Title: IndexController
 * @Package: com.jiayuan.modules.sys.controller
 * @Description: 首页提示
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-04
 */
@RestController
public class IndexController {

    @GetMapping("/")
    public Result<String> index() {
        String tips = "临床大数据检索后端管理系统已启动！";
        return Result.ok(tips);
    }
}
