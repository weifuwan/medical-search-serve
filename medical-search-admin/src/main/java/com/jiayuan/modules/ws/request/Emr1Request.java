package com.jiayuan.modules.ws.request;

import lombok.Builder;
import lombok.Data;

/**
 * @Title: com.jiayuan.modules.ws.request
 * @Package: EmrRequest
 * @Description: TODO
 * @Author: 李建奎
 * @Date: 创建时间 2024/9/18
 */
@Data
@Builder
public class Emr1Request {

    private String HIS_RESID;
    private String CREATIONTIME;
    private String REQ_SYS_CODE;
    private String GROUP_CODE;
    private String ORGANIZATION_CODE;
    private String DOMAIN_ID;
    private String PATIENT_ID;
    private String VISIT_NO;


}
