package com.jiayuan.modules.search.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.modules.search.dto.ResultFieldDTO;
import com.jiayuan.modules.search.dto.SortDTO;
import com.jiayuan.modules.search.service.ResultFieldService;
import com.jiayuan.modules.template.dto.FieldDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * @Title: ResultFieldController
 * @Package: com.jiayuan.modules.search.controller
 * @Description: 返回结果表头
 * @Author: 李建奎
 * @Date: 创建时间 2023-01-05
 */
@RestController
@RequestMapping("search/resultfield")
@Api(tags = "返回结果表头")
@RequiredArgsConstructor
public class ResultFieldController {
    private final ResultFieldService resultFieldService;

    @GetMapping("getUserShowFieldList")
    @ApiOperation("获取用户显示字段列表")
    public Result<List<FieldDTO>> getUserShowFieldList() {
        return Result.ok(resultFieldService.getUserShowFieldList());
    }

    @GetMapping("getDefaultShowFieldList")
    @ApiOperation("获取默认显示字段列表")
    public Result<List<FieldDTO>> getDefaultShowFieldList() {
        return Result.ok(resultFieldService.getDefaultShowFieldList());
    }


    @PostMapping("userShowFieldBatchSave")
    @ApiOperation("用户显示字段批量配置")
    @LogOperation("用户显示字段批量配置")
    public Result userShowFieldBatchSave(@RequestBody ValidList<ResultFieldDTO> list) {
        resultFieldService.userShowFieldBatchSave(list);
        return Result.ok();
    }

    @PostMapping("defaultShowFieldBatchSave")
    @ApiOperation("默认显示字段批量配置")
    @LogOperation("默认显示字段批量配置")
    public Result defaultShowFieldBatchSave(@RequestBody ValidList<ResultFieldDTO> list) {
        resultFieldService.defaultShowFieldBatchSave(list);
        return Result.ok();
    }

    @Deprecated
    @PostMapping("saveBatch")
    @ApiOperation("用户展示字段批量保存")
    @LogOperation("用户展示字段批量保存")
    public Result saveBatch(@RequestBody ValidList<ResultFieldDTO> list) {
        resultFieldService.userShowFieldBatchSave(list);
        return Result.ok();
    }

    @PutMapping
    @ApiOperation("结果表头修改")
    @LogOperation("结果表头修改")
    public Result update(@RequestBody ResultFieldDTO dto) {
        resultFieldService.updateResultField(dto);
        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("结果表头删除")
    @LogOperation("结果表头删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        resultFieldService.delete(ids);
        return Result.ok();
    }


    @GetMapping("reset")
    @ApiOperation("显示表头重置")
    public Result defaultTitleReset() {
        resultFieldService.defaultTitleReset();
        return Result.ok();
    }

    @PostMapping("sort")
    @ApiOperation("排序")
    @LogOperation("排序")
    public Result sort(@RequestBody ValidList<SortDTO> list) {
        resultFieldService.sort(list);
        return Result.ok();
    }




    @Deprecated
    @GetMapping("getDefaultFieldList")
    @ApiOperation("获取默认显示字段列表")
    public Result<List<FieldDTO>> getDefaultFieldList() {
        return Result.ok(resultFieldService.getUserShowFieldList());
    }
}