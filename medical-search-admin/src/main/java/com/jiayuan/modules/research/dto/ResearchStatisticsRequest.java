package com.jiayuan.modules.research.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * Shared filters for research statistics endpoints.
 */
@Data
@ApiModel("科研统计查询条件")
public class ResearchStatisticsRequest {

    @ApiModelProperty("开始日期，格式 yyyy-MM-dd，包含当天")
    private String startDate;

    @ApiModelProperty("结束日期，格式 yyyy-MM-dd，包含当天")
    private String endDate;

    @ApiModelProperty("趋势粒度：day、week、month，默认 month")
    private String interval = "month";

    @ApiModelProperty("Top N 数量，范围 1-50，默认 10")
    private Integer topSize = 10;
}