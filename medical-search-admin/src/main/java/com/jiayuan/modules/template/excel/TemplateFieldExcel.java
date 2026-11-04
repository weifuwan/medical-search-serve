package com.jiayuan.modules.template.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 模板和字段的映射关系
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
public class TemplateFieldExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "模板id")
    private Integer templateId;
    @Excel(name = "字段id")
    private Integer fieldId;
    @Excel(name = "字段值")
    private String fieldVal;
    @Excel(name = "符号")
    private Integer symbol;
    @Excel(name = "与下一条的关系")
    private Integer nextRelation;
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