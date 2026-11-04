
package com.jiayuan.modules.sys.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.ExcelUtils;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.sys.dto.SysParamsDTO;
import com.jiayuan.modules.sys.entity.HospitalConfigEntity;
import com.jiayuan.modules.sys.entity.SysParamsEntity;
import com.jiayuan.modules.sys.excel.SysParamsExcel;
import com.jiayuan.modules.sys.request.HospitalRequest;
import com.jiayuan.modules.sys.service.SysParamsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


/**
 * @Title: SysParamsController
 * @Package: com.jiayuan.modules.sys.controller
 * @Description: 参数管理
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-21
 */
@RestController
@RequestMapping("sys/params")
@Api(tags = "参数管理")
public class SysParamsController {
    @Resource
    private SysParamsService sysParamsService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "paramCode", value = "参数编码", paramType = "query", dataType = "String")
    })
    public Result<PageData<SysParamsDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<SysParamsDTO> page = sysParamsService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<SysParamsDTO> get(@PathVariable("id") Long id) {
        SysParamsDTO data = sysParamsService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperation("保存")
    public Result save(@RequestBody SysParamsDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);

        sysParamsService.save(dto);

        return Result.ok();
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperation("修改")
    public Result update(@RequestBody SysParamsDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);

        sysParamsService.update(dto);

        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @LogOperation("删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        sysParamsService.delete(ids);

        return Result.ok();
    }

    @GetMapping("export")
    @ApiOperation("导出")
    @LogOperation("导出")
    @ApiImplicitParam(name = "paramCode", value = "参数编码", paramType = "query", dataType = "String")
    public void export(@ApiIgnore @RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
        List<SysParamsDTO> list = sysParamsService.list(params);

        ExcelUtils.exportExcelToTarget(response, null, list, SysParamsExcel.class);
    }


    @ApiOperation(value = "医院参数配置")
    @LogOperation("医院参数配置")
    @PostMapping("/saveHospitalConfig")
    public Result<String> saveHospitalConfig(HospitalRequest request, HttpServletRequest servletRequest) {
        sysParamsService.saveHospitalConfig(request, servletRequest);
        return Result.ok("保存成功");
    }

    @ApiOperation(value = "获取医院配置接口")
    @GetMapping("/getHospitalConfig")
    public Result<HospitalConfigEntity> getHospitalConfig() {
        return Result.ok(sysParamsService.getHospitalConfig());
    }

}