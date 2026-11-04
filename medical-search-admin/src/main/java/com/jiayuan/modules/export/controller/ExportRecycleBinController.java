package com.jiayuan.modules.export.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.modules.export.dto.ExportRecycleBinDTO;
import com.jiayuan.modules.export.service.ExportRecycleBinService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.Map;


/**
 * 数据检索保存记录回收站
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@RestController
@RequestMapping("export/exportrecyclebin")
@Api(tags = "数据检索保存记录回收站")
@RequiredArgsConstructor
public class ExportRecycleBinController {
    private final ExportRecycleBinService exportRecycleBinService;

    @GetMapping("page")
    @ApiOperation("分页检索")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String")
    })
    public Result<PageData<ExportRecycleBinDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<ExportRecycleBinDTO> page = exportRecycleBinService.page(params);

        // 清空过期记录
        exportRecycleBinService.clear();

        return Result.ok(page);
    }

    @PostMapping("/revoke")
    @ApiOperation("撤销")
    @LogOperation("撤销")
    public Result revoke(@RequestBody Long[] ids) throws Exception {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        exportRecycleBinService.revoke(ids);

        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("删除")
    @LogOperation("删除")
    public Result delete(@RequestBody Long[] ids) throws Exception {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        exportRecycleBinService.deletedLogicallyBatchIds(ids);

        return Result.ok();
    }

}