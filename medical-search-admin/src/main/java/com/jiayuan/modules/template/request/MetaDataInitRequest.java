package com.jiayuan.modules.template.request;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;


@Data
@ApiModel(value = "元数据初始化请求参数")
public class MetaDataInitRequest implements Serializable {
    private static final long serialVersionUID = -7309566698175663872L;

    @ApiModelProperty(value = "正则表达式")
    private String regex;

    @ApiModelProperty(value = "是否取反")
    private Boolean negation;

    @ApiModelProperty(value = "数据库类型")
    private String dbType;

    @ApiModelProperty(value = "索引名称")
    private String indexName;
}
