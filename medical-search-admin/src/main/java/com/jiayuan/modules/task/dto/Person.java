package com.jiayuan.modules.task.dto;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @Title: com.jiayuan.modules.task.dto
 * @Package: Person
 * @Description: 人员
 * @Author: 李建奎
 * @Date: 创建时间 2024/9/10
 */
@Data
@ToString
public class Person {
    /*
     <DEPT_SN_3></DEPT_SN_3>
     <DEPT_SN_2></DEPT_SN_2>
     <EMP_TIT_NAME>主管护师</EMP_TIT_NAME>
     <JOB_CATEGORY_CODE>2</JOB_CATEGORY_CODE>
     <SEX>2</SEX>
     <DEPT_GROUP_CODE></DEPT_GROUP_CODE>
     <EDUCATION>其他</EDUCATION>
     <UNICODE>0011</UNICODE>
     <SIGNATURE></SIGNATURE>
     <PY_CODE>0011QQQ</PY_CODE>
     <ORDER_FLAG_NAME>禁止使用</ORDER_FLAG_NAME>
     <TYPE>UPDATE</TYPE>
     <STATUS>1</STATUS>
     <OPERATOR_DEPT_CODE>0011</OPERATOR_DEPT_CODE>
     <DINGTALK_ID></DINGTALK_ID>
     <BIRTH_DATE>1985-09-20 00:00:00</BIRTH_DATE>
     <WECHAT_ID></WECHAT_ID>
     <EMP_TIT_CODE>253</EMP_TIT_CODE>
     <OPERATOR_CODE>9999</OPERATOR_CODE>
     <EMP_PHY_CODE></EMP_PHY_CODE>
     <EMP_PO_CODE>3</EMP_PO_CODE>
     <DEPT_SN>0119</DEPT_SN>
     <DEPT_GROUP_NAME></DEPT_GROUP_NAME>
     <HIS_CODE>0011</HIS_CODE>
     <JOB_CATEGORY_NAME>护士</JOB_CATEGORY_NAME>
     <SOCIAL_NO>510623198509200026</SOCIAL_NO>
     <MARK>1</MARK>
     <NAME>秦青青</NAME>
     <CODE>0011</CODE>
     <IFCADRE>0</IFCADRE>
     <ORDER_FLAG_CODE>0</ORDER_FLAG_CODE>
     <OPERATOR_DEPT_NAME>儿科门诊（花园院区）</OPERATOR_DEPT_NAME>
     <EDUCATION_CODE>90</EDUCATION_CODE>
     <DOCTOR_NOTES></DOCTOR_NOTES>
     <EMP_PO_NAME>中级</EMP_PO_NAME>
     <CREATETIME>2025-09-11 14:39:08</CREATETIME>
     <PHONE_NUMBER></PHONE_NUMBER>
     <BEGIN_WORK_DATE></BEGIN_WORK_DATE>
     <OPERATOR_NAME>超级用户</OPERATOR_NAME>
     */

    /**
     * 编码
     */
    private String CODE;
    /**
     * 姓名
     */
    private String NAME;
    /**
     * 性别
     */
    private String SEX;

    /**
     * 手机号
     */
    private String PHONE_NUMBER;
    /**
     * 出生日期
     */
    private Date BIRTH_DATE;
    /**
     * 身份证号
     */
    private String SOCIAL_NO;
    /**
     * 学历代码
     */
    private String EDUCATION_CODE;
    /**
     * 学历名称
     */
    private String EDUCATION;
    /**
     * 所属科室编码
     */
    private String DEPT_SN;
    /**
     * 所属科室编码2
     */
    private String DEPT_SN2;
    /**
     * 所属科室编码3
     */
    private String DEPT_SN3;
    /**
     * 状态0停用1启用
     */
    private Integer STATUS;


}
