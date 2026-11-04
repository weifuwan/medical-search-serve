package com.jiayuan.modules.export.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 数据检索保存记录回收站
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
public class ExportRecycleBinExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "数据保存记录ID")
    private Long searchId;
    @Excel(name = "数据保存记录名称")
    private String searchName;
    @Excel(name = "维度(0人次 1人)")
    private Integer dimension;
    @Excel(name = "数量")
    private Integer amount;
    @Excel(name = "检索表达式")
    private String expression;
    @Excel(name = "备注")
    private String remark;
    @Excel(name = "过期清除截止日期")
    private Date expireDate;
    @Excel(name = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;
    @Excel(name = "创建(删除)时间")
    private Date createDate;
    @Excel(name = "创建(删除)人ID")
    private String createUserId;
    @Excel(name = "创建(删除)人名称")
    private String createUserName;
    @Excel(name = "最后更新时间")
    private Date updateDate;

}