package com.jiayuan.modules.template.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 表分类
 *
 * @author lijiankui
 * @since 1.0.0 2023-02-15
 */
@Data
@TableName("cbdses_table_classify")
public class TableClassifyEntity {

    /**
     * 主键
     */
    private Long id;
    /**
     * 名称
     */
    private String name;
    /**
     * 排列序号
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
     * 最后更新时间
     */
    private Date updateDate;
}