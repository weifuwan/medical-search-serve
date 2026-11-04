package com.jiayuan.core.poi;
import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.params.ExcelExportEntity;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

public class EasypoiExcelExportTest {
    public static void main(String[] args) {
        // 定义导出参数
        ExportParams exportParams = new ExportParams();
        exportParams.setTitle("测试数据");
        exportParams.setSheetName("Sheet1");

        // 定义表头
        List<ExcelExportEntity> headerList = new ArrayList<>();
        ExcelExportEntity nameHeader = new ExcelExportEntity("姓名", "name");
        headerList.add(nameHeader);
        ExcelExportEntity ageHeader = new ExcelExportEntity("年龄", "age");
        headerList.add(ageHeader);

        // 定义数据
        List<Map<String, Object>> dataList = new ArrayList<>();
        Map<String, Object> data1 = new HashMap<>();
        data1.put("name", "张三");
        data1.put("age", 20);
        dataList.add(data1);

        Map<String, Object> data2 = new HashMap<>();
        data2.put("name", "李四");
        data2.put("age", 25);
        dataList.add(data2);

        // 导出 Excel
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams, headerList, dataList);
        // 获取工作表
        Sheet sheet = workbook.getSheetAt(0);

        // 设置列宽（这里设置第一列宽度为 20 个字符宽度，第二列宽度为 10 个字符宽度）
        sheet.setColumnWidth(0, 20 * 256);
        sheet.setColumnWidth(1, 10 * 256);
        // 将 Excel 写入文件
        try (FileOutputStream fos = new FileOutputStream("D:\\test.xlsx")) {
            workbook.write(fos);
            System.out.println("Excel 导出成功！");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (workbook != null) {
                    workbook.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}