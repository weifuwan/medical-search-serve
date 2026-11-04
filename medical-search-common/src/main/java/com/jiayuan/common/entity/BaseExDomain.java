
package com.jiayuan.common.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @Title: BaseExDomain
 * @Package: com.jiayuan.common.entity
 * @Description: 基础实体类
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-10
 */
@Data
public abstract class BaseExDomain implements Serializable {
    /**
     * id
     */
    @TableId
    private Long id;
    /**
     * 创建者
     */
    @TableField(fill = FieldFill.INSERT)
    private Long creator;
    /**
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    private Date createDate;

    /**
     * 是否删除
     */
    @TableField(fill = FieldFill.INSERT)
    private Integer isDeleted = 0;

    /**
     * 更新者
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updater;

    /**
     * 更新时间
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateDate;

    /**
     * 创建者用户名
     */
    @TableField(fill = FieldFill.INSERT)
    private String creatorName;

    /**
     * 更新者用户名
     */
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updaterName;
}