package com.jiayuan.modules.export.service.impl;

import cn.afterturn.easypoi.excel.entity.params.ExcelExportEntity;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.ZipUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.constant.ExportConstant;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.enums.ExportStatus;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.utils.ExcelUtils;
import com.jiayuan.common.utils.file.FileUploadUtils;
import com.jiayuan.common.utils.uuid.Seq;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.export.dao.ExportRecordFieldDao;
import com.jiayuan.modules.export.dao.ExportSearchResultDao;
import com.jiayuan.modules.export.dto.*;
import com.jiayuan.modules.export.entity.ExportSearchResultEntity;
import com.jiayuan.modules.export.service.ExportRecordService;
import com.jiayuan.modules.export.service.ExportSearchFieldService;
import com.jiayuan.modules.export.service.ExportSearchResultService;
import com.jiayuan.modules.search.component.BuilderSourceUtil;
import com.jiayuan.modules.search.component.SearchComponent;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.excel.ExcelExport;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.search.service.ResultFieldService;
import com.jiayuan.modules.searchv2.component.ExpressionParserComponent;
import com.jiayuan.modules.searchv2.modal.NodeQueryVo;
import com.jiayuan.modules.searchv2.modal.SearchVo;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.io.*;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * 数据检索保存记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ExportSearchResultServiceImpl extends CrudServiceImpl<ExportSearchResultDao, ExportSearchResultEntity, ExportSearchResultDTO> implements ExportSearchResultService {

    private final ExportRecordFieldDao exportRecordFieldDao;
    private final SearchComponent searchComponent;
    private final ResultFieldService resultFieldService;
    private final ThreadPoolTaskExecutor threadPoolTaskExecutor;
    private final ExportSearchFieldService exportSearchFieldService;
    private final ExportRecordService exportRecordService;
    private final ExpressionParserComponent expressionParserComponent;

    private static final int PAGE_SIZE = 100;

    private final ExcelExport excelExport;


    @Override
    public Wrapper<ExportSearchResultEntity> getWrapper(Map<String, Object> params) {
        String name = (String) params.get("name");
        String startTime = (String) params.get("startTime");
        String endTime = (String) params.get("endTime");

        return Wrappers.<ExportSearchResultEntity>lambdaQuery()
                .eq(ExportSearchResultEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .like(StringUtils.isNotBlank(name), ExportSearchResultEntity::getName, name)
                .apply(StringUtils.isNotBlank(startTime),
                        "TO_CHAR(create_date, 'YYYY-MM-DD') >= TO_CHAR(TO_DATE('" + startTime + "', 'YYYY-MM-DD'), 'YYYY-MM-DD')")
                .apply(StringUtils.isNotBlank(endTime),
                        "TO_CHAR(create_date, 'YYYY-MM-DD') <= TO_CHAR(TO_DATE('" + endTime + "', 'YYYY-MM-DD'), 'YYYY-MM-DD')")
                .eq(ExportSearchResultEntity::getCreator, SecurityUser.getUserId())
                .orderByDesc(ExportSearchResultEntity::getUpdateDate);
    }

    @Override
    public List<SeniorExportRecordFieldDTO> querySeniorColumnList(Long exportRecordId) {
        List<SeniorExportRecordFieldDTO> exportRecordFieldDTO = exportRecordFieldDao.querySeniorTableHeader(exportRecordId);
        if (CollectionUtils.isNotEmpty(exportRecordFieldDTO)) {
            exportRecordFieldDTO.forEach(f -> {
                f.setFieldContentDTOList(exportRecordFieldDao.queryFieldContent(f.getId()));
            });
        }
        return exportRecordFieldDTO;
    }

    @Override
    public EsPageData search(SearchRequest searchRequest) {
        List<FieldDTO> columnList = searchRequest.getColumnList();
        if (CollectionUtils.isEmpty(columnList)) {
            columnList = resultFieldService.getUserShowFieldList();
            searchRequest.setColumnList(columnList);
        }

        if (Objects.isNull(searchRequest.getPage())) {
            searchRequest.setPage(ExportConstant.MIN_PAGE);
        }

        if (Objects.isNull(searchRequest.getSize())) {
            searchRequest.setSize(ExportConstant.MAX_SIZE);
        }

        if (BuilderSourceUtil.isPersonTimes(searchRequest.getDimension())) {
            return searchComponent.searchOfVisit(searchRequest);
        } else {
            return searchComponent.searchOfPerson(searchRequest);
        }
    }

    @Override
    public SearchRequest buildSeniorParam(String expression, Integer dimension, String orderTableCode, String orderFieldCode, String order, Integer page, Integer size, List<SeniorExportRecordFieldDTO> selectFieldList, Long recordId) {
        List<FieldDTO> columnList = buildSeniorColumn(selectFieldList, recordId);
        return SearchRequest.builder()
                .expression(buildSeniorExpression(expression, selectFieldList))
                .dimension(dimension)
                .columnList(columnList)
                .orderTableCode(orderTableCode)
                .orderFieldCode(orderFieldCode)
                .orderMode(order)
                .isOptimized(false)
                .page(page)
                .size(size)
                .build();
    }

    @Override
    public String export(String fileName, EsPageData pageData, SearchRequest searchRequest) {
        String folderPath = StrUtil.format("{}/{}", FileUploadUtils.getExportPath(), Seq.getId(Seq.uploadSeqType));
        String tmpFolderPath = Paths.get(folderPath, "tmp").toString();
        String path = null;
        try {
            //任务数量、excel数量
            double page = Math.ceil((double) pageData.getTotal() / ExportConstant.MAX_SIZE);
            List<CompletableFuture> completableFutures = new ArrayList<>();
            AtomicReference<List> rows = new AtomicReference<>(Lists.newArrayList());
            AtomicInteger taskCounter = new AtomicInteger(0);
            AtomicInteger excelCounter = new AtomicInteger(0);

            //分页检索(多线程)
            for (int i = 0; i < page; i++) {
                SearchRequest search = searchRequest.clone();
                search.setPage(i);
                search.setSize(ExportConstant.MAX_SIZE);
                CompletableFuture<Void> completableFuture = CompletableFuture.runAsync(() -> {
                    EsPageData esPageData = search(search);
                    synchronized (rows) {
                        try {
                            taskCounter.getAndIncrement();
                            rows.get().addAll(esPageData.getRows());
                            //单个excel不超过10000
                            if (rows.get().size() >= ExportConstant.EXCEL_SIZE || taskCounter.get() >= page) {
                                ExcelUtils.writeExcel(tmpFolderPath, String.format("数据_%s.xls", excelCounter.get()), search.getDimension(), pageData.getColumnList(), rows.get());
                                excelCounter.getAndIncrement();
                                rows.set(Lists.newArrayList());
                            }
                        } catch (Exception e) {
                            log.error("数据写入: " + e.getMessage(), e);
                            throw new RuntimeException("数据写入: " + e.getMessage(), e);
                        }
                    }
                }, threadPoolTaskExecutor);
                completableFutures.add(completableFuture);
            }

            //等待任务结束
            completableFutures.forEach(CompletableFuture::join);

            //压缩并保存至服务器
            String fileNameEx = fileName + ".zip";
            String zipPath = Paths.get(folderPath, fileNameEx).toString();
            ZipUtil.zip(tmpFolderPath, zipPath);

            //获取文件路径
            path = FileUploadUtils.getPathFileName(folderPath, fileNameEx);
        } catch (Exception e) {
            log.error("导出失败: " + e.getMessage(), e);
        } finally {
            //删除缓存文件
            FileUtil.del(tmpFolderPath);
        }
        return path;
    }

    @Override
    public String exportV2(String fileName, EsPageData pageData, SearchRequest searchRequest) {
        return null;
    }

    @Async
    @Override
    public void seniorForExport(Long taskRecordId, SeniorExportRecordDTO seniorExportRecordDTO, ExportSearchResultDTO searchResult) {
        CompletableFuture.runAsync(() -> {
            //保存导出字段、字段内容。
            exportRecordService.saveField(taskRecordId, seniorExportRecordDTO);

            EsPageData pageData = null;
            //es检索数据
            SearchRequest searchRequest = this.buildSeniorParam(
                    searchResult.getExpression(),
                    searchResult.getDimension(),
                    searchResult.getOrderTableCode(),
                    searchResult.getOrderFieldCode(),
                    searchResult.getOrderMode(),
                    ExportConstant.MIN_PAGE,
                    1,
                    seniorExportRecordDTO.getFieldDTOList(),
                    seniorExportRecordDTO.getId()
            );
            ExportRecordDTO endRecordDTO = new ExportRecordDTO();
            endRecordDTO.setId(taskRecordId);
            try {
                pageData = this.search(searchRequest);

                if (pageData.getTotal() > 0) {
                    //导出Excel
                    String path = this.export(searchResult.getName(), pageData, searchRequest);
                    if (StringUtils.isNotBlank(path)) {
                        endRecordDTO.setPath(path);
                        endRecordDTO.setStatus(ExportStatus.SUCCESS.code());
                        endRecordDTO.setRemark("导出成功");
                    } else {
                        endRecordDTO.setStatus(ExportStatus.FAIL.code());
                        endRecordDTO.setRemark("下载路径为空");
                    }
                } else {
                    endRecordDTO.setStatus(ExportStatus.SUCCESS.code());
                    endRecordDTO.setRemark("无数据");
                }
            } catch (Exception e) {
                endRecordDTO.setStatus(ExportStatus.FAIL.code());
                endRecordDTO.setRemark("导出失败" + e.getMessage());
                log.error("导出失败: " + e.getMessage(), e);
            }
            //保存导出记录
            endRecordDTO.setAmount(Objects.nonNull(pageData) ? pageData.getTotal().intValue() : 0);
            endRecordDTO.setFieldAmount(Objects.nonNull(pageData) ? pageData.getColumnList().size() : 0);
            exportRecordService.endExportTask(searchResult, endRecordDTO);
        }, threadPoolTaskExecutor);
    }

    @Override
    public void seniorForExportV2(Long taskRecordId, String searchName, ExportSearchResultDTO searchResult) {
        CompletableFuture.runAsync(() -> {
            final List<FieldDTO> columnList = resultFieldService.getUserShowFieldList();
            ExportRecordDTO endRecordDTO = new ExportRecordDTO();
            endRecordDTO.setId(taskRecordId);

            String expression = searchResult.getExpression();
            String uniqueId = Seq.getId(Seq.uploadSeqType);
            try {

                SearchRequest build = SearchRequest
                        .builder()
                        .expression(expression)
                        .columnList(columnList)
                        .size(PAGE_SIZE)
                        .export(true)
                        .esBatchSize(10)
                        .page(1)
                        .build();
                SearchVo search = expressionParserComponent.search(build);
                NodeQueryVo nodeQueryVo = search.getNodeQueryVo();
                search.setUniqueId(uniqueId);
                String exportPath = excelExport.exportToExcel(nodeQueryVo, uniqueId);

                if (StringUtils.isNotBlank(exportPath)) {
                    endRecordDTO.setPath(exportPath);
                    endRecordDTO.setAmount(nodeQueryVo.getResult().size());
                    endRecordDTO.setStatus(ExportStatus.SUCCESS.code());
                    endRecordDTO.setRemark("导出成功");
                } else {
                    endRecordDTO.setStatus(ExportStatus.FAIL.code());
                    endRecordDTO.setRemark("下载路径为空");
                }


                // directory
                String folderPath = endRecordDTO.getPath();

                // /profile/export/20241218144051A004/zhenduan.zip
                String separator = FileSystems.getDefault().getSeparator();
                //压缩并保存至服务器
                String targetAbsolutePath = folderPath.replace("data", "profile") + separator + searchName + ".zip";

                ZipUtil.zip(folderPath, targetAbsolutePath);
                log.info("targetAbsolutePath -> {}", targetAbsolutePath);
                //保存导出记录
                endRecordDTO.setPath(targetAbsolutePath);
                endRecordDTO.setFieldAmount(1);
//                exportRecordService.endExportTask(searchResult, endRecordDTO);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(" 导出失败 ");
                log.error("=====导出失败=====");
                endRecordDTO.setStatus(ExportStatus.FAIL.code());
                endRecordDTO.setRemark(e.getMessage());
                exportRecordService.endExportTask(searchResult, endRecordDTO);
            } finally {
                // 确保最终更新导出记录
                exportRecordService.endExportTask(searchResult, endRecordDTO);
                System.gc(); // 最后执行一次GC
            }

        }, threadPoolTaskExecutor);
    }


    @Override
    public Set<FieldDTO> getExportSearchFields(Long saveDataId) {
        ExportSearchResultDTO searchResult = this.get(saveDataId);
        Assert.notNull(searchResult, "数据保存记录不存在");
        //用户配置展示字段+检索字段
        List<FieldDTO> result = exportSearchFieldService.findList(saveDataId);
        //表达式检索字段
        List<FieldDTO> searchFields = searchComponent.getSearchFields(searchResult.getExpression());
        //去重
        result.addAll(searchFields);
        TreeSet<FieldDTO> set = result.stream().filter(e -> Objects.nonNull(e.getIsShow()) && e.getIsShow()).collect(Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(FieldDTO::getFieldId))));

        return set;
    }

    @Override
    public void saveDataSearchRecord(ExportSearchResultDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        String orderTableCode = dto.getOrderTableCode();
        String orderFieldCode = dto.getOrderFieldCode();
        String orderMode = dto.getOrderMode();
        if (StrUtil.isNotBlank(orderTableCode)) {
            dto.setOrderTableCode(EsConstant.MS_VISIT_RECORD);
        }
        if (StrUtil.isNotBlank(orderFieldCode)) {
            dto.setOrderFieldCode(EsConstant.VISIT_NO);
        }
        if (StrUtil.isNotBlank(orderMode)) {
            dto.setOrderMode(Constant.DESC);
        }
        this.save(dto);
        List<FieldDTO> userShowFieldList = resultFieldService.getUserShowFieldList();
        if (CollectionUtil.isNotEmpty(userShowFieldList)) {
            List<ExportSearchFieldDTO> exportSearchFieldDTOS = BeanUtil.copyToList(userShowFieldList, ExportSearchFieldDTO.class);
            exportSearchFieldDTOS.forEach(e -> e.setSaveRecordId(dto.getId()));
            exportSearchFieldService.saveBatch(exportSearchFieldDTOS);
        }

    }

    @Override
    public void updateDataSearchRecord(ExportSearchResultDimensionDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        this.update(ConvertUtils.sourceToTarget(dto, ExportSearchResultDTO.class));
    }

    @Async
    @Override
    public void basicForExport(Long taskRecordId, ExportSearchResultDTO searchResult) {
        CompletableFuture.runAsync(() -> {
            EsPageData pageData = null;
            //es检索数据
            SearchRequest searchRequest = SearchRequest.builder()
                    .expression(searchResult.getExpression())
                    .dimension(searchResult.getDimension())
                    .orderTableCode(searchResult.getOrderTableCode())
                    .orderFieldCode(searchResult.getOrderFieldCode())
                    .orderMode(searchResult.getOrderMode())
                    .columnList(exportSearchFieldService.findList(searchResult.getId()))
                    .page(ExportConstant.MIN_PAGE)
                    .size(1)
                    .isOptimized(false)
                    .build();
            ExportRecordDTO endRecordDTO = new ExportRecordDTO();
            endRecordDTO.setId(taskRecordId);
            try {
                pageData = this.search(searchRequest);
                if (pageData.getTotal() > 0) {
                    //导出Excel
                    String path = this.export(searchResult.getName(), pageData, searchRequest);
                    if (StringUtils.isNotBlank(path)) {
                        endRecordDTO.setPath(path);
                        endRecordDTO.setStatus(ExportStatus.SUCCESS.code());
                        endRecordDTO.setRemark("导出成功");
                    } else {
                        endRecordDTO.setStatus(ExportStatus.FAIL.code());
                        endRecordDTO.setRemark("下载路径为空");
                    }
                } else {
                    endRecordDTO.setStatus(ExportStatus.SUCCESS.code());
                    endRecordDTO.setRemark("无数据");
                }

            } catch (Exception e) {
                endRecordDTO.setStatus(ExportStatus.FAIL.code());
                endRecordDTO.setRemark("导出失败" + e.getMessage());
                log.error("导出失败: " + e.getMessage(), e);
            }
            //保存导出记录
            endRecordDTO.setAmount(Objects.nonNull(pageData) ? pageData.getTotal().intValue() : 0);
            endRecordDTO.setFieldAmount(Objects.nonNull(pageData) ? pageData.getColumnList().size() : 0);
            exportRecordService.endExportTask(searchResult, endRecordDTO);
        }, threadPoolTaskExecutor);
    }

    @Override
    public void basicForExportV2(Long taskRecordId, String searchName, ExportSearchResultDTO searchResult) {
        CompletableFuture.runAsync(() -> {

            int maxPage = 30;

            final List<FieldDTO> columnList = resultFieldService.getUserShowFieldList();
            int total = 0;
            ExportRecordDTO endRecordDTO = new ExportRecordDTO();
            endRecordDTO.setId(taskRecordId);

            String expression = searchResult.getExpression();
            String uniqueId = Seq.getId(Seq.uploadSeqType);
            try {

                SearchRequest build = SearchRequest
                        .builder()
                        .expression(expression)
                        .columnList(columnList)
                        .esBatchSize(1000)
                        .export(true)
                        .size(PAGE_SIZE)
                        .page(1)
                        .build();

                SearchVo search = expressionParserComponent.search(build);

                if (search.getTotal() > 0) {
                    search.setUniqueId(uniqueId);
                    String exportPath = exportBasicDataToExcel(search);
                    if (StringUtils.isNotBlank(exportPath)) {
                        endRecordDTO.setPath(exportPath);
                        endRecordDTO.setStatus(ExportStatus.SUCCESS.code());
                        endRecordDTO.setRemark("导出成功");
                        total = search.getTotal();
                        endRecordDTO.setAmount(search.getTotal());
                    } else {
                        endRecordDTO.setStatus(ExportStatus.FAIL.code());
                        endRecordDTO.setRemark("下载路径为空");
                    }

                    if (search.getTotal() > PAGE_SIZE) {
                        total = Math.min(search.getTotal(), maxPage * PAGE_SIZE);

                        int pageSize = PAGE_SIZE;
                        int totalPages = (total + pageSize - 1) / pageSize; // 计算总页数

                        for (int page = 2; page <= totalPages; page++) {
                            log.info("current page is {}", page);
                            // 构建分页查询请求
                            SearchRequest pageRequest = SearchRequest
                                    .builder()
                                    .expression(expression)
                                    .size(pageSize)
                                    .columnList(columnList)
                                    .esBatchSize(1000)
                                    .export(true)
                                    .page(page)
                                    .build();

                            SearchVo pageSearch = expressionParserComponent.search(pageRequest);
                            pageSearch.setUniqueId(uniqueId);
                            exportBasicDataToExcel(pageSearch);
                            if (page > maxPage) {
                                log.info("最多导出{}页数据", maxPage);
                                break;
                            }
                        }
                        log.info("All paginated data export completed");
                    } else {
                        log.info("Export completed");
                    }
                } else {
                    String exportPath = exportBasicDataToExcel(search);
                    endRecordDTO.setStatus(ExportStatus.SUCCESS.code());
                    endRecordDTO.setRemark("无数据");
                    endRecordDTO.setPath(exportPath);
                }

                // directory
                String folderPath = endRecordDTO.getPath();
                log.info("folderPath -> {}", folderPath);
                // /profile/export/20241218144051A004/zhenduan.zip
                String separator = FileSystems.getDefault().getSeparator();
                //压缩并保存至服务器
                String targetAbsolutePath = folderPath.replace("data", "profile") + separator + searchName + ".zip";

                ZipUtil.zip(folderPath, targetAbsolutePath);
                log.info("targetAbsolutePath -> {}", targetAbsolutePath);
                //保存导出记录
                endRecordDTO.setAmount(total);
                endRecordDTO.setPath(targetAbsolutePath);
                endRecordDTO.setFieldAmount(1);
                exportRecordService.endExportTask(searchResult, endRecordDTO);

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(" 导出失败 ");
                log.error("=====导出失败=====");
                endRecordDTO.setStatus(ExportStatus.FAIL.code());
                endRecordDTO.setRemark(e.getMessage());
                exportRecordService.endExportTask(searchResult, endRecordDTO);
            }


        }, threadPoolTaskExecutor);
    }

//    /**
//     * export data to excel
//     *
//     * @param searchVo search parameters
//     * @return path
//     * @throws Exception exception
//     */
//    public String exportDataToExcel(SearchVo searchVo) throws Exception {
//        String pathRes = null;
//        List<Map<String, Object>> result = searchVo.getResult();
//        for (Map<String, Object> resultMap : result) {
//            Object subTables = resultMap.get("jykj_subTables");
//            if (subTables != null) {
//                List<Map<String, Object>> subList = (List<Map<String, Object>>) subTables;
//                for (Map<String, Object> subMap : subList) {
//                    Object data = subMap.get("data");
//                    Object column = subMap.get("columns");
//                    Object tableName = subMap.get("tableName");
//                    // Define export parameters
//                    ExportParams exportParams = new ExportParams();
//                    if (tableName == null) {
//                        exportParams.setTitle("默认");
//                    } else {
//                        exportParams.setTitle(tableName.toString());
//                    }
//                    exportParams.setSheetName("Sheet1");
//
//                    // Define header
//                    List<ExcelExportEntity> headerList = new ArrayList<>();
//                    if (column != null) {
//                        List<Map<String, Object>> columns = (List<Map<String, Object>>) column;
//                        for (Map<String, Object> columnsMap : columns) {
//                            ExcelExportEntity nameHeader = new ExcelExportEntity(columnsMap.get("title").toString(), columnsMap.get("dataIndex"));
//                            headerList.add(nameHeader);
//                        }
//                    }
//
//                    // Definitive data
//                    List<Map<String, Object>> dataList = new ArrayList<>();
//                    if (data != null) {
//                        dataList = (List<Map<String, Object>>) data;
//                    }
//                    String separator = FileSystems.getDefault().getSeparator();
//                    String folderPath = StrUtil.format("{}{}{}", FileUploadUtils.getExportPath(), separator, searchVo.getUniqueId());
//                    String tmpFolderPath = Paths.get(folderPath, "tmp").toString();
//
//                    Path path = Paths.get(tmpFolderPath);
//
//                    if (!Files.exists(path)) {
//                        try {
//                            Files.createDirectories(path);
//                            log.info("Directory created successfully: " + path);
//                        } catch (IOException e) {
//                            log.info("Directory creation failed: " + path);
//                            throw new Exception("Directory creation failed", e);
//                        }
//                    }
//
//                    String filePath = String.format("%s%s数据-%s.xlsx", tmpFolderPath, separator, tableName);
//                    pathRes = tmpFolderPath;
//                    Workbook workbook = null;
//                    Sheet sheet = null;
//                    int startRow = 0;
//
//                    try {
//                        File file = new File(filePath);
//                        if (file.exists()) {
//                            // The file exists, read the existing file
//                            try (FileInputStream fis = new FileInputStream(file)) {
//                                workbook = new XSSFWorkbook(fis);
//                                sheet = workbook.getSheet(exportParams.getSheetName());
//                                if (sheet == null) {
//                                    sheet = workbook.createSheet(exportParams.getSheetName());
//                                }
//                                startRow = sheet.getLastRowNum() + 1;
//                                if (startRow == 0) {
//                                    // If it is a new worksheet, write the title and header first
//                                    Row titleRow = sheet.createRow(0);
//                                    Cell titleCell = titleRow.createCell(0);
//                                    titleCell.setCellValue(exportParams.getTitle());
//
//                                    Row headerRow = sheet.createRow(1);
//                                    for (int i = 0; i < headerList.size(); i++) {
//                                        Cell cell = headerRow.createCell(i);
//                                        cell.setCellValue(headerList.get(i).getName());
//                                    }
//                                    startRow = 2;
//                                }
//                            }
//                        } else {
//                            // The file does not exist, create a new workbook
//                            workbook = ExcelExportUtil.exportExcel(exportParams, headerList, new ArrayList<>());
//                            sheet = workbook.getSheetAt(0);
//                            // Skip title and header rows
//                            startRow = 2;
//                        }
//
//                        // append data
//                        for (Map<String, Object> rowData : dataList) {
//                            Row row = sheet.createRow(startRow++);
//                            for (int i = 0; i < headerList.size(); i++) {
//                                ExcelExportEntity header = headerList.get(i);
//                                Cell cell = row.createCell(i);
//                                Object value = rowData.get(header.getKey());
//                                if (value != null) {
//                                    cell.setCellValue(value.toString());
//                                }
//                            }
//                        }
//
//                        // Set column width
//                        for (int i = 0; i < headerList.size(); i++) {
//                            sheet.setColumnWidth(i, 20 * 256);
//                        }
//
//                        // Write Excel to a file
//                        try (FileOutputStream fos = new FileOutputStream(filePath)) {
//                            workbook.write(fos);
//                        }
//
//
//                    } catch (IOException e) {
//                        throw new Exception("Export failed!", e);
//                    } finally {
//                        try {
//                            if (workbook != null) {
//                                workbook.close();
//                            }
//                        } catch (IOException e) {
//                            e.printStackTrace();
//                        }
//
//                    }
//
//                }
//            }
//        }
//        return pathRes;
//    }

    //    private static final Logger log = LoggerFactory.getLogger(ExcelExportService.class);
    private static final String DEFAULT_SHEET_NAME = "Sheet1";
    private static final String DEFAULT_TITLE = "默认";
    private static final int COLUMN_WIDTH = 20 * 256;
    private static final int WINDOW_SIZE = 100; // SXSSFWorkbook保留的行数
    private static final int BUFFER_THRESHOLD = 1000; // 内存缓冲阈值

    /**
     * 导出数据到Excel
     *
     * @param searchVo 搜索参数
     * @return 导出文件路径
     * @throws Exception 导出异常
     */
    public String exportDataToExcel(SearchVo searchVo) throws Exception {
        // 1. 准备导出目录
        Path exportPath = prepareExportDirectory(searchVo);

        // 2. 按表名分组收集所有数据
        Map<String, TableExportData> exportDataMap = collectExportData(searchVo.getResult());

        // 3. 并行导出各表数据
        exportDataMap.forEach((tableName, tableData) -> {
            try {
                appendToExcelFile(exportPath, tableName, tableData);
            } catch (Exception e) {
                log.error("导出表{}数据失败", tableName, e);
                throw new RuntimeException(e);
            }
        });

        return exportPath.toString();
    }

    /**
     * 导出数据到Excel
     *
     * @param searchVo 搜索参数
     * @return 导出文件路径
     * @throws Exception 导出异常
     */
    public String exportBasicDataToExcel(SearchVo searchVo) throws Exception {
        // 1. 准备导出目录
        Path exportPath = prepareExportDirectory(searchVo);

        // 2. 按表名分组收集所有数据
        Map<String, TableExportData> exportDataMap = collectBasicExportData(searchVo.getResult(), searchVo.getColumns());

        // 3. 并行导出各表数据
        exportDataMap.forEach((tableName, tableData) -> {
            try {
                appendToExcelFile(exportPath, tableName, tableData);
            } catch (Exception e) {
                log.error("导出表{}数据失败", tableName, e);
                throw new RuntimeException(e);
            }
        });

        return exportPath.toString();
    }

    /**
     * 准备导出目录
     */
    private Path prepareExportDirectory(SearchVo searchVo) throws IOException {
        String folderPath = StrUtil.format("{}{}{}",
                FileUploadUtils.getExportPath(),
                FileSystems.getDefault().getSeparator(),
                searchVo.getUniqueId());

        Path tmpFolderPath = Paths.get(folderPath, "tmp");

        if (!Files.exists(tmpFolderPath)) {
            try {
                Files.createDirectories(tmpFolderPath);
                log.info("目录创建成功: {}", tmpFolderPath);
            } catch (IOException e) {
                log.error("目录创建失败: {}", tmpFolderPath, e);
                throw e;
            }
        }

        return tmpFolderPath;
    }

    /**
     * 收集所有需要导出的数据并按表名分组
     */
    private Map<String, TableExportData> collectBasicExportData(List<Map<String, Object>> results,
                                                                List<Map<String, String>> columns) {
        Map<String, TableExportData> exportDataMap = new ConcurrentHashMap<>();
        TableExportData tableData = exportDataMap.computeIfAbsent("基础字段",
                k -> new TableExportData());
        List<ExcelExportEntity> headers = columns.stream()
                .map(col -> new ExcelExportEntity(
                        col.get("title").toString(),
                        col.get("dataIndex")))
                .collect(Collectors.toList());
        // 只设置一次表头
        if (tableData.getHeaders().isEmpty()) {
            tableData.setHeaders(headers);
        }
        // 处理数据
        tableData.getData().addAll(results);
        return exportDataMap;
    }

    /**
     * 收集所有需要导出的数据并按表名分组
     */
    private Map<String, TableExportData> collectExportData(List<Map<String, Object>> result) {
        Map<String, TableExportData> exportDataMap = new ConcurrentHashMap<>();

        result.forEach(resultMap -> {
            Object subTables = resultMap.get("jykj_subTables");
            if (subTables instanceof List) {
                ((List<Map<String, Object>>) subTables).forEach(subMap -> {
                    String tableName = subMap.get("tableName") != null ?
                            subMap.get("tableName").toString() : DEFAULT_TITLE;

                    TableExportData tableData = exportDataMap.computeIfAbsent(tableName,
                            k -> new TableExportData());

                    // 处理表头
                    if (subMap.get("columns") instanceof List) {
                        List<ExcelExportEntity> headers = ((List<Map<String, Object>>) subMap.get("columns"))
                                .stream()
                                .map(col -> new ExcelExportEntity(
                                        col.get("title").toString(),
                                        col.get("dataIndex")))
                                .collect(Collectors.toList());

                        // 只设置一次表头
                        if (tableData.getHeaders().isEmpty()) {
                            tableData.setHeaders(headers);
                        }
                    }

                    // 处理数据
                    if (subMap.get("data") instanceof List) {
                        tableData.getData().addAll((List<Map<String, Object>>) subMap.get("data"));
                    }
                });
            }
        });

        return exportDataMap;
    }


    private void appendToExcelFile(Path exportPath, String tableName, TableExportData tableData) throws Exception {
        String fileName = String.format("%s%s数据-%s.xlsx", exportPath,
                FileSystems.getDefault().getSeparator(),
                tableName);
        File file = new File(fileName);
        Workbook workbook = null;

        try {
            // 1. 如果文件存在，读取现有工作簿
            if (file.exists()) {
                try (InputStream is = new FileInputStream(file)) {
                    workbook = new XSSFWorkbook(is);
                }
            }
            // 2. 文件不存在，创建新工作簿
            else {
                workbook = new SXSSFWorkbook(WINDOW_SIZE);
            }

            // 3. 获取或创建Sheet
            Sheet sheet = workbook.getSheet(DEFAULT_SHEET_NAME);
            if (sheet == null) {
                sheet = workbook.createSheet(DEFAULT_SHEET_NAME);
                createTitleAndHeader(sheet, tableName, tableData.getHeaders());
            }

            // 4. 确定追加数据的起始行
            int startRow = sheet.getLastRowNum() + 1;
            if (startRow == 0) { // 全新Sheet
                createTitleAndHeader(sheet, tableName, tableData.getHeaders());
                startRow = 2;
            } else if (startRow == 1) { // 只有标题行
                createHeaderRow(sheet, tableData.getHeaders());
                startRow = 2;
            }

            // 5. 追加数据
            appendDataToSheet(sheet, startRow, tableData.getData(), tableData.getHeaders());

            // 6. 设置列宽
            setColumnWidths(sheet, tableData.getHeaders().size());

            // 7. 写入文件
            try (OutputStream os = new FileOutputStream(file)) {
                if (workbook instanceof SXSSFWorkbook) {
                    ((SXSSFWorkbook) workbook).write(os);
                } else {
                    workbook.write(os);
                }
            }
        } finally {
            if (workbook != null) {
                try {
                    workbook.close();
                } catch (IOException e) {
                    log.error("关闭工作簿失败", e);
                }
            }
        }
    }

    private void appendDataToSheet(Sheet sheet, int startRow,
                                   List<Map<String, Object>> data, List<ExcelExportEntity> headers) {
        for (Map<String, Object> rowData : data) {
            Row row = sheet.createRow(startRow++);
            for (int i = 0; i < headers.size(); i++) {
                ExcelExportEntity header = headers.get(i);
                if (header == null) {
                    System.out.println("111header = " + headers);
                }

                if (header.getKey() == null) {
                    System.out.println("222header = " + header);
                }

                Object value = rowData.get(header.getKey());
                if (value != null) {
                    row.createCell(i).setCellValue(value.toString());
                }
            }
        }
    }


    private void createHeaderRow(Sheet sheet, List<ExcelExportEntity> headers) {
        Row headerRow = sheet.createRow(1);
        for (int i = 0; i < headers.size(); i++) {
            headerRow.createCell(i).setCellValue(headers.get(i).getName());
        }
    }

    /**
     * 创建标题和表头
     */
    private void createTitleAndHeader(Sheet sheet, String title, List<ExcelExportEntity> headers) {
        // 标题行
        Row titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue(title);

        // 表头行
        Row headerRow = sheet.createRow(1);
        for (int i = 0; i < headers.size(); i++) {
            headerRow.createCell(i).setCellValue(headers.get(i).getName());
        }
    }

    /**
     * 设置列宽
     */
    private void setColumnWidths(Sheet sheet, int columnCount) {
        for (int i = 0; i < columnCount; i++) {
            sheet.setColumnWidth(i, COLUMN_WIDTH);
        }
    }

    /**
     * 表导出数据封装类
     */
    private static class TableExportData {
        private List<ExcelExportEntity> headers = new ArrayList<>();
        private List<Map<String, Object>> data = new ArrayList<>();

        public List<ExcelExportEntity> getHeaders() {
            return headers;
        }

        public void setHeaders(List<ExcelExportEntity> headers) {
            this.headers = headers;
        }

        public List<Map<String, Object>> getData() {
            return data;
        }
    }

    /**
     * 构造高级导出表头数据
     *
     * @param selectFieldList 选择字段以及内容
     * @return
     */
    private List<FieldDTO> buildSeniorColumn(List<SeniorExportRecordFieldDTO> selectFieldList, Long recordId) {
        List<Long> ids = selectFieldList.stream()
                .map(SeniorExportRecordFieldDTO::getTableFieldId)
                .collect(Collectors.toList());

        List<FieldDTO> queryFieldList = resultFieldService.getFieldList(ids);

        List<FieldDTO> defaultFieldList = exportSearchFieldService.findList(recordId);
        if (CollectionUtil.isEmpty(defaultFieldList)) {
            defaultFieldList = resultFieldService.getUserShowFieldList();
        }

        return Stream.of(queryFieldList, defaultFieldList)
                .flatMap(Collection::stream)
                .collect(Collectors.collectingAndThen(Collectors.toCollection(() ->
                        new TreeSet<>(Comparator.comparing(FieldDTO::getFieldId))), ArrayList::new));
    }

    /**
     * 重新构造高级导出表达式
     *
     * @param expression      表达式
     * @param selectFieldList 选择字段以及内容
     * @return
     */
    private String buildSeniorExpression(String expression, List<SeniorExportRecordFieldDTO> selectFieldList) {
        if (CollectionUtils.isNotEmpty(selectFieldList)) {
            List<String> subExpression = Lists.newArrayList();
            for (SeniorExportRecordFieldDTO record : selectFieldList) {
                if (CollectionUtils.isNotEmpty(record.getFieldContentDTOList())) {
                    String orExpression = record.getFieldContentDTOList().stream()
                            .map(m -> String.format("*%s*[%s.%s]", m.getName(), record.getTableName(), record.getFieldName()))
                            .collect(Collectors.joining(String.format(" %s ", Symbol.LogicEnum.OR.getName()), "(", ")"));
                    subExpression.add(String.format("%s %s", Symbol.LogicEnum.AND.getName(), orExpression));
                }
            }
            if (CollectionUtils.isNotEmpty(subExpression)) {
                expression = String.format("(%s) %s", expression, String.join(" ", subExpression));
            }
        }
        return expression;
    }

}