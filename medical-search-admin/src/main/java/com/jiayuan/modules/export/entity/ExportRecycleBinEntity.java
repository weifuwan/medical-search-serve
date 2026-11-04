package com.jiayuan.modules.export.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 数据检索保存记录回收站
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@TableName("cbdses_export_recycle_bin")
public class ExportRecycleBinEntity {

    /**
     * 主键
     */
    private Long id;
    /**
     * 数据保存记录ID
     */
    private Long searchId;
    /**
     * 数据保存记录名称
     */
    private String searchName;
    /**
     * 维度(0人次 1人)
     */
    private Integer dimension;
    /**
     * 数量
     */
    private Integer amount;
    /**
     * 检索表达式
     */
    private String expression;
    /**
     * 备注
     */
    private String remark;
    /**
     * 过期清除截止日期
     */
    private Date expireDate;
    /**
     * 是否删除(1-删除, 0-未删除)
     */
    private Integer isDeleted;
    /**
     * 创建(删除)时间
     */
    private Date createDate;
    /**
     * 创建(删除)人ID
     */
    private String createUserId;
    /**
     * 创建(删除)人名称
     */
    private String createUserName;
    /**
     * 最后更新时间
     */
    private Date updateDate;
}