package com.jiayuan.modules.search.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @Title: StatVO
 * @Package: com.jiayuan.modules.search.vo
 * @Description: 统计vo
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/23
 */
public class StatDTO {

    /**
     * 数据统计
     */
    @Data
    @ApiModel("数据统计")
    public static class DataStat {

        @ApiModelProperty("人数")
        private Long persons;

        @ApiModelProperty("人次")
        private Long personTimes;

    }

    /**
     * 导出占比统计
     */
    @Data
    @ApiModel("导出占比统计")
    public static class ExportStat {

        @ApiModelProperty("基本导出")
        private Long baseExportTimes;

        @ApiModelProperty("高级导出")
        private Long highExportTimes;
    }
}
