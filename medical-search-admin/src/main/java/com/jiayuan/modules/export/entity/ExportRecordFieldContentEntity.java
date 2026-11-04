package com.jiayuan.modules.export.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 数据导出记录字段信息(高级导出)选择内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@TableName("cbdses_export_record_field_content")
public class ExportRecordFieldContentEntity {

    /**
     * 主键
     */
    private Long id;
    /**
     * 导出记录字段信息ID
     */
    private Long fieldId;
    /**
     * 字段编码
     */
    private String code;
    /**
     * 字段名称
     */
    private String name;
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