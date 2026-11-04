
package com.jiayuan.modules.log.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.ExcelUtils;
import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.log.dto.SysLogOperationDTO;
import com.jiayuan.modules.log.excel.SysLogOperationExcel;
import com.jiayuan.modules.log.service.SysLogOperationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;


/**
 * 操作日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
@RestController
@RequestMapping("sys/log/operation")
@Api(tags = "操作日志")
public class SysLogOperationController {
    @Autowired
    private SysLogOperationService sysLogOperationService;

    @GetMapping("page")
    @ApiOperation("分页")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "status", value = "状态  0：失败    1：成功", paramType = "query", dataType = "int"),
            @ApiImplicitParam(name = Constant.START_DATE, value = "开始时间(yyyy-MM-dd)", paramType = "query", dataType = "String", format = "yyyy-mm-dd"),
            @ApiImplicitParam(name = Constant.END_DATE, value = "结束时间(yyyy-MM-dd)", paramType = "query", dataType = "String", format = "yyyy-mm-dd")
    })
    public Result<PageData<SysLogOperationDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<SysLogOperationDTO> page = sysLogOperationService.page(params);

        return Result.ok(page);
    }

    @GetMapping("export")
    @ApiOperation("导出")
    @LogOperation("导出")
    public void export(@ApiIgnore @RequestParam Map<String, Object> params, HttpServletResponse response) throws Exception {
        List<SysLogOperationDTO> list = sysLogOperationService.list(params);

        ExcelUtils.exportExcelToTarget(response, null, list, SysLogOperationExcel.class);
    }

}