package com.jiayuan.modules.template.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseDomain;
import com.jiayuan.common.enums.TableSlaveType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 表
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
@TableName("cbdses_table")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TableEntity extends BaseDomain {
    private static final long serialVersionUID = 1L;
    /**
     * 表名称
     */
    private String tableName;
    /**
     * 表编码
     */
    private String tableCode;
    /**
     * 表分类ID
     */
    private Long classifyId;
    /**
     * 排序
     */
    private Integer sort;

    /**
     * 备注
     */
    private String remark;

    /**
     * 是否有效
     */
    private Boolean isEffective;


    /**
     * 是否循环字段
     */
    private Boolean isLoop;

    /**
     * 主键编码
     */
    private String primaryCode;

    /**
     * 表的从属类型(1主表2附表)
     * @see TableSlaveType
     */
    private Integer slaveType;

    /**
     * 关联字段
     */
    @Deprecated
    private String relatedField;

    /**
     * 主表编码
     */
    private String mainTableCode;
    /**
     * 是否显示
     */
    private Boolean isShow;
}