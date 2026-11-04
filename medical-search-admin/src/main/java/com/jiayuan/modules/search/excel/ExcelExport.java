package com.jiayuan.modules.search.excel;

import com.jiayuan.common.utils.file.FileUploadUtils;
import com.jiayuan.modules.searchv2.cache.MysqlMetaCache;
import com.jiayuan.modules.searchv2.component.TableFieldInfo;
import com.jiayuan.modules.searchv2.modal.NodeQueryVo;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.Semaphore;
import java.util.concurrent.atomic.AtomicInteger;

@Service
@RequiredArgsConstructor
@Slf4j
public class ExcelExport {
    private static final int DEFAULT_WINDOW_SIZE = 100;
    private static final int MAX_CONCURRENT_EXPORTS = 5;

    private final ThreadPoolTaskExecutor taskExecutor;
    private final AtomicInteger batchCounter = new AtomicInteger(1);
    private Semaphore exportSemaphore;

    @Value("${export.batch-size:800}")
    private int batchSize;

    @Value("${export.window-size:100}")
    private int windowSize;

    @Resource
    private MysqlMetaCache mysqlMetaCache;

    @Resource
    private EsQueryService esQueryService;

    @PostConstruct
    public void init() {
        this.exportSemaphore = new Semaphore(MAX_CONCURRENT_EXPORTS);
        log.info("ExcelExport initialized with max {} concurrent exports", MAX_CONCURRENT_EXPORTS);
    }

    @SneakyThrows
    public String exportToExcel(NodeQueryVo nodeQueryVo, String uuid) {
        List<String> allResults = nodeQueryVo.getResult();
        List<List<String>> batches = partitionList(allResults, batchSize);
        List<CompletableFuture<Void>> futures = new ArrayList<>(batches.size());
        int baseBatchNumber = batchCounter.get();

        Path tmpFolderPath = prepareExportDirectory(uuid);

        for (int i = 0; i < batches.size(); i++) {
            final List<String> batch = batches.get(i);
            final int currentBatchNumber = baseBatchNumber + i;

            CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
                try {
                    exportSemaphore.acquire();
                    processBatch(nodeQueryVo, batch, currentBatchNumber, tmpFolderPath);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    log.warn("Export thread interrupted", e);
                } catch (Exception e) {
                    log.error("Error processing batch {}", currentBatchNumber, e);
                } finally {
                    exportSemaphore.release();
                }
            }, taskExecutor);

            futures.add(future);
        }

        CompletableFuture.allOf(futures.toArray(new CompletableFuture[0])).join();
        return tmpFolderPath.toString();
    }

    private Path prepareExportDirectory(String uuid) throws IOException {
        String folderPath = String.format("%s%s%s",
                FileUploadUtils.getExportPath(),
                FileSystems.getDefault().getSeparator(),
                uuid);

        Path tmpFolderPath = Paths.get(folderPath, "tmp");
        if (!Files.exists(tmpFolderPath)) {
            Files.createDirectories(tmpFolderPath);
            log.info("Created export directory: {}", tmpFolderPath);
        }
        return tmpFolderPath;
    }

    private void processBatch(NodeQueryVo nodeQueryVo, List<String> batch,
                              int batchNumber, Path tmpFolderPath) {
        try {
            Map<String, List<Map<String, Object>>> indexResultsMap =
                    esQueryService.queryEsDataGroupByIndex(nodeQueryVo, batch);

            for (Map.Entry<String, List<Map<String, Object>>> entry : indexResultsMap.entrySet()) {
                String indexName = entry.getKey();
                List<Map<String, Object>> data = entry.getValue();

                String safeIndexName = getSafeIndexName(indexName);
                String filePath = buildExportFilePath(tmpFolderPath, safeIndexName, batchNumber);

                writeIndexDataToExcel(data, indexName, filePath);
                log.debug("Exported {} records to {}", data.size(), filePath);
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to export batch " + batchNumber, e);
        }
    }

    private String getSafeIndexName(String indexName) {
        Map<String, TableFieldInfo> cacheEnToChi = mysqlMetaCache.getCacheEnToChi(indexName);
        TableFieldInfo visitNo = cacheEnToChi.get("visit_no");
        return visitNo != null ? visitNo.getTableName() : indexName;
    }

    private String buildExportFilePath(Path folder, String indexName, int batchNumber) {
        return folder.resolve(String.format("%s_export_%d.xlsx", indexName, batchNumber)).toString();
    }

    private void writeIndexDataToExcel(List<Map<String, Object>> data,
                                       String indexName,
                                       String filePath) throws IOException {
        // 使用配置的窗口大小，默认100行在内存中
        try (SXSSFWorkbook workbook = new SXSSFWorkbook(windowSize)) {
            Sheet sheet = workbook.createSheet(indexName);

            if (!data.isEmpty()) {
                createHeaderRow(sheet, data.get(0), indexName);
                populateDataRows(sheet, data);
            }

            ensureParentDirectoryExists(filePath);
            writeWorkbookToFile(workbook, filePath);
        }
    }

    private void createHeaderRow(Sheet sheet, Map<String, Object> sampleRow, String indexName) {
        Row headerRow = sheet.createRow(0);
        int colNum = 0;

        // 固定表头
        headerRow.createCell(colNum++).setCellValue("Index");
        headerRow.createCell(colNum++).setCellValue("Row ID");

        // 动态表头
        Map<String, TableFieldInfo> fieldMap = mysqlMetaCache.getCacheEnToChi(indexName);
        for (String key : sampleRow.keySet()) {
            if (!key.startsWith("_")) {
                String headerName = Optional.ofNullable(fieldMap.get(key))
                        .map(TableFieldInfo::getFieldName)
                        .orElse(key);
                headerRow.createCell(colNum++).setCellValue(headerName);
            }
        }
    }

    private void populateDataRows(Sheet sheet, List<Map<String, Object>> data) {
        Map<String, Object> firstRow = data.get(0);
        int rowNum = 1;

        for (Map<String, Object> rowData : data) {
            Row row = sheet.createRow(rowNum++);
            int cellNum = 0;

            // 固定列
            row.createCell(cellNum++).setCellValue(sheet.getSheetName());
            row.createCell(cellNum++).setCellValue(rowData.get("_row_id").toString());

            // 数据列
            for (String key : firstRow.keySet()) {
                if (!key.startsWith("_")) {
                    setCellValue(row.createCell(cellNum++), rowData.get(key));
                }
            }
        }
    }

    private void ensureParentDirectoryExists(String filePath) throws IOException {
        Path parentDir = Paths.get(filePath).getParent();
        if (parentDir != null) {
            Files.createDirectories(parentDir);
        }
    }

    private void writeWorkbookToFile(SXSSFWorkbook workbook, String filePath) throws IOException {
        try (FileOutputStream fos = new FileOutputStream(filePath)) {
            workbook.write(fos);
        } finally {
            workbook.dispose(); // 清理临时文件
        }
    }

    private void setCellValue(Cell cell, Object value) {
        if (value == null) {
            cell.setCellValue("");
        } else if (value instanceof String) {
            cell.setCellValue((String) value);
        } else if (value instanceof Number) {
            cell.setCellValue(((Number) value).doubleValue());
        } else if (value instanceof Boolean) {
            cell.setCellValue((Boolean) value);
        } else if (value instanceof Date) {
            cell.setCellValue((Date) value);
        } else {
            cell.setCellValue(value.toString());
        }
    }

    private <T> List<List<T>> partitionList(List<T> list, int batchSize) {
        List<List<T>> batches = new ArrayList<>();
        for (int i = 0; i < list.size(); i += batchSize) {
            batches.add(list.subList(i, Math.min(i + batchSize, list.size())));
        }
        return batches;
    }
}