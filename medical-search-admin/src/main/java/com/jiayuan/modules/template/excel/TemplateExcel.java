package com.jiayuan.modules.template.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 模板
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
public class TemplateExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "模板名称")
    private String templateName;
    @Excel(name = "使用范围(0-全院 1-个人)")
    private Integer useScope;
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