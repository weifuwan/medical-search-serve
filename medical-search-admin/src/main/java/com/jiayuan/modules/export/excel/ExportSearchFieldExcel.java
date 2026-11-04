package com.jiayuan.modules.export.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

import java.util.Date;

/**
 * 数据保存显示字段
 *
 * @author lijiankui 
 * @since 1.0.0 2024-10-08
 */
@Data
public class ExportSearchFieldExcel {
            @Excel(name = "主键")
        private Long id;
            @Excel(name = "数据保存记录id")
        private Long saveRecordId;
            @Excel(name = "是否患者(人)基础字段(0否，1是)")
        private Integer isBasic;
            @Excel(name = "是否就诊(人次)基础字段(0否，1是)")
        private Integer isVisitBasic;
            @Excel(name = "是否是字典")
        private Integer isDict;
            @Excel(name = "字典类型")
        private String dictType;
            @Excel(name = "排序")
        private Integer sort;
            @Excel(name = "表编码")
        private String tableCode;
            @Excel(name = "字段编码")
        private String fieldCode;
            @Excel(name = "创建者")
        private Long creator;
            @Excel(name = "创建时间")
        private Date createDate;
            @Excel(name = "是否删除(1-删除, 0-未删除)")
        private Integer isDeleted;
            @Excel(name = "更新者")
        private String updater;
            @Excel(name = "更新时间")
        private Date updateDate;
    
}