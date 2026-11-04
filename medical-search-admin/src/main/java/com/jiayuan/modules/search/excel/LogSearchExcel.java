package com.jiayuan.modules.search.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * @Title: LogSearchExcel
 * @Package: com.jiayuan.modules.search.excel
 * @Description: 检索日志
 * @Author: 李建奎
 * @Date: 创建时间 2022-12-21
 */
@Data
public class LogSearchExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "表达式")
    private String expression;
    @Excel(name = "创建者")
    private Long creator;
    @Excel(name = "创建时间")
    private Date createDate;

}