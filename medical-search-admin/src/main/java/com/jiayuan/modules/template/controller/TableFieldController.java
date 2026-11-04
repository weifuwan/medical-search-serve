package com.jiayuan.modules.template.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.ExcelUtils;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.modules.searchv2.cache.MysqlMetaCache;
import com.jiayuan.modules.template.dto.TableFieldDTO;
import com.jiayuan.modules.template.excel.FieldExcel;
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
 * @Title: TableFieldController
 * @Package: com.jiayuan.modules.template.controller
 * @Description: 字段管理
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-25
 */
@RestController
@RequestMapping("field")
@Api(tags = "字段管理")
@RequiredArgsConstructor
public class TableFieldController {
    private final TableFieldService tableFieldService;

//    private final MysqlMetaCache mysqlMetaCache;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<TableFieldDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<TableFieldDTO> page = tableFieldService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("信息")
    public Result<TableFieldDTO> get(@PathVariable("id") Long id) {
        TableFieldDTO data = tableFieldService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("保存字段")
    @LogOperation("保存字段")
    public Result save(@RequestBody TableFieldDTO dto) {
        tableFieldService.saveTableField(dto);
        return Result.ok();
    }

    @PutMapping
    @ApiOperation("修改字段")
    @LogOperation("修改字段")
    public Result update(@RequestBody TableFieldDTO dto) {
        tableFieldService.updateTableField(dto);
        return Result.ok();
    }

    @PutMapping("/switch")
    @ApiOperation("切换展示")
    @LogOperation("切换展示")
    public Result switchFieldsStatus(@RequestBody TableFieldDTO dto) {
        tableFieldService.switchFieldsStatus(dto);
        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("删除字段")
    @LogOperation("删除字段")
    public Result delete(@RequestBody Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        tableFieldService.delete(ids);

        return Result.ok();
    }

    @GetMapping("export")
    @ApiOperation("导出字段")
    @LogOperation("导出字段")
    public void export(@ApiIgnore @RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
        List<TableFieldDTO> list = tableFieldService.list(params);

        ExcelUtils.exportExcelToTarget(response, null, list, FieldExcel.class);
    }


    @GetMapping("getFieldList")
    @ApiOperation("获取字段列表")
    public Result<List<TableFieldDTO>> getFieldList(@RequestParam(value = "tableId", required = false) Long tableId,
                                                    @RequestParam(value = "fieldName", required = false) String fieldName) throws Exception {
        return Result.ok(tableFieldService.getFieldList(tableId, fieldName));
    }

}