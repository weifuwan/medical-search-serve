package com.jiayuan.modules.export.controller;

import cn.hutool.core.util.StrUtil;
import com.jiayuan.common.annotation.ExportOperation;
import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.constant.ExportConstant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.utils.file.FileUploadUtils;
import com.jiayuan.common.utils.file.FileUtils;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.modules.export.dto.*;
import com.jiayuan.modules.export.service.ExportRecordService;
import com.jiayuan.modules.export.service.ExportRecycleBinService;
import com.jiayuan.modules.export.service.ExportSearchResultService;
import com.jiayuan.modules.export.service.TableFieldContentService;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.template.dto.FieldDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.nio.file.FileSystems;
import java.util.Map;
import java.util.Set;


/**
 * 数据检索保存记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@RestController
@RequestMapping("export/exportsearchresult")
@Api(tags = "数据检索保存记录")
@Slf4j
@RequiredArgsConstructor
public class ExportSearchResultController {
    private final ExportSearchResultService exportSearchResultService;
    private final ExportRecycleBinService exportRecycleBinService;
    private final ExportRecordService exportRecordService;
    private final TableFieldContentService tableFieldContentService;


    @GetMapping("page")
    @ApiOperation("分页检索")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "name", value = "数据保存名称", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "startTime", value = "开始时间(yyyy-MM-dd)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "endTime", value = "结束时间(yyyy-MM-dd)", paramType = "query", dataType = "String")
    })
    public Result<PageData<ExportSearchResultDTO>> page(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<ExportSearchResultDTO> page = exportSearchResultService.page(params);

        return Result.ok(page);
    }

    @GetMapping("pageFieldContent")
    @ApiOperation("查询选择字段内容列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = Constant.PAGE, value = "当前页码，从1开始", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.LIMIT, value = "每页显示记录数", paramType = "query", required = true, dataType = "int"),
            @ApiImplicitParam(name = Constant.ORDER_FIELD, value = "排序字段", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = Constant.ORDER, value = "排序方式，可选值(asc、desc)", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "fieldId", value = "字段ID", paramType = "query", dataType = "String"),
            @ApiImplicitParam(name = "name", value = "字段内容名称", paramType = "query", dataType = "String")
    })
    public Result<PageData<TableFieldContentDTO>> pageFieldContent(@ApiIgnore @RequestParam Map<String, Object> params) {
        PageData<TableFieldContentDTO> page = tableFieldContentService.page(params);

        return Result.ok(page);
    }

    @GetMapping("{id}")
    @ApiOperation("查看详情")
    public Result<ExportSearchResultDTO> get(@PathVariable("id") Long id) {
        ExportSearchResultDTO data = exportSearchResultService.get(id);

        return Result.ok(data);
    }

    @PostMapping
    @ApiOperation("数据保存")
    @LogOperation("数据保存")
    public Result save(@RequestBody ExportSearchResultDTO dto) {
        exportSearchResultService.saveDataSearchRecord(dto);
        return Result.ok();
    }

    @PutMapping
    @ApiOperation("升级/降级")
    @LogOperation("升级/降级")
    public Result update(@RequestBody ExportSearchResultDimensionDTO dto) {
        exportSearchResultService.updateDataSearchRecord(dto);
        return Result.ok();
    }

    @DeleteMapping
    @ApiOperation("数据保存删除")
    @LogOperation("数据保存删除")
    public Result delete(@RequestBody Long[] ids) throws Exception {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");

        exportSearchResultService.deletedLogicallyBatchIds(ids);

        // 移到回收站
        for (Long id : ids) {
            exportRecycleBinService.save(exportSearchResultService.get(id));
        }

        return Result.ok();
    }

    @GetMapping("basicExport")
    @ApiOperation("基本导出")
    @LogOperation("基本导出")
    @ExportOperation()
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "检索记录主键ID", paramType = "query", required = true, dataType = "int")
    })
    public Result basicExport(@RequestParam Long id, HttpServletResponse response) {
        ExportSearchResultDTO searchResult = exportSearchResultService.get(id);
        Assert.notNull(searchResult, "检索记录不存在");

        //检查是否以及存在导出
        boolean flag = exportRecordService.checkExportTask(id);
        if (!flag) {
            return Result.error("请勿重复导出");
        }
        ExportRecordDTO exportRecordDTO = exportRecordService.startExportTask(searchResult, BizConstant.ExportType.BASE);
        exportSearchResultService.basicForExportV2(exportRecordDTO.getId(), exportRecordDTO.getSearchName(), searchResult);
        return Result.ok();
    }


    @PostMapping("seniorExport")
    @ApiOperation("高级导出")
    @LogOperation("高级导出")
    @ExportOperation()
    public Result seniorExport(@RequestBody @Valid SeniorExportRecordDTO seniorExportRecordDTO, HttpServletResponse response) {

        ExportSearchResultDTO searchResult = exportSearchResultService.get(seniorExportRecordDTO.getId());
        Assert.notNull(searchResult, "检索记录不存在");

        // 检查是否以及存在导出
        boolean flag = exportRecordService.checkExportTask(seniorExportRecordDTO.getId());
        if (!flag) {
            return Result.error("请勿重复导出");
        }
        ExportRecordDTO exportRecordDTO = exportRecordService.startExportTask(searchResult, BizConstant.ExportType.HIGH);
        exportSearchResultService.seniorForExportV2(exportRecordDTO.getId(), exportRecordDTO.getSearchName(), searchResult);
        return Result.ok();
    }


    @Deprecated
    @PostMapping("preview")
    @ApiOperation("预览导出结果(高级导出)")
    @LogOperation("预览导出结果(高级导出)")
    public Result<EsPageData> preview(@RequestBody @Valid SeniorExportRecordDTO seniorExportRecordDTO) {
        Assert.isTrue(seniorExportRecordDTO.getFieldDTOList().size() < ExportConstant.MAX_EXPORT_FIELD, "选择字段数超过限制");

        ExportSearchResultDTO searchResult = exportSearchResultService.get(seniorExportRecordDTO.getId());

        Assert.notNull(searchResult, "检索记录不存在");

        // searchResult.getDimension() 维度这里暂时写死0，前端实现人维度的预览比较困难
        SearchRequest searchRequest = exportSearchResultService.buildSeniorParam(
                searchResult.getExpression(),
                0,
                searchResult.getOrderTableCode(),
                searchResult.getOrderFieldCode(),
                searchResult.getOrderMode(),
                seniorExportRecordDTO.getPage(),
                seniorExportRecordDTO.getSize(),
                seniorExportRecordDTO.getFieldDTOList(),
                seniorExportRecordDTO.getId()
        );

        return Result.ok(exportSearchResultService.search(searchRequest));
    }

    /**
     * 下载
     */
    @GetMapping("download")
    @ApiOperation("下载导出结果")
    @LogOperation("下载导出结果")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "exportId", value = "导出记录ID", paramType = "query", required = true, dataType = "String")
    })
    public void download(@ApiIgnore @RequestParam Long exportId, HttpServletResponse response) throws Exception {
        AssertUtils.isNull(exportId, "exportId");

        ExportRecordDTO dto = exportRecordService.get(exportId);
        final String path = dto.getPath();

        if (!FileUtils.checkAllowDownload(path)) {
            throw new Exception(StrUtil.format("资源文件({})非法，不允许下载。 ", path));
        }
        // 数据库资源地址
        String downloadPath = FileUploadUtils.getDownloadUrl(path);
        // 下载名称
        String separator = FileSystems.getDefault().getSeparator();
        String downloadName = StringUtils.substringAfterLast(downloadPath, separator);
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        FileUtils.setAttachmentResponseHeader(response, downloadName);

        FileUtils.writeBytes(path, response.getOutputStream());
    }


    /**
     * 获取高级导出字段字段列表
     */
    @GetMapping("getExportFields")
    @ApiOperation("获取高级导出字段字段列表")
    public Result<Set<FieldDTO>> getExportSearchFields(Long saveDataId) {
        Set<FieldDTO> data = exportSearchResultService.getExportSearchFields(saveDataId);
        return Result.ok(data);
    }
}