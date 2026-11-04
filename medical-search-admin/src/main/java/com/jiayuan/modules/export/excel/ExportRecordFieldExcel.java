package com.jiayuan.modules.export.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 数据导出记录字段信息(高级导出)
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
public class ExportRecordFieldExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "数据导出记录ID")
    private Long exportId;
    @Excel(name = "表ID")
    private String tableId;
    @Excel(name = "表字段ID")
    private String tableFieldId;
    @Excel(name = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;
    @Excel(name = "创建时间")
    private Date createDate;
    @Excel(name = "最后更新时间")
    private Date updateDate;

}