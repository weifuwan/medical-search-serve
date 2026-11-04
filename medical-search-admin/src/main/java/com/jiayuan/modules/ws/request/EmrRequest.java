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
public class EmrRequest {

    /**
     * <![CDATA[<DATA>
     * <HIS_RESID>22a0f9e0-4454-11dc-a6be1-363i03d68668071</HIS_RESID>
     * <CREATIONTIME>2020-10-10 10:10:10</CREATIONTIME>
     * <REQ_SYS_CODE>HIS</REQ_SYS_CODE>
     * <GROUP_CODE>01</GROUP_CODE>
     * <ORGANIZATION_CODE>001</ORGANIZATION_CODE>
     * <DOMAIN_ID>01</DOMAIN_ID>
     * <REQUEST>
     *     <PATIENT_ID>2108230484</PATIENT_ID>
     *     <VISIT_NO>124544</VISIT_NO>
     *     <MEDICAL_CARDNO>254114</MEDICAL_CARDNO>
     *     <EHEALTH_CARD></EHEALTH_CARD>
     *     <OUTPATIENT_NO>2108230484</OUTPATIENT_NO>
     *     <INPATIENT_NO>2108230484</INPATIENT_NO>
     *     <EXEC_DEPT_CODE>201</EXEC_DEPT_CODE>
     * </REQUEST>
     * </DATA>]]>
     */

    private String HIS_RESID;
    private String CREATIONTIME;
    private String REQ_SYS_CODE;
    private String GROUP_CODE;
    private String ORGANIZATION_CODE;
    private String DOMAIN_ID;
    private RequestParam REQUEST;

    @Data
    @Builder
    public static class RequestParam{
        private String PATIENT_ID;
        private String UNICODE;
        private String VISIT_NO;
        private String MEDICAL_CARDNO;
        private String EHEALTH_CARD;
        private String OUTPATIENT_NO;
        private String INPATIENT_NO;
        private String EXEC_DEPT_CODE;
    }


}
