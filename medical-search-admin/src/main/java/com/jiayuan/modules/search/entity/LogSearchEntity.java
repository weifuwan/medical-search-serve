package com.jiayuan.modules.search.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Title: LogSearchEntity
 * @Package: com.jiayuan.modules.search.entity
 * @Description: 检索日志
 * @Author: 李建奎
 * @Date: 创建时间 2022-12-08
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@TableName("cbdses_log_search")
public class LogSearchEntity extends BaseEntity {

    /**
     * 表达式
     */
    private String expression;


    @TableField(exist = false)
    private Integer amount;
}