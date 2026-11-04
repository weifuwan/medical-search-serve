package com.jiayuan.modules.search.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 返回结果表头
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
public class ResultFieldExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "关联字段id")
    private Integer fieldId;
    @Excel(name = "是否默认")
    private Integer isDefault;
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