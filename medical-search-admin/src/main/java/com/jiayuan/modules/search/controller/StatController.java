package com.jiayuan.modules.search.controller;

import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.search.dto.StatDTO;
import com.jiayuan.modules.search.request.StatRequest;
import com.jiayuan.modules.search.service.StatService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Title: StatController
 * @Package: com.jiayuan.modules.search.controller
 * @Description: 统计模块
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/23
 */
@RestController
@RequestMapping("stat")
@Api(tags = "统计模块")
public class StatController {

    @Resource
    private StatService statService;


    @GetMapping("statOfData")
    @ApiOperation("数据统计")
    public Result<StatDTO.DataStat> statOfData(StatRequest param) {
        return Result.ok(statService.statOfData(param));
    }


    @GetMapping("statOfExport")
    @ApiOperation("导出占比统计")
    public Result<StatDTO.ExportStat> statOfExport(StatRequest param) {
        return Result.ok(statService.statOfExport(param));
    }
}
