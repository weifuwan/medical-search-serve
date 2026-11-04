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
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.template.dto.TemplateFieldDTO;
import com.jiayuan.modules.template.excel.TemplateFieldExcel;
import com.jiayuan.modules.template.service.TemplateFieldService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


/**
 * 模板和字段的映射关系
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Deprecated
@RestController
@RequestMapping("template/templatefield")
@Api(tags = "模板和字段的映射关系")
public class TemplateFieldController {
    @Autowired
    private TemplateFieldService templateFieldService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<TemplateFieldDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<TemplateFieldDTO> page = templateFieldService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<TemplateFieldDTO> get(@PathVariable("id") Long id) {
        TemplateFieldDTO data = templateFieldService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存")
    @LogOperation("保存")
    public Result save(@RequestBody TemplateFieldDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);

        templateFieldService.save(dto);

        return Result.ok();
    }

    @PutMapping
    @ApiOperation("修改")
    @LogOperation("修改")
    public Result update(@RequestBody TemplateFieldDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);

        templateFieldService.update(dto);

        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @LogOperation("删除")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        templateFieldService.delete(ids);

        return Result.ok();
    }

    @GetMapping("export")
    @ApiOperation("导出")
    @LogOperation("导出")
    public void export(@ApiIgnore @RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
        List<TemplateFieldDTO> list = templateFieldService.list(params);

        ExcelUtils.exportExcelToTarget(response, null, list, TemplateFieldExcel.class);
    }

}