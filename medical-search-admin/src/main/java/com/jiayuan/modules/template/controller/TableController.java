package com.jiayuan.modules.template.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.modules.template.dto.TableClassifyDTO;
import com.jiayuan.modules.template.dto.TableDTO;
import com.jiayuan.modules.template.request.MetaSearchRequest;
import com.jiayuan.modules.template.service.TableClassifyService;
import com.jiayuan.modules.template.service.TableService;
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
 * @Title: TableController
 * @Package: com.jiayuan.modules.template.controller
 * @Description: 表结构管理
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-25
 */
@RestController
@RequestMapping("table")
@Api(tags = "表管理")
@RequiredArgsConstructor
public class TableController {
    private final TableService tableService;
    private final TableClassifyService tableClassifyService;

    @GetMapping("pageClassify")
    @ApiOperation("表分类分页查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<TableClassifyDTO>> pageClassify(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<TableClassifyDTO> page = tableClassifyService.page(params);
        return Result.ok(page);
    }

    @GetMapping("page")
    @ApiOperation("表分页查询")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "tableName", value = "表名称", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "classifyId", value = "表分类ID", paramType = "query", dataType = "Long"),
    })
    public Result<PageData<TableDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<TableDTO> page = tableService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<TableDTO> get(@PathVariable("id") Long id) {
        TableDTO data = tableService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("表保存")
    @LogOperation("表保存")
    public Result save(@RequestBody TableDTO dto) {
        tableService.saveTable(dto);
        return Result.ok();
    }

    @PutMapping
    @ApiOperation("表修改")
    @LogOperation("表修改")
    public Result update(@RequestBody TableDTO dto) {
        tableService.updateTable(dto);
        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("表删除")
    @LogOperation("表删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        tableService.delete(ids);

        return Result.ok();
    }


    @GetMapping("getTableList")
    @ApiOperation("获取表集合")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "tableName", value = "表中文名称", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "classifyId", value = "表分类ID", paramType = "query", dataType = "Long"),
            @ApiImplicitParam(name = "include", value = "是否包含字段(true/false)", paramType = "query", dataType = "boolean"),
    })
    public Result<List<TableDTO>> getTableList(String tableName, boolean include, Long classifyId) {
        return Result.ok(tableService.getTableList(tableName, include, classifyId));
    }

    @GetMapping("getTableInfo")
    @ApiOperation("获取表结构信息")
    public Result<List<TableDTO>> getTableInfo(MetaSearchRequest request) {
        return Result.ok(tableService.getTableInfo(request));
    }

    @PutMapping("updateDisplayStatus")
    @ApiOperation("更新表显示状态")
    @LogOperation("更新表显示状态")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "tableId", value = "表ID", paramType = "query", required = true, dataType = "Long"),
            @ApiImplicitParam(name = "isShow", value = "是否显示", paramType = "query", required = true, dataType = "Boolean")
    })
    public Result updateDisplayStatus(@RequestParam Long tableId, @RequestParam Boolean isShow) {
        tableService.updateDisplayStatus(tableId, isShow);
        return Result.ok();
    }
}