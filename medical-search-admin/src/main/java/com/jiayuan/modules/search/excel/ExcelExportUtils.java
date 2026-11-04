package com.jiayuan.modules.search.excel;

import cn.afterturn.easypoi.excel.entity.params.ExcelExportEntity;
import com.jiayuan.common.utils.file.FileUploadUtils;
import com.jiayuan.modules.searchv2.modal.SearchVo;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ForkJoinPool;
import java.util.stream.Collectors;

public class ExcelExportUtils {
    private static final Logger log = LoggerFactory.getLogger(ExcelExportUtils.class);

    private static final String DEFAULT_SHEET_NAME = "Sheet1";
    private static final String DEFAULT_TITLE = "数据导出";
    private static final int COLUMN_WIDTH = 20 * 256;
    private static final int WINDOW_SIZE = 100; // SXSSFWorkbook保留的行数
    private static final int BATCH_SIZE = 500;  // 批量处理行数

    /**
     * 导出数据到Excel
     *
     * @param searchVo 搜索参数
     * @return 导出文件路径
     * @throws Exception 导出异常
     */
    public String exportDataToExcel(SearchVo searchVo) throws Exception {
        logMemoryUsage("导出开始前");

        // 1. 准备导出目录
        Path exportPath = prepareExportDirectory(searchVo);

        // 2. 按表名分组收集所有数据
        Map<String, TableExportData> exportDataMap = collectExportData(searchVo.getResult());

        // 3. 控制并行度导出
        exportWithParallelism(exportPath, exportDataMap);

        logMemoryUsage("导出完成后");
        return exportPath.toString();
    }

    /**
     * 基础数据导出
     */
    public String exportBasicDataToExcel(SearchVo searchVo) throws Exception {
        logMemoryUsage("基础导出开始前");

        Path exportPath = prepareExportDirectory(searchVo);
        Map<String, TableExportData> exportDataMap = collectBasicExportData(
                searchVo.getResult(),
                searchVo.getColumns()
        );

        exportWithParallelism(exportPath, exportDataMap);

        logMemoryUsage("基础导出完成后");
        return exportPath.toString();
    }

    /**
     * 控制并行度的导出方法
     */
    private void exportWithParallelism(Path exportPath, Map<String, TableExportData> exportDataMap) {
        int parallelism = Math.max(1, Runtime.getRuntime().availableProcessors() - 1);
        ForkJoinPool customThreadPool = new ForkJoinPool(parallelism);

        try {
            customThreadPool.submit(() ->
                    exportDataMap.entrySet().parallelStream().forEach(entry -> {
                        try {
                            appendToExcelFile(exportPath, entry.getKey(), entry.getValue());
                            // 每处理完一个表提示GC
                            System.gc();
                        } catch (Exception e) {
                            log.error("导出表{}数据失败", entry.getKey(), e);
                            throw new RuntimeException(e);
                        }
                    })).get();
        } catch (Exception e) {
            log.error("并行导出异常", e);
            throw new RuntimeException(e);
        } finally {
            customThreadPool.shutdown();
        }
    }

    /**
     * 准备导出目录
     */
    private Path prepareExportDirectory(SearchVo searchVo) throws IOException {
        String folderPath = String.format("%s%s%s",
                FileUploadUtils.getExportPath(),
                FileSystems.getDefault().getSeparator(),
                searchVo.getUniqueId());

        Path tmpFolderPath = Paths.get(folderPath, "tmp");

        if (!Files.exists(tmpFolderPath)) {
            Files.createDirectories(tmpFolderPath);
            log.info("创建导出目录: {}", tmpFolderPath);
        }

        return tmpFolderPath;
    }

    /**
     * 收集基础导出数据
     */
    private Map<String, TableExportData> collectBasicExportData(
            List<Map<String, Object>> results,
            List<Map<String, String>> columns) {

        Map<String, TableExportData> exportDataMap = new ConcurrentHashMap<>();
        TableExportData tableData = exportDataMap.computeIfAbsent("基础字段", k -> new TableExportData());

        List<ExcelExportEntity> headers = columns.stream()
                .map(col -> new ExcelExportEntity(
                        col.get("title").toString(),
                        col.get("dataIndex")))
                .collect(Collectors.toList());

        if (tableData.getHeaders().isEmpty()) {
            tableData.setHeaders(headers);
        }

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

    /**
     * 追加数据到Excel文件
     */
    private void appendToExcelFile(Path exportPath, String tableName, TableExportData tableData) throws Exception {
        String fileName = String.format("%s%s%s.xlsx",
                exportPath,
                FileSystems.getDefault().getSeparator(),
                tableName);

        File file = new File(fileName);
        Workbook workbook = null;

        try {
            // 1. 处理工作簿
            if (file.exists()) {
                try (InputStream is = new FileInputStream(file)) {
                    workbook = new XSSFWorkbook(is);
                }
            } else {
                workbook = new SXSSFWorkbook(WINDOW_SIZE);
                ((SXSSFWorkbook) workbook).setCompressTempFiles(true);
            }

            // 2. 获取或创建Sheet
            Sheet sheet = workbook.getSheet(DEFAULT_SHEET_NAME);
            if (sheet == null) {
                sheet = workbook.createSheet(DEFAULT_SHEET_NAME);
                createTitleAndHeader(sheet, tableName, tableData.getHeaders());
            }

            // 3. 确定追加位置
            int startRow = sheet.getLastRowNum() + 1;
            if (startRow == 0) { // 全新Sheet
                createTitleAndHeader(sheet, tableName, tableData.getHeaders());
                startRow = 2;
            } else if (startRow == 1) { // 只有标题行
                createHeaderRow(sheet, tableData.getHeaders());
                startRow = 2;
            }

            // 4. 分批写入数据
            appendDataInBatches(sheet, startRow, tableData.getData(), tableData.getHeaders());

            // 5. 设置列宽
            setColumnWidths(sheet, tableData.getHeaders().size());

            // 6. 写入文件
            try (OutputStream os = new FileOutputStream(file)) {
                workbook.write(os);
            }
        } finally {
            // 7. 确保资源释放
            if (workbook != null) {
                try {
                    if (workbook instanceof SXSSFWorkbook) {
                        ((SXSSFWorkbook) workbook).dispose();
                    }
                    workbook.close();
                } catch (IOException e) {
                    log.error("关闭工作簿失败", e);
                }
            }
        }
    }

    /**
     * 分批追加数据到Sheet
     */
    private void appendDataInBatches(Sheet sheet, int startRow,
                                     List<Map<String, Object>> data,
                                     List<ExcelExportEntity> headers) {
        int totalRows = data.size();
        int batches = (int) Math.ceil((double) totalRows / BATCH_SIZE);

        for (int batch = 0; batch < batches; batch++) {
            int fromIndex = batch * BATCH_SIZE;
            int toIndex = Math.min((batch + 1) * BATCH_SIZE, totalRows);
            List<Map<String, Object>> batchData = data.subList(fromIndex, toIndex);

            // 处理当前批次
            for (Map<String, Object> rowData : batchData) {
                Row row = sheet.createRow(startRow++);
                for (int i = 0; i < headers.size(); i++) {
                    ExcelExportEntity header = headers.get(i);
                    Object value = rowData.get(header.getKey());
                    if (value != null) {
                        row.createCell(i).setCellValue(value.toString());
                    }
                }
            }

            // 每处理完一个批次提示GC
            if (batch % 5 == 0) {
                System.gc();
            }
        }
    }

    /**
     * 创建标题和表头
     */
    private void createTitleAndHeader(Sheet sheet, String title, List<ExcelExportEntity> headers) {
        // 只在有表头的情况下才合并单元格
        if (headers != null && !headers.isEmpty()) {
            // 确保列数至少为1
            int lastCol = Math.max(0, headers.size() - 1);
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, lastCol));
        }

        // 标题行样式
        CellStyle titleStyle = sheet.getWorkbook().createCellStyle();
        titleStyle.setAlignment(HorizontalAlignment.CENTER);
        Font titleFont = sheet.getWorkbook().createFont();
        titleFont.setBold(true);
        titleFont.setFontHeightInPoints((short) 14);
        titleStyle.setFont(titleFont);

        // 标题行
        Row titleRow = sheet.createRow(0);
        Cell titleCell = titleRow.createCell(0);
        titleCell.setCellValue(title);
        titleCell.setCellStyle(titleStyle);

        // 表头行样式
        CellStyle headerStyle = sheet.getWorkbook().createCellStyle();
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        Font headerFont = sheet.getWorkbook().createFont();
        headerFont.setBold(true);
        headerStyle.setFont(headerFont);

        // 表头行
        if (headers != null && !headers.isEmpty()) {
            Row headerRow = sheet.createRow(1);
            for (int i = 0; i < headers.size(); i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers.get(i).getName());
                cell.setCellStyle(headerStyle);
            }
        }
    }

    private void createHeaderRow(Sheet sheet, List<ExcelExportEntity> headers) {
        CellStyle headerStyle = sheet.getWorkbook().createCellStyle();
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        Font headerFont = sheet.getWorkbook().createFont();
        headerFont.setBold(true);
        headerStyle.setFont(headerFont);

        Row headerRow = sheet.createRow(1);
        for (int i = 0; i < headers.size(); i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers.get(i).getName());
            cell.setCellStyle(headerStyle);
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
     * 记录内存使用情况
     */
    private void logMemoryUsage(String phase) {
        Runtime runtime = Runtime.getRuntime();
        long used = runtime.totalMemory() - runtime.freeMemory();
        log.info("{} - 内存使用: {}MB/{}MB (最大: {}MB)",
                phase,
                used / (1024 * 1024),
                runtime.totalMemory() / (1024 * 1024),
                runtime.maxMemory() / (1024 * 1024));
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

}