
package com.jiayuan.modules.sys.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.sys.dto.SysDictTypeDTO;
import com.jiayuan.modules.sys.entity.DictType;
import com.jiayuan.modules.sys.service.SysDictTypeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;
import java.util.Map;

/**
 * 字典类型
 *
 * @author lijiankui
 */
@RestController
@RequestMapping("sys/dict/type")
@Api(tags = "字典类型")
public class SysDictTypeController {
    @Autowired
    private SysDictTypeService sysDictTypeService;

    @GetMapping("page")
    @ApiOperation("字典类型")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "dictType", value = "字典类型", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "dictName", value = "字典名称", paramType = "query", dataType = "String")
    })
    public Result<PageData<SysDictTypeDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        //字典类型
        PageData<SysDictTypeDTO> page = sysDictTypeService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<SysDictTypeDTO> get(@PathVariable("id") Long id) {
        SysDictTypeDTO data = sysDictTypeService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperation("保存")
    public Result save(@RequestBody SysDictTypeDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, DefaultGroup.class);

        sysDictTypeService.save(dto);

        return Result.ok("");
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperation("修改")
    public Result update(@RequestBody SysDictTypeDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);

        sysDictTypeService.update(dto);

        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @LogOperation("删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        sysDictTypeService.delete(ids);

        return Result.ok();
    }

    @GetMapping("all")
    @ApiOperation("所有字典数据")
    public Result<List<DictType>> all() {
        List<DictType> list = sysDictTypeService.getAllList();

        return Result.ok(list);
    }

}