package com.jiayuan.modules.template.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseExDomain;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Title: TableFieldEntity
 * @Package: com.jiayuan.modules.template.entity
 * @Description: 字段
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-25
 */
@Data
@Builder
@TableName("cbdses_table_field")
@AllArgsConstructor
@NoArgsConstructor
public class TableFieldEntity extends BaseExDomain {
    private static final long serialVersionUID = 1L;
    /**
     * 字段名称
     */
    private String fieldName;
    /**
     * 字段编码
     */
    private String fieldCode;
    /**
     * 数据类型
     */
    private String dataType;
    /**
     * 表id
     */
    private Long tableId;

    /**
     * 表编码
     */
    private String tableCode;
    /**
     * 排序
     */
    private Integer sort;

    /**
     * 字段类型 FieldUseType枚举值
     * @see com.jiayuan.common.enums.FieldUseType
     */
    private Integer fieldType;

    /**
     * 备注
     */
    private String remark;

    /**
     * 是否有效
     */
    private Boolean isEffective;
    /**
     * 是否显示
     */
    private Boolean isShow;
}