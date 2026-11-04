package com.jiayuan.modules.template.controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.ExcelUtils;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.modules.template.dto.TableClassifyDTO;
import com.jiayuan.modules.template.dto.TableFieldDTO;
import com.jiayuan.modules.template.excel.FieldExcel;
import com.jiayuan.modules.template.service.TableClassifyService;
import com.jiayuan.modules.template.service.TableFieldService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


/**
 * @Title: com.jiayuan.modules.template.controller
 * @Package: TableClassifyController
 * @Description: 表分类处理器
 * @Author: 李建奎
 * @Date: 创建时间 2025/4/16
 */
@RestController
@RequestMapping("classify")
@Api(tags = "表分类")
@RequiredArgsConstructor
public class TableClassifyController {
    private final TableClassifyService tableClassifyService;


    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序分类", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<TableClassifyDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<TableClassifyDTO> page = tableClassifyService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<TableClassifyDTO> get(@PathVariable("id") Long id) {
        TableClassifyDTO data = tableClassifyService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存分类")
    @LogOperation("保存分类")
    public Result save(@RequestBody TableClassifyDTO dto) {
        tableClassifyService.save(dto);
        return Result.ok();
    }

    @PutMapping
    @ApiOperation("修改分类")
    @LogOperation("修改分类")
    public Result update(@RequestBody TableClassifyDTO dto) {
        tableClassifyService.update(dto);
        return Result.ok();
    }


    @DeleteMapping
    @ApiOperation("删除分类")
    @LogOperation("删除分类")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        tableClassifyService.delete(ids);
        return Result.ok();
    }


    @GetMapping("findList")
    @ApiOperation("获取分类列表")
    public Result<List<TableClassifyDTO>> getFieldList() throws Exception {
        return Result.ok(tableClassifyService.list(Wrappers.emptyWrapper()));
    }

}