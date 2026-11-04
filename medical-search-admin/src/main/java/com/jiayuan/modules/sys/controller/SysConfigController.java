package com.jiayuan.modules.sys.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.dto.KeyValue;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.sys.dto.SysConfigDTO;
import com.jiayuan.modules.sys.entity.SysConfigEntity;
import com.jiayuan.modules.sys.service.SysConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;


/**
 * 系统配置表
 *
 * @author lijiankui
 * @since 1.0.0 2023-11-22
 */
@RestController
@RequestMapping("sys/config")
@Api(tags = "系统配置表")
@RequiredArgsConstructor
public class SysConfigController {
    private final SysConfigService sysConfigService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<SysConfigDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<SysConfigDTO> page = sysConfigService.page(params);
        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<SysConfigDTO> get(@PathVariable("id") Long id) {
        SysConfigDTO data = sysConfigService.get(id);
        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("系统配置保存")
    @LogOperation("系统配置保存")
    public Result save(@RequestBody SysConfigDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        sysConfigService.save(dto);
        return Result.ok();
    }

    @PutMapping
    @ApiOperation("系统配置修改")
    @LogOperation("系统配置修改")
    public Result update(@RequestBody SysConfigDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        sysConfigService.update(dto);
        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("系统配置删除")
    @LogOperation("系统配置删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        sysConfigService.delete(ids);
        return Result.ok();
    }


    @GetMapping("findList")
    @ApiOperation("获取系统配置(List集合)")
    public Result<List<SysConfigDTO>> findList() {
        List<SysConfigDTO> data = sysConfigService.findList();
        return Result.ok(data);
    }

    @GetMapping("getSysConfig")
    @ApiOperation("获取系统配置(map结构)")
    public Result<Map<String, SysConfigDTO>> getSysConfig() {
        List<SysConfigDTO> list = sysConfigService.findList();
        Map<String, SysConfigDTO> data = list.stream().collect(Collectors.toMap(SysConfigDTO::getConfigCode, Function.identity()));
        return Result.ok(data);
    }

    @GetMapping("getByKey")
    @ApiOperation("获取单个配置")
    public Result<SysConfigDTO> getByKey(String configCode) {
        AssertUtils.isBlank(configCode, "configCode");
        SysConfigDTO dto = sysConfigService.selectOne(Wrappers.<SysConfigEntity>lambdaQuery()
                .eq(SysConfigEntity::getConfigCode, configCode));
        return Result.ok(dto);
    }

    @PostMapping("updateByConfigCode")
    @ApiOperation("更新系统设置")
    @LogOperation("更新系统设置")
    public Result updateByConfigCode(@RequestBody ValidList<KeyValue> configList) {
        sysConfigService.updateByConfigCode(configList);
        return Result.ok();
    }

}