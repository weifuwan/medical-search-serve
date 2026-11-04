package com.jiayuan.modules.export.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 数据导出记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Data
@TableName("cbdses_export_record")
public class ExportRecordEntity {

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
     * 排序表编码
     */
    private String orderTableCode;
    /**
     * 排序字段编码
     */
    private String orderFieldCode;
    /**
     * 排序方式
     */
    private String orderMode;
    /**
     * 导出类型(0-基本导出, 1-高级导出)
     */
    private Integer exportType;
    /**
     * 导出字段数量
     */
    private Integer fieldAmount;
    /**
     * 是否删除(1-删除, 0-未删除)
     */
    private Integer isDeleted;
    /**
     * 创建(导出)时间
     */
    private Date createDate;
    /**
     * 创建(导出)人ID
     */
    private String createUserId;
    /**
     * 创建(导出)人名称
     */
    private String createUserName;
    /**
     * 最后更新时间
     */
    private Date updateDate;
    /**
     * 导出状态(1导出进行中，2成功，3失败)
     */
    private Integer status;
    /**
     * 开始时间
     */
    private Date startDate;
    /**
     * 结束时间
     */
    private Date endDate;
    /**
     * 备注
     */
    private String remark;

    /**
     * 文件路径
     */
    private String path;

}