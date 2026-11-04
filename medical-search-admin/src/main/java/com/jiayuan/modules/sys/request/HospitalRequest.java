package com.jiayuan.modules.sys.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Title: HospitalRequest
 * @Package: com.jiayuan.modules.sys.request
 * @Description: 医院配置请求
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/12
 */
@Data
@ApiModel("医院配置参数")
public class HospitalRequest {

    @ApiModelProperty("医院logo")
    private MultipartFile file;

    @ApiModelProperty("医院名称")
    private String hospitalName;

    @ApiModelProperty("编号")
    private Long id;
}
