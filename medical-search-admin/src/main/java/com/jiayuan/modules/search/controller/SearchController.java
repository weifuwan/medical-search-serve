package com.jiayuan.modules.search.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.search.service.SearchService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;


/**
 * @Title: SearchController
 * @Package: com.jiayuan.modules.search.controller
 * @Description: 检索处理器
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-17
 */
@RestController
@RequestMapping("index")
@Api(tags = "检索处理器")
public class SearchController {
    @Resource
    private SearchService searchService;


    @PostMapping("search")
    @ApiOperation("检索")
    @LogOperation("检索")
    public Result<EsPageData> search(@RequestBody SearchRequest request) {
        ValidatorUtils.validateEntity(request);
        return Result.ok(searchService.search(request));
    }


}