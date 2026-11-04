package com.jiayuan.modules.search.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.modules.search.dto.KeywordConfigDTO;
import com.jiayuan.modules.search.service.KeywordConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;
import java.util.Map;


/**
 * 关键字检索配置
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@RestController
@RequestMapping("search/keywordConfig")
@Api(tags = "关键字检索配置")
@RequiredArgsConstructor
public class KeywordConfigController {

    private final KeywordConfigService keywordConfigService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<KeywordConfigDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<KeywordConfigDTO> page = keywordConfigService.page(params);
        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<KeywordConfigDTO> get(@PathVariable("id") Long id) {
        KeywordConfigDTO data = keywordConfigService.get(id);
        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("默认检索配置保存")
    @LogOperation("默认检索配置保存")
    public Result save(@RequestBody KeywordConfigDTO dto) {
        keywordConfigService.saveKeywordConfig(dto);
        return Result.ok();
    }

    @PutMapping
    @ApiOperation("默认检索配置修改")
    @LogOperation("默认检索配置修改")
    public Result update(@RequestBody KeywordConfigDTO dto) {
        keywordConfigService.updateKeywordConfig(dto);
        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("默认检索配置删除")
    @LogOperation("默认检索配置删除")
    public Result delete(@RequestBody Long[] ids) {
        keywordConfigService.deleteKeywordConfig(ids);
        return Result.ok();
    }



    @GetMapping("list")
    @ApiOperation("默认检索字段列表")
    public Result<List<KeywordConfigDTO>> getDefaultSearchFieldList() {
        List<KeywordConfigDTO> list = keywordConfigService.getDefaultSearchFieldList();
        return Result.ok(list);
    }

    @GetMapping("reset")
    @ApiOperation("默认检索项重置")
    public Result defaultSearchItemReset() {
        keywordConfigService.defaultSearchItemReset();
        return Result.ok();
    }

    @PostMapping("saveBatch")
    @ApiOperation("默认检索配置批量保存")
    @LogOperation("默认检索配置批量保存")
    public Result saveBatch(@RequestBody ValidList<KeywordConfigDTO> list) {
        keywordConfigService.saveBatch(list);
        return Result.ok();
    }
}