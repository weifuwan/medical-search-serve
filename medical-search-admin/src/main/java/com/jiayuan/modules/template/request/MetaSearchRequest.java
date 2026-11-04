package com.jiayuan.modules.template.request;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;


@Data
@ApiModel(value = "元数据搜索")
@Builder
public class MetaSearchRequest implements Serializable {
    private static final long serialVersionUID = -7309566698175663872L;


    @ApiModelProperty(value = "1表，2字段")
    private Integer type;

    @ApiModelProperty(value = "查询关键字(表或字段名称)")
    private String keyword;

    @ApiModelProperty(value = "表分类ID")
    private Long classifyId;
}
