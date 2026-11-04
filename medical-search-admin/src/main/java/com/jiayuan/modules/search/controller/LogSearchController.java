package com.jiayuan.modules.search.controller;

import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.search.dto.LogSearchDTO;
import com.jiayuan.modules.search.service.LogSearchService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * @Title: LogSearchController
 * @Package: com.jiayuan.modules.search.controller
 * @Description: 检索日志处理器
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-17
 */
@RestController
@RequestMapping("log/logsearch")
@Api(tags = "检索日志")
public class LogSearchController {
    @Resource
    private LogSearchService logSearchService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<LogSearchDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<LogSearchDTO> page = logSearchService.page(params);

        return Result.ok(page);
    }


    /**
     * 检索历史
     *
     * @param top
     * @return
     */
    @GetMapping("listOfHistorySearch")
    @ApiOperation("检索历史")
    public Result<List<LogSearchDTO>> listOfHistorySearch(@RequestParam("top") Integer top) {
        return Result.ok(logSearchService.listOfHistorySearch(top));
    }

    /**
     * 热门信息检索
     *
     * @param top
     * @return
     */
    @GetMapping("listOfPopularSearch")
    @ApiOperation("热门信息检索")
    public Result<List<LogSearchDTO>> listOfPopularSearch(@RequestParam("top") Integer top) {
        return Result.ok(logSearchService.listOfPopularSearch(top));
    }

}