package com.jiayuan.modules.template.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 表分类
 *
 * @author lijiankui
 * @since 1.0.0 2023-02-15
 */
@Data
public class TableClassifyExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "名称")
    private String name;
    @Excel(name = "排列序号")
    private Integer sort;
    @Excel(name = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;
    @Excel(name = "创建时间")
    private Date createDate;
    @Excel(name = "最后更新时间")
    private Date updateDate;

}