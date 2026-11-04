package com.jiayuan.modules.template.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 字段
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
public class FieldExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "字段名称")
    private String fieldName;
    @Excel(name = "字段编码")
    private String fieldCode;
    @Excel(name = "表id")
    private Integer tableId;
    @Excel(name = "排序")
    private Integer sort;
    @Excel(name = "是否删除")
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