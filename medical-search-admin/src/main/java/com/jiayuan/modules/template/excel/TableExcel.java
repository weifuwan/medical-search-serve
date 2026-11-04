package com.jiayuan.modules.template.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 表
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
public class TableExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "组名称")
    private String tableName;
    @Excel(name = "组编码")
    private String tableCode;
    @Excel(name = "排序")
    private Integer sort;
    @Excel(name = "是否使用")
    private Integer isDeleted;
    @Excel(name = "创建者")
    private Long creator;
    @Excel(name = "创建时间")
    private Date createDate;
    @Excel(name = "更新者")
    private Long updater;
    @Excel(name = "更新时间")
    private Date updateDate;
    @Excel(name = "备注")
    private String remark;

}