
package com.jiayuan.modules.sys.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.sys.dto.SysDictDataDTO;
import com.jiayuan.modules.sys.service.SysDictDataService;
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
 * 字典数据
 *
 * @author lijiankui
 */
@RestController
@RequestMapping("sys/dict/data")
@Api(tags = "字典数据")
public class SysDictDataController {
    @Autowired
    private SysDictDataService sysDictDataService;

    @GetMapping("page")
    @ApiOperation("字典数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "dictLabel", value = "字典标签", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "dictValue", value = "字典值", paramType = "query", dataType = "String")
    })
    public Result<PageData<SysDictDataDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        //字典类型
        PageData<SysDictDataDTO> page = sysDictDataService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<SysDictDataDTO> get(@PathVariable("id") Long id) {
        SysDictDataDTO data = sysDictDataService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperation("保存")
    public Result save(@RequestBody SysDictDataDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, DefaultGroup.class);

        sysDictDataService.save(dto);

        return Result.ok();
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperation("修改")
    public Result update(@RequestBody SysDictDataDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);

        sysDictDataService.update(dto);

        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @LogOperation("删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        sysDictDataService.delete(ids);

        return Result.ok();
    }

    @GetMapping("findListByType")
    @ApiOperation("字典列表查询")
    public Result<List<SysDictDataDTO>> findListByType(String type) {
        List<SysDictDataDTO> list = sysDictDataService.findListByType(type);
        return Result.ok(list);
    }

    @PostMapping("findListByBatchType")
    @ApiOperation("字典列表批量查询（空就是查询全部）")
    public Result<Map<String, List<SysDictDataDTO>>> findListByBatchType(@RequestBody ValidList<String> typeList) {
        Map<String, List<SysDictDataDTO>> map = sysDictDataService.findListByBatchType(typeList);
        return Result.ok(map);
    }



}