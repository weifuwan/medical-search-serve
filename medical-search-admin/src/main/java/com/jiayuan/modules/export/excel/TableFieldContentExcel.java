package com.jiayuan.modules.export.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 字段内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-12-29
 */
@Data
public class TableFieldContentExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "字段id")
    private Long fieldId;
    @Excel(name = "编码")
    private String code;
    @Excel(name = "名称")
    private String name;
    @Excel(name = "排序")
    private Integer sort;
    @Excel(name = "是否删除(1-删除, 0-未删除)")
    private Integer isDeleted;
    @Excel(name = "创建时间")
    private Date createDate;
    @Excel(name = "更新时间")
    private Date updateDate;

}