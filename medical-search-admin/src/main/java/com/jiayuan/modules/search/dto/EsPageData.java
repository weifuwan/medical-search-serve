package com.jiayuan.modules.search.dto;

import com.jiayuan.modules.template.dto.FieldDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @Title: ESPageData
 * @Package: com.jiayuan.modules.search.dto
 * @Description: ES分页工具
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/16
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@ApiModel(value = "分页数据")
public class EsPageData implements Serializable {

    private static final long serialVersionUID = -2314051450814678935L;

    @ApiModelProperty(value = "表头集合")
    private List<FieldDTO> columnList;

    @ApiModelProperty(value = "总记录数")
    private Long total;

    @ApiModelProperty(value = "列表数据")
    private List rows;

    @ApiModelProperty(value = "查询语句")
    private String query;

    @ApiModelProperty(value = "查询语句1")
    private String query1;

    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    @Data
    public static class Group {

        @ApiModelProperty(value = "基础数据")
        private Object basic;

        @ApiModelProperty(value = "子列表数据")
        private List subList;
    }
}
