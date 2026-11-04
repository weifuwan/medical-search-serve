package com.jiayuan.modules.template.request;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;


@Data
@ApiModel(value = "注释请求参数")
@Builder
public class CommentRequest implements Serializable {
    private static final long serialVersionUID = -7309566698175663872L;



    @ApiModelProperty(value = "数据库类型")
    private String dbType;


}
