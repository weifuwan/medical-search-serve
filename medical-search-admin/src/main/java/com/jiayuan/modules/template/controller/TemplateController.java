package com.jiayuan.modules.template.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.ExcelUtils;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.modules.template.dto.TemplateDTO;
import com.jiayuan.modules.template.excel.TemplateExcel;
import com.jiayuan.modules.template.service.TemplateService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


/**
 * @Title: TemplateController
 * @Package: com.jiayuan.modules.template.controller
 * @Description: 模板管理
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-16
 */
@RestController
@RequestMapping("template/template")
@Api(tags = "模板管理")
public class TemplateController {
    @Resource
    private TemplateService templateService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.START_DATE, value = "开始时间(yyyy-MM-dd)", paramType = "query", dataType = "String", format = "yyyy-mm-dd"),
            @ApiImplicitParam(name = Constant.END_DATE, value = "结束时间(yyyy-MM-dd)", paramType = "query", dataType = "String", format = "yyyy-mm-dd"),
            @ApiImplicitParam(name = "useScope", value = "使用范围：0-全院，1-个人", paramType = "query", dataType = "String"),
    })
    public Result<PageData<TemplateDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        return Result.ok(templateService.getPageInfo(params));
    }

    @GetMapping("{id}")
    @ApiOperation("获取模板信息")
    public Result<TemplateDTO> get(@PathVariable("id") Long id) {
        TemplateDTO data = templateService.getById(id);

        return Result.ok(data);
    }

    @PostMapping("saveOrUpdate")
    @ApiOperation("模板保存或更新")
    @LogOperation("模板保存或更新")
    public Result saveOrUpdate(@RequestBody TemplateDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        templateService.saveOrUpdateTemplate(dto);

        return Result.ok();
    }


    @DeleteMapping
    @ApiOperation("模板删除")
    @LogOperation("模板删除")
    public Result delete(@RequestBody Long[] ids) throws Exception {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        templateService.deletedLogicallyBatchIds(ids);

        return Result.ok();
    }

    @GetMapping("export")
    @ApiOperation("导出")
    public void export(@ApiIgnore @RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
        List<TemplateDTO> list = templateService.list(params);

        ExcelUtils.exportExcelToTarget(response, null, list, TemplateExcel.class);
    }


    @GetMapping("list")
    @ApiOperation("获取模板列表")
    public Result<List<TemplateDTO>> list() {
        return Result.ok(templateService.selectList());
    }

    @PostMapping("preview")
    @ApiOperation("模板预览")
    public Result preview(@RequestBody TemplateDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        return Result.ok(templateService.preview(dto));
    }
}