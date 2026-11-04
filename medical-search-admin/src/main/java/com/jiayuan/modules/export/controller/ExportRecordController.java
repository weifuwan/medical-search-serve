package com.jiayuan.modules.export.controller;

import com.jiayuan.common.annotation.ExportOperation;
import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.constant.ExportConstant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.export.dto.ExportRecordDTO;
import com.jiayuan.modules.export.service.ExportRecordService;
import com.jiayuan.modules.export.service.ExportSearchResultService;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
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
import java.util.Map;
import java.util.Objects;


/**
 * 数据导出记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@RestController
@RequestMapping("export/exportrecord")
@Api(tags = "数据导出记录")
public class ExportRecordController {
    @Autowired
    private ExportRecordService exportRecordService;
    @Autowired
    private ExportSearchResultService exportSearchResultService;

    @GetMapping("page")
    @ApiOperation("分页检索")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "searchName", value = "导出数据名称", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "createUserName", value = "导出人", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "startTime", value = "开始时间(yyyy-MM-dd)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "endTime", value = "结束时间(yyyy-MM-dd)", paramType = "query", dataType = "String")
    })
    public Result<PageData<ExportRecordDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<ExportRecordDTO> page = exportRecordService.page(params);

        return Result.ok(page);
    }

    @GetMapping("info")
    @ApiOperation("查看")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = "id", value = "主键ID", paramType = "query", dataType = "Long", required = true)
    })
    public Result<EsPageData> get(@ApiIgnore @RequestParam Map<String, Object> params) {
        int curPage = 0;
        int limit = 10;

        if (params.get(Constant.PAGE) != null) {
            curPage = Integer.parseInt((String) params.get(Constant.PAGE));
        }
        if (params.get(Constant.LIMIT) != null) {
            limit = Integer.parseInt((String) params.get(Constant.LIMIT));
        }

        Long id = Long.parseLong((String) params.get("id"));

        ExportRecordDTO exportRecordDTO = exportRecordService.get(id);
        SearchRequest searchRequest = query(exportRecordDTO, curPage, limit);

        EsPageData esPageData = exportSearchResultService.search(searchRequest);

        return Result.ok(esPageData);
    }

    @Deprecated
    @GetMapping("export")
    @ApiOperation("再次导出")
    @LogOperation("再次导出")
    @ExportOperation()
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "导出记录主键ID", paramType = "query", required = true, dataType = "int")
    })
    public void export(@RequestParam Long id, HttpServletResponse response) {
        ExportRecordDTO exportRecordDTO = exportRecordService.get(id);
        SearchRequest searchRequest = query(exportRecordDTO, ExportConstant.MIN_PAGE, ExportConstant.MAX_SIZE);
        EsPageData esPageData = exportSearchResultService.search(searchRequest);

//        exportSearchResultService.export(response, exportRecordDTO.getSearchName(), esPageData, searchRequest);
    }

    private SearchRequest query(ExportRecordDTO exportRecordDTO, Integer page, Integer size) {
        SearchRequest searchRequest = null;
        // 高级导出
        if (Objects.nonNull(exportRecordDTO.getExportType()) && exportRecordDTO.getExportType().equals(BizConstant.ExportType.HIGH.getCode())) {
            searchRequest = exportSearchResultService.buildSeniorParam(
                    exportRecordDTO.getExpression(),
                    exportRecordDTO.getDimension(),
                    exportRecordDTO.getOrderTableCode(),
                    exportRecordDTO.getOrderFieldCode(),
                    exportRecordDTO.getOrderMode(),
                    page,
                    size,
                    exportSearchResultService.querySeniorColumnList(exportRecordDTO.getId()),
                    exportRecordDTO.getId()
            );
        } else {
            //基本导出
            searchRequest = SearchRequest.builder()
                    .expression(exportRecordDTO.getExpression())
                    .dimension(exportRecordDTO.getDimension())
                    .orderTableCode(exportRecordDTO.getOrderTableCode())
                    .orderFieldCode(exportRecordDTO.getOrderFieldCode())
                    .orderMode(exportRecordDTO.getOrderMode())
                    .page(page)
                    .size(size)
                    .build();
        }

        return searchRequest;
    }
}