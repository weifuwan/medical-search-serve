package com.jiayuan.modules.template.request;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;


@Data
@ApiModel(value = "元数据合并请求参数")
public class MetaDataMergeRequest implements Serializable {
    private static final long serialVersionUID = -7309566698175663872L;

    @ApiModelProperty(value = "是否重置元数据")
    private Boolean isReset = false;

    @ApiModelProperty(value = "是否补充注释")
    private Boolean isAddComment;

    @ApiModelProperty(value = "数据库类型(mysql/oracle)")
    private String dbType;


}
