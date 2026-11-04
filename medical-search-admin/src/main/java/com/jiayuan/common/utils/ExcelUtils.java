
package com.jiayuan.common.utils;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.params.ExcelExportEntity;
import com.google.common.collect.Lists;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.BeanUtils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

/**
 * excel工具类
 *
 * @author lijiankui
 */
public class ExcelUtils {

    /**
     * Excel导出
     *
     * @param response  response
     * @param fileName  文件名
     * @param list      数据List
     * @param pojoClass 对象Class
     */
    public static void exportExcel(HttpServletResponse response, String fileName, Collection<?> list,
                                   Class<?> pojoClass) throws IOException {
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(), pojoClass, list);
        ServletOutputStream out = getOutputStream(response, fileName);
        workbook.write(out);
        out.flush();
    }

    /**
     * Excel导出，先sourceList转换成List<targetClass>，再导出
     *
     * @param response    response
     * @param fileName    文件名
     * @param sourceList  原数据List
     * @param targetClass 目标对象Class
     */
    public static void exportExcelToTarget(HttpServletResponse response, String fileName, Collection<?> sourceList,
                                           Class<?> targetClass) throws Exception {
        List targetList = new ArrayList<>(sourceList.size());
        for (Object source : sourceList) {
            Object target = targetClass.newInstance();
            BeanUtils.copyProperties(source, target);
            targetList.add(target);
        }

        exportExcel(response, fileName, targetList, targetClass);
    }

    /**
     * 检索结果导出
     *
     * @param folderPath 文件夹路径
     * @param fileName   文件名
     * @param dimension  维度(0人次 1人)
     * @param pageData   检索结果
     * @throws Exception
     */
    public static void writeExcel(String folderPath, String fileName, Integer dimension, List<FieldDTO> columnList, List rowsList) throws IOException {
        // 构造表头
        List<ExcelExportEntity> headerList = Lists.newArrayList();
        // 构造数据
        List<Map<String, Object>> dataList = Lists.newArrayList();


        // 人
        if(1 == dimension) {
            headerList = ExcelExportEntityUtil.buildExcelHeader(columnList, rowsList);
            dataList = ExcelExportEntityUtil.buildExcelRow(columnList, rowsList);
        }

        // 人次
        if (0 == dimension) {
            headerList = ExcelExportEntityUtil.buildBaseExcelHeader(columnList, rowsList);
            dataList = ExcelExportEntityUtil.buildBaseExcelRow(columnList, rowsList);
        }

        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams(), headerList, dataList);

        File folderPathFile = new File(folderPath);
        if (!folderPathFile.exists()) {
            boolean result = folderPathFile.mkdirs();
        }

        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(String.format("%s/%s", folderPath, fileName));
            workbook.write(fos);
        } catch (FileNotFoundException ignored) {

        } finally {
            assert fos != null;
            fos.close();
        }
    }

    /**
     * 下载压缩包
     *
     * @param file
     * @param response
     */
    public static void downloadZip(File file, HttpServletResponse response) {
        if (file.exists() == false) {
            System.out.println("待压缩的文件目录：" + file + "不存在.");
        } else {
            try {
                // 以流的形式下载文件。
                InputStream fis = new BufferedInputStream(new FileInputStream(file.getPath()));
                byte[] buffer = new byte[fis.available()];
                fis.read(buffer);
                fis.close();
                // 清空response
                response.reset();

                response.addHeader("Access-Control-Allow-Origin", "*");
                response.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
                response.addHeader("Access-Control-Allow-Headers", "Content-Type");

                response.setContentType("application/octet-stream");
                response.setCharacterEncoding("UTF-8");

                // 如果输出的是中文名的文件，在此处就要用URLEncoder.encode方法进行处理
                response.setHeader("Content-Disposition",
                        "attachment;filename=" + URLEncoder.encode(file.getName(), "UTF-8"));
                // 允许浏览器访问header中的FileName
                response.setHeader("Access-Control-Expose-Headers", "FileName");
                // 设置FileName，转码防止中文乱码
                response.setHeader("FileName", URLEncoder.encode(file.getName(), "UTF-8"));

                OutputStream toClient = new BufferedOutputStream(response.getOutputStream());

                toClient.write(buffer);
                toClient.flush();
                toClient.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    File f = new File(file.getPath());
                    f.delete();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }


    private static ServletOutputStream getOutputStream(HttpServletResponse response, String fileName) throws IOException {
        if (StringUtils.isBlank(fileName)) {
            //当前日期
            fileName = DateUtils.format(new Date());
        }

        response.setCharacterEncoding("UTF-8");
        response.setHeader("content-Type", "application/vnd.ms-excel");
        response.setHeader("Content-Disposition",
                "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8") + ".xls");
        return response.getOutputStream();
    }
}
