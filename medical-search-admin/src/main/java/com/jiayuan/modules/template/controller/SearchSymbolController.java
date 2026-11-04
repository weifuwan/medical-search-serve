package com.jiayuan.modules.template.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.modules.template.dto.SearchSymbolDTO;
import com.jiayuan.modules.template.entity.SearchSymbolEntity;
import com.jiayuan.modules.template.service.SearchSymbolService;
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
 * @Title: com.jiayuan.modules.template.controller
 * @Package: SearchSymbolController
 * @Description: 检索符号处理器
 * @Author: 李建奎
 * @Date: 创建时间 2025/4/16
 */
@RestController
@RequestMapping("searchSymbol")
@Api(tags = "检索符号")
@RequiredArgsConstructor
public class SearchSymbolController {

    private final SearchSymbolService searchSymbolService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<SearchSymbolDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<SearchSymbolDTO> page = searchSymbolService.page(params);
        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<SearchSymbolDTO> get(@PathVariable("id") Long id) {
        SearchSymbolDTO data = searchSymbolService.get(id);
        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存检索符号")
    @LogOperation("保存检索符号")
    public Result save(@RequestBody SearchSymbolDTO dto) {
        searchSymbolService.save(dto);
        return Result.ok();
    }

    @PutMapping
    @ApiOperation("修改检索符号")
    @LogOperation("修改检索符号")
    public Result update(@RequestBody SearchSymbolDTO dto) {
        searchSymbolService.update(dto);
        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("删除检索符号")
    @LogOperation("删除检索符号")
    public Result delete(@RequestBody Long[] ids) {
        AssertUtils.isArrayEmpty(ids, "id");
        searchSymbolService.delete(ids);
        return Result.ok();
    }

    @GetMapping("findList")
    @ApiOperation("获取检索符号列表")
    public Result<List<SearchSymbolDTO>> findList() {
        return Result.ok(
                searchSymbolService.list(
                        Wrappers.<SearchSymbolEntity>lambdaQuery()
                                .eq(SearchSymbolEntity::getIsDeleted, 0)
                                .orderByAsc(SearchSymbolEntity::getSort)
                                .orderByAsc(SearchSymbolEntity::getId)
                )
        );
    }
}