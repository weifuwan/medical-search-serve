package com.jiayuan.modules.template.request;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;


@Data
@ApiModel(value = "ES元数据初始化请求参数")
public class ESMetaDataInitRequest implements Serializable {
    private static final long serialVersionUID = -7309566698175663872L;

    @ApiModelProperty(value = "索引名称")
    private String indexName;
}
