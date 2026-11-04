package com.jiayuan.modules.export.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 字段内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-12-29
 */
@Data
@TableName("cbdses_table_field_content")
public class TableFieldContentEntity {

    /**
     * 主键
     */
    private Long id;
    /**
     * 字段id
     */
    private Long fieldId;
    /**
     * 编码
     */
    private String code;
    /**
     * 名称
     */
    private String name;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 是否删除(1-删除, 0-未删除)
     */
    private Integer isDeleted;
    /**
     * 创建时间
     */
    private Date createDate;
    /**
     * 更新时间
     */
    private Date updateDate;
}