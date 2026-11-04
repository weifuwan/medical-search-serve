package com.jiayuan.modules.template.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 检索符号
 *
 * @author lijiankui
 * @since 1.0.0 2025-04-16
 */
@Data
@TableName("CBDS_SEARCH_SYMBOL")
public class SearchSymbolEntity {

    /**
     * 主键
     */
    private Long id;

    /**
     * 符号值
     */
    private String symbolValue;

    /**
     * 符号展示文本
     */
    private String symbolLabel;

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