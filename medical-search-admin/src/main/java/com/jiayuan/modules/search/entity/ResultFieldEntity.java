package com.jiayuan.modules.search.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseDomain;
import lombok.Data;

/**
 * @Title: ResultFieldEntity
 * @Package: com.jiayuan.modules.search.entity
 * @Description: 返回结果表头
 * @Author: 李建奎
 * @Date: 创建时间 2022-12-01
 */
@Data
@TableName("cbdses_result_field")
public class ResultFieldEntity extends BaseDomain {

    /**
     * 字段编码
     */
    private String fieldCode;
    /**
     * 表编码
     */
    private String tableCode;

    /**
     * 排序
     */
    private Integer sort;
    /**
     * 是否默认
     */
    private Integer isDefault;

    /**
     * 是否是(人)基础信息
     */
    private Integer isBasic;
    /**
     * 是否是(人次)基础信息
     */
    private Integer isVisitBasic;

    /**
     * 是否是字典
     */
    private Integer isDict;

    /**
     * 字典类型
     */
    private String dictType;
    /**
     * 用户id
     */
    private Long userId;
}