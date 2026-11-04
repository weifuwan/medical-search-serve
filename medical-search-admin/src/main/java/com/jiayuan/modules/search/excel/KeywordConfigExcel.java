package com.jiayuan.modules.search.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 关键字检索配置
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
public class KeywordConfigExcel {
    @Excel(name = "主键")
    private Long id;
    @Excel(name = "关键字")
    private String keyword;
    @Excel(name = "字段id")
    private Integer fieldId;
    @Excel(name = "创建者")
    private Long creator;
    @Excel(name = "创建时间")
    private Date createDate;
    @Excel(name = "是否删除")
    private Integer isDeleted;

}