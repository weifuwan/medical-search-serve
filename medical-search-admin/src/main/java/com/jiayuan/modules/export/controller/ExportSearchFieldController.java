package com.jiayuan.modules.export.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.export.dto.ExportSearchFieldDTO;
import com.jiayuan.modules.export.service.ExportSearchFieldService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Map;


/**
 * 数据保存显示字段
 *
 * @author lijiankui
 * @since 1.0.0 2024-10-08
 */
@RestController
@RequestMapping("export/searchField")
@Api(tags = "数据保存显示字段")
public class ExportSearchFieldController {
    @Autowired
    private ExportSearchFieldService exportSearchFieldService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<ExportSearchFieldDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<ExportSearchFieldDTO> page = exportSearchFieldService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<ExportSearchFieldDTO> get(@PathVariable("id") Long id) {
        ExportSearchFieldDTO data = exportSearchFieldService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperation("保存")
    public Result save(@RequestBody ExportSearchFieldDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);

        exportSearchFieldService.save(dto);

        return Result.ok();
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperation("修改")
    public Result update(@RequestBody ExportSearchFieldDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);

        exportSearchFieldService.update(dto);

        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @LogOperation("删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        exportSearchFieldService.delete(ids);

        return Result.ok();
    }


}