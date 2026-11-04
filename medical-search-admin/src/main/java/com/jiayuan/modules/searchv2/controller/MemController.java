package com.jiayuan.modules.searchv2.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.searchv2.cache.MysqlMetaCache;
import com.jiayuan.modules.searchv2.component.TableFieldInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Map;


/**
 * @Title: SearchController
 * @Package: com.jiayuan.modules.search.controller
 * @Description: 缓存
 * @Author: 魏福万
 * @Date: 创建时间 2025-02-27
 */
@RestController
@RequestMapping("cache")
@Api(tags = "检索处理器v2")
public class MemController {
    @Resource
    private MysqlMetaCache mysqlMetaCache;


    @GetMapping("cache1")
    @ApiOperation("缓存1")
    @LogOperation("缓存1")
    public Result<Map<String, TableFieldInfo>> cache1(@RequestParam(value = "indexName", required = false) String indexName) {
        return Result.ok(mysqlMetaCache.getCache(indexName));
    }

    @GetMapping("cache2")
    @ApiOperation("缓存2")
    @LogOperation("缓存2")
    public Result<Map<String, TableFieldInfo>> cache2(@RequestParam(value = "indexName", required = false) String indexName) {
        return Result.ok(mysqlMetaCache.getCacheEnToChi(indexName));
    }
}