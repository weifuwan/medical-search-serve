package com.jiayuan.modules.export.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 数据检索保存记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
public class ExportSearchResultExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "数据保存名称")
    private String name;
    @Excel(name = "维度(0人次 1人)")
    private Integer dimension;
    @Excel(name = "数量")
    private Integer amount;
    @Excel(name = "检索表达式")
    private String expression;
    @Excel(name = "备注")
    private String remark;
    @Excel(name = "排序表编码")
    private String orderTableCode;
    @Excel(name = "排序字段编码")
    private String orderFieldCode;
    @Excel(name = "排序方式")
    private String orderMode;
    @Excel(name = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;
    @Excel(name = "创建时间")
    private Date createDate;
    @Excel(name = "最后更新时间")
    private Date updateDate;

}