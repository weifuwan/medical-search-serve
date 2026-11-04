package com.jiayuan.modules.searchv2.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.search.service.SearchService;
import com.jiayuan.modules.searchv2.modal.SearchVo;
import com.jiayuan.modules.searchv2.service.SearchServiceV2;
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
 * @Author: 魏福万
 * @Date: 创建时间 2025-02-27
 */
@RestController
@RequestMapping("index")
@Api(tags = "检索处理器version2")
public class SearchV2Controller {
    @Resource
    private SearchServiceV2 searchServiceV2;


    @PostMapping("search-v2")
    @ApiOperation("检索")
    @LogOperation("检索")
    public Result<SearchVo> searchV2(@RequestBody SearchRequest request) {
        ValidatorUtils.validateEntity(request);
        return Result.ok(searchServiceV2.search(request));
    }


}