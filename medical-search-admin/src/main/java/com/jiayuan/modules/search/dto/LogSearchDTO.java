package com.jiayuan.modules.search.dto;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * @Title: LogSearchDTO
 * @Package: com.jiayuan.modules.search.dto
 * @Description: 检索日志
 * @Author: 李建奎
 * @Date: 创建时间 2022-12-08
 */
@Data
@ApiModel(value = "检索日志")
public class LogSearchDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "表达式")
    private String expression;

    @ApiModelProperty(value = "创建者")
    private Long creator;

    @ApiModelProperty(value = "创建时间")
    private Date createDate;

    @TableField(exist = false)
    private Integer amount;
}