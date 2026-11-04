package com.jiayuan.modules.security.dto;

import lombok.Data;

/**
 * @Title: SsoUserDTO
 * @Package: com.jiayuan.modules.security.dto
 * @Description: 单点登录返回信息
 * @Author: 李建奎
 * @Date: 创建时间 2023-09-04
 */
@Data
public class SsoUserDTO {
    private Boolean expired;
    private String orgCode;
    private String userName;
    private String userId;
    private String groupCode;
    private String errorMsg;
    private String caJson;
}
