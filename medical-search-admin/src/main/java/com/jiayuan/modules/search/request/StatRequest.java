package com.jiayuan.modules.search.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;

/**
 * @Title: StatRequest
 * @Package: com.jiayuan.modules.search.dto
 * @Description: 统计参数
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/23
 */
@ApiModel(value = "统计参数")
@Data
public class StatRequest {

    @ApiModelProperty(value = "开始时间")
    private Date startDate;

    @ApiModelProperty(value = "结束时间")
    private Date endDate;
}
