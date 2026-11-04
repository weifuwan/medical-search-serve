package com.jiayuan.modules.export.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 数据导出记录字段信息(高级导出)选择内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
public class ExportRecordFieldContentExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "导出记录字段信息ID")
    private Long fieldId;
    @Excel(name = "字段编码")
    private String code;
    @Excel(name = "字段名称")
    private String name;
    @Excel(name = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;
    @Excel(name = "创建时间")
    private Date createDate;
    @Excel(name = "最后更新时间")
    private Date updateDate;

}