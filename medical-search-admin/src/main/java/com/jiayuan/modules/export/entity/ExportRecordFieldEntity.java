package com.jiayuan.modules.export.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 数据导出记录字段信息(高级导出)
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@TableName("cbdses_export_record_field")
public class ExportRecordFieldEntity {

    /**
     * 主键
     */
    private Long id;
    /**
     * 数据导出记录ID
     */
    private Long exportId;
    /**
     * 表ID
     */
    private Long tableId;
    /**
     * 表字段ID
     */
    private Long tableFieldId;
    /**
     * 是否删除(1-删除, 0-未删除)
     */
    private Integer isDeleted;
    /**
     * 创建时间
     */
    private Date createDate;
    /**
     * 最后更新时间
     */
    private Date updateDate;
}