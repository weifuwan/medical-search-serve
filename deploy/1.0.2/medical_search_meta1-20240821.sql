/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.116
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 192.168.1.116:3306
 Source Schema         : medical_search_meta1

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 21/08/2024 14:22:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cdr_aers_reportcard
-- ----------------------------
DROP TABLE IF EXISTS `cdr_aers_reportcard`;
CREATE TABLE `cdr_aers_reportcard`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一键',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区名称',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编码',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床编码',
  `REPORT_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告编码',
  `CLASS_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '不良事件类别代码 1输血相关事件 2药物相关事件 3手术相关事件 4麻醉相关事件 5院内感染事件 6其他医护差错 7医疗设备机械事件 8跌倒事件 9公共意外事件 10治安事件',
  `REPORT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '上报时间',
  `REPORT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上报科室编码',
  `REPORT_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上报科室名称',
  `REPORT_WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上报病区编码',
  `REPORT_WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上报病区名称',
  `REPORTER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上报人代码',
  `REPORTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上报人名称',
  `DUTY_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士编码',
  `DUTY_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士名称',
  `HAPPEN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '发生时间',
  `HAPPEN_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发生地点',
  `HAPPEN_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发生原因',
  `NOTE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '事件描述',
  `NURSING_METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '护理措施及处理方法',
  `HEAD_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护士长代码',
  `HEAD_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护士长名称',
  `HEAD_NURSE_RECORD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '护士长记录',
  `DEPT_HEAD_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科护士长编码',
  `DEPT_HEAD_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科护士长名称',
  `DEPT_HEAD_NURSE_RECORD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '科护士长记录',
  `VERIFY_OPER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人代码',
  `VERIFY_OPER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人名称',
  `VERIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `OPER_TIME` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `EXTUBATION_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拔管类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_aers_reportcard
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_aers_reportcard_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_aers_reportcard_records`;
CREATE TABLE `cdr_aers_reportcard_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASS_CODE` decimal(65, 30) NULL DEFAULT NULL,
  `REPORT_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DUTY_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DUTY_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HAPPEN_TIME` datetime(0) NULL DEFAULT NULL,
  `HAPPEN_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HAPPEN_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NOTE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `NURSING_METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `HEAD_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HEAD_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HEAD_NURSE_RECORD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DEPT_HEAD_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_HEAD_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_HEAD_NURSE_RECORD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `VERIFY_OPER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERIFY_OPER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VERIFY_TIME` datetime(0) NULL DEFAULT NULL,
  `OPER_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `EXTUBATION_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_aers_reportcard_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_allergyinfoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_allergyinfoquery`;
CREATE TABLE `cdr_allergyinfoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `BEDNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床号',
  `ALLERGIC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏记录ID',
  `RECORD_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录医生编码',
  `RECORD_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录医生',
  `RECORD_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录科室编码',
  `RECORD_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录科室',
  `ORDER_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱号',
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `ALLERGIC_STARTDATE` datetime(0) NULL DEFAULT NULL COMMENT '过敏开始时间',
  `ALLERGIC_ENDDATE` datetime(0) NULL DEFAULT NULL COMMENT '过敏结束时间',
  `FAMILY_ALLERGIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '是否家族史 0.否，1，是',
  `ALLERGEN_DIAGNOS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏诊断编码',
  `ALLERGEN_DIAGNOS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏诊断名称',
  `ALLERGENCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏原编码',
  `ALLERGICTYPE` decimal(1, 0) NULL DEFAULT NULL COMMENT '过敏类型编码 1药物2食物3环境4混合性过敏源5其他过敏源',
  `MEMO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏备注',
  `SERIOUSNESS` decimal(1, 0) NULL DEFAULT NULL COMMENT '过敏严重程度编码 1轻度2中度3重度',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_allergyinfoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_appointment_infoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_appointment_infoquery`;
CREATE TABLE `cdr_appointment_infoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统域标识',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `VISIT_TIMES` decimal(3, 0) NOT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊流水号',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者id',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者姓名',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `BED_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位',
  `LIST_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `APPOINT_TYPE` decimal(2, 0) NOT NULL COMMENT '预约场景 1挂号2手术3检查4检验5收费结算',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请单号',
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应医嘱号',
  `APPOINT_CHECK_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约项目名称',
  `APPOINT_TIME` datetime(0) NOT NULL COMMENT '预约时间',
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约单流水号',
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约排序号',
  `APPOINT_CHECKTIME` datetime(0) NOT NULL COMMENT '预约检查时间',
  `APPOINT_EQUIP_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约设备编码',
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约设备名称',
  `APPOINT_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约诊室编码',
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约诊室名称',
  `APPOINT_OPERATOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约登记人员编码',
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约登记人员名称',
  `APPOINT_STATUS` decimal(1, 0) NOT NULL COMMENT '预约状态 1未预约 2预约完成 3取消预约 ',
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `DELETE_FLAG` decimal(1, 0) NOT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `OUTPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊号',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_appointment_infoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_bed_emr
-- ----------------------------
DROP TABLE IF EXISTS `cdr_bed_emr`;
CREATE TABLE `cdr_bed_emr`  (
  `WARD_CODE` decimal(18, 0) NOT NULL,
  `BED_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ROOM_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_CODE` decimal(18, 0) NULL DEFAULT NULL,
  `BED_APPROVED_TYPE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_SEX_TYPE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_CLASS` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_STATUS` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_LABEL` varchar(153) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOCAL_BED_CODE` varchar(153) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_bed_emr
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_bedchangeinfoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_bedchangeinfoquery`;
CREATE TABLE `cdr_bedchangeinfoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `CURRENT_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人工号',
  `CURRENT_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `TRANS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `ORGBED_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '换前床号',
  `CURRENTBED_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '换后床号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_bedchangeinfoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_bedchangeinfoquery_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_bedchangeinfoquery_records`;
CREATE TABLE `cdr_bedchangeinfoquery_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENT_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENT_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANS_DATE` datetime(0) NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGBED_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENTBED_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_bedchangeinfoquery_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_blood_glucose
-- ----------------------------
DROP TABLE IF EXISTS `cdr_blood_glucose`;
CREATE TABLE `cdr_blood_glucose`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识01门诊，02住院，03体检，04急诊',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `BED_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位',
  `MEASURE_VALUE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测量值',
  `MEASURE_DATE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测量时段',
  `MEASURE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '测量时间',
  `OPRATOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测量人ID',
  `OPRATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测量人姓名',
  `OPERATE_STATE` decimal(4, 0) NULL DEFAULT NULL COMMENT '操作状态 0:未操作1:已操作',
  `OPERATE_TYPE` decimal(4, 0) NULL DEFAULT NULL COMMENT '操作类型 1:增加2:修改3:删除',
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_blood_glucose
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_blood_glucose_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_blood_glucose_records`;
CREATE TABLE `cdr_blood_glucose_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEASURE_VALUE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEASURE_DATE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEASURE_TIME` datetime(0) NULL DEFAULT NULL,
  `OPRATOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPRATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATE_STATE` decimal(4, 0) NULL DEFAULT NULL,
  `OPERATE_TYPE` decimal(4, 0) NULL DEFAULT NULL,
  `REMARK` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_blood_glucose_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_bloodtrans_appinfoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_bloodtrans_appinfoquery`;
CREATE TABLE `cdr_bloodtrans_appinfoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区代码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区',
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `DIAGNOSIS` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '患者收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '患者舒张压',
  `TEMPERATURE` decimal(2, 1) NULL DEFAULT NULL COMMENT '患者体温',
  `PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '患者脉搏',
  `PREGNANT_NO` decimal(65, 30) NULL DEFAULT NULL COMMENT '孕次',
  `BORNED_NO` decimal(65, 30) NULL DEFAULT NULL COMMENT '产次',
  `ABO_BLOOD_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ABO血型代码',
  `RH_BLOOD_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者RH血型代码',
  `ILLNESS_CURRENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病史信息',
  `TRANSFUSION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输血史',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单号',
  `APPLY_DESC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单详细信息',
  `CHECK_APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请日期时间',
  `AUTHOR_TIME` datetime(0) NULL DEFAULT NULL COMMENT '开单时间',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生工号',
  `APPLY_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期时间',
  `ASSIGNED_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生工号',
  `ASSIGNED_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生',
  `ABO_BLOOD_APPLY_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请ABO血型代码',
  `ABO_BLOOD_APPLY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请ABO血型',
  `RH_BLOOD_APPLY_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请RH血型代码',
  `RH_BLOOD_APPLY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请RH血型',
  `BLOOD_COLLECT_LOCATION` decimal(3, 0) NULL DEFAULT NULL COMMENT '采血标记 0：否/1：是',
  `TRANSFUSION_LOCATION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血地点',
  `TRANSFUSION_PURPOSE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血目的',
  `TRANSFUSION_URGENTFLAG` decimal(3, 0) NULL DEFAULT NULL COMMENT '输血紧急标志 0：否/1：是',
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TRANSFUSION_VOLUME_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请血量单位',
  `TRANSFUSION_VOLUME` decimal(3, 0) NULL DEFAULT NULL COMMENT '申请血量',
  `EXEC_STATUSCODE` decimal(3, 0) NULL DEFAULT NULL COMMENT '执行状态 1“已申请”，2“已确认”，3“已备血”，4“科室领用”，5“开始输血”，6“输血结束”，7“退还”，8“撤销”',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_bloodtrans_appinfoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_bloodtrans_appinfoquery_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_bloodtrans_appinfoquery_records`;
CREATE TABLE `cdr_bloodtrans_appinfoquery_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL,
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL,
  `TEMPERATURE` decimal(2, 1) NULL DEFAULT NULL,
  `PULSE` decimal(65, 30) NULL DEFAULT NULL,
  `PREGNANT_NO` decimal(65, 30) NULL DEFAULT NULL,
  `BORNED_NO` decimal(65, 30) NULL DEFAULT NULL,
  `ABO_BLOOD_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RH_BLOOD_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ILLNESS_CURRENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TRANSFUSION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DESC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `AUTHOR_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL,
  `ASSIGNED_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ABO_BLOOD_APPLY_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ABO_BLOOD_APPLY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RH_BLOOD_APPLY_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RH_BLOOD_APPLY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BLOOD_COLLECT_LOCATION` decimal(3, 0) NULL DEFAULT NULL,
  `TRANSFUSION_LOCATION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSFUSION_PURPOSE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSFUSION_URGENTFLAG` decimal(3, 0) NULL DEFAULT NULL,
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSFUSION_VOLUME_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSFUSION_VOLUME` decimal(3, 0) NULL DEFAULT NULL,
  `EXEC_STATUSCODE` decimal(3, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_bloodtrans_appinfoquery_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_bloodtrans_status
-- ----------------------------
DROP TABLE IF EXISTS `cdr_bloodtrans_status`;
CREATE TABLE `cdr_bloodtrans_status`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用血申请单号',
  `EXEC_STATUSCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行状态 1“已申请”，2“已确认”，3“已备血”，4“科室领用”，5“开始输血”，6“输血结束”，7“退还”，8“撤销”',
  `EXEC_DATE` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `EXEC_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行医生工号',
  `EXEC_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行医生',
  `EXEC_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_bloodtrans_status
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_applyinfo
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_applyinfo`;
CREATE TABLE `cdr_check_applyinfo`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码',
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区代码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区',
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `APPLY_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请单详细内容',
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL COMMENT '申请单有效日期上限',
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL COMMENT '申请单有效日期下限',
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生工号',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱ID',
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类项目编码',
  `CHECK_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目名称',
  `CHECK_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型编码',
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型名称',
  `CHECK_EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `URGENTFLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '加急标志0:否/1：是',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态 1未缴费2已缴费3退费',
  `APPLY_STATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单状态 0,\'待检\',1,登记\',2,\'已出报告,3,拒绝执行4，取消执行',
  `CHARGE_FEE` decimal(14, 2) NULL DEFAULT NULL COMMENT '检查申请项目费用',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '预约时间（进行预约的当前时间）',
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约登记人员编码',
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约登记人员名称',
  `APPOINT_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '预约状态编码（1未预约 2预约完成 3取消预约  ）',
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL COMMENT '预约检查时间',
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约流水号',
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约排序号',
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约设备名称',
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约诊室名称（例如:彩超室一，彩超室二）',
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子健康卡号',
  `APPOINT_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约诊室编码',
  `ORDER_NOTE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `OBSERVATION_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留观号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_applyinfo
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_applyinfo_bf
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_applyinfo_bf`;
CREATE TABLE `cdr_check_applyinfo_bf`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DESC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_EXEC_TIME` datetime(0) NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URGENTFLAG` decimal(65, 30) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPLY_STATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_FEE` decimal(14, 2) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_applyinfo_bf
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_applyinfo_details
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_applyinfo_details`;
CREATE TABLE `cdr_check_applyinfo_details`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `CHECK_ITEM_NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目名称',
  `CHECK_SITE_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查部位编码',
  `CHECK_SITE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查部位名称',
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `CHECK_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查方法，一个部位对应一个方法',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `SITE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一行'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_applyinfo_details
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_applyinfo_details_bf
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_applyinfo_details_bf`;
CREATE TABLE `cdr_check_applyinfo_details_bf`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `CHECK_ITEM_NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_SITE_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_SITE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `SITE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_applyinfo_details_bf
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_applyinfo_lt_bak_20240514
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_applyinfo_lt_bak_20240514`;
CREATE TABLE `cdr_check_applyinfo_lt_bak_20240514`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_EXEC_TIME` datetime(0) NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URGENTFLAG` decimal(65, 30) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPLY_STATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_FEE` decimal(14, 2) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_NOTE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBSERVATION_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_applyinfo_lt_bak_20240514
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_applyinfo_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_applyinfo_records`;
CREATE TABLE `cdr_check_applyinfo_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_EXEC_TIME` datetime(0) NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URGENTFLAG` decimal(65, 30) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPLY_STATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_FEE` decimal(14, 2) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_NOTE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBSERVATION_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_applyinfo_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_report`;
CREATE TABLE `cdr_check_report`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生工号',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告时间',
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生编码',
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生',
  `REVIEW_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `REVIEW_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告号',
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '整张报告图片信息',
  `REPORT_ORDER_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查号',
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目编码',
  `CHECK_ITEM_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '检查项目名称',
  `CHECK_TYPECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型编码',
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型名称',
  `REPORT_MEMO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查备注',
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '总测量次数',
  `IMAGING_FINDING` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '客观所见内容',
  `IMAGING_CONCLUSION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主观提示内容',
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断代码（主要诊断)',
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断名称（主要诊断）',
  `CHECK_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查方法名称',
  `EXAM_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查医生编码',
  `EXAM_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查医生名称',
  `EXAM_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查科室编码',
  `EXAM_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查科室名称',
  `MANUFACTURE_RCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仪器型号',
  `ITEM_RESULT_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '检查结果标志 1,正常;2,异常9,不确定',
  `ITEM_REMARKS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '说明',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_report_base64
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_report_base64`;
CREATE TABLE `cdr_check_report_base64`  (
  `REPORT_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BASE64` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_report_base64
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_report_bf
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_report_bf`;
CREATE TABLE `cdr_check_report_bf`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REVIEW_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REVIEW_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REPORT_ORDER_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CHECK_TYPECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_MEMO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `IMAGING_FINDING` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `IMAGING_CONCLUSION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MANUFACTURE_RCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_RESULT_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `ITEM_REMARKS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_report_bf
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_report_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_report_records`;
CREATE TABLE `cdr_check_report_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REVIEW_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REVIEW_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REPORT_ORDER_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_ITEM_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CHECK_TYPECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_MEMO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `IMAGING_FINDING` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `IMAGING_CONCLUSION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MANUFACTURE_RCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_RESULT_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `ITEM_REMARKS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_report_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_check_status
-- ----------------------------
DROP TABLE IF EXISTS `cdr_check_status`;
CREATE TABLE `cdr_check_status`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单号',
  `APPLY_STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查状态0 待检 1登记 2已出报告 3拒绝执行 4取消执行',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '登记日期',
  `MODIFY_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登记医生工号',
  `MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登记医生',
  `CHECK_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查医生工号',
  `CHECK_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查医生',
  `CHECK_DATE` datetime(0) NULL DEFAULT NULL COMMENT '检查日期',
  `MODIFY_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `MODIFY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_check_status
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_clinic_path
-- ----------------------------
DROP TABLE IF EXISTS `cdr_clinic_path`;
CREATE TABLE `cdr_clinic_path`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `PATH_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径ID',
  `PATH_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径名称',
  `OPERATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作医生编码',
  `OPERATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作医生名称',
  `IN_PATH_TIME` datetime(0) NULL DEFAULT NULL COMMENT '入径时间',
  `OUT_PATH_TIME` datetime(0) NULL DEFAULT NULL COMMENT '完成时间',
  `EXIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '退出时间',
  `EXIT_REASON` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退出原因',
  `ABERRATION_TIME` datetime(0) NULL DEFAULT NULL COMMENT '变异时间',
  `ABERRATION_REASON` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变异原因',
  `EVALUATION_TIME` datetime(0) NULL DEFAULT NULL COMMENT '评估时间',
  `EVALUATION_RESULTS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评估结果',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_clinic_path
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_clinic_path_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_clinic_path_records`;
CREATE TABLE `cdr_clinic_path_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATH_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATH_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IN_PATH_TIME` datetime(0) NULL DEFAULT NULL,
  `OUT_PATH_TIME` datetime(0) NULL DEFAULT NULL,
  `EXIT_TIME` datetime(0) NULL DEFAULT NULL,
  `EXIT_REASON` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ABERRATION_TIME` datetime(0) NULL DEFAULT NULL,
  `ABERRATION_REASON` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EVALUATION_TIME` datetime(0) NULL DEFAULT NULL,
  `EVALUATION_RESULTS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_clinic_path_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_configuration
-- ----------------------------
DROP TABLE IF EXISTS `cdr_configuration`;
CREATE TABLE `cdr_configuration`  (
  `ID` decimal(65, 30) NOT NULL COMMENT '主键id',
  `KEY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'key',
  `VALUE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'value',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性',
  `TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `CONFIG_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `DESCRIPTION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_configuration
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_consultation_infoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_consultation_infoquery`;
CREATE TABLE `cdr_consultation_infoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区代码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会诊申请单号',
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会诊医嘱号',
  `ORDERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱类别编码',
  `CONSULTATION_TYPE` decimal(1, 0) NULL DEFAULT NULL COMMENT '申请类型编码 1、门诊会诊，2、病房会诊，3、急诊会诊，4、院内会诊，5、院外会诊',
  `URGENCY_CODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '紧急程度编码 1,常规会诊，2、急会诊',
  `ILLNESS_DESCIPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病情简要描述',
  `REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请会诊目的',
  `REQUEST_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `APPLY_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生编码',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `APPLY_STATUSCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '状态编码 0已申请,1已接受,2完成会诊',
  `CONSULTATION_PLACE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会诊地点',
  `CONSULT_ORG_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受会诊医院编码',
  `CONSULT_ORG_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受会诊医院名称',
  `CONSULT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受会诊科室编码',
  `CONSULT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受会诊科室',
  `CONSULT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受会诊医生编码',
  `CONSULT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受会诊医生',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_consultation_infoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_consultation_infoquery_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_consultation_infoquery_records`;
CREATE TABLE `cdr_consultation_infoquery_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDERCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSULTATION_TYPE` decimal(1, 0) NULL DEFAULT NULL,
  `URGENCY_CODE` decimal(1, 0) NULL DEFAULT NULL,
  `ILLNESS_DESCIPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REQUEST_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_STATUSCODE` decimal(1, 0) NULL DEFAULT NULL,
  `CONSULTATION_PLACE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSULT_ORG_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSULT_ORG_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSULT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSULT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSULT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSULT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_consultation_infoquery_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_consultation_status
-- ----------------------------
DROP TABLE IF EXISTS `cdr_consultation_status`;
CREATE TABLE `cdr_consultation_status`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会诊申请单号',
  `MODIFY_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答科室编码',
  `MODIFY_DDEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答科室',
  `MODIFY_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答医生工号',
  `MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答医生',
  `EXEC_STATUSCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '状态编码 0已申请,1已接受,2完成会诊',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_consultation_status
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_critically_ill_patient
-- ----------------------------
DROP TABLE IF EXISTS `cdr_critically_ill_patient`;
CREATE TABLE `cdr_critically_ill_patient`  (
  `PATIENT_ID` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISIT_NO` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `MEDICAL_ORDERID` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱号',
  `ORDER_DEPTCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立科室',
  `ORDER_DEPTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立科室名称',
  `EXEC_STATUSCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行状态编码',
  `EXEC_STATUS` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行状态',
  `ORDER_CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱开始时间',
  `ORDER_STOPTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱停止时间',
  `ITEM_DATE` decimal(65, 30) NULL DEFAULT NULL COMMENT '日期',
  `DATA_WRITE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '数据记录时间',
  `ORDER_CONTENT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱内容',
  `ORDER_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱编码',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_critically_ill_patient
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_criticalvalue_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_criticalvalue_report`;
CREATE TABLE `cdr_criticalvalue_report`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '危急值内容',
  `SEND_TIME` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `USER_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受者ID',
  `USER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收者姓名',
  `INCEPT_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收者科室编码',
  `INCEPT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收者科室名称',
  `INCEPT_WARD_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收者病区编码',
  `INCEPT_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收者病区名称',
  `USER_GROUP` decimal(1, 0) NULL DEFAULT NULL COMMENT '用户是否群体 1 是群发  0不是群发',
  `MESSAGE_LEVEL` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息级别 低 中 高',
  `APPILICATIONNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验/检查申请单号',
  `LREPORT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告ID',
  `MESSAGE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `SENDER_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者科室编码',
  `SENDER_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者科室名称',
  `SENDER_WARD_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者病区编码',
  `SENDER_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者病区名称',
  `PROCESS_METHOD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理内容',
  `WRITEEMR_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '是否写EMR 0:未写；1：已写',
  `WRITEYIZHU_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '是否写医嘱 0:未写；1：已写',
  `PROCESS_STEP` decimal(1, 0) NULL DEFAULT NULL COMMENT '处理阶段 0:未发送，1：已发送，2:已处理',
  `PROCESS_USERID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人编码',
  `PROCESS_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人名称',
  `PROCESS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '处理时间  ',
  `INCEPT_TYPE` decimal(1, 0) NULL DEFAULT NULL COMMENT '接收人类型 0,医生 1,护士',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `EXAM_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查系统类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_criticalvalue_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_criticalvalue_report_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_criticalvalue_report_records`;
CREATE TABLE `cdr_criticalvalue_report_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SEND_TIME` datetime(0) NULL DEFAULT NULL,
  `USER_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INCEPT_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INCEPT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INCEPT_WARD_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INCEPT_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USER_GROUP` decimal(1, 0) NULL DEFAULT NULL,
  `MESSAGE_LEVEL` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPILICATIONNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LREPORT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MESSAGE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SENDER_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SENDER_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SENDER_WARD_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SENDER_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROCESS_METHOD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WRITEEMR_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `WRITEYIZHU_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `PROCESS_STEP` decimal(1, 0) NULL DEFAULT NULL,
  `PROCESS_USERID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROCESS_USER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROCESS_DATE` datetime(0) NULL DEFAULT NULL,
  `INCEPT_TYPE` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `EXAM_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_criticalvalue_report_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_desen_rules
-- ----------------------------
DROP TABLE IF EXISTS `cdr_desen_rules`;
CREATE TABLE `cdr_desen_rules`  (
  `ID` decimal(65, 30) NOT NULL COMMENT '主键id',
  `DECRYPTION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '脱密名称',
  `DECRYPTION_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '脱密编码'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_desen_rules
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_device_requisition_management
-- ----------------------------
DROP TABLE IF EXISTS `cdr_device_requisition_management`;
CREATE TABLE `cdr_device_requisition_management`  (
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一主键',
  `MEDICATION_DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领药部门',
  `AMOUNT_MONEY` decimal(12, 4) NULL DEFAULT NULL COMMENT '金额',
  `FILLING_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '填制人',
  `FILLING_DATE` datetime(0) NULL DEFAULT NULL COMMENT '填制时间',
  `CHECK_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `CHECK_DATE` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `ACCOUNTING_DATE` datetime(0) NULL DEFAULT NULL COMMENT '会计日期',
  `CHECK_PERIOD` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核期间',
  `ABSTRACT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '摘要',
  `NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领用单号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_device_requisition_management
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_device_requisition_management_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_device_requisition_management_detail`;
CREATE TABLE `cdr_device_requisition_management_detail`  (
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一主键',
  `NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领用单号和主表进行关联',
  `DEVICE_INFORMATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备信息',
  `SPECIFICATIONS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `PRODUCER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产商',
  `UNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `FILL_QUANTITY` decimal(8, 4) NULL DEFAULT NULL COMMENT '填写数量',
  `ACTUAL_QUANTITY` decimal(8, 4) NULL DEFAULT NULL COMMENT '实际数量',
  `UNIT_PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '单价',
  `AMOUNT_MONEY` decimal(12, 4) NULL DEFAULT NULL COMMENT '金额'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_device_requisition_management_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_diagnosis_coincidence
-- ----------------------------
DROP TABLE IF EXISTS `cdr_diagnosis_coincidence`;
CREATE TABLE `cdr_diagnosis_coincidence`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者id',
  `VISIT_TIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `DIAGNOSTIC_COMPLIANCE_ONP` decimal(65, 30) NULL DEFAULT NULL COMMENT '门诊与出院 0.未做 1.符合 2.不符合 3.不确定',
  `DIAGNOSTIC_COMPLIANCE_INP` decimal(65, 30) NULL DEFAULT NULL COMMENT '入院与出院 0.未做 1.符合 2.不符合 3.不确定',
  `DIAGNOSTIC_COMPLIANCE_DR` decimal(65, 30) NULL DEFAULT NULL COMMENT '放射与病理 0.未做 1.符合 2.不符合 3.不确定',
  `DIAGNOSTIC_COMPLIANCE_PAT` decimal(65, 30) NULL DEFAULT NULL COMMENT '临床与病理 0.未做 1.符合 2.不符合 3.不确定',
  `DIAGNOSTIC_COMPLIANCE_AUTOPSY` decimal(65, 30) NULL DEFAULT NULL COMMENT '临床与尸检 0.未做 1.符合 2.不符合 3.不确定',
  `DIAGNOSTIC_COMPLIANCE_SURGERY` decimal(65, 30) NULL DEFAULT NULL COMMENT '术前与术后 0.未做 1.符合 2.不符合 3.不确定',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `RESCUEFREQUENCY` decimal(65, 30) NULL DEFAULT NULL COMMENT '抢救次数',
  `SUCCESSTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '成功次数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_diagnosis_coincidence
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_document_register
-- ----------------------------
DROP TABLE IF EXISTS `cdr_document_register`;
CREATE TABLE `cdr_document_register`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识，01门诊\r\n02住院\r\n03体检\r\n04急诊',
  `UNICODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄， 大于1岁，填写X岁；大于1月不足1岁填写X月X天；\r\n大于1天不足1月填写X天X小时；\r\n不足1天填写X小时X分钟',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `FILE_ORDER_NUM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历个人排列序号',
  `FILE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历名称',
  `CREATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历创建人编码',
  `CREATOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历创建人',
  `MR_CLASS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历分类代码',
  `MR_CLASS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历分类名称',
  `DOC_BASE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'BASE64编码原始文件',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `LAST_MODIFY_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人编码',
  `LAST_MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  `LAST_MODIFY_DATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '病历最后修时间',
  `DELETE_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '修改标志0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_document_register
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_document_register_20240126
-- ----------------------------
DROP TABLE IF EXISTS `cdr_document_register_20240126`;
CREATE TABLE `cdr_document_register_20240126`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_ORDER_NUM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOC_BASE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_MODIFY_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_MODIFY_DATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(65, 30) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_document_register_20240126
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_document_register_20240617
-- ----------------------------
DROP TABLE IF EXISTS `cdr_document_register_20240617`;
CREATE TABLE `cdr_document_register_20240617`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_ORDER_NUM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOC_BASE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_MODIFY_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_MODIFY_DATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(65, 30) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_document_register_20240617
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_document_register_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_document_register_records`;
CREATE TABLE `cdr_document_register_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_ORDER_NUM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOC_BASE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_MODIFY_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_MODIFY_DATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(65, 30) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_document_register_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_documentregister_mrclass
-- ----------------------------
DROP TABLE IF EXISTS `cdr_documentregister_mrclass`;
CREATE TABLE `cdr_documentregister_mrclass`  (
  `MR_CLASS_CODE` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MR_CLASS_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS_TYPE` decimal(1, 0) NULL DEFAULT NULL,
  `MR_CLASS_SHOW_ORDER` decimal(2, 0) NULL DEFAULT NULL,
  `PARENT_MR_CLASS_CODE` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DS_CODE` varchar(33) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `ONE_FILE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `SHARE_FILE` decimal(1, 0) NULL DEFAULT NULL,
  `MASTER_TEMPLET_CODE` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LINE_SPACE` decimal(1, 0) NULL DEFAULT NULL,
  `FONT_SIZE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISMR_MONITOR` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_documentregister_mrclass
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_drug_procurement_warehousing
-- ----------------------------
DROP TABLE IF EXISTS `cdr_drug_procurement_warehousing`;
CREATE TABLE `cdr_drug_procurement_warehousing`  (
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一值主键',
  `NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库编号',
  `SUPPLIER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `COST_AMOUNT` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本金额',
  `PRICE_AMOUNT` decimal(10, 2) NULL DEFAULT NULL COMMENT '售价金额',
  `PRICE_DIFFERENCE_AMOUNT` decimal(10, 2) NULL DEFAULT NULL COMMENT '差价金额',
  `FILLING_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '填制人',
  `FILLING_DATE` datetime(0) NULL DEFAULT NULL COMMENT '填制时间',
  `MODIFY_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `CHECK_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `CHECK_DATE` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `DOCUMENT_DESCRIPTION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据说明',
  `ABSTRACT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `PROCUREMENT_CHANNELS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采购途径'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_drug_procurement_warehousing
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_drug_procurement_warehousing_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_drug_procurement_warehousing_detail`;
CREATE TABLE `cdr_drug_procurement_warehousing_detail`  (
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一主键',
  `PAYMENT_STANDARDS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款标准',
  `DRUG_INFORMATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品信息',
  `COUNTRY_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家编码',
  `TRADE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `DRUG_SOURCE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '药品来源',
  `ESSENTIAL_MEDICINES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '基本药物',
  `SPECIFICATIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '规格',
  `PRODUCER` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '生产商',
  `BATCH_NUMBER` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '批号',
  `LOSE_EFFICACY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '失效期',
  `AMONT` decimal(12, 4) NULL DEFAULT NULL COMMENT '数量',
  `UNIT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '单位',
  `COST_PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '成本价',
  `COST_AMOUNT` decimal(12, 4) NULL DEFAULT NULL COMMENT '成本金额',
  `DISCOUNT` decimal(3, 0) NULL DEFAULT NULL COMMENT '扣率',
  `PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '售价',
  `PRICE_AMOUNT` decimal(12, 4) NULL DEFAULT NULL COMMENT '售价金额',
  `PRICE_DIFFERENCE` decimal(8, 2) NULL DEFAULT NULL COMMENT '差价',
  `APPROVAL_NUMBER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批准文号',
  `INVOICE_NUMBER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票号',
  `INVOICE_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票代码',
  `INVOICE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '发票日期',
  `INVOICE_VALUE` decimal(8, 2) NULL DEFAULT NULL COMMENT '发票金额',
  `LADING_NUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '随货单号',
  `LADING_DATE` datetime(0) NULL DEFAULT NULL COMMENT '随货日期',
  `NO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库单号和主表进行关联'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_drug_procurement_warehousing_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_drug_procurement_warehousing_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_drug_procurement_warehousing_records`;
CREATE TABLE `cdr_drug_procurement_warehousing_records`  (
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUPPLIER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COST_AMOUNT` decimal(10, 2) NULL DEFAULT NULL,
  `PRICE_AMOUNT` decimal(10, 2) NULL DEFAULT NULL,
  `PRICE_DIFFERENCE_AMOUNT` decimal(10, 2) NULL DEFAULT NULL,
  `FILLING_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILLING_DATE` datetime(0) NULL DEFAULT NULL,
  `MODIFY_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL,
  `CHECK_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_DATE` datetime(0) NULL DEFAULT NULL,
  `DOCUMENT_DESCRIPTION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ABSTRACT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROCUREMENT_CHANNELS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_drug_procurement_warehousing_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_drug_requisition_manage
-- ----------------------------
DROP TABLE IF EXISTS `cdr_drug_requisition_manage`;
CREATE TABLE `cdr_drug_requisition_manage`  (
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一主键',
  `NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单号',
  `MEDICATION_DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领药部门',
  `COST_AMOUNT` decimal(12, 4) NULL DEFAULT NULL COMMENT '成本金额',
  `PRICE_AMOUNT` decimal(12, 4) NULL DEFAULT NULL COMMENT '销售金额',
  `PRICE_DIFFERENCE` decimal(8, 2) NULL DEFAULT NULL COMMENT '差价金额',
  `FILLING_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '填制人',
  `FILLING_DATE` datetime(0) NULL DEFAULT NULL COMMENT '填制时间',
  `MODIFY_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `CHECK_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `CHECK_DATE` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `ABSTRACT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '摘要',
  `MEDICATION_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领药方式'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_drug_requisition_manage
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_drug_requisition_manage_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_drug_requisition_manage_detail`;
CREATE TABLE `cdr_drug_requisition_manage_detail`  (
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '明细表主键，唯一值',
  `DRUG_INFORMATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品信息',
  `COUNTRY_CODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家编码',
  `TRADE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名',
  `DRUG_SOURCE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品来源',
  `ESSENTIAL_MEDICINES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基本药物',
  `SPECIFICATIONS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `PRODUCER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产商',
  `COUNTRY_ORIGIN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原产地',
  `BATCH_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批号',
  `LOSE_EFFICACY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '失效期',
  `FILL_QUANTITY` decimal(8, 4) NULL DEFAULT NULL COMMENT '填写数量',
  `ACTUAL_QUANTITY` decimal(8, 4) NULL DEFAULT NULL COMMENT '实际数量',
  `UNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `COST_PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '成本价',
  `COST_AMOUNT` decimal(12, 4) NULL DEFAULT NULL COMMENT '成本金额',
  `PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '售价',
  `PRICE_AMOUNT` decimal(12, 4) NULL DEFAULT NULL COMMENT '售价金额',
  `PRICE_DIFFERENCE` decimal(8, 2) NULL DEFAULT NULL COMMENT '差价',
  `WAREHOUSE_LOCATION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库房货位',
  `NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号，和主表进行关联'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_drug_requisition_manage_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_drug_requisition_manage_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_drug_requisition_manage_records`;
CREATE TABLE `cdr_drug_requisition_manage_records`  (
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEDICATION_DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COST_AMOUNT` decimal(12, 4) NULL DEFAULT NULL,
  `PRICE_AMOUNT` decimal(12, 4) NULL DEFAULT NULL,
  `PRICE_DIFFERENCE` decimal(8, 2) NULL DEFAULT NULL,
  `FILLING_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILLING_DATE` datetime(0) NULL DEFAULT NULL,
  `MODIFY_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL,
  `CHECK_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_DATE` datetime(0) NULL DEFAULT NULL,
  `ABSTRACT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `MEDICATION_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_drug_requisition_manage_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_druginfoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_druginfoquery`;
CREATE TABLE `cdr_druginfoquery`  (
  `GROUP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `DRUGIN_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药记录ID',
  `PRESCRIPTION_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药单号',
  `DISPENSER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配药医生编码',
  `DISPENSER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配药医生',
  `CONFIRMPERSON_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药确认人编码',
  `CONFIRMPERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药确认人',
  `CONFIRM_TIME` datetime(0) NULL DEFAULT NULL COMMENT '发药确认时间',
  `DISPENSE_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药库房编码',
  `DISPENSE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药库房',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者个人信息标识',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_druginfoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_druginfoquery_details
-- ----------------------------
DROP TABLE IF EXISTS `cdr_druginfoquery_details`;
CREATE TABLE `cdr_druginfoquery_details`  (
  `DRUGIN_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药记录ID',
  `PRESCRIPTION_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药单号',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者个人信息标识',
  `CONFIRM_TIME` datetime(0) NULL DEFAULT NULL COMMENT '发药确认时间',
  `DRUGLIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱明细ID/处方明细ID',
  `DRUG_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药物编码',
  `DRUG_NAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药物名称',
  `BATCH_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `QUANTITY` decimal(10, 0) NULL DEFAULT NULL COMMENT '领药量',
  `UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药量单位',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_druginfoquery_details
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_druginfoquery_details_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_druginfoquery_details_records`;
CREATE TABLE `cdr_druginfoquery_details_records`  (
  `DRUGIN_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRESCRIPTION_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONFIRM_TIME` datetime(0) NULL DEFAULT NULL,
  `DRUGLIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DRUG_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DRUG_NAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BATCH_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QUANTITY` decimal(10, 0) NULL DEFAULT NULL,
  `UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_druginfoquery_details_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_druginfoquery_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_druginfoquery_records`;
CREATE TABLE `cdr_druginfoquery_records`  (
  `GROUP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DRUGIN_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRESCRIPTION_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISPENSER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISPENSER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONFIRMPERSON_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONFIRMPERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONFIRM_TIME` datetime(0) NULL DEFAULT NULL,
  `DISPENSE_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISPENSE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_druginfoquery_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_electrocardiogram_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_electrocardiogram_report`;
CREATE TABLE `cdr_electrocardiogram_report`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请·单编号',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生工号',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `REGISTER_TIME` datetime(0) NULL DEFAULT NULL COMMENT '检查登记时间',
  `REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查登记人编码',
  `REGISTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查登记人',
  `CHECK_EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告时间',
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生编码',
  `REPORT_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生',
  `REVIEW_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `REVIEW_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告号',
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '整张报告图片信息',
  `REPORT_ORDER_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查号',
  `TAKE_MEDICINE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服用降压药情况',
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目编码',
  `CHECK_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目名称',
  `CHECK_TYPECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型编码',
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型名称',
  `REPORT_MEMO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查备注',
  `IMAGING_FINDING` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '客观所见内容',
  `IMAGING_CONCLUSION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主观提示内容',
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断代码（主要诊断)',
  `DIAGNOSIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断名称（主要诊断）',
  `DIAG_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断医生编码',
  `DIAG_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断医生',
  `DIAG_INFO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它诊断意见',
  `CHECK_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查方法名称',
  `EXAM_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查医生编码',
  `EXAM_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查医生名称',
  `EXAM_DEPT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查科室编码',
  `EXAM_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查科室名称',
  `EXAM_DATE` datetime(0) NULL DEFAULT NULL COMMENT '检查时间',
  `MANUFACTURE_RCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仪器型号',
  `ITEM_RESULT_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '检查结果标志 1,正常;2,异常9,不确定',
  `ITEM_REMARKS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '说明',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_electrocardiogram_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_electrocardiogram_report_base64
-- ----------------------------
DROP TABLE IF EXISTS `cdr_electrocardiogram_report_base64`;
CREATE TABLE `cdr_electrocardiogram_report_base64`  (
  `REPORT_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BASE64` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_electrocardiogram_report_base64
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_admission_assessment
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_admission_assessment`;
CREATE TABLE `cdr_emr_admission_assessment`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `RESPONS_NURSE_SIGNTIME` datetime(0) NULL DEFAULT NULL COMMENT '责任护士签署日期时间',
  `RESPONS_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士编码',
  `RESPONS_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士名称',
  `IN_HOSPITAL_TYPE_CODE` decimal(2, 0) NULL DEFAULT NULL COMMENT '入院途径代码 ',
  `IN_HOSPITAL_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院途径，如：门诊',
  `IN_WARD_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入病房方式',
  `MAIN_SYMPTOM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主要症状名称',
  `TEMPERATURE` decimal(3, 1) NULL DEFAULT NULL COMMENT '体温',
  `PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '脉率   ',
  `RATE_RESPIRATORY` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸频率',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '舒张压',
  `WEIGHT` decimal(3, 2) NULL DEFAULT NULL COMMENT '体重',
  `WEIGHT_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体重(单位)  ',
  `GROWTH_DEGREE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '发育程度代码',
  `GROWTH_DEGREE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发育程度，如：正力型',
  `MENTALSTATE` decimal(65, 30) NULL DEFAULT NULL COMMENT '精神状态正常标志',
  `SLEEP_SITUATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '睡眠状况',
  `SPECIAL_CONDITIONS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身体特殊情况',
  `PSYCHOLOGIC_SITUATION_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '心理状态代码',
  `PSYCHOLOGIC_SITUATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '心理状态',
  `NUTRITION_SITUATION_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '营养状态代码',
  `NUTRITION_SITUATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营养状态',
  `SELF_CARE_ABILITY_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '自理能力代码 ',
  `SELF_CARE_ABILITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自理能力，如：完全自理',
  `SMOKING_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '吸烟标志 ',
  `SMOKING_SITUA_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '吸烟状况代码, ',
  `SMOKING_SITUA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '吸烟状况',
  `DAILY_SMOKING` decimal(65, 30) NULL DEFAULT NULL COMMENT '日吸烟量',
  `DAILY_SMOKING_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日吸烟量单位',
  `STOP_SMOKING_DAY` decimal(65, 30) NULL DEFAULT NULL COMMENT '停止吸烟天数',
  `DRINKING_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '饮酒标志(False/True),',
  `DRINKING_FREQ_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '饮酒频率代码, ',
  `DRINKING_FREQ` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮酒频率',
  `DAILY_DRINKING` decimal(65, 30) NULL DEFAULT NULL COMMENT '日饮酒量（mL）',
  `DIET_SATUTRTION_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '饮食情况代码  ',
  `DIET_SATUTRTION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮食情况，如：良好',
  `NURSE_OBSERVED_ITEM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察项目名称',
  `NURSE_OBSERVED_RESULIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察结果',
  `EVALUATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '评估日期时间',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_admission_assessment
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_admission_death_in24hrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_admission_death_in24hrecord`;
CREATE TABLE `cdr_emr_admission_death_in24hrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ADDRESS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者详细住址',
  `ADDR_ROAD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-村（街、路、弄等）',
  `ADDR_STREET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-乡（镇、街道办事处）',
  `ADDR_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-县（区）',
  `ADDR_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-市（地区）',
  `ADDR_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-省（自治区、直辖市）',
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病史陈述者姓名',
  `AGENT_RELATIONSHIP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病史陈述者与患者关系',
  `AGENT_RELATIONSHIP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关系代码',
  `DOCTOR_DIRECTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `RECORD_AUDITOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接诊医师',
  `RECORD_AUDITOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接诊医师编码',
  `INPATIENT_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `CHARGE_DOCTOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间',
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出院日期时间',
  `ILLNESS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主诉',
  `IS_STATEMENT_TRUE` decimal(65, 30) NULL DEFAULT NULL COMMENT '陈述内容可靠标志',
  `TCM_OBSERVATIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '中医“四诊”观察结果',
  `ADMIDIAG_WM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-西医诊断名称',
  `ADMIDIAG_TCM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医病名',
  `ADMIDIAG_TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医证候名称',
  `ADMIDIAG_TCM_SYNDROMECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医证候代码',
  `ADMISSION_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院情况',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `DEATH_DATE` datetime(0) NULL DEFAULT NULL COMMENT '死亡日期时间',
  `DEATH_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '死亡原因',
  `DEATHDIAG_WM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '死亡诊断-西医诊断名称',
  `DEATHDIAG_WM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '死亡诊断-西医诊断编码',
  `DEATHDIAG_TCM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '死亡诊断-中医病名代码',
  `DEATHDIAG_TCM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '死亡诊断-中医病名',
  `DEATHDIAG_TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '死亡诊断-中医证候名称',
  `DEATHDIAG_TCM_SYNDROMECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '死亡诊断-中医证候代码',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `ADMIDIAG_WM_CODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-西医诊断代码'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_admission_death_in24hrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_admission_discharge_in24hrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_admission_discharge_in24hrecord`;
CREATE TABLE `cdr_emr_admission_discharge_in24hrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ADDRESS` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者详细住址',
  `ADDR_ROAD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-村（街、路、弄等）',
  `ADDR_STREET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-乡（镇、街道办事处）',
  `ADDR_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-县（区）',
  `ADDR_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-市（地区）',
  `ADDR_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-省（自治区、直辖市）',
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病史陈述者姓名',
  `AGENT_RELATIONSHIP` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病史陈述者与患者关系',
  `AGENT_RELATIONSHIP_CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关系代码',
  `IS_STATEMENT_TRUE` decimal(65, 30) NULL DEFAULT NULL COMMENT '陈述内容可靠标志',
  `DOCTOR_DIRECTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `RECORD_AUDITOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接诊医师',
  `RECORD_AUDITOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接诊医师编码',
  `INPATIENT_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `CHARGE_DOCTOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主诉',
  `ILLNESS_CURRENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '现病史',
  `MAIN_SYMPTOM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '症状名称',
  `MAIN_SYMPTOM_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '症状描述',
  `ADMIDIAG_WM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-西医诊断名称',
  `ADMIDIAG_WM_CODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-西医诊断编码',
  `ADMIDIAG_TCM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医病名',
  `ADMIDIAG_TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医证候名称',
  `THERAPEUTIC_PRINCIPLEANDMETHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '治则治法',
  `ADMISSION_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院情况 1	危2	急9	一般',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `DISCHARGE_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院情况 1	治愈\r\n2	好转\r\n3	稳定\r\n4	恶化\r\n5	死亡\r\n9	其他\r\n',
  `DISCHDIAG_WM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-西医诊断名称',
  `DISCHDIAG_WM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-西医诊断编码',
  `DISCHDIAG_TCM_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-中医病名代码',
  `DISCHDIAG_TCM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-中医病名',
  `DISCHDIAG_TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-中医证候名称',
  `DISCHDIAG_TCM_SYNDROMECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-中医证候代码',
  `DISCHARGE_ADVICE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院医嘱',
  `DISCHARGE_ADVICE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出院医嘱开立日期',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_admission_discharge_in24hrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_admissionrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_admissionrecord`;
CREATE TABLE `cdr_emr_admissionrecord`  (
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ADDRESS` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者详细住址',
  `ADDR_ROAD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-村（街、路、弄等）',
  `ADDR_STREET` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-乡（镇、街道办事处）',
  `ADDR_AREA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-县（区）',
  `ADDR_CITY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-市（地区）',
  `ADDR_PROVINCE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-省（自治区、直辖市）',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `MARRYSTATUSCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况代码',
  `MARRYSTATUS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `NATION_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族代码',
  `NATION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `COUNTRY_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家代码',
  `COUNTRY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家名称',
  `OCCUPATIONCODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业代码',
  `OCCUPATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业',
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病史陈述者姓名',
  `AGENT_RELATIONSHIP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病史陈述者与患者关系',
  `AGENT_RELATIONSHIP_CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关系代码',
  `DOCTOR_DIRECTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `RECORD_AUDITOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接诊医师',
  `RECORD_AUDITOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接诊医师编码',
  `INPATIENT_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `CHARGE_DOCTOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主诉',
  `ILLNESS_CURRENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '现病史',
  `IS_HEALTHY` decimal(3, 0) NULL DEFAULT NULL COMMENT '一般健康状况标志',
  `DISEASE_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '疾病史（含外伤）',
  `IS_INFECTION` decimal(3, 0) NULL DEFAULT NULL COMMENT '患者传染性标志',
  `INFECTION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '传染病史',
  `MARRY_HISTOYR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '婚育史',
  `ALLERGIES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '过敏史',
  `OPERATION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术史',
  `VACCINATION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预防接种史',
  `TRANSFUSION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输血史',
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `PERSONAL_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人史',
  `MENSTRUAL_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '月经史',
  `FAMILY_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '家族史',
  `TEMPERATURE` decimal(5, 1) NULL DEFAULT NULL COMMENT '体温',
  `PULSE` decimal(10, 0) NULL DEFAULT NULL COMMENT '脉率',
  `RATE_RESPIRATORY` decimal(10, 0) NULL DEFAULT NULL COMMENT '呼吸频率',
  `PRESSURE_SYSTOLIC` decimal(10, 0) NULL DEFAULT NULL COMMENT '收缩压',
  `PRESSURE_DIASTOLIC` decimal(10, 0) NULL DEFAULT NULL COMMENT '舒张压',
  `HEIGHT` decimal(10, 0) NULL DEFAULT NULL COMMENT '身高',
  `HEIGHT_UNIT` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身高单位',
  `WEIGHT` decimal(10, 0) NULL DEFAULT NULL COMMENT '体重',
  `WEIGHT_UNIT` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体重单位，如kg',
  `EXAM_GENERAL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查',
  `EXAM_SKIN_MUCOSA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-皮肤和黏膜检查结果',
  `EXAM_LYMPHADEN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-全身浅表淋巴结检查结果',
  `EXAM_HEAD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-头部及其器官检查结果',
  `EXAM_NECK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-颈部检查结果',
  `EXAM_CHEST` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-胸部检查结果',
  `EXAM_ABDOMEN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-腹部检查结果',
  `EXAM_ANUS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-肛门指诊检查结果',
  `EXAM_EXTERNAL_GENITALIA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-外生殖器检查结果',
  `EXAM_SPINE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-脊柱检查结果',
  `EXAM_ARMS_LEGS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-四肢检查结果',
  `EXAM_NERVOUS_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查-神经系统检查结果',
  `SPECIALTY_SITUATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '专科情况',
  `EXAMINATION_AUXILIARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '辅助检查结果',
  `IS_STATEMENT_TRUE` decimal(3, 0) NULL DEFAULT NULL COMMENT '陈述内容可靠标志',
  `FINALRADVICE_REVIEWER` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最终审核者签名',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '签名时间',
  `FINAL_MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `REHABILITATION_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '康复诊断',
  `FIRSTSTEP_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '初步诊断'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_admissionrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_aesarean_sectionrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_aesarean_sectionrecord`;
CREATE TABLE `cdr_emr_aesarean_sectionrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `INTRAOPERATIVE_MEDICATION_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '手术用药量',
  `ABDOMINAL_EXPLORATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '腹腔探查附件',
  `ABDOMINAL_EXPLORATION_UTERRUS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '腹腔探查子宫',
  `IS_ABDOMINAL_ABNORMAL` decimal(65, 30) NULL DEFAULT NULL COMMENT '宫腔探查异常情况标志',
  `IS_ABDOMINAL_MYOMA` decimal(65, 30) NULL DEFAULT NULL COMMENT '宫腔探查肌瘤标志',
  `ABDOMINAL_EXPLORATION_MANAGE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宫腔探查处理情况',
  `OPERATING_PUERPERA_SITUATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术时产妇情况',
  `BLEEDING_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '出血量',
  `BLOOD_TRANSFUSION_INGREDIENTS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血成分',
  `BLOOD_TRANSFUSION_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '输血量（mL）',
  `INFUSION_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '输液量（mL）',
  `OXYGEN_SUPPLY_TIME` decimal(65, 30) NULL DEFAULT NULL COMMENT '供氧时间（min）',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `OPERATION_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生编码',
  `OPERATION_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生名称',
  `ANESTHESIA_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师编码',
  `ANESTHESIA_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师姓名',
  `NURSE_INSTRUMENTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '器械护士编码',
  `NURSE_INSTRUMENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '器械护士名称',
  `MIDWIFERY_ASSISTANT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '助手编码',
  `MIDWIFERY_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '助手姓名',
  `OTHER_MEDICATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他用药',
  `OTHER_SITUATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其他情况',
  `OPERATION_ENDDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术结束日期时间',
  `OPERATION_FULLTIME_SPENT` decimal(65, 30) NULL DEFAULT NULL COMMENT '手术全程时间（min）',
  `FETAL_POSITION_CODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胎方位代码',
  `POSTPARTUM_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产后诊断',
  `POSTPARTUM_OBSERVATIONS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '产后观察日期时间',
  `POSTPARTUM_INSPECTION_DATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产后检查时间（min）',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '舒张压',
  `POSTPARTUM_PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后脉搏（次/min ）',
  `POSTPARTUM_RATE_HEART` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后心率（次/min ）',
  `POSTPARTUM_BLEEDING_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后出血量（mL）',
  `POSTPARTUM_CONTRACTIONS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产后宫缩',
  `BABY_PROTECTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护婴者编码',
  `BABY_PROTECTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护婴者姓名',
  `EXPECT_BORN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '待产日期时间',
  `IS_FETAL_MEMBRANES_INTACT` decimal(65, 30) NULL DEFAULT NULL COMMENT '胎膜完整情况标志',
  `UMBILICAL_CORD_LENGTH` decimal(65, 30) NULL DEFAULT NULL COMMENT '脐带长度（cm）',
  `NUCHAL_CORD` decimal(65, 30) NULL DEFAULT NULL COMMENT '绕颈身（周）',
  `PREBORN_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产前诊断名称',
  `SURGICAL_INDICATIONS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术指征',
  `OPERATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术代码，手术(操作)代码表(ICD-9-CM)',
  `OPERATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术名称',
  `OPERATION_BEGINDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术开始日期时间',
  `ANESTHESIA_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方法代码',
  `ANESTHESIA_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方法',
  `ANESTHESIA_SITE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉体位',
  `ANESTHESIA_EFFECT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉效果',
  `POSTPARTUM_UTERUS_LOC` decimal(3, 1) NULL DEFAULT NULL COMMENT '产后宫底高度（cm）',
  `BDBY_SEX_ID` decimal(65, 30) NULL DEFAULT NULL COMMENT '新生儿性别代码代码',
  `BDBY_SEX` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新生儿性别代码',
  `BDBY_WEIGHT` decimal(65, 30) NULL DEFAULT NULL COMMENT '新生儿出生体重（g）',
  `BDBY_WEIGHT_UNIT` decimal(65, 30) NULL DEFAULT NULL COMMENT '新生儿出生体重单位（g）',
  `BDBY_HEIGHT` decimal(3, 1) NULL DEFAULT NULL COMMENT '新生儿出生身长（cm）',
  `SCALP_EDEMA_SIZE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产瘤大小',
  `SCALP_EDEMA_SITE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产瘤部位',
  `APGAR_RATING_INTERVAL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Apgar评分间隔时间',
  `APGAR_SCORE` decimal(65, 30) NULL DEFAULT NULL COMMENT 'Apgar评分值',
  `BIRTHING_RESULT_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '分娩结局',
  `BABY_ABNORMAL_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '新生儿异常情况， ',
  `CAESAREAN_PROCESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '剖宫产手术过程',
  `CONDITION_WOMB` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子宫情况',
  `DELIVERY_MODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胎儿娩出方式',
  `PLACENTA_YELLOW_STAINED` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胎盘黄染',
  `MEMBRANES_YELLOW_STAINED` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胎膜黄染',
  `CORD_WINDING` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '脐带缠绕情况',
  `UMBILICAL_CORD` decimal(65, 30) NULL DEFAULT NULL COMMENT '脐带扭转（周）',
  `SAVE_CORD_BLOOD` decimal(65, 30) NULL DEFAULT NULL COMMENT '存脐带血情况标志',
  `UTERINE_WALL_SUTURE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子宫壁缝合情况',
  `OXYTOCIN` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宫缩剂名称',
  `OXYTOCIN_USAGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宫缩剂使用方法',
  `INTRAOPERATIVE_MEDICATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术用药',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_aesarean_sectionrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_anesthesia_informedconsent
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_anesthesia_informedconsent`;
CREATE TABLE `cdr_emr_anesthesia_informedconsent`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `AUTHOR_SIGN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '知情同意书文档书写签署日期',
  `AUTHOR_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知情同意书文档作者编码',
  `AUTHOR_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知情同意书文档作者名称',
  `ANESTHESIA_SIGN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '麻醉医师签名时间',
  `ANESTHESIA_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师编码',
  `ANESTHESIA_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师姓名',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期时间',
  `ASSIGNED_DOC_ID` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `ASSIGNED_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生姓名',
  `PATIENT_SIGN_TIEM` datetime(0) NULL DEFAULT NULL COMMENT '患者签名日期时间',
  `PATIENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者签名',
  `AGENT_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '患者代理人签名时间',
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人签名',
  `AGENT_RELATIONSHIP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系',
  `AGENT_RELATIONSHIP_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系代码',
  `PREOPERATIVE_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '术前诊断名称',
  `ANESTHESIA_TYPE_CODE_PLAN` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟麻醉方式代码',
  `ANESTHESIA_TYPE_PLAN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟麻醉方式',
  `ANESTHESIA_DATETIME_PALN` datetime(0) NULL DEFAULT NULL COMMENT '拟麻醉日期时间',
  `OPERATION_CODE_PLAN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施手术代码',
  `OPERATION_NAME_PLAN` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施手术名称',
  `INVASIVE_TYPE_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '拟行有创操作和检测方法',
  `BASIC_ILLNESS_AFFECT_ANESTHESIA` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基础疾病影响',
  `BASIC_ILLNESS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者基础疾病',
  `NARCOTIC_ANALGESICS_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '使用麻醉镇痛汞标志',
  `ANESTHESIA_SAFETY_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '参加麻醉安全保险标志',
  `OPERATION_ORG_ADVICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构的意见',
  `PATIENT_OPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '患者的意见',
  `ANESTHESIA_RISK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '麻醉中，麻醉后可能产发生的意外及并发症',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_anesthesia_informedconsent
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_anesthesia_postrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_anesthesia_postrecord`;
CREATE TABLE `cdr_emr_anesthesia_postrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `PREOPERATIVE_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前诊断名称',
  `POSTOPERATIVE_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术后诊断',
  `ANESTHESIA_TYPE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方法',
  `ANESTHESIA_ADAPT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉适应症',
  `ANESTHESIA_RECOVERY` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉恢复情况',
  `ANESTHESIA_AWAKE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '清醒日期时间',
  `SPECIAL_CONDITIONS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊情况',
  `GENERAL_INSPECTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '一般状况检查结果',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_anesthesia_postrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_anesthesia_prerecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_anesthesia_prerecord`;
CREATE TABLE `cdr_emr_anesthesia_prerecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ABO_BLOOD_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ABO血型代码，ABO血型代码表',
  `ABO_BLOOD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ABO血型',
  `RH_BLOOD_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Rh血型代码，Rh血型代码表',
  `RH_BLOOD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Rh血型',
  `PREOPERATIVE_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前诊断名称',
  `POSTOPERATIVE_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术后诊断',
  `ILLNESS_HISTORY_SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简要病史',
  `ALLERGIES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '过敏史描述',
  `GENERAL_INSPECTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '一般检查情况',
  `MENTALSTATE` decimal(65, 30) NULL DEFAULT NULL COMMENT '精神状态正常标志 ',
  `HEART_AUSCULTATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '心脏听诊结果',
  `LUNG_AUSCULTATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '肺部听诊结果',
  `EXTREMITIES_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '四肢检查结果',
  `SPINAL_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '脊柱检查结果',
  `ABDOMEN_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '腹部检查结果',
  `TRACHEA_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '气管检查结果',
  `TOOTH_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '牙齿检查结果',
  `ECG_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '心电检查结果',
  `CHEST_X_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '胸部X线检查结果',
  `CT_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'CT检查结果',
  `B_ULTRASOUND` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'B超检查结果',
  `MRI_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'MRI检查结果',
  `LUNG_FOUNCTION__EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '肺功能检查结果',
  `BLOODROUT_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '血常规检查结果',
  `URINEROUT_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '尿常规检查结果',
  `COAGULATION_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '凝血功能检查结果',
  `LIVERFUNCTION_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '肝功能检查结果',
  `BLOODGAS_EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '血气分析检查结果',
  `ANESTHESIA_ADAPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '麻醉适应症',
  `ANESTHESIA_PRECAUTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注意事项',
  `ANESTHESIA_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟行麻醉方式代码',
  `ANESTHESIA_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟行麻醉方式',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_anesthesia_prerecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_anesthesiarecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_anesthesiarecord`;
CREATE TABLE `cdr_emr_anesthesiarecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `WEIGHT` decimal(5, 1) NULL DEFAULT NULL COMMENT '体重',
  `TEMPERATURE` decimal(5, 1) NULL DEFAULT NULL COMMENT '体温',
  `PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '脉率   ',
  `RATE_RESPIRATORY` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸频率',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '舒张压',
  `BLOOD_OXYGEN_SATURATION` decimal(5, 1) NULL DEFAULT NULL COMMENT '血氧饱和度',
  `BLOOD_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血型',
  `PREOPERATIVE_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前诊断名称',
  `POSTOPERATIVE_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术后诊断',
  `OPERATOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主刀医生工号',
  `OPERATOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主刀医生名称',
  `FIRST_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手编码',
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手姓名',
  `SECEND_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手编码',
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手姓名',
  `NURSE_INSTRUMENTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '器械护士编码',
  `NURSE_INSTRUMENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '器械护士名称',
  `NURSE_PATROLID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡台护士编码',
  `NURSE_PATROL_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡台护士名称',
  `OPERATION_ROOM_NUMBER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术间编号',
  `OPERATION_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术室名称',
  `OPERATION_PLATFORM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术台编码',
  `ANESTHESIA_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医生编码',
  `ANESTHESIA_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医生姓名',
  `OPERATION_SITE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术体位代码',
  `OPERATION_SITE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术体位名称',
  `BLOOD_TRANSFUSION_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '输血日期时间',
  `BLOOD_KIND` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血品种',
  `BLOOD_TRANSFUSION_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '输血量',
  `BLOOD_TRANSFUSION_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血量计量单位',
  `INFUSION_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '输液量',
  `INFUSION_VOLUME_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输液量计量单位',
  `BLEEDING_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '出血量',
  `MEASURE_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出血量计量单位',
  `ANESTHESIA_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方法',
  `ANESTHESIA_BEGINTIME` datetime(0) NULL DEFAULT NULL COMMENT '麻醉开始时间',
  `ANESTHESIA_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '麻醉结束时间',
  `ASA_GRADING_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ASA分级标准代码',
  `INTUBATION_CLASSIFICATION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '气管插管分类',
  `ROUTINE_MONITORING_ITEMS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '常规监测项目名称',
  `ROUTINE_MONITORING_RESULT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '常规监测项目结果',
  `SPECIAL_MONITORING_ITEMS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊监测项目名称',
  `SPECIAL_MONITORING_RESULT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊监测项目结果',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `URINE_MEASURE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尿量',
  `AUTOLOGOUS_BLOOD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自体血',
  `PLATELET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血小板',
  `ANESTHETIC_DRUGS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉用药',
  `REQUEST_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_anesthesiarecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_awaiting_deliveryrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_awaiting_deliveryrecord`;
CREATE TABLE `cdr_emr_awaiting_deliveryrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `BORN_BEFORE_CHECKER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产程检查医生',
  `BORN_BEFORE_CHECKDATE` datetime(0) NULL DEFAULT NULL COMMENT '产程检查日期',
  `EXPECT_BORN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '待产日期',
  `PREGANT_NO` decimal(65, 30) NULL DEFAULT NULL COMMENT '孕次',
  `BORNED_NO` decimal(65, 30) NULL DEFAULT NULL COMMENT '产次',
  `PREDICT_BORN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '预产期',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '舒张压',
  `TEMPERATURE` decimal(2, 1) NULL DEFAULT NULL COMMENT '体温',
  `PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '脉率   ',
  `RATE_RESPIRATORY` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸频率',
  `ABDOMINAL_CIRCUMFERENCE` decimal(3, 1) NULL DEFAULT NULL COMMENT '腹围',
  `FETAL_POSITION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胎方位',
  `FETAL_RATE_HEART` decimal(65, 30) NULL DEFAULT NULL COMMENT '胎心率',
  `CONTRACTIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '宫缩情况',
  `CERVICAL_THICKNESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宫颈厚度',
  `MIYAGUCHI_ACTIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '宫口情况',
  `FETAL_MEMBRANES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胎膜情况，如“已破”',
  `FIRST_OUT_LOC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '先露位置，如“头先露出”',
  `AMNIOTIC_FLUID_CONDITION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '羊水情况',
  `CHECK_BEF_BORN_T` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产前检查异常情况',
  `GESTATION_ACTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '此次妊娠特殊情况',
  `PLAN_CHILDBIRTH_TYPE_CODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '计划分娩方式',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_awaiting_deliveryrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_base64
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_base64`;
CREATE TABLE `cdr_emr_base64`  (
  `FILE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件索引id',
  `BASE64` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'base64编码',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_base64
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_blood_transrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_blood_transrecord`;
CREATE TABLE `cdr_emr_blood_transrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ABO_BLOOD_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ABO血型代码，ABO血型代码表',
  `ABO_BLOOD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ABO血型',
  `RH_BLOOD_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者Rh血型代码，Rh血型代码表',
  `RH_BLOOD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者Rh血型',
  `BLOOD_TRANS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '输血时间',
  `BLOOD_TRANS_RECORD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输血过程详细记录',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `TRANSFUSION_EXEC_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血执行人',
  `TRANSFUSION_VOLUME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血量',
  `TRANSFUSION_VOLUME_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血量单位',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_blood_transrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_careplan
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_careplan`;
CREATE TABLE `cdr_emr_careplan`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `RECORD_AUDIT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '记录审核日期',
  `RECORD_AUDITOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录审核人',
  `RECORD_AUDITOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录审核人编码',
  `NURSE_LEVEL_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理等级代码， ',
  `NURSE_LEVEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理等级 ',
  `NURSE_TYPE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理类型代码， ',
  `NURSE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理类型',
  `NURSING_PROBLEM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理问题',
  `NURSE_OPERATE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作名称',
  `NURSE_OPERATE_ITEM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作项目类目名称',
  `NURSE_OPERATE_RESULT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作结果',
  `CATHETER_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导管护理描述',
  `POSTURE_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体位护理描述',
  `SKIN_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮肤护理描述',
  `TRACHEA_NURSE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '气管护理代码',
  `TRACHEA_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '气管护理,如：翻身，拍背',
  `SAFETY_NURSE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '安全护理代码  ',
  `SAFETY_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安全护理',
  `DIET_GUIDE_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮食指导代码 ',
  `DIET_GUIDE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮食指导，如：普通饮食',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_careplan
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_consultationrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_consultationrecord`;
CREATE TABLE `cdr_emr_consultationrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPT_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `ROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会诊申请单号',
  `URGENCYCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '紧急程度编码 1,常规会诊，2、急会诊',
  `REQUEST_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `APPLY_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生编码',
  `ILLNESS_DESCIPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病情简要描述',
  `REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请会诊目的',
  `CONSULTATIONPLACENAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会诊地点',
  `REPLY_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会诊应答人编码',
  `REPLY_DOC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会诊应答人',
  `REPLY_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应答科室编码',
  `REPLY_DEPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '应答科室',
  `CONSULT_OPINION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会诊意见',
  `CONSULT_TIEME` datetime(0) NULL DEFAULT NULL COMMENT '会诊时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生姓名',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `APPLY_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `EXAMINATION_AUXILIARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '辅助检查结果',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `MEDICAL_RECORDS_SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病历摘要',
  `DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会诊诊断'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_consultationrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_consultationrecord_bak
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_consultationrecord_bak`;
CREATE TABLE `cdr_emr_consultationrecord_bak`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URGENCYCODE` decimal(1, 0) NULL DEFAULT NULL,
  `REQUEST_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ILLNESS_DESCIPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CONSULTATIONPLACENAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLY_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLY_DOC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLY_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPLY_DEPT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONSULT_OPINION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CONSULT_TIEME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `RECORD_PERSONID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAMINATION_AUXILIARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `MEDICAL_RECORDS_SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_consultationrecord_bak
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_content
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_content`;
CREATE TABLE `cdr_emr_content`  (
  `SEARCH_CATEGORY` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOPIC` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSTRUMENTS_TYPE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CLASS_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_NAME` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CODE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CAPTION_DATE_TIME` datetime(0) NULL DEFAULT NULL,
  `FILE_UNIQUE_ID` varchar(144) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FILE_FLAG` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_CONTENT_HTML` longblob NULL,
  `MR_CONTENT_TEXT` longblob NULL,
  `LAST_MODIFY_DATE_TIME` datetime(0) NULL DEFAULT NULL,
  `CREATE_DATE_TIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VISIT_TIME` decimal(4, 0) NOT NULL,
  `ADMISSION_DATE_TIME` datetime(0) NULL DEFAULT NULL,
  `ID_CARD` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORG_CODE` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORG_NAME` char(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR_ID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATOR_NAME` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `UNICODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_content
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_dailyrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_dailyrecord`;
CREATE TABLE `cdr_emr_dailyrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DOCTOR_DIRECTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `DOCTOR_DIRECTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主任医师签字日期',
  `PRO_DUTY_CATEGORY` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业技术职务类别',
  `PRO_DUTY_CATEGORYCODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业技术职务类别代码',
  `HOSPITALIZATION_PROCESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '住院病程',
  `TCM_OBSERVATIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '中医“四诊”观察结果',
  `DOCTORADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱内容',
  `TREATMENT_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗计划',
  `SYNDROME_DIFFERENTIATION_TREATMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '辨证论治',
  `TCM_DECOCTING_WAYS` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药饮片煎煮法',
  `TCM_MEDICATION` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药用药方法',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_dailyrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_death_discussionrecords
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_death_discussionrecords`;
CREATE TABLE `cdr_emr_death_discussionrecords`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DOCTOR_DIRECTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `DOCTOR_DIRECTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主任医师签字日期',
  `INPATIENT_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `INPATIENT_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '住院医师签字日期时间',
  `CHARGE_DOCTOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `CHARGE_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主治医师签字日期',
  `PARTICIPANTS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参会人员',
  `MEETING_CHAIR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主持人',
  `MEETING_CHAIR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主持人员编码',
  `DEATH_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '死亡原因',
  `DEATHDIAG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '死亡诊断-诊断名称',
  `DISCUSSION_RECORD` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '死亡讨论记录',
  `DISCUSSION_SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主持人总结意见',
  `DISCUSSION_SIGN_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主持人签名',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_death_discussionrecords
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_death_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_death_records`;
CREATE TABLE `cdr_emr_death_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DOCTOR_DIRECTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `DOCTOR_DIRECTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主任医师签字日期',
  `INPATIENT_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `INPATIENT_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '住院医师签字日期时间',
  `CHARGE_DOCTOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `CHARGE_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主治医师签字日期',
  `ADMISSION_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院情况',
  `ADMIDIAG` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-诊断名称',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `DEATH_DATE` datetime(0) NULL DEFAULT NULL COMMENT '死亡日期时间',
  `DEATH_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '死亡原因',
  `DEATHDIAG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '死亡诊断-诊断名称',
  `COMPLICATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '并发症',
  `IS_AUTOPSY` decimal(65, 30) NULL DEFAULT NULL COMMENT '家属是否同意尸体解剖标志',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `ADMIDIAG_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-诊断编码',
  `DEATHDIAG_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '死亡诊断-诊断编码'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_death_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_discharge_assessment
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_discharge_assessment`;
CREATE TABLE `cdr_emr_discharge_assessment`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `RECORD_AUDITDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录审核日期',
  `RECORD_AUDITOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录审核人',
  `RECORD_AUDITOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录审核人编码',
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出院日期时间',
  `OUTHOSPITAL_STATUS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院情况',
  `OUTHOSPITAL_WAY_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '离院方式代码 ',
  `OUTHOSPITAL_WAY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '离院方式,如医嘱离院',
  `DIET_GUIDE_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮食指导代码，饮食指导代码表',
  `DIET_GUIDE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮食指导，如：普通饮食',
  `GUIDE_LIFE_ATTITUDE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生活方式指导  ',
  `CONTENTS_EDUCATION_PROPAGANDA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宣教内容, ',
  `GUIDE_REVISITING` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '复诊指导',
  `GUIDE_MEDICATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用药指导  ',
  `DIET_SATUTRTION_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '饮食情况代码',
  `DIET_SATUTRTION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '饮食情况，如：良好',
  `SELF_CARE_ABILITY_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '自理能力代码 ',
  `SELF_CARE_ABILITY` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自理能力,如：完全自理',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_discharge_assessment
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_discharge_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_discharge_records`;
CREATE TABLE `cdr_emr_discharge_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DOCTOR_DIRECTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `DOCTOR_DIRECTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主任医师签字日期',
  `INPATIENT_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `INPATIENT_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '住院医师签字日期时间',
  `CHARGE_DOCTOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `CHARGE_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主治医师签字日期',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间',
  `ADMISSION_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院情况',
  `ADMIDIAG_WM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-西医诊断名称',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `EXAMINATION_AUXILIARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '辅助检查结果',
  `TCM_OBSERVATIONS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医“四诊”观察结果',
  `THERAPEUTIC_PRINCIPLEANDMETHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治则治法',
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出院日期时间',
  `OUTHOSPITAL_STATUS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院情况',
  `DISCHDIAG_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-西医诊断名称',
  `DISCHARGE_ADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院医嘱',
  `DISCHDIAG_SYMPTOM_PHYSICAL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院时症状与体征',
  `NOTE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `DISCHDIAG_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-西医诊断编码',
  `ADMIDIAG_WM_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-西医诊断编码',
  `CHARGE_DOCTOR_ SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主治医师签字日期',
  `DOCTOR_DIRECTOR_ SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主任医师签字日期'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_discharge_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_discharged_briefrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_discharged_briefrecord`;
CREATE TABLE `cdr_emr_discharged_briefrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DOCTOR_DIRECTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '上级医师签字时间',
  `DOCTOR_DIRECTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医师名称',
  `INPATIENT_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '住院医师签字时间',
  `INPATIENT_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `ADMISSION_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院情况',
  `ADMIDIAG_WM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-西医诊断名称',
  `EXAMINATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '院内检查',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `DISCHDIAG_SYMPTOM_PHYSICAL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院时症状与体征',
  `DISCHARGE_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院情况',
  `DISCHDIAG_WM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院诊断-西医诊断名称',
  `DISCHARGE_ADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院医嘱',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_discharged_briefrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_emergency_observ_medicalrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_emergency_observ_medicalrecord`;
CREATE TABLE `cdr_emr_emergency_observ_medicalrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `OUTPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DEPARTMENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `VISIT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '就诊日期时间',
  `IN_OBSERVATROOM_TIME` datetime(0) NULL DEFAULT NULL COMMENT '收人观察室日期时间',
  `AUTHOR_ASSIGNED_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊医师编码',
  `AUTHOR_ASSIGNED` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊医师',
  `ALLERGIES_FLAR` decimal(65, 30) NULL DEFAULT NULL COMMENT '过敏标志',
  `ALLERGIES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏史描述',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主诉',
  `ILLNESS_CURRENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '现病史',
  `ILLNESS_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '既往史',
  `EXAMINATION_PHYSIQUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查结果',
  `EXAM_AUXILIARY_ITEM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '辅助检查项目',
  `EXAMINATION_AUXILIARY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '辅助检查结果',
  `RESCUE_BEGINDATE` datetime(0) NULL DEFAULT NULL COMMENT '抢救开始时间',
  `RESCUE_ENDDATE` datetime(0) NULL DEFAULT NULL COMMENT '抢救结束时间',
  `RESCUE_PROCESSDESC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抢救记录描述',
  `RESCUER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参加抢救人员名单',
  `MEDICAL_RECORD` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '急诊留观病程记录',
  `MEDICAL_RECORD_DATE` datetime(0) NULL DEFAULT NULL COMMENT '急诊留观病程记录时间',
  `MEDICAL_RECORD_DESC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '急诊留观病程记录描述',
  `NOTICES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `DIRECTION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者去向',
  `RECORDE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '记录时间，',
  `REVOKE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '撤销时间',
  `LAST_MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  `DELETE_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '修改标志',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_emergency_observ_medicalrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_expensivemedicon_usagerecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_expensivemedicon_usagerecord`;
CREATE TABLE `cdr_emr_expensivemedicon_usagerecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `HAIGH_CONSUMABLES_USETYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '高值耗材使用途径',
  `HAIGH_CONS_USING_QUANTITY` decimal(65, 30) NULL DEFAULT NULL COMMENT '耗材使用数量',
  `HAIGH_CONSUMABLES_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用数量单位',
  `HAIGH_CONSUMABLES_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗材编码',
  `HAIGH_CONSUMABLES_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '材料名称',
  `MANUFACTURER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生产厂家',
  `SUPPLIER` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `ISIMPLANTABILITY` decimal(65, 30) NULL DEFAULT NULL COMMENT '可植入性耗材标志',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_expensivemedicon_usagerecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_firstpage_medicalrecord_tcm
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_firstpage_medicalrecord_tcm`;
CREATE TABLE `cdr_emr_firstpage_medicalrecord_tcm`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` decimal(2, 0) NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门(急)诊号',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者身份证号',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BIRTHTIME` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `GENDERNAME` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `MARRYSTATUSCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况代码',
  `MARRYSTATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `NATION_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族代码',
  `NATION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `TELEPHONE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者联系电话',
  `MEDICAL_RECORD_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病案号',
  `HEALTH_CARD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '健康卡号',
  `ADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者详细住址',
  `ADDR_ROAD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-村（街、路、弄等）',
  `ADDR_STREET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-乡（镇、街道办事处）',
  `ADDR_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-县（区）',
  `ADDR_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-市（地区）',
  `ADDR_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-省（自治区、直辖市）',
  `ADDR_ZIP` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `BORN_ADDR_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-县（区）---出生地',
  `BORN_ADDR_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-市（地区）---出生地',
  `BORN_ADDR_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-省（自治区、直辖市）---出生地',
  `BORN_ADDR_ZIP` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码---出生地',
  `COUNTRY_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家代码，世界各国和地区名称代码',
  `COUNTRY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家名称',
  `WORK_ADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者详细住址，工作单位',
  `WORK_ADDR_ROAD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-村（街、路、弄等）',
  `WORK_ADDR_STREET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-乡（镇、街道办事处）',
  `WORK_ADDR_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-县（区）',
  `WORK_ADDR_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-市（地区）',
  `WORK_ADDR_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-省（自治区、直辖市）',
  `WORK_ADDR_ZIP` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `EMPLOYERORGANIZATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位名称',
  `WORKPHONE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位电话',
  `HOUSE_ADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者详细住址，户口地址',
  `HOUSE_ADDR_ROAD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-村（街、路、弄等）',
  `HOUSE_ADDR_STREET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-乡（镇、街道办事处）',
  `HOUSE_ADDR_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-县（区）',
  `HOUSE_ADDR_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-市（地区）',
  `HOUSE_ADDR_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-省（自治区、直辖市）',
  `HOUSE_ADDR_ZIP` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `NATIVE_ADDR_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '籍贯-市（地区）',
  `NATIVE_ADDR_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '籍贯-省(自治区、直辖市)',
  `OCCUPATIONCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业代码',
  `OCCUPATION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业',
  `CREATETIME` datetime(0) NULL DEFAULT NULL COMMENT '文档生成时间',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '文档创建日期',
  `RECORD_PERSONID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档创建医生编码',
  `RECORD_PERSON` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档创建医生',
  `ORGID_CUSTODIAL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档保管机构编号',
  `ORG_CUSTODIAL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档保管机构名称',
  `DOCTOR_DIRECTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `DOCTOR_DEPUTY_DIRECTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任(副)医师编号',
  `DOCTOR_DEPUTY_DIRECTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任(副)医师',
  `INPATIENT_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `CHARGE_DOCTOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `RESPONS_NURSE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士编码',
  `RESPONS_NURSE_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士名称',
  `ADVANCED_STUDIES_DOCID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进修医师编码',
  `ADVANCED_STUDIES_DOC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进修医师名称',
  `PRACTICE_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实习医师编码',
  `PRACTICE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实习医师名称',
  `CODING_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码医师编码',
  `CODING_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码医师',
  `RELATION_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人关系代码',
  `RELATIONSHIP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人关系',
  `RELATION_PERSON` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `RELATION_PERSON_TEL` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人电话号码',
  `RELATION_ADDRESS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细住址,联系人',
  `RELATION_ROAD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-村（街、路、弄等）',
  `RELATION_STREET` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-乡（镇、街道办事处）',
  `RELATION_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-县（区）',
  `RELATION_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-市（地区）',
  `RELATION_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址-省（自治区、直辖市）',
  `RELATION_ZIP` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `IN_HOSPITAL_TYPE_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院途径代码',
  `IN_HOSPITAL_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院途径',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间',
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出院日期时间',
  `BED_NO` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_NO` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT_CODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编码',
  `DEPARTMENT` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `BDBY_IN_WEIGHT` decimal(3, 0) NULL DEFAULT NULL COMMENT '新生儿入院体重',
  `BDBY_IN_WEIGHT_UNIT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新生儿入院体重单位',
  `BDBY_BORN_WEIGHT` decimal(3, 0) NULL DEFAULT NULL COMMENT '新生儿出生体重',
  `BDBY_BORN_WEIGHT_UNIT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新生儿出生体重单位',
  `DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '西医诊断名称',
  `DIAGNOSIS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '西医诊断代码',
  `TCM_DISEASE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医诊断名称',
  `TCM_DISEASECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医诊断代码',
  `TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医证候名称',
  `TCM_SYNDROMECODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医证候代码',
  `PATHOLOGY_CODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病理诊断名称',
  `PATHOLOGY_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病理诊断编码',
  `TREATMENT_CATEGORY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治疗类别',
  `TREATMENT_CATEGORY_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治疗类别代码表',
  `CLINICAL_PATHWAY_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实施临床路径标志代码表',
  `CLINICAL_PATHWAY_NAME` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实施临床路径标志名称',
  `DISEASE_STATE_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院者疾病状态代码',
  `DISEASE_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院者疾病状态',
  `DAMAGE_POIS_REASON_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '损伤中毒的外部原因',
  `DAMAGE_POIS_REASON_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '损伤中毒的外部原因-疾病编码',
  `BRAIN_INJURY_COMA_D` decimal(3, 0) NULL DEFAULT NULL COMMENT '颅脑损伤患者入院前昏迷时间-d',
  `BRAIN_INJURY_COMA_H` decimal(3, 0) NULL DEFAULT NULL COMMENT '颅脑损伤患者入院前昏迷时间-h',
  `BRAIN_INJURY_COMA_MIN` decimal(3, 0) NULL DEFAULT NULL COMMENT '颅脑损伤患者入院前昏迷时间-min',
  `BRAIN_INJURY_COMA_IN_D` decimal(3, 0) NULL DEFAULT NULL COMMENT '颅脑损伤患者入院后昏迷时间-d',
  `BRAIN_INJURY_COMA_IN_H` decimal(3, 0) NULL DEFAULT NULL COMMENT '颅脑损伤患者入院后昏迷时间-h',
  `BRAIN_INJURY_COMA_IN_MIN` decimal(65, 30) NULL DEFAULT NULL COMMENT '颅脑损伤患者入院后昏迷时间-min',
  `TRANS_DEPT_REASON` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转科原因',
  `TRANS_DEPT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '转科时间',
  `TRANS_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转科科室编码',
  `TRANS_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转科科室名称',
  `TCM_DISCHDIAG_DIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院中医诊断-主病名称',
  `TCM_DISCHDIAG_DISID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院中医诊断-主病编码',
  `TCM_DISCHDIAG_ADMIDISSTA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '出院中医诊断-主病-入院病情',
  `TCM_DISCHDIAG_ADMIDISSTAID` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院中医诊断-主病-入院病情代码,入院病情代码表',
  `TCM_DISCHDIAG_SYND` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院中医诊断-主证名称',
  `TCM_DISCHDIAG_SYNDID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院中医诊断-主证代码',
  `TCM_DISCHDIAG_ADMISYNDSTA` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院中医诊断-主证-入院病情',
  `TCM_DISCHDIAG_ADMISYNDSTAID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院中医诊断-主证-入院病情代码',
  `WM_DISCHDIAG_MAIN_DIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院西医诊断-主要诊断-疾病名称',
  `WM_DISCHDIAG_MAIN_DISID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院西医诊断-主要诊断-疾病编码',
  `WM_DISCHDIAG_MAIN_ADMIDISSTA` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院西医诊断-主要诊断-入院病情',
  `WM_DISCHDIAG_MAIN_ADMIDISSTAID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院西医诊断-主要诊断-入院病情代码',
  `WM_DISCHDIAG_OTHER_DIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院西医诊断-其他诊断名称',
  `WM_DISCHDIAG_OTHER_DISID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院西医诊断-其他诊断疾病编码',
  `WM_DISCHDIAG_OTHER_ADMIDISSTA` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院西医诊断-其他诊断-入院病情',
  `WM_DISCHDIAG_OTHER_ADMIDISSTAID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院西医诊断-其他诊断-入院病情代码',
  `OUTHOSPITAL_WAY_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '离院方式代码',
  `OUTHOSPITAL_WAY` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '离院方式',
  `ACCEPT_HOSPITAL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟接受医疗机构名称',
  `IS_ALLERGIES` decimal(3, 0) NULL DEFAULT NULL COMMENT '过敏史标志',
  `ALLERGY_DRUG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '过敏药物名称',
  `ABO_BLOOD_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ABO血型代码',
  `ABO_BLOOD_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ABO血型',
  `RH_BLOOD_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Rh血型代码',
  `RH_BLOOD_NAME` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Rh血型',
  `OPERATION_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术代码',
  `OPERATION_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术名称',
  `OPERATION_BEGINDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术日期时间',
  `OPERATION_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生编码',
  `OPERATION_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生名称',
  `FIRST_ASSISTANTID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手编码',
  `FIRST_ASSISTANT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手姓名',
  `SECEND_ASSISTANTID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手编码',
  `SECEND_ASSISTANT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手姓名',
  `OPERATION_LEVEL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术级别',
  `OPERATION_LEVEL_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术级别代码,',
  `INCISION_LEVEL_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术切口类别代码',
  `INCISION_LEVEL` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术切口类别',
  `INCISION_HEAL_LEVEL_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术切口愈合等级代码',
  `INCISION_HEAL_LEVEL` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术切口愈合等级',
  `ANESTHESIA_TYPE_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方式代码',
  `ANESTHESIA_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方式',
  `ANESTHESIA_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师编码',
  `ANESTHESIA_NAME` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师姓名',
  `IN_VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '住院次数',
  `DEATH_AUTOPSY_FLAG` decimal(3, 0) NULL DEFAULT NULL COMMENT '死亡患者尸检标志',
  `MEDICAL_RECORD_QUA_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病案质量代码',
  `MEDICAL_RECORD_QUA` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病案质量',
  `QUALITY_CTRL_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '质控医生编码',
  `QUALITY_CTRL_DOC` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '质控医生',
  `QUALITY_CTRL_NUR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '质控护士编码',
  `QUALITY_CTRL_NUR` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '质控护士',
  `IN_VISIT_DAYS` decimal(3, 0) NULL DEFAULT NULL COMMENT '实际住院天数',
  `OUT_SICKROOM_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者出院病房编码',
  `OUT_SICKROOM_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者出院病房名称',
  `OUT_DEPT_NO` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者出院科室编码',
  `OUT_DEPT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者出院科室名称',
  `OUT_IN_FALG` decimal(3, 0) NULL DEFAULT NULL COMMENT '出院31天内再住院标志',
  `OUT_IN_REASON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院31天内再住院目的',
  `PAYMENT_WAYS` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗付款方式名称',
  `PAYMENT_WAYS_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗付款方式代码',
  `ZY_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '住院总费用',
  `PERSONAL_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '住院总费用-自付金额',
  `COMMON_MEDIC_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '综合医疗服务费-一般医疗服务费',
  `COMMON_MEDIC_SDAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '综合医疗服务费-一般医疗服务费-中医辨证论治费',
  `COMMON_MEDIC_SDAT_GCFEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '综合医疗服务费-一般医疗服务费-中医辨证论治会诊费',
  `COMMON_TREAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '综合医疗服务费-一般治疗操作费',
  `COMMON_NUR_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '综合医疗服务费-护理费',
  `COMMON_OTHER_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '综合医疗服务费-其他费用',
  `PATHOLOGY_DIA_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '诊断-病理诊断费',
  `LIS_DIA_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '诊断-实验室诊断费',
  `ICONOGRAPHY_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '诊断-影像学诊断费',
  `CLINIC_DIA_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '诊断-临床诊断项目费',
  `NOP_TREAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '非手术治疗项目费',
  `NOP_PHYSCICAL_TREAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '非手术治疗项目费-临床物理治疗费',
  `OP_TREAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '手术治疗费',
  `OP_TREAT_ANESTHESIA_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '手术治疗费-麻醉费',
  `OP_TREAT_OPERAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '手术治疗费-手术费',
  `RECURE_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '康复费',
  `USED_TCM_PREPARATION` decimal(3, 0) NULL DEFAULT NULL COMMENT '使用医疗机构中药制剂',
  `USED_TCM_DATT` decimal(3, 0) NULL DEFAULT NULL COMMENT '使用中医诊疗技术标志',
  `IS_DIALECTICAL_PROTECTION` decimal(3, 0) NULL DEFAULT NULL COMMENT '辩证施护标志',
  `TCM_DIAG_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医诊断费',
  `TCM_TREAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医治疗费',
  `TCM_DIAG_FEE_EXTERNAL` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医类-中医治疗费-中医外治',
  `TCM_DIAG_FEE_BONE` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医类-中医治疗费-中医骨伤',
  `TCM_DIAG_FEE_ACUPUNCTURE` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医类-中医治疗费-针刺与灸法',
  `TCM_DIAG_FEE_MASSAGE` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医类-中医治疗费-中医推拿治疗',
  `TCM_DIAG_FEE_ANORECTAL` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医类-中医治疗费-中医肛肠治疗',
  `TCM_DIAG_FEE_SPECIAL` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医类-中医治疗费-中医特殊治疗',
  `TCM_TREAT_FEE_OTHER` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医其他治疗费',
  `TCM_OTHER_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医类-中医其他费-中药特殊调配加工',
  `TCM_TREAT_FEE_DIET` decimal(12, 4) NULL DEFAULT NULL COMMENT '中医类-中医治疗费-辩证施膳',
  `DRUG_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '西药费',
  `DRUG_ANTIBACT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '西药费-抗菌药物费用',
  `CTM_DRUG_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '中成药费',
  `HERB_MEDICINE_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '中草药费',
  `BLOOD_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '血费',
  `ALBUMIN_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '白蛋白类制品费',
  `GLOBULIN_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '球蛋白类制品费',
  `CRUOR_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '凝血因子类制品费',
  `CYTOKINE_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '细胞因子类制品费',
  `USED_TCM_DATE` decimal(3, 0) NULL DEFAULT NULL COMMENT '使用中医诊疗设备标志',
  `MATERIALS_CHECK_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '一次性医用材料费-检查用',
  `MATERIALS_TREAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '一次性医用材料费-治疗用',
  `MATERIALS_OPREAT_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '一次性医用材料费-手术用',
  `OTHERS_FEE` decimal(12, 4) NULL DEFAULT NULL COMMENT '其他费',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_firstpage_medicalrecord_tcm
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_firstrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_firstrecord`;
CREATE TABLE `cdr_emr_firstrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `SUPERIOR_PHYSICIAN_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '上级医生签字日期',
  `SUPERIOR_PHYSICIAN_CODE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医生编码',
  `SUPERIOR_PHYSICIAN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级医生姓名',
  `INPATIENT_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '住院医师签字日期',
  `INPATIENT_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主诉',
  `PATIENT_FEATURE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病例特点',
  `DIAGNOSIS_BASIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊断依据',
  `PREDIAG_WM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '初步诊断-西医诊断名称',
  `PREDIAG_TCM_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初步诊断-中医病名代码',
  `PREDIAG_TCM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '初步诊断-中医病名',
  `PREDIAG_TCM_SYNDROMENAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '初步诊断-中医证候名称',
  `DIFFDIAG_WM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '鉴别诊断-西医诊断名称',
  `DIFFDIAG_TCM_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '鉴别诊断-中医病名代码',
  `DIFFDIAG_TCM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '鉴别诊断-中医病名',
  `DIFFDIAG_TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '鉴别诊断-中医证候名称',
  `TREATMENT_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗计划',
  `THERAPEUTIC_PRINCIPLEANDMETHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '治则治法',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_firstrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_firstrecord_afteropreation
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_firstrecord_afteropreation`;
CREATE TABLE `cdr_emr_firstrecord_afteropreation`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期时间，数字格式',
  `ASSIGNED_DOC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `ASSIGNED_DOC_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生姓名',
  `OPERATION_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术代码，手术(操作)代码表(ICD-9-CM)',
  `OPERATION_PROCESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容描述',
  `NOTICES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注意事项',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_firstrecord_afteropreation
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_general_nurserecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_general_nurserecord`;
CREATE TABLE `cdr_emr_general_nurserecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `AUTHOR_SIGN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '护理记录书写日期',
  `AUTHOR_NUR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理记录书写护士编码',
  `AUTHOR_NUR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理记录书写护士名称',
  `SIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '护理记录签名时间',
  `SIGNED_NUR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理记录签名护士编码',
  `SIGNED_NUR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理记录签名护士名称',
  `WEIGHT` decimal(65, 30) NULL DEFAULT NULL COMMENT '体重',
  `TEMPERATURE` decimal(65, 30) NULL DEFAULT NULL COMMENT '体温',
  `PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '脉率   ',
  `RATE_RESPIRATORY` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸频率',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '舒张压',
  `BLOOD_OXYGEN_SATURATION` decimal(65, 30) NULL DEFAULT NULL COMMENT '血氧饱和度',
  `ISDORSALIS_PEDIS_PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '足背动脉搏动标志 ',
  `DIET_SATUTRTION_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '饮食情况代码， ',
  `NURSE_LEVEL_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理等级代码， ',
  `NURSE_LEVEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理等级 ',
  `NURSE_TYPE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理类型代码， ',
  `NURSE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理类型',
  `CATHETER_NURSE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导管护理描述',
  `TRACHEA_NURSE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '气管护理代码，气管护理代码表',
  `POSTURE_NURSE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体位护理',
  `SKIN_NURSE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮肤护理',
  `NUTRITION_NURSE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营养护理',
  `PSYCHOLOGIC_NURSE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '心理护理代码，心理护理代码表',
  `SAFETY_NURSE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '安全护理代码， ',
  `NURSE_OBSERVED` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简要病情',
  `NURSE_OBSERVED_ITEM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察项目名称',
  `NURSE_OBSERVED_RESULIT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察结果',
  `NURSE_OPERATE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作名称',
  `NURSE_OPERATE_ITEM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作项目类目名称',
  `NURSE_OPERATE_RESULT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作结果',
  `ISSEND_SUG_SAFETY` decimal(65, 30) NULL DEFAULT NULL COMMENT '发出手术安全核对表标志 ',
  `ISCOLLECT_SUG_SAFETY` decimal(65, 30) NULL DEFAULT NULL COMMENT '收回手术安全核对表标志 ',
  `ISSEND_SUG_RISK` decimal(65, 30) NULL DEFAULT NULL COMMENT '发出手术风险评估表标志 ',
  `ISCOLLECT_SUG_RISK` decimal(65, 30) NULL DEFAULT NULL COMMENT '收回手术风险评估表标志 ',
  `ISNURSE_ISOLATION` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理隔离标志 ',
  `NURSE_ISOLATION_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理隔离种类代码',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_general_nurserecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_general_surgeryrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_general_surgeryrecord`;
CREATE TABLE `cdr_emr_general_surgeryrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `IS_INVASIVE` decimal(65, 30) NULL DEFAULT NULL COMMENT '手术史标志  ',
  `OPERATION_BEGINDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术开始日期时间',
  `OPERATION_ENDDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术结束日期时间',
  `OPERATION_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生编码',
  `OPERATION_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生名称',
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手姓名',
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手姓名',
  `NURSE_INSTRUMENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '器械护士名称',
  `NURSE_PATROL_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡台护士名称',
  `OPERATION_LEVEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术级别',
  `OPERATION_CLASSIFICATION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切口分类',
  `OPERATION_WOUND_GRADE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术切口等级',
  `BLEEDING_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '出血量',
  `MEASURE_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '血量计量单位',
  `BLOOD_TRANSFUSION_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '输血量',
  `BLOOD_TRANSFUSED` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输血反应',
  `ANESTHESIA_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方式',
  `ANESTHESIA_TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方式编码',
  `ANESTHESIA_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师编码',
  `ANESTHESIA_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师姓名',
  `ANESTHESIA_BEGINTIME` datetime(0) NULL DEFAULT NULL COMMENT '麻醉开始时间',
  `ANESTHESIA_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '麻醉结束时间',
  `OPERATION_SITE_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术目标部位代码',
  `OPERATION_SITE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术目标部位名称',
  `PREOPERATIVE_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '术前诊断',
  `POSTOPERATIVE_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '术后诊断',
  `OPERATION_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术名称',
  `OPERATION_PROCESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术过程描述',
  `POSTOPERATIVE_TREATMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '术后处置',
  `OPERATION_MATERIAL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介入物名称',
  `OPERATION_SITE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术体位代码',
  `OPERATION_SITE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术体位名称',
  `DISINFECTION_DESC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮肤消毒描述',
  `INCISION_DESC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术切口描述',
  `STIME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术持续时间(分钟) ',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `APPLICATIONNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单号',
  `OPERATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术代码',
  `OPERATION_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术类型：诊断操作、介入治疗等'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_general_surgeryrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_general_surgeryrecord_copy
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_general_surgeryrecord_copy`;
CREATE TABLE `cdr_emr_general_surgeryrecord_copy`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL,
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_INVASIVE` decimal(65, 30) NULL DEFAULT NULL,
  `OPERATION_BEGINDATE` datetime(0) NULL DEFAULT NULL,
  `OPERATION_ENDDATE` datetime(0) NULL DEFAULT NULL,
  `OPERATION_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NURSE_INSTRUMENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NURSE_PATROL_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_LEVEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_CLASSIFICATION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_WOUND_GRADE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BLEEDING_VOLUME` decimal(65, 30) NULL DEFAULT NULL,
  `MEASURE_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BLOOD_TRANSFUSION_VOLUME` decimal(65, 30) NULL DEFAULT NULL,
  `BLOOD_TRANSFUSED` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ANESTHESIA_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_BEGINTIME` datetime(0) NULL DEFAULT NULL,
  `ANESTHESIA_ENDTIME` datetime(0) NULL DEFAULT NULL,
  `OPERATION_SITE_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_SITE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PREOPERATIVE_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `POSTOPERATIVE_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OPERATION_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_PROCESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `POSTOPERATIVE_TREATMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OPERATION_MATERIAL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `OPERATION_SITE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_SITE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISINFECTION_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `INCISION_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `STIME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LAST_UPDATE_TIME` datetime(0) NOT NULL,
  `APPLICATIONNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_general_surgeryrecord_copy
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_inandout_record
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_inandout_record`;
CREATE TABLE `cdr_emr_inandout_record`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `NURSE_LEVEL_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理等级代码， ',
  `NURSE_TYPE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理类型代码， ',
  `RECORD_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '记录日期时间点',
  `TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型：入量/出量',
  `PROJECT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名（水、食物等，药品则为药品名）',
  `MEDICATION_DOSAGE` decimal(65, 30) NULL DEFAULT NULL COMMENT '剂量(单次)',
  `MEDICATION_DOSAGE_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '剂量(单次)单位',
  `MEDICATION_QUANTITY` decimal(65, 30) NULL DEFAULT NULL COMMENT '数量',
  `TOTLE_DOSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '总量',
  `RECORD_NUR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录护士编码',
  `RECORD_NUR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录护士名称',
  `DRUG_METHOD` decimal(20, 0) NULL DEFAULT NULL COMMENT '药物用法代码，用药途径代码表',
  `DRUG_METHOD_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '药物用法名称',
  `MEDICATION_FREQUENCY` decimal(65, 30) NULL DEFAULT NULL COMMENT '用药频率',
  `MEDICATION_FREQUENCY_UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用药频率单位',
  `ITEM_COLOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `ITEM_CHARACTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性状',
  `ITEM_COMMENT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IS_VOMIT` decimal(65, 30) NULL DEFAULT NULL COMMENT '呕吐标志 ',
  `IS_DYSURIA` decimal(65, 30) NULL DEFAULT NULL COMMENT '排尿困难标志 ',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_inandout_record
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_intractable_discussionrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_intractable_discussionrecord`;
CREATE TABLE `cdr_emr_intractable_discussionrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DISCUSSION_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '讨论时间',
  `DISCUSSION_ADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讨论地点',
  `DOCTOR_DIRECTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师',
  `RECORD_AUDITOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接诊医师编码',
  `INPATIENT_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编码',
  `INPATIENT_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师名称',
  `CHARGE_DOCTOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `MEETING_CHAIR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主持人',
  `MEETING_CHAIR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主持人员编码',
  `PARTICIPANTS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参会人员',
  `DISCUSSION_OPINIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '讨论意见',
  `DIRECTOR_OPINIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主任意见',
  `DOCTOR_OPINIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主治/副主任意见',
  `OTHER_OPINIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他人意见',
  `DISCUSSION_SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主持人总结意见',
  `SYNDROME_DIFFERENTIATION_TREATMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '辨证论治',
  `TCM_DECOCTING_WAYS` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药饮片煎煮法',
  `TCM_MEDICATION` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药用药方法',
  `TCM_DOCTORADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '中药处方医嘱内容',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_intractable_discussionrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_medicalrecord_summary
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_medicalrecord_summary`;
CREATE TABLE `cdr_emr_medicalrecord_summary`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `MARRIAGE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻',
  `OCCUPATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业',
  `NATIVE_ADDRESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '单位或地址',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院时间',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `AGENT_SIGN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病史陈述者姓名',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主诉',
  `ILLNESS_CURRENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '现病史',
  `ILLNESS_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '既往史',
  `DISEASE_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '疾病史',
  `INFECTION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '传染病史',
  `OPERATION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术史',
  `MARRY_HISTOYR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '婚育史',
  `TRANSFUSION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输血史',
  `ALLERGY_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '过敏史',
  `VACCINATION_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预防接种史',
  `PERSONAL_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人史',
  `MENSTRUAL_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '月经史',
  `FAMILY_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '家族史',
  `BREATH_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '呼吸系统',
  `CIRCULATE_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '循环系统',
  `DIGESTION_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消化系统',
  `REPRODUCTION_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '泌尿系统',
  `BLOOD_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '血液系统',
  `ENDOCRINE_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内分泌系统',
  `MUSCLE_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '肌肉及关节',
  `NERVE_SYSTEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '神经系统',
  `MEDICAL_TREATMENT_T` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其它医学处置',
  `RESPONS_DOCTOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医师编码',
  `RESPONS_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医师姓名',
  `INSURANCE_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗保险类别代码',
  `INSURANCE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗保险类别名称',
  `MZ_FEE` decimal(65, 30) NULL DEFAULT NULL COMMENT '门诊总费用，单位“元”',
  `ZY_FEE` decimal(65, 30) NULL DEFAULT NULL COMMENT '住院总费用，单位“元”',
  `PERSONAL_FEE` decimal(65, 30) NULL DEFAULT NULL COMMENT '个人承担费用，单位“元”',
  `RECORDE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '记录时间，',
  `REVOKE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '撤销时间',
  `LAST_MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_medicalrecord_summary
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_notice_criticalcondition
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_notice_criticalcondition`;
CREATE TABLE `cdr_emr_notice_criticalcondition`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `CHARGE_DOCTOR_SIGNTIME` datetime(0) NULL DEFAULT NULL COMMENT '责任医师签署日期',
  `CHARGE_DOCTORID` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生编号',
  `CHARGE_DOCTOR` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生姓名',
  `PATIENT_SIGN_TIEM` datetime(0) NULL DEFAULT NULL COMMENT '患者 签名日期时间',
  `PATIENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者签名',
  `AGENT_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '患者代理人签名时间',
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人签名',
  `AGENT_RELATIONSHIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系',
  `AGENT_RELATIONSHIP_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系代码',
  `DIAGNOSIS_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病诊断编码',
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病诊断名称',
  `CONDITION_GENERAL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病情概况以及主要抢救措施',
  `CRITICALLY_ILL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '病危（重）通知时间',
  `CRITICALLY_ILL_CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病危（重）通知内容',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_notice_criticalcondition
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_notice_criticalcondition_cp
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_notice_criticalcondition_cp`;
CREATE TABLE `cdr_emr_notice_criticalcondition_cp`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL,
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL,
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DOCTOR_SIGNTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_DOCTORID` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DOCTOR` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_SIGN_TIEM` datetime(0) NULL DEFAULT NULL,
  `PATIENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENT_SIGNDATE` datetime(0) NULL DEFAULT NULL,
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENT_RELATIONSHIP` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGENT_RELATIONSHIP_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONDITION_GENERAL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CRITICALLY_ILL_DATE` datetime(0) NULL DEFAULT NULL,
  `CRITICALLY_ILL_CONTENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_notice_criticalcondition_cp
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_operation_informedconsent
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_operation_informedconsent`;
CREATE TABLE `cdr_emr_operation_informedconsent`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `OPERATION_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术医生签名时间',
  `OPERATION_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生编码',
  `OPERATION_DOCTOR_SIGN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生签名',
  `PATIENT_SIGN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者签名',
  `PATIENT_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '患者签名时间',
  `AGENT_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '患者代理人签名时间',
  `AGENT_SIGN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人签名',
  `AGENT_RELATIONSHIP_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '患者代理人关系代码，',
  `PREOPERATIVE_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '术前诊断名称',
  `OPERATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术名称',
  `OPERATION_PLAN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '手术计划日期时间',
  `OPERATION_METHOD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术方式描述',
  `PREOPERATIVE_PREPARATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前准备',
  `OPERATION_CONTRAINDICATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术禁忌症',
  `OPERATION_INDICATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术指征',
  `ANESTHESIA_TYPE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '拟实施麻醉方法',
  `ALTERNATIVES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '替代方案',
  `OPERATION_ORG_ADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医疗机构的意见',
  `PATIENT_OPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '患者的意见',
  `INTRAOPERATIVE_UNEXPECTED` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术中可能出现的意外及风险',
  `POSTOPERATIVE_UNEXPECTED` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术后可能出现的意外以及风险',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_operation_informedconsent
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_other_informedconsent
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_other_informedconsent`;
CREATE TABLE `cdr_emr_other_informedconsent`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ATTENDING_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '医师签名时间',
  `ATTENDING_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师编码',
  `ATTENDING_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师签名',
  `PATIENT_SIGN` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者签名',
  `PATIENT_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '患者签名时间',
  `AGENT_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '患者代理人签名时间',
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人签名',
  `AGENT_RELATIONSHIP` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系',
  `AGENT_RELATIONSHIP_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系代码',
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病诊断名称',
  `DIAGNOSIS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病诊断编码',
  `INFORMED_CONSENT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知情同意书名称',
  `OPERATION_ORG_ADVICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构的意见',
  `PATIENT_OPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '患者的意见',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `INFORMED_CONSENT_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '知情同意书内容'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_other_informedconsent
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_pathomepage_diagnosis
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_pathomepage_diagnosis`;
CREATE TABLE `cdr_emr_pathomepage_diagnosis`  (
  `UNICODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(219) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `SORT_NO` decimal(2, 0) NOT NULL,
  `DIAGNOSIS_DATE` datetime(0) NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DIAGNOSIS_TYPE_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIAGNOSIS_TYPE_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_pathomepage_diagnosis
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_preoperative_discussion
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_preoperative_discussion`;
CREATE TABLE `cdr_emr_preoperative_discussion`  (
  `OPERATION_PROGRAM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术方案',
  `DISCUSSION_OPINIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '讨论意见',
  `DISCUSSION_CONCLUSION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '讨论结论',
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DISCUSSION_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '讨论时间',
  `DISCUSSION_ADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讨论地点',
  `OPERATION_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生编码',
  `OPERATION_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生名称',
  `OPERATION_DOCTOR_POST` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生专业技术职务类别',
  `OPERATION_DOCTOR_POST_CODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生专业技术职务类别代码',
  `OPERATION_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术医生签字时间',
  `ANESTHESIA_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师编码',
  `ANESTHESIA_DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师姓名',
  `ANESTHESIA_DOCTOR_POST` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师专业技术职务类别',
  `ANESTHESIA_DOCTOR_POST_CODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师专业技术职务类别代码',
  `ANESTHESIA_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '麻醉医师签字时间',
  `CHARGE_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师编码',
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师名称',
  `CHARGE_DOCTOR_POST` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师专业技术职务类别',
  `CHARGE_DOCTOR_POST_CODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医师专业技术职务类别代码',
  `CHARGE_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '医师签字时间',
  `PARTICIPANTS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参会人员',
  `MEETING_CHAIR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主持人',
  `MEETING_CHAIR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主持人员编码',
  `PREOPERATIVE_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '术前诊断名称',
  `PREOPERATIVE_DIAGNOSIS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前诊断代码',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间',
  `OPERATION_CODE_PLAN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施手术代码密码',
  `OPERATION_NAME_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '拟实施手术名称',
  `OPERATION_SITE_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '拟实施手术目标部位名称',
  `OPERATION_DATE_PLAN` datetime(0) NULL DEFAULT NULL COMMENT '拟实施手术及操作日期时间',
  `ANESTHESIA_TYPE_CODE_PLAN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施麻醉方法代码',
  `ANESTHESIA_NAME_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '拟实施麻醉名称',
  `NOTICES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注意事项',
  `OPERATION_KEY_POINTS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术要点',
  `PREOPERATIVE_PREPARATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '术前准备',
  `OPERATION_INDICATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术指征',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_preoperative_discussion
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_preoperative_summary
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_preoperative_summary`;
CREATE TABLE `cdr_emr_preoperative_summary`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `OPERATION_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生编码',
  `OPERATION_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生名称',
  `OPERATION_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术医生签字时间',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期时间',
  `ASSIGNED_DOC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `ASSIGNED_DOC_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生姓名',
  `CONTACT_PERSON` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `CONTACT_PHONE` decimal(65, 30) NULL DEFAULT NULL COMMENT '联系人电话',
  `MEDICAL_RECORDS_SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病历摘要章节',
  `PREOPERATIVE_DIAGNOSIS` decimal(65, 30) NULL DEFAULT NULL COMMENT '术前诊断名称',
  `PREOPERATIVE_DIAGNOSIS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前诊断代码，诊断代码表（ICD-10）',
  `DIAGNOSIS_BASIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊断依据',
  `IS_ALLERGIES` decimal(65, 30) NULL DEFAULT NULL COMMENT '过敏史标志',
  `ALLERGIES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '过敏史',
  `EXAMINATION_AUXILIARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '辅助检查结果',
  `OPERATION_ADAPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术适应证',
  `OPERATION_CONTRAINDICATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术禁忌症',
  `OPERATION_INDICATION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术指征',
  `CONSULTATION_ADVICES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会诊意见',
  `OPERATION_CODE_PLAN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施手术代码',
  `OPERATION_NAME_PLAN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施手术名称',
  `OPERATION_SITE_PLAN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施手术目标部位名称',
  `OPERATION_DATE_PLAN` datetime(0) NULL DEFAULT NULL COMMENT '拟实施手术及操作日期时间',
  `ANESTHESIA_TYPE_CODE_PLAN` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施麻醉方法代码',
  `ANESTHESIA_NAME_PLAN` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟实施麻醉名称',
  `NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `OPERATION_KEY_POINTS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术要点',
  `PREOPERATIVE_PREPARATION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前准备',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_preoperative_summary
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_relief_shiftrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_relief_shiftrecord`;
CREATE TABLE `cdr_emr_relief_shiftrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `HANDOVER_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '交班日期时间',
  `HANDOVER_PERSON_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交班者编码',
  `HANDOVER_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交班者姓名',
  `SUCCEED_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '接班日期时间',
  `SUCCEED_PERSON_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接班者编码',
  `SUCCEED_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接班者姓名',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间',
  `ADMISSION_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院情况',
  `CURRENT_SITUATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '目前情况',
  `SUCCEED_TREATMENT_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '接班诊疗计划',
  `NOTICES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注意事项',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `RECORD_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交接班类型',
  `RECORD_TYPE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '交接班类型代码',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_relief_shiftrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_rescuerecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_rescuerecord`;
CREATE TABLE `cdr_emr_rescuerecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期时间',
  `ASSIGNED_DOC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `ASSIGNED_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生姓名',
  `ASSIGNED_DOC_POST` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生职务类别',
  `ASSIGNED_DOC_POSTCODE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职务类别编码,专业技术职务类别代码表',
  `PARTICIPANTS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参会人员',
  `CHANGE_OF_DISEASE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病情变化情况',
  `NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `OPERATION_CODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术代码',
  `OPERATION_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术名称',
  `OPERATION_SITE_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术目标部位代码',
  `OPERATION_SITE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术目标部位名称',
  `OPERATION_MATERIAL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介入物名称',
  `OPERATION_METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作方法描述',
  `OPERATION_NUMBER` decimal(65, 30) NULL DEFAULT NULL COMMENT '操作次数',
  `RESCUE_MEASURES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '抢救措施',
  `RESCUE_BEGINDATE` datetime(0) NULL DEFAULT NULL COMMENT '抢救开始时间',
  `RESCUE_ENDDATE` datetime(0) NULL DEFAULT NULL COMMENT '抢救结束时间',
  `INSPECTION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查/检验名称',
  `INSPECTION_ITEMS` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查/检验项目',
  `INSPECTION_QUANTITATIVE_RESULT` decimal(4, 4) NULL DEFAULT NULL COMMENT '检查/检验定量结果',
  `INSPECTION_QUAN_RESULT_UNIT` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查/检验定量结果单位,如mmHg',
  `INSPECTION_RESULT_CODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查/检验结果代码，如1.异常 2.正常 3.不确定',
  `INSPECTION_RESULT` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查/检验结果结果',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_rescuerecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_serious_nurserecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_serious_nurserecord`;
CREATE TABLE `cdr_emr_serious_nurserecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `WEIGHT` decimal(3, 2) NULL DEFAULT NULL COMMENT '体重',
  `TEMPERATURE` decimal(2, 1) NULL DEFAULT NULL COMMENT '体温',
  `RATE_HEART` decimal(65, 30) NULL DEFAULT NULL COMMENT '心率',
  `RATE_RESPIRATORY` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸频率',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '舒张压',
  `BLOOD_SUGAR` decimal(3, 2) NULL DEFAULT NULL COMMENT '血糖检测值',
  `DIET_SATUTRTION_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '饮食情况代码， ',
  `NURSE_LEVEL_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理等级代码， ',
  `CATHETER_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '导管护理描述',
  `POSTURE_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体位护理描述',
  `SKIN_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮肤护理描述',
  `NURSE_LEVEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理等级 ',
  `NURSE_TYPE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理类型代码， ',
  `NURSE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理类型',
  `NURSE_OBSERVED_ITEM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察项目名称',
  `NURSE_OBSERVED_RESULIT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察结果',
  `NURSE_OPERATE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作名称',
  `NURSE_OPERATE_RESULT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作结果',
  `VENTILATOR_MONITORING_ITEM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '呼吸机监护项目',
  `VENTILATOR_MONITORING_DD` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸机使用时间（天）',
  `VENTILATOR_MONITORING_HH` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸机使用时间（小时）',
  `VENTILATOR_MONITORING_MM` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸机使用时间（分）',
  `IN_ICU_FALG` decimal(65, 30) NULL DEFAULT NULL COMMENT '是否入住重症监护病房',
  `IN_ICU_TYPE` decimal(65, 30) NULL DEFAULT NULL COMMENT '入住重症监护病房类型  ',
  `IN_ICU_DD` decimal(65, 30) NULL DEFAULT NULL COMMENT '入住重症监护病房时间（天）',
  `IN_ICU_HH` decimal(65, 30) NULL DEFAULT NULL COMMENT '入住重症监护病房时间（小时）',
  `IN_ICU_MM` decimal(65, 30) NULL DEFAULT NULL COMMENT '入住重症监护病房时间（分）',
  `RESCUE_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '有无抢救',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_serious_nurserecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_sm_surgeryrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_sm_surgeryrecord`;
CREATE TABLE `cdr_emr_sm_surgeryrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `OUTPATIENT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门(急)诊号',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `APPLICATIONNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术申请单号',
  `IS_INVASIVE` decimal(65, 30) NULL DEFAULT NULL COMMENT '手术史标志  ',
  `OPERATION_BEGINDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术开始日期时间',
  `OPERATION_ENDDATE` datetime(0) NULL DEFAULT NULL COMMENT '手术结束日期时间',
  `OPERATION_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生编码',
  `OPERATION_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生名称',
  `FIRST_ASSISTANTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手编码',
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手',
  `SECEND_ASSISTANT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手编码',
  `TRANSPORTOR_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转运者编码',
  `TRANSPORTOR_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转运者姓名',
  `NURSE_HANDOVERID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交接护士编码',
  `NURSE_HANDOVERNAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交接护士名称',
  `NURSE_HANDOVER_TIME` datetime(0) NULL DEFAULT NULL COMMENT '交接护士签名时间',
  `NUR_PATROL_TIME_BFOP` datetime(0) NULL DEFAULT NULL COMMENT '术前巡台时间',
  `NUR_PATROLID_BFOP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前巡台护士编码',
  `NUR_PATROL_NAME_BFOP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前巡台护士名称',
  `NUR_INSTRUMENT_TIME_BFOP` datetime(0) NULL DEFAULT NULL COMMENT '术前器械护士签字时间',
  `NUR_INSTRUMENTID_BFOP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前器械护士编码',
  `NUR_INSTRUMENT_NAME_BFOP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前器械护士名称',
  `ANESTHESIA_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师编码',
  `ANESTHESIA_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师姓名',
  `OPERATION_LEVEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术级别',
  `OPERATION_CLASSIFICATION` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切口分类',
  `OPERATION_WOUND_GRADE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术切口等级',
  `BLEEDING_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '出血量',
  `BLOOD_TRANSFUSION_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '输血量',
  `ANESTHESIA_TYPE` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方式',
  `ANESTHESIA_TYPE_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方式编码',
  `BREATHING_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '呼吸类型',
  `BREATHING_TYPE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸类型代码',
  `ANESTHESIA_BEGINTIME` datetime(0) NULL DEFAULT NULL COMMENT '麻醉开始时间',
  `ANESTHESIA_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '麻醉结束时间',
  `OPERATION_SITE_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术目标部位代码',
  `OPERATION_SITE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术目标部位名称',
  `PREOPERATIVE_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前诊断',
  `POSTOPERATIVE_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术后诊断',
  `OPERATION_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术名称',
  `OPERATION_MATERIAL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介入物名称',
  `OPERATION_SITE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术体位代码',
  `OPERATION_SITE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术体位名称',
  `DISINFECTION_DESC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮肤消毒描述',
  `INCISION_DESC` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术切口描述',
  `STIME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术持续时间(分钟)，院感接口新增',
  `IN_SURGERY_ITEMS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术中所用物品名称',
  `NUR_PATROL_TIME_BFCLOSE` datetime(0) NULL DEFAULT NULL COMMENT '关前巡台时间',
  `NUR_PATROLID_BFCLOSE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关前巡台护士编码',
  `ENUR_PATROL_NAME_BFCLOSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关前巡台护士名称',
  `NUR_INSTRUMENT_TIME_BFCLOSE` datetime(0) NULL DEFAULT NULL COMMENT '关前器械护士签字时间',
  `NUR_INSTRUMENTID_BFCLOSE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关前器械护士编码',
  `NUR_INSTRUMENT_NAME_BFCLOSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关前器械护士名称',
  `NUR_PATROL_TIME_AFCLOSE` datetime(0) NULL DEFAULT NULL COMMENT '关后巡台时间',
  `NUR_PATROLID_AFCLOSE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关后巡台护士编码',
  `ENUR_PATROL_NAME_AFCLOSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关后巡台护士名称',
  `NUR_INSTRUMENT_TIME_AFCLOSE` datetime(0) NULL DEFAULT NULL COMMENT '关后器械护士签字时间',
  `NUR_INSTRUMENTID_AFCLOSE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关后器械护士编码',
  `NUR_INSTRUMENT_NAME_AFCLOSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关后器械护士名称',
  `NUR_HANDOVER_TIME_AFOP` datetime(0) NULL DEFAULT NULL COMMENT '术后交接护士交接时间',
  `NUR_HANDOVERID_AFOP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术后交接护士编码',
  `NUR_HANDOVERNAME_AFOP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术后交接护士名称',
  `TRANSPORTOR_CODE_AFOP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术后转运者编码',
  `TRANSPORTOR_NAME_AFOP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术后转运者姓名',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `ASA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手',
  `SECEND_ASSISTANTID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SURGERY_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术编码',
  `PREOPERATIVE_DIAGNOSTIC_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '术前诊断编码',
  `OPERATING_ROOM_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术室编号',
  `SURGICAL_SCHEDULING_TIME` datetime(0) NULL DEFAULT NULL COMMENT '手术排班时间',
  `OPERATION_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_sm_surgeryrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_specialexamandtreat_consent
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_specialexamandtreat_consent`;
CREATE TABLE `cdr_emr_specialexamandtreat_consent`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `AUTHOR_SIGN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '治疗同意书文档书写签署日期',
  `AUTHOR_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治疗同意书文档作者编码',
  `AUTHOR_DOC_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治疗同意书文档作者名称',
  `CHARGE_DOCTOR_SIGNTIME` datetime(0) NULL DEFAULT NULL COMMENT '责任医师签署日期',
  `CHARGE_DOCTORID` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生编号',
  `CHARGE_DOCTOR` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生姓名',
  `PATIENT_SIGN_TIEM` datetime(0) NULL DEFAULT NULL COMMENT '患者签名日期时间',
  `PATIENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者签名',
  `AGENT_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '患者代理人签名时间',
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人签名',
  `AGENT_RELATIONSHIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系',
  `AGENT_RELATIONSHIP_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系代码',
  `SPECIAL_TREAT_ITEM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊检查及特殊治疗项目名称',
  `SPECIAL_TREAT_PURPOSE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊检查及特殊治疗目的',
  `ALTERNATIVES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '替代方案',
  `SPECIAL_TREAT_RISK` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '特殊检查及特殊治疗可能引起的并发症及风险',
  `OPERATION_ORG_ADVICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构的意见',
  `PATIENT_OPTION` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者的意见',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_specialexamandtreat_consent
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_stagerecord_summary
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_stagerecord_summary`;
CREATE TABLE `cdr_emr_stagerecord_summary`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期时间',
  `ASSIGNED_DOC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `ASSIGNED_DOC_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生姓名',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主诉',
  `CURRENT_SITUATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '目前情况',
  `CURRDIAG_WM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '目前诊断-西医诊断名称',
  `CURRDIAG_TCM` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目前诊断-中医病名',
  `CURRDIAG_TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目前诊断-中医证候名称',
  `TCM_OBSERVATIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '中医“四诊”观察结果',
  `FUTURE_TREATMENT_OPTIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '今后治疗方案',
  `THERAPEUTIC_PRINCIPLEANDMETHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '治则治法',
  `DOCTORADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱内容',
  `TCM_DECOCTING_WAYS` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药煎煮方法',
  `TCM_MEDICATION` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药用药方法',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_stagerecord_summary
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_superiordoctors_wardinspection
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_superiordoctors_wardinspection`;
CREATE TABLE `cdr_emr_superiordoctors_wardinspection`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `DOCTOR_DIRECTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任医师编号',
  `DOCTOR_DIRECTOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主任医师',
  `DOCTOR_DIRECTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主任医师签字日期',
  `CHARGE_DOCTOR_ID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `CHARGE_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '主治医师签名日期',
  `RECORD_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '查房记录日期时间',
  `WARD_ROUND_RECORDS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '查房记录',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_superiordoctors_wardinspection
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_surgical_nurserecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_surgical_nurserecord`;
CREATE TABLE `cdr_emr_surgical_nurserecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `WEIGHT` decimal(3, 0) NULL DEFAULT NULL COMMENT '体重',
  `ABO_BLOOD_TYPE` decimal(65, 30) NULL DEFAULT NULL COMMENT 'ABO血型代码',
  `ABO_BLOOD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ABO血型',
  `RH_BLOOD_TYPE` decimal(65, 30) NULL DEFAULT NULL COMMENT 'Rh血型代码  ',
  `RH_BLOOD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Rh血型',
  `SKIN_CHECK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮肤检查描述',
  `NURSE_LEVEL_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理等级代码， ',
  `NURSE_LEVEL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理等级 ',
  `NURSE_TYPE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '护理类型代码， ',
  `NURSE_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理类型',
  `NURSE_OBSERVED_ITEM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察项目名称',
  `NURSE_OBSERVED_RESULIT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察结果',
  `NURSE_OPERATE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作名称',
  `NURSE_OPERATE_ITEM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作项目类目名称',
  `NURSE_OPERATE_RESULT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理操作结果',
  `OPERATIONROOM_IN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '入手术室日期时间',
  `OPERATIONROOM_OUT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '出手术室日期时间',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_surgical_nurserecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_therapyrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_therapyrecord`;
CREATE TABLE `cdr_emr_therapyrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `IS_INVASIVE` decimal(65, 30) NULL DEFAULT NULL COMMENT '有创诊疗操作标志',
  `DOCTORADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '处理及指导意见',
  `TREATMENT_PROJECT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '治疗方案',
  `TREATMENT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '治疗项目',
  `EFFECT_JUDGE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '效果评价',
  `FUTURE_TREATMENT_SOLUTIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '今后治疗方案',
  `REVOKE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '撤销时间',
  `LAST_MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '编辑时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_therapyrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_transferredrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_transferredrecord`;
CREATE TABLE `cdr_emr_transferredrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统域标识01门诊02住院\r\n03体检\r\n04急诊',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NOT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NOT NULL COMMENT '性别代码代码0未知的性别代码，1 男性，2女性，9未说明的性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NOT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文档作者',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主诉',
  `ADMISSION_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '入院情况',
  `ADMIISSION_DIAG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '入院诊断-西医诊断名称',
  `ADMIISSION_DIAG_CODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '入院诊断-西医诊断代码',
  `TREATMENT_PROCESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '治疗经过',
  `CURRENT_SITUATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目前情况',
  `CURRENT_DIAG` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目前诊断',
  `TREATMENT_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转入诊疗计划',
  `NOTICES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注意事项',
  `TRANSFER_OUT_DEPARTMENTID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转出科室编码',
  `TRANSFER_OUT_DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转出科室名称',
  `TRANSFER_OUT_AREA_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转出病区代码',
  `TRANSFER_OUT_AREA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转出病区名称',
  `SHIFT_TO_DEPARTMENTID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转入科室编码',
  `SHIFT_TO_DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转入科室名称',
  `SHIFT_TO_AREA_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转入病区代码',
  `TRANSFER_PURPOSE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转科目的',
  `TRANSFER_OUT_RECORD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转科记录类型1	转入记录\r\n2	转出记录',
  `TRANSFER_OUT_RECORDCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '转科记录类型代码表'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_transferredrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_transfusion_therapyconsent
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_transfusion_therapyconsent`;
CREATE TABLE `cdr_emr_transfusion_therapyconsent`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `ATTENDING_DOCTOR_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '经治医师签名时间',
  `ATTENDING_DOCTORID` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经治医师编码',
  `ATTENDING_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经治医师签名',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期时间',
  `ASSIGNED_DOC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `ASSIGNED_DOC_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生姓名',
  `PATIENT_SIGN_TIEM` datetime(0) NULL DEFAULT NULL COMMENT '患者签名日期时间',
  `PATIENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者签名',
  `AGENT_SIGNDATE` datetime(0) NULL DEFAULT NULL COMMENT '患者代理人签名时间',
  `AGENT_SIGN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人签名',
  `AGENT_RELATIONSHIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系',
  `AGENT_RELATIONSHIP_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者代理人关系代码',
  `ISBLOOD_TRANS_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血史标志',
  `ISBLOOD_TRANS_NAME` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否有输血史',
  `BLOOD_TRANS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '输血时间',
  `BLOOD_TRANS_WAYS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血方式',
  `BLOOD_TRANS_INDICATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血指征',
  `BLOOD_TRANS_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血品种代码',
  `BLOOD_TRANS_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '输血品种',
  `HBSAG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乙型肝炎表面抗原，输血前有关检查项目',
  `HBSAB` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乙型肝炎表面抗体，输血前有关检查项目',
  `HBEAG` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乙型肝炎病毒抗原，输血前有关检查项目',
  `HBEAB` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乙型肝炎病毒抗体，输血前有关检查项目',
  `HBCAB` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乙型肝炎病毒核心抗体，输血前有关检查项目',
  `ALT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '谷丙转氨酶，输血前有关检查项目',
  `SYPHILIS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '梅毒，输血前有关检查项目',
  `ANTI_HIV_HALF` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抗艾滋病毒，输血前有关检查项目',
  `ANTI_HCV` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抗丙肝病毒，输血前有关检查项目',
  `OPERATION_ORG_ADVICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构的意见',
  `PATIENT_OPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '患者的意见',
  `BLOOD_TRANS_UNEXPECTED` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '输血风险及可能发生的不良后果',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_transfusion_therapyconsent
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_vaginal_deliveryrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_vaginal_deliveryrecord`;
CREATE TABLE `cdr_emr_vaginal_deliveryrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `MIDWIFERY_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接生者编码',
  `MIDWIFERY_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接生者姓名',
  `MIDWIFERY_ASSIST_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '助产者编码',
  `MIDWIFERY_ASSIST_DOCTORNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '助产者姓名',
  `BABY_PROTECTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护婴者编码',
  `BABY_PROTECTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护婴者姓名',
  `PREGANT_NO` decimal(65, 30) NULL DEFAULT NULL COMMENT '孕次',
  `BORNED_NO` decimal(65, 30) NULL DEFAULT NULL COMMENT '产次',
  `PREDICT_BORN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '预产期',
  `COMING_BORN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '临产日期时间',
  `MEMBRANES_BROKE_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '胎膜破裂日期时间',
  `PREAMNIOTIC_FLUID_CONDITION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前羊水性状',
  `PREAMNIOTIC_FLUID_VOLUMN` decimal(65, 30) NULL DEFAULT NULL COMMENT '前羊水量',
  `CONTRACTIONS_BEGINDATE` datetime(0) NULL DEFAULT NULL COMMENT '宫缩开始日期时间',
  `FIRSTBORN_TIME_SPENT` decimal(65, 30) NULL DEFAULT NULL COMMENT '第1产程时长（min）',
  `UTERUS_FULLOPEN_TIMESPENT` datetime(0) NULL DEFAULT NULL COMMENT '宫口开全日期时间',
  `SECENDBORN_TIME_SPENT` decimal(65, 30) NULL DEFAULT NULL COMMENT '第2产程时长（min）',
  `BABYBORN_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '胎儿娩出日期时间',
  `THIRDBORN_TIME_SPENT` decimal(65, 30) NULL DEFAULT NULL COMMENT '第3产程时长（min）',
  `PLACENTA_EMERGE_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '胎盘娩出日期时间',
  `MIDWIFERY_FULLTIME_SPENT` decimal(65, 30) NULL DEFAULT NULL COMMENT '总产程时长（min）',
  `FETAL_POSITION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '胎方位',
  `MIDWIFERY_ASSIST_METHOD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '助产方式',
  `PLACENTA_EMERGE_SITUATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '胎盘娩出情况',
  `IS_FETAL_MEMBRANES_INTACT` decimal(65, 30) NULL DEFAULT NULL COMMENT '胎膜完整情况标志',
  `AMNIOTIC_FLUID_CONDITION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '羊水性状',
  `AMNIOTIC_FLUID_VOLUMN` decimal(65, 30) NULL DEFAULT NULL COMMENT '羊水量（mL）',
  `UMBILICAL_CORD_LENGTH` decimal(65, 30) NULL DEFAULT NULL COMMENT '脐带长度（cm）',
  `NUCHAL_CORD` decimal(65, 30) NULL DEFAULT NULL COMMENT '绕颈身（周）',
  `MEDICATION_BIRTHING` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产时用药',
  `PREVENTIVE_MEASURE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预防措施',
  `IS_EPISIOTOMY` decimal(65, 30) NULL DEFAULT NULL COMMENT '产妇会阴切开标志',
  `EPISIOTOMY_SITE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会阴切开位置',
  `PERINEUM_SUTURE_NUMBER` decimal(65, 30) NULL DEFAULT NULL COMMENT '产妇会阴缝合针数',
  `PERINEUM_LACE_DEGREE_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '产妇会阴裂伤程度,会阴裂伤情况代码表',
  `IS_PERINEUM_HEMATOMA` decimal(65, 30) NULL DEFAULT NULL COMMENT '会阴血肿标志',
  `PERINEUM_HEMATOMA_SIZE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会阴血肿大小',
  `PERINEUM_HEMATOMA_HANDLE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会阴血肿处理',
  `ANESTHESIA_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方法',
  `ANESTHESIA_TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉方法代码, ',
  `ANESTHESIA_DRUG` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉药物名称',
  `CERVIX_SUTURE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '宫颈缝合情况',
  `BIRTHING_SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分娩过程摘要',
  `CONDITION_CONTRACTIONS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '宫缩情况',
  `CONDITION_WOMB` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '子宫情况',
  `CONDITION_LOCHIA` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '恶露状况',
  `CONDITION_PERINEUM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会阴情况',
  `REPAIRPROCEDURE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '修补手术过程',
  `SAVE_CORD_BLOOD` decimal(65, 30) NULL DEFAULT NULL COMMENT '存脐带血情况标志 ',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后15分钟收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后15分钟舒张压',
  `POSTPARTUM_PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后15分钟脉搏（次/min ）',
  `POSTPARTUM_RATE_HEART` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后15分钟心率（次/min ）',
  `POSTPARTUM_BLEEDING_VOLUME` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后出血量（mL）',
  `POSTPARTUM_CONTRACTIONS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '产后宫缩情况',
  `POSTPARTUM_UTERUS_LOC` decimal(65, 30) NULL DEFAULT NULL COMMENT '产后宫底高度（cm）',
  `ANUS_EXAM` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '肛查',
  `BDBY_SEX_ID` decimal(65, 30) NULL DEFAULT NULL COMMENT '新生儿性别代码代码',
  `BDBY_WEIGHT` decimal(65, 30) NULL DEFAULT NULL COMMENT '新生儿出生体重（g）',
  `BDBY_HEIGHT` decimal(3, 1) NULL DEFAULT NULL COMMENT '新生儿出生身长（cm）',
  `APGAR_RATING_INTERVAL_CODE` datetime(0) NULL DEFAULT NULL COMMENT 'Apgar评分间隔时间,Apgar评分间隔时间代码表',
  `APGAR_RATING_INTERVAL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Apgar评分间隔时间',
  `APGAR_SCORE` decimal(65, 30) NULL DEFAULT NULL COMMENT 'Apgar评分值',
  `BIRTHING_RESULT_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '分娩结局',
  `BABY_ABNORMAL_CODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '新生儿异常情况， ',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_vaginal_deliveryrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_emr_vitalsigns_measurerecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_emr_vitalsigns_measurerecord`;
CREATE TABLE `cdr_emr_vitalsigns_measurerecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码代码',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `ROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在科室名称',
  `WARD_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区编码',
  `WARD_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者所在病区名称',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `RECORD_PERSONID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档作者',
  `RATE_RESPIRATORY` decimal(65, 30) NULL DEFAULT NULL COMMENT '呼吸频率',
  `IS_USE_VENTILATOR` decimal(65, 30) NULL DEFAULT NULL COMMENT '使用呼吸机标志 ',
  `PULSE` decimal(65, 30) NULL DEFAULT NULL COMMENT '脉率（次/min）  ',
  `PACEMAKER_HEART_RATE` decimal(65, 30) NULL DEFAULT NULL COMMENT '起搏器心率（次/min）',
  `TEMPERATURE` decimal(4, 2) NULL DEFAULT NULL COMMENT '体温（℃）',
  `PRESSURE_SYSTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '收缩压',
  `PRESSURE_DIASTOLIC` decimal(65, 30) NULL DEFAULT NULL COMMENT '舒张压',
  `WEIGHT` decimal(4, 2) NULL DEFAULT NULL COMMENT '体重',
  `WEIGHT_UNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体重单位',
  `AC` decimal(4, 2) NULL DEFAULT NULL COMMENT '腹围（cm）',
  `NURSE_OBSERVED_ITEM_FIRST` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察项目名称1',
  `NURSE_OBSERVED_RESULIT_FIRST` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '护理观察结果1',
  `NURSE_OBSERVED_ITEM_SECOND` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察项目名称2',
  `NURSE_OBSERVED_RESULIT_SECOND` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察结果2',
  `NURSE_OBSERVED_ITEM_THIRD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察项目名称3',
  `NURSE_OBSERVED_RESULIT_THIRD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理观察结果3',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_emr_vitalsigns_measurerecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_equip_in_out
-- ----------------------------
DROP TABLE IF EXISTS `cdr_equip_in_out`;
CREATE TABLE `cdr_equip_in_out`  (
  `UNICODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一主键',
  `SUPPLIER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商',
  `AMOUNT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '金额',
  `INVOICE_AMOUNT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票金额',
  `FILLING_PERSON` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '填制人',
  `CREATETIME` datetime(0) NULL DEFAULT NULL COMMENT '填制日期',
  `CHECK_PERSON` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `CHECK_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期',
  `ACCOUNTING_DATE` datetime(0) NULL DEFAULT NULL COMMENT '会计日期',
  `CHECK_PERIOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核期间',
  `ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主表明细表关联字段',
  `NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入库编号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_equip_in_out
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_equip_in_out_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_equip_in_out_detail`;
CREATE TABLE `cdr_equip_in_out_detail`  (
  `ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一主键和主表关联',
  `DEVICE_INFORMATION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备信息',
  `SPECIFICATIONS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规格',
  `PRODUCER` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '生产商',
  `GOODS_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货物单号',
  `INVOICE_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票号码',
  `INVOICE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '发票日期',
  `UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位',
  `WAREHOUSING_NUMBER` decimal(3, 0) NULL DEFAULT NULL COMMENT '\r\n数量',
  `INVOICE_UNIT_PRICE` decimal(18, 4) NULL DEFAULT NULL COMMENT '发票单价',
  `INVOICE_VALUE` decimal(18, 4) NULL DEFAULT NULL COMMENT '发票金额',
  `TRANS_MISCELL_EXPENSES` decimal(18, 4) NULL DEFAULT NULL COMMENT '应摊运杂费',
  `COST_UNIT_PRICE` decimal(18, 4) NULL DEFAULT NULL COMMENT '成本单价',
  `COST_AMOUNT` decimal(18, 4) NULL DEFAULT NULL COMMENT '\r\n成本金额\r\n',
  `INVOICE_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票代码',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一值'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_equip_in_out_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_examappinfoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_examappinfoquery`;
CREATE TABLE `cdr_examappinfoquery`  (
  `GROUP_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `HOSPITAL_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构代码',
  `HOSPITAL_NAME` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构',
  `OUTPATIENT_NO` decimal(18, 0) NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` decimal(18, 0) NULL DEFAULT NULL COMMENT '住院号',
  `MEDICAL_CARDNO` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者就诊卡号',
  `EHEALTH_CARD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '电子健康卡号',
  `CLINIC_TYPE_CODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊类别代码',
  `CLINIC_TYPE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊类别名称',
  `PATIENT_ID` decimal(18, 0) NULL DEFAULT NULL COMMENT '患者ID',
  `VISITTIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(243) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `ID_CARD` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者身份证号',
  `INSURANCE_CARD` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者医保卡号',
  `PATIENT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '患者姓名',
  `TELECOM` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者电话',
  `GENDERCODE` decimal(65, 30) NULL DEFAULT NULL COMMENT '性别代码',
  `GENDERNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别名称',
  `BIRTHTIME` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `AGE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '年龄',
  `AGE_UNIT` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄单位',
  `ADDRESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '地址',
  `BED_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床编码',
  `BED_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `ROOM_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT_CODE` decimal(18, 0) NULL DEFAULT NULL COMMENT '科室代码',
  `DEPARTMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '科室名称',
  `WARD_CODE` decimal(18, 0) NULL DEFAULT NULL COMMENT '病区代码',
  `WARD_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病区名称',
  `DIAG_TYPE_CODE` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断类别编码',
  `DIAG_TYPE` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断类别名称',
  `DIAG_DATE` datetime(0) NULL DEFAULT NULL COMMENT '诊断时间',
  `DIAGNOSIS_CODE` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '疾病名称',
  `AUTHOR_TIME` datetime(0) NULL DEFAULT NULL COMMENT '开单日期时间',
  `APPLY_DOC_SIGNID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '开立者签名',
  `APPLY_DOC_ID` decimal(18, 0) NULL DEFAULT NULL COMMENT '开立者ID ',
  `APPLY_DOC_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开立者姓名',
  `APPLY_DEPT_CODE` decimal(18, 0) NOT NULL COMMENT '开立科室代码',
  `APPLY_DEPT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '开立科室名称',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期时间',
  `ASSIGNED_DOC_ID` decimal(18, 0) NULL DEFAULT NULL COMMENT '审核者工号',
  `ASSIGNED_DOC_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核者姓名',
  `APPLICATIONNO` decimal(65, 30) NULL DEFAULT NULL COMMENT '电子申请单号',
  `UNICODE` decimal(65, 30) NOT NULL COMMENT '唯一编码',
  `APPLY_DESC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请单描述内容',
  `APPLY_STATE` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单状态',
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL COMMENT '申请单有效日期上限',
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL COMMENT '申请单有效日期下限',
  `PRIORITY_CODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '优先级别代码',
  `PRIORITY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '优先级别名称',
  `LIS_SAMPLE_ID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '标本ID',
  `LIS_SAMPLE_TYPECODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本类别代码',
  `LIS_SAMPLE_TYPE` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本类别名称',
  `BLOOD_SAMPLING` decimal(65, 30) NULL DEFAULT NULL COMMENT '血液标本',
  `ORDER_ID` decimal(65, 30) NULL DEFAULT NULL COMMENT '医嘱ID',
  `LIS_ITEM_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目编码',
  `LIS_ITEM_NAME` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目名称',
  `LIS_METHODCODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '检验方法编码',
  `LIS_METHOD` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '检验方法名称',
  `LIS_EFFECTIVE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '执行日期时间',
  `EXEC_DEPT_CODE` decimal(18, 0) NOT NULL COMMENT '执行科室代码',
  `EXEC_DEPT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行科室名称',
  `NOTICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注意事项',
  `URGENTFLAG` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加急标志',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CHARGE_STATUS` decimal(65, 30) NULL DEFAULT NULL COMMENT '收费状态',
  `EXTERNAL_INSPECTION` decimal(65, 30) NULL DEFAULT NULL COMMENT '外检标志(0否，1是)',
  `BAR_CODE` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '条码号',
  `TUBE_COLOR` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采血管颜色'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_examappinfoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_budget_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_budget_detail`;
CREATE TABLE `cdr_hrp_budget_detail`  (
  `BUDGET_PLAN` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预算方案',
  `ESTABLISHMENT_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编制类型',
  `CHARGE_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '指标',
  `PERIOD` decimal(10, 0) NULL DEFAULT NULL COMMENT '期间',
  `DEPT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `CENTRALIZED_DEPT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归口科室',
  `ESTABLISHMENT_DEPT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编制科室',
  `BUDGETED_AMOUNT` decimal(16, 2) NULL DEFAULT NULL COMMENT '预算金额',
  `APPROVAL_AMOUNT` decimal(16, 2) NULL DEFAULT NULL COMMENT '批复金额',
  `SOURCE_FUNDS` decimal(1, 0) NULL DEFAULT NULL COMMENT '资金来源',
  `TIPS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主键'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_budget_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_budget_dict
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_budget_dict`;
CREATE TABLE `cdr_hrp_budget_dict`  (
  `CHARGE_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指标编码',
  `CHARGE_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '指标名称',
  `CENTRALIZED_DEPT` varchar(111) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归口科室'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_budget_dict
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_budget_receipt
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_budget_receipt`;
CREATE TABLE `cdr_hrp_budget_receipt`  (
  `PERIOD` decimal(10, 0) NULL DEFAULT NULL,
  `CHARGE_DEPT` varchar(111) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用科室',
  `CHARGE_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '费用指标',
  `EXEC_AMT` decimal(16, 2) NULL DEFAULT NULL COMMENT '执行金额',
  `RECEIPT_DATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据日期'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_budget_receipt
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_clinicalservicedept_cost
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_clinicalservicedept_cost`;
CREATE TABLE `cdr_hrp_clinicalservicedept_cost`  (
  `DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编码',
  `DEPT_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `QJ` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST1` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '001人员经费直接成本',
  `INDIRECTCOST1` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST1` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '001人员经费全成本',
  `DIRECTCOST2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST3` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '003药品费直接成本',
  `INDIRECTCOST3` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST3` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '003药品费全成本',
  `DIRECTCOST4` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST4` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST4` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST5` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST5` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST5` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST6` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST6` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST6` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST7` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '007其他费用直接成本',
  `INDIRECTCOST7` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST7` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '007其他费用全成本',
  `DIRECTCOST8` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST8` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST8` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST9` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST9` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST9` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST10` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST10` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST10` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST11` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST11` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST11` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST12` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '012其他支出直接成本',
  `INDIRECTCOST12` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST12` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '012其他支出全成本',
  `DIRECTCOST101` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST101` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST101` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST102` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST102` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST102` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST103` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '103财政药品费直接成本',
  `INDIRECTCOST103` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST103` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '103财政药品费全成本',
  `DIRECTCOST107` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '107财政其他费用直接成本',
  `INDIRECTCOST107` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST107` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '107财政其他费用',
  `DIRECTCOST201` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST201` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST201` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST202` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST202` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST202` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST203` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST203` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST203` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST207` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDIRECTCOST207` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FULLCOST207` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_clinicalservicedept_cost
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_department_dict
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_department_dict`;
CREATE TABLE `cdr_hrp_department_dict`  (
  `HIS_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HIS科室编码',
  `HIS_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HIS科室名称',
  `CW_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财务科室编码',
  `CW_NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财务科室名称'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_department_dict
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_department_directcost
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_department_directcost`;
CREATE TABLE `cdr_hrp_department_directcost`  (
  `DEPT_TYPE_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室类型编码',
  `DEPT_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室类型名称',
  `DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编码',
  `DEPT_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `QJ` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_001` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '001人员经费',
  `DIRECTCOST_002` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_003` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '003药品费',
  `DIRECTCOST_004` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_005` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_006` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_007` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '007其他费用',
  `DIRECTCOST_008` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_009` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_010` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_011` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_012` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '012其他支出',
  `DIRECTCOST_101` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_102` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_103` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '103财政药品费',
  `DIRECTCOST_107` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '107财政其他费用',
  `DIRECTCOST_201` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_202` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_203` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIRECTCOST_207` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_department_directcost
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_deptsz_dedtail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_deptsz_dedtail`;
CREATE TABLE `cdr_hrp_deptsz_dedtail`  (
  `TYPEID` varchar(43) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CLASS_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室类型编码',
  `CLASS_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室类型名称',
  `DEPT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编码',
  `DEPT_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `COST_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成本项目编码',
  `COST_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成本项目名称 如：人员经费',
  `SZ_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收支项目编码',
  `SZ_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收支项目名称 如：(门诊)挂号收入',
  `SDATE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日期',
  `SZ_TYPE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收支类型',
  `INCOME` decimal(12, 2) NULL DEFAULT NULL COMMENT '收入金额',
  `OUTCOME` decimal(12, 2) NULL DEFAULT NULL COMMENT '支出金额',
  `EVIDENCE_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '凭证摘要'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_deptsz_dedtail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_his_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_his_report`;
CREATE TABLE `cdr_hrp_his_report`  (
  `病人病区` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `住院医师` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `病人ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `主页ID` decimal(65, 30) NULL DEFAULT NULL,
  `姓名` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `住院号` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `入科时间` datetime(0) NULL DEFAULT NULL,
  `出科时间` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `费别` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `住院天数` decimal(65, 30) NULL DEFAULT NULL,
  `治疗费` decimal(12, 2) NULL DEFAULT NULL,
  `化验费` decimal(12, 2) NULL DEFAULT NULL,
  `药事服务费` decimal(12, 2) NULL DEFAULT NULL,
  `西成药费` decimal(12, 2) NULL DEFAULT NULL,
  `高值耗材费` decimal(12, 2) NULL DEFAULT NULL,
  `检查费` decimal(12, 2) NULL DEFAULT NULL,
  `TCD` decimal(12, 2) NULL DEFAULT NULL,
  `外诊费` decimal(12, 2) NULL DEFAULT NULL,
  `护理费` decimal(12, 2) NULL DEFAULT NULL,
  `氧气费` decimal(12, 2) NULL DEFAULT NULL,
  `中成药费` decimal(12, 2) NULL DEFAULT NULL,
  `理疗费` decimal(12, 2) NULL DEFAULT NULL,
  `输血费` decimal(12, 2) NULL DEFAULT NULL,
  `放射检查` decimal(12, 2) NULL DEFAULT NULL,
  `麻醉费` decimal(12, 2) NULL DEFAULT NULL,
  `动态心电图` decimal(12, 2) NULL DEFAULT NULL,
  `其他费` decimal(12, 2) NULL DEFAULT NULL,
  `其他材料费` decimal(12, 2) NULL DEFAULT NULL,
  `动态血压监测` decimal(12, 2) NULL DEFAULT NULL,
  `手术费` decimal(12, 2) NULL DEFAULT NULL,
  `床位费` decimal(12, 2) NULL DEFAULT NULL,
  `诊察费` decimal(12, 2) NULL DEFAULT NULL,
  `一般耗材费` decimal(12, 2) NULL DEFAULT NULL,
  `心率变异性分析` decimal(12, 2) NULL DEFAULT NULL,
  `化验费A` decimal(12, 2) NULL DEFAULT NULL,
  `疼痛费` decimal(12, 2) NULL DEFAULT NULL,
  `放射治疗` decimal(12, 2) NULL DEFAULT NULL,
  `B超费` decimal(12, 2) NULL DEFAULT NULL,
  `诊疗费` decimal(12, 2) NULL DEFAULT NULL,
  `中草药费` decimal(12, 2) NULL DEFAULT NULL,
  `心电图费` decimal(12, 2) NULL DEFAULT NULL,
  `肺通气` decimal(12, 2) NULL DEFAULT NULL,
  `STROGE_DATE` datetime(0) NULL DEFAULT NULL,
  `执行科室` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `开单科室` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_his_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_hrp_sz_item
-- ----------------------------
DROP TABLE IF EXISTS `cdr_hrp_sz_item`;
CREATE TABLE `cdr_hrp_sz_item`  (
  `SZ_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收支项目编码',
  `SZ_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收支项目名称',
  `SZ_CATEGORY` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收支类别 如：门诊收入、住院收入',
  `SZ_TYPE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收支类型 如：临床收入、药品收入',
  `INCOME_TYPE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收入大类 如：门诊收入',
  `COST_NATURE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用性质 如：卫生材料、高值耗材',
  `COST_SOURCE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成本来源',
  `COST_ITEMS` varchar(101) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成本项目',
  `CODE_LEVEL` decimal(5, 0) NULL DEFAULT NULL COMMENT '编码层次',
  `V` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收支项目全称',
  `SZ_ATTRIBUTE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '启用收支属性 如：变动性态',
  `FINAL_MARK` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '末级标志 0：否  1：是'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_hrp_sz_item
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_infection_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_infection_report`;
CREATE TABLE `cdr_infection_report`  (
  `CARDID` decimal(65, 30) NULL DEFAULT NULL,
  `CARDNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CARDTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CARDSTATUS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTTIME` datetime(0) NULL DEFAULT NULL,
  `REPORTERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKTIME` datetime(0) NULL DEFAULT NULL,
  `CHECKERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTDEPTCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTDEPTNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISDELETED` decimal(65, 30) NULL DEFAULT NULL,
  `CARDEDITTIME` datetime(0) NULL DEFAULT NULL,
  `VISITID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EARLYID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINTCOUNT` decimal(65, 30) NULL DEFAULT NULL,
  `CREATETIME` datetime(0) NULL DEFAULT NULL,
  `CREATEUSER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSERCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATEUSERDEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CARDGUID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTDEPART` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CORRECTDISEASE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTDOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORTDATE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPTPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CARDREASON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PARENTNAME_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTNAME_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IDCARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTSEX_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTAGE_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGEUNIT_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BIRTHDATE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKUNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTID_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGION_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_PROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_CITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_COUNTY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_TOWN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_OTHER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROFESSIONAL_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROFESSIONALOTHER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISEASETYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISEASEDEGREE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CASESYMPTOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ATTACKDATE` datetime(0) NULL DEFAULT NULL,
  `DIAGNOSEDATE_MAIN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEADDATE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISEASESENTITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISEASESTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISEASESNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISEASESPART` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSITIVETIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEBUTSYMPTOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEBUTDATE` datetime(0) NULL DEFAULT NULL,
  `ALT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KHBC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIVERPUNCTURE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `KHBS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SAMESYMPTOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MARITALSTATUS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NATION_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EDUCATION_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGION_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMBOBOXPROVINCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMBOBOXCITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMBOBOXCOUNTY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMBOBOXTOWN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TXTADDR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTACTHISTORY1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INJECTIONNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NONBUSINESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEXNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GAYSEXNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTACTHISTORY2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OTHERCONTACTHISTORY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SEXUALHISTORY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BINFECTROUTES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SAMPLE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXPERIMENTALRESULTS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `POSITIVEDATE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTACTS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONFIRMUNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AIDSDATE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTNAME_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTSEX_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENTAGE_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGEUNIT_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDRS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOUSEHOLDERNAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HOUSEHOLDERPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORKUNIT_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROFESSIONAL_ADDI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERRALREASON1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERRALREASON2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERRALDATE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERRALUNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERRALDOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOUNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITADDR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNITPHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `HANDLEREMARK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISEASECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REMARKS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ISPATIENTTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKRESULT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AIDSREMARKS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CONTACTSYMPTOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CERTIFICATETYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKAFP` decimal(65, 30) NULL DEFAULT NULL,
  `REGION_AFPTRUE` decimal(65, 30) NULL DEFAULT NULL,
  `REGION_AFPFALSE` decimal(65, 30) NULL DEFAULT NULL,
  `REGION_AFP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDATE_AFP` datetime(0) NULL DEFAULT NULL,
  `ADDR_PROVINCE_AFP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_CITY_AFP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_COUNTY_AFP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_TOWN_AFP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDR_OTHER_AFP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AFP_DATE` datetime(0) NULL DEFAULT NULL,
  `AFP_SYMPTOMS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ZZTZ` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ZYID` decimal(65, 30) NULL DEFAULT NULL,
  `ADDITIONDISEASECATEGORY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDITIONINPUTTYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADDITIONINPUTCOUNTRY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTDATE` datetime(0) NULL DEFAULT NULL,
  `SAMPLE_OTHER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BINFECTROUTES_OTHER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECKRESULTTWO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LATE_REPORT` decimal(65, 30) NULL DEFAULT NULL,
  `IS_TP_PAST` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TP_SYMPTOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TP_TPPA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TP_TRUST` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TP_TITER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RNARESULT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORF1AB_CT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `N_CT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_COVID19_RELATED` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEATH_DIAGNOSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TP_REPORT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CORRECT_REASON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_COVID19` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_ALT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NJY_CHECK_REPORT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_YGANDUKNOW` decimal(65, 30) NULL DEFAULT NULL,
  `INOCULATION_TIMES` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_COVID19_TIME` datetime(0) NULL DEFAULT NULL,
  `IS_FIRST_INFECT` decimal(65, 30) NULL DEFAULT NULL,
  `RE_INFECT_TIME` datetime(0) NULL DEFAULT NULL,
  `IS_COVID19_BEFORE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_TP_BEFORE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_TP_SYMPTOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TP_SPECIAL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NO_TP_TRUST` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` decimal(65, 30) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_infection_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_interactive_service_log
-- ----------------------------
DROP TABLE IF EXISTS `cdr_interactive_service_log`;
CREATE TABLE `cdr_interactive_service_log`  (
  `RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成的唯一消息ID',
  `HIS_RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求入参唯一消息ID',
  `PATIENT_ID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `CREATIONTIME` datetime(0) NULL DEFAULT NULL COMMENT '请求中的消息创建时间',
  `LAST_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `XML_IN` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调用接口的请求入参',
  `TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果编码 ‘AA’/ ‘AE’',
  `RESULT` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果名称 \'成功\'/\'失败\'',
  `FAILURE_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '失败原因',
  `XML_OUT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调用接口后的返回消息',
  `MODIFY_FLAG` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改标志UPDATE/ADD/QUERY',
  `TABLE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新增/修改的对应表名',
  `INTERFACE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `REQ_SYS_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂商ID',
  `INTERFACE_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口编码',
  `REQ_SYS_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂商名称',
  `INTERFACE_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '0:标准交互服务 1:院内交互服务 2:共享文档 3:查询接口 4:外部机构 5:推送第三方',
  `EMPI_RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'EMPI返回的消息ID',
  `START_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用开始时间',
  `END_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用结束时间',
  `EXECUTION_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用耗时(ms)',
  `EXCEPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常说明'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '111' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_interactive_service_log
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_interactive_service_log_a
-- ----------------------------
DROP TABLE IF EXISTS `cdr_interactive_service_log_a`;
CREATE TABLE `cdr_interactive_service_log_a`  (
  `RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成的唯一消息ID',
  `HIS_RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求入参唯一消息ID',
  `PATIENT_ID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `CREATIONTIME` datetime(0) NULL DEFAULT NULL COMMENT '请求中的消息创建时间',
  `LAST_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `XML_IN` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调用接口的请求入参',
  `TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果编码 ‘AA’/ ‘AE’',
  `RESULT` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果名称 \'成功\'/\'失败\'',
  `FAILURE_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '失败原因',
  `XML_OUT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调用接口后的返回消息',
  `MODIFY_FLAG` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改标志UPDATE/ADD/QUERY',
  `TABLE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新增/修改的对应表名',
  `INTERFACE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `REQ_SYS_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂商ID',
  `INTERFACE_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口编码',
  `REQ_SYS_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂商名称',
  `INTERFACE_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '0:标准交互服务 1:院内交互服务 2:共享文档 3:查询接口 4:外部机构 5:推送第三方',
  `EMPI_RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'EMPI返回的消息ID',
  `START_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用开始时间',
  `END_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用结束时间',
  `EXECUTION_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用耗时(ms)',
  `EXCEPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常说明',
  `FILTER_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '0无需过滤 1过滤'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_interactive_service_log_a
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_interactive_service_log_a_bak
-- ----------------------------
DROP TABLE IF EXISTS `cdr_interactive_service_log_a_bak`;
CREATE TABLE `cdr_interactive_service_log_a_bak`  (
  `RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HIS_RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATIONTIME` datetime(0) NULL DEFAULT NULL,
  `LAST_TIME` datetime(0) NULL DEFAULT NULL,
  `XML_IN` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESULT` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FAILURE_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `XML_OUT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `MODIFY_FLAG` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TABLE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INTERFACE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQ_SYS_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INTERFACE_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQ_SYS_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INTERFACE_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EMPI_RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `START_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `END_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXECUTION_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCEPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `FILTER_FLAG` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_interactive_service_log_a_bak
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_interactive_service_log_b
-- ----------------------------
DROP TABLE IF EXISTS `cdr_interactive_service_log_b`;
CREATE TABLE `cdr_interactive_service_log_b`  (
  `RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成的唯一消息ID',
  `HIS_RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求入参唯一消息ID',
  `PATIENT_ID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `CREATIONTIME` datetime(0) NULL DEFAULT NULL COMMENT '请求中的消息创建时间',
  `LAST_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `XML_IN` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调用接口的请求入参',
  `TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果编码 ‘AA’/ ‘AE’',
  `RESULT` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果名称 \'成功\'/\'失败\'',
  `FAILURE_REASON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '失败原因',
  `XML_OUT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调用接口后的返回消息',
  `MODIFY_FLAG` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改标志UPDATE/ADD/QUERY',
  `TABLE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新增/修改的对应表名',
  `INTERFACE_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  `REQ_SYS_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂商ID',
  `INTERFACE_CODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口编码',
  `REQ_SYS_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂商名称',
  `INTERFACE_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '0:标准交互服务 1:院内交互服务 2:共享文档 3:查询接口 4:外部机构 5:推送第三方',
  `EMPI_RESID` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'EMPI返回的消息ID',
  `START_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用开始时间',
  `END_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用结束时间',
  `EXECUTION_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口调用耗时(ms)',
  `EXCEPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常说明',
  `FILTER_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '0无需过滤 1过滤'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_interactive_service_log_b
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_applyinfo
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_applyinfo`;
CREATE TABLE `cdr_laboratory_applyinfo`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区代码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区',
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `AUTHOR_TIME` datetime(0) NULL DEFAULT NULL COMMENT '开单日期时间',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生编码',
  `APPLY_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开立科室代码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开立科室',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单ID',
  `APPLY_DESC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单描述内容',
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL COMMENT '申请单有效日期上限',
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL COMMENT '申请单有效日期下限',
  `LIS_SAMPLE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本ID',
  `LIS_SAMPLE_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本类别代码',
  `LIS_SAMPLE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本类别名称',
  `BLOOD_SAMPLING` decimal(1, 0) NULL DEFAULT NULL COMMENT '血液标本标识 1是0否',
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱ID',
  `LIS_ITEM_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目编码',
  `LIS_ITEM_NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目名称',
  `LIS_EFFECTIVE_DATE` datetime(0) NULL DEFAULT NULL COMMENT '执行日期时间',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室代码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `ACQUISITION_METHOD` decimal(1, 0) NULL DEFAULT NULL COMMENT '采集方式编码 1.血液标本采集2.痰液标本采集3.尿液标本采集4.粪便标本采集5.咽拭子标本采集6其他（脑脊液及胸腹水标本采集等）',
  `URGENTFLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '加急标志 0：否/1：是',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态 1未缴费2已缴费3退费',
  `APPLY_STATE` decimal(1, 0) NULL DEFAULT NULL COMMENT '申请单状态 0,\'采样\',1,\'护工接收\',2,\'登记\',3,\'上机检验\'，4，已出报告，5，拒绝执行，6，取消执行',
  `EXTERNAL_INSPECTION` decimal(1, 0) NULL DEFAULT NULL COMMENT '外检标志 0：非外检 1：外检 ',
  `SAMPLE_ID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验条码号',
  `TUBE_COLOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试管颜色',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '核酸标志，0否1是',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '预约时间,进行预约登记的当前时间)',
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约登记人员编码',
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约登记人员名称',
  `APPOINT_STATUS` decimal(65, 30) NULL DEFAULT NULL COMMENT '预约状态编码,1未预约 2预约完成 3取消预约 ',
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL COMMENT '预约检查时间',
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约流水号',
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约排序号',
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约设备名称',
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约诊室名称',
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子健康卡号',
  `APPOINT_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_applyinfo
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_applyinfo_bak20240514
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_applyinfo_bak20240514`;
CREATE TABLE `cdr_laboratory_applyinfo_bak20240514`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DESC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL,
  `LIS_SAMPLE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BLOOD_SAMPLING` decimal(1, 0) NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_EFFECTIVE_DATE` datetime(0) NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACQUISITION_METHOD` decimal(1, 0) NULL DEFAULT NULL,
  `URGENTFLAG` decimal(1, 0) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPLY_STATE` decimal(1, 0) NULL DEFAULT NULL,
  `EXTERNAL_INSPECTION` decimal(1, 0) NULL DEFAULT NULL,
  `SAMPLE_ID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TUBE_COLOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_STATUS` decimal(65, 30) NULL DEFAULT NULL,
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_applyinfo_bak20240514
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_applyinfo_bf
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_applyinfo_bf`;
CREATE TABLE `cdr_laboratory_applyinfo_bf`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DESC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL,
  `LIS_SAMPLE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BLOOD_SAMPLING` decimal(1, 0) NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_EFFECTIVE_DATE` datetime(0) NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACQUISITION_METHOD` decimal(1, 0) NULL DEFAULT NULL,
  `URGENTFLAG` decimal(1, 0) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPLY_STATE` decimal(1, 0) NULL DEFAULT NULL,
  `EXTERNAL_INSPECTION` decimal(1, 0) NULL DEFAULT NULL,
  `SAMPLE_ID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TUBE_COLOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_STATUS` decimal(65, 30) NULL DEFAULT NULL,
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_applyinfo_bf
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_applyinfo_import
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_applyinfo_import`;
CREATE TABLE `cdr_laboratory_applyinfo_import`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DESC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL,
  `LIS_SAMPLE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BLOOD_SAMPLING` decimal(1, 0) NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_EFFECTIVE_DATE` datetime(0) NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACQUISITION_METHOD` decimal(1, 0) NULL DEFAULT NULL,
  `URGENTFLAG` decimal(1, 0) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPLY_STATE` decimal(1, 0) NULL DEFAULT NULL,
  `EXTERNAL_INSPECTION` decimal(1, 0) NULL DEFAULT NULL,
  `SAMPLE_ID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TUBE_COLOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_STATUS` decimal(65, 30) NULL DEFAULT NULL,
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_applyinfo_import
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_applyinfo_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_applyinfo_records`;
CREATE TABLE `cdr_laboratory_applyinfo_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR_TIME` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DESC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_B` datetime(0) NULL DEFAULT NULL,
  `APPLY_EFFECTIVE_E` datetime(0) NULL DEFAULT NULL,
  `LIS_SAMPLE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BLOOD_SAMPLING` decimal(1, 0) NULL DEFAULT NULL,
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_EFFECTIVE_DATE` datetime(0) NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ACQUISITION_METHOD` decimal(1, 0) NULL DEFAULT NULL,
  `URGENTFLAG` decimal(1, 0) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `APPLY_STATE` decimal(1, 0) NULL DEFAULT NULL,
  `EXTERNAL_INSPECTION` decimal(1, 0) NULL DEFAULT NULL,
  `SAMPLE_ID` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TUBE_COLOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_TIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_OPERATOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_OPERATOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_STATUS` decimal(65, 30) NULL DEFAULT NULL,
  `APPOINT_CHECKTIME` datetime(0) NULL DEFAULT NULL,
  `APPOINT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_SORTNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_DEPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_applyinfo_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report`;
CREATE TABLE `cdr_laboratory_report`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生工号',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `SEND_TIME` datetime(0) NULL DEFAULT NULL COMMENT '送检时间',
  `RECEIVE_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本核收人编码',
  `RECEIVE_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本核收人',
  `RECEIVE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '标本核收时间',
  `TECHNICIAN_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验医生编码',
  `TECHNICIAN_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验医生',
  `LIS_EXAM_TIME` datetime(0) NULL DEFAULT NULL COMMENT '检验时间',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告号',
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生编码',
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '检验报告审核时间',
  `ASSIGNED_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告审核人编码',
  `ASSIGNED_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告审核人',
  `PRINT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '打印时间',
  `LIS_SAMPLE_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验标本号',
  `LIS_SAMPLE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验标本编码',
  `LIS_SAMPLE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验标本名称',
  `LIS_ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目编码',
  `LIS_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目名称',
  `REPORT_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告类别代码 01一般临床检验 02血液学检查 03临床化学检查 04临床免疫学检查  05临床微生物学检查 06临床寄生物学检查 07分子生物学检查',
  `REPORT_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告类别',
  `DEVICE_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仪器编号',
  `DEVICE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仪器名称',
  `LIS_BARCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '条码号',
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '总测量次数',
  `IMAGING_NOTES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断代码（主要诊断)',
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断名称（主要诊断）',
  `IMAGE_INDEX` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图像索引号',
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '整张报告图片信息/URL 地址',
  `WSW_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '微生物报告标志，0否1是',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志，0否1是',
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '核酸标志，0否1是',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `REPORT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告科室编码',
  `REPORT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告科室',
  `EFFECTIVETIME_B` datetime(0) NULL DEFAULT NULL COMMENT '采样开始时间',
  `EFFECTIVETIME_E` datetime(0) NULL DEFAULT NULL COMMENT '采样结束时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report230918
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report230918`;
CREATE TABLE `cdr_laboratory_report230918`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `SEND_TIME` datetime(0) NULL DEFAULT NULL,
  `RECEIVE_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_TIME` datetime(0) NULL DEFAULT NULL,
  `TECHNICIAN_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TECHNICIAN_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_EXAM_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL,
  `ASSIGNED_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_TIME` datetime(0) NULL DEFAULT NULL,
  `LIS_SAMPLE_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_BARCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `IMAGING_NOTES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_INDEX` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `WSW_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EFFECTIVETIME_B` datetime(0) NULL DEFAULT NULL,
  `EFFECTIVETIME_E` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report230918
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_20240423
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_20240423`;
CREATE TABLE `cdr_laboratory_report_20240423`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `SEND_TIME` datetime(0) NULL DEFAULT NULL,
  `RECEIVE_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_TIME` datetime(0) NULL DEFAULT NULL,
  `TECHNICIAN_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TECHNICIAN_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_EXAM_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL,
  `ASSIGNED_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_TIME` datetime(0) NULL DEFAULT NULL,
  `LIS_SAMPLE_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_BARCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `IMAGING_NOTES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_INDEX` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `WSW_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EFFECTIVETIME_B` datetime(0) NULL DEFAULT NULL,
  `EFFECTIVETIME_E` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_20240423
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_base64
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_base64`;
CREATE TABLE `cdr_laboratory_report_base64`  (
  `REPORT_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告id',
  `BASE64` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'base64转码',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '报告生成时间',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_base64
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_detail`;
CREATE TABLE `cdr_laboratory_report_detail`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告号',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告时间',
  `LIS_ITEM_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目名称',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `LIS_REPORT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告ID',
  `LISITEM_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验子项目唯一记录号',
  `LIS_ITEM_SUB_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验子项目代码',
  `LIS_ITEM_SUB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验子项目名称',
  `LIS_RATION_RESULT` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验定量结果',
  `LIS_RATION_RESULT_UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验定量结果单位',
  `PRINT_SERIAL_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打印序号',
  `DETECT_INDICAT_RESULT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检测指标结果(箭头提示) 偏高↑或偏低↓',
  `ABNORMAL_TIPS` decimal(65, 30) NULL DEFAULT NULL COMMENT '异常结果代码 1,正常;2,无法识别的异常;3,异常偏高;4,异常偏低;9,不确定',
  `REFERENCE_RANGE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参考值范围',
  `MEASURE_UNIT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '计量单位',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_detail230919
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_detail230919`;
CREATE TABLE `cdr_laboratory_report_detail230919`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LIS_REPORT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LISITEM_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_SUB_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_SUB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_RATION_RESULT` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_RATION_RESULT_UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_SERIAL_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETECT_INDICAT_RESULT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ABNORMAL_TIPS` decimal(65, 30) NULL DEFAULT NULL,
  `REFERENCE_RANGE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEASURE_UNIT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_detail230919
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_detail_records`;
CREATE TABLE `cdr_laboratory_report_detail_records`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LIS_REPORT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LISITEM_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_SUB_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_SUB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_RATION_RESULT` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_RATION_RESULT_UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_SERIAL_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETECT_INDICAT_RESULT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ABNORMAL_TIPS` decimal(65, 30) NULL DEFAULT NULL,
  `REFERENCE_RANGE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEASURE_UNIT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_detail_wsw
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_detail_wsw`;
CREATE TABLE `cdr_laboratory_report_detail_wsw`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告号',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告时间',
  `LIS_ITEM_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目名称',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `BACTERIA_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '细菌代号',
  `BACTERIA_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '细菌名称',
  `COMMENTS_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检出病原体名称',
  `COLONY_COUNTS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菌落计数 单位：cfu/ml；如“>10万”',
  `CULTURE_CONTAINER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培养基 例如：“巧克力平板”',
  `CULTURE_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培养时间包含单位 例如：72小时',
  `CULTURE_CONDITION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培养条件 例如：“37℃；',
  `DISCOVERY_METHOD` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发现方式  例如：“肉眼”或“镜检”等',
  `INDICATOR_RESULT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '检测结果 简要描述是否发现或是否生长等',
  `INDICATOR_RESULT_DES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '检测结果文字描述  如：耐药、中度敏感、敏感等',
  `SUSCEPTIBILITY_RESU_NO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '药敏结果流水号',
  `DRUG_SENSITIVE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药敏代码 例如：阿莫西林代码为“AMX”或 “AMOX”',
  `DRUG_SENSITIVE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药敏名称,例如：“阿莫西林”',
  `SIR_REFERENCE_RANGE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SIR参考值范围',
  `DRUG_CONTENT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纸片含药量 应包含单位：g、mg、μg',
  `INHIBIT_BACTERIAL_CONT` decimal(65, 30) NULL DEFAULT NULL COMMENT '抑菌浓度,即 MIC 单位：g/ml',
  `INHIBIT_BACTERIAL_WIDTH` decimal(65, 30) NULL DEFAULT NULL COMMENT '抑菌环直径 单位：mm',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_detail_wsw
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_detail_wsw230920
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_detail_wsw230920`;
CREATE TABLE `cdr_laboratory_report_detail_wsw230920`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BACTERIA_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BACTERIA_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COLONY_COUNTS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CULTURE_CONTAINER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CULTURE_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CULTURE_CONDITION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISCOVERY_METHOD` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDICATOR_RESULT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `INDICATOR_RESULT_DES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SUSCEPTIBILITY_RESU_NO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DRUG_SENSITIVE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DRUG_SENSITIVE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIR_REFERENCE_RANGE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DRUG_CONTENT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INHIBIT_BACTERIAL_CONT` decimal(65, 30) NULL DEFAULT NULL,
  `INHIBIT_BACTERIAL_WIDTH` decimal(65, 30) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_detail_wsw230920
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_detail_wsw_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_detail_wsw_records`;
CREATE TABLE `cdr_laboratory_report_detail_wsw_records`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BACTERIA_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BACTERIA_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COMMENTS_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `COLONY_COUNTS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CULTURE_CONTAINER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CULTURE_TIME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CULTURE_CONDITION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DISCOVERY_METHOD` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDICATOR_RESULT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `INDICATOR_RESULT_DES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `SUSCEPTIBILITY_RESU_NO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DRUG_SENSITIVE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DRUG_SENSITIVE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SIR_REFERENCE_RANGE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DRUG_CONTENT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INHIBIT_BACTERIAL_CONT` decimal(65, 30) NULL DEFAULT NULL,
  `INHIBIT_BACTERIAL_WIDTH` decimal(65, 30) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_detail_wsw_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_records`;
CREATE TABLE `cdr_laboratory_report_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `SEND_TIME` datetime(0) NULL DEFAULT NULL,
  `RECEIVE_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_TIME` datetime(0) NULL DEFAULT NULL,
  `TECHNICIAN_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TECHNICIAN_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_EXAM_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL,
  `ASSIGNED_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_TIME` datetime(0) NULL DEFAULT NULL,
  `LIS_SAMPLE_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_BARCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `IMAGING_NOTES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_INDEX` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `WSW_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EFFECTIVETIME_B` datetime(0) NULL DEFAULT NULL,
  `EFFECTIVETIME_E` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_report_test01
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_report_test01`;
CREATE TABLE `cdr_laboratory_report_test01`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `SEND_TIME` datetime(0) NULL DEFAULT NULL,
  `RECEIVE_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_TIME` datetime(0) NULL DEFAULT NULL,
  `TECHNICIAN_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TECHNICIAN_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_EXAM_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL,
  `ASSIGNED_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_TIME` datetime(0) NULL DEFAULT NULL,
  `LIS_SAMPLE_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_SAMPLE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEVICE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_BARCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL,
  `IMAGING_NOTES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_INDEX` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `WSW_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `REPORT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EFFECTIVETIME_B` datetime(0) NULL DEFAULT NULL,
  `EFFECTIVETIME_E` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_report_test01
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_status
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_status`;
CREATE TABLE `cdr_laboratory_status`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NOT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单号',
  `SAMPLE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验条码号',
  `SAMPLING_TIME` datetime(0) NULL DEFAULT NULL COMMENT '标本采集时间',
  `SAMPLING_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本采集人编码',
  `SAMPLING_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本采集人',
  `TRANSPORT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '送检时间',
  `TRANSPORT_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本送检人编码',
  `TRANSPORT_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本送检人',
  `RECEIVING_TIME` datetime(0) NULL DEFAULT NULL COMMENT '护工接收标本时间',
  `RECEIVING_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护工编码',
  `RECEIVING_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护工',
  `RECEIVE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '标本核收时间',
  `RECEIVE_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本核收人编码',
  `RECEIVE_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本核收人',
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '检验报告审核时间',
  `AUDIT_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告审核人编码',
  `AUDIT_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告审核人',
  `APPLY_STATUS` decimal(2, 0) NULL DEFAULT NULL COMMENT '检验状态 0,\'采样\',1,\'护工接收\',2,\'登记\',3,\'上机检验\'，4，已出报告，5，拒绝执行，6，取消执行',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '检验日期',
  `MODIFY_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验医生工号',
  `MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验医生',
  `MODIFY_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验科室编码',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0正常 1撤销',
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '核酸标志 0否1是',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_status
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_laboratory_status_20231009
-- ----------------------------
DROP TABLE IF EXISTS `cdr_laboratory_status_20231009`;
CREATE TABLE `cdr_laboratory_status_20231009`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NOT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SAMPLE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SAMPLING_TIME` datetime(0) NULL DEFAULT NULL,
  `SAMPLING_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SAMPLING_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSPORT_TIME` datetime(0) NULL DEFAULT NULL,
  `TRANSPORT_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANSPORT_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVING_TIME` datetime(0) NULL DEFAULT NULL,
  `RECEIVING_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVING_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_TIME` datetime(0) NULL DEFAULT NULL,
  `RECEIVE_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIVE_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `AUDIT_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AUDIT_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_STATUS` decimal(2, 0) NULL DEFAULT NULL,
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL,
  `MODIFY_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFY_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_laboratory_status_20231009
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_log_operation
-- ----------------------------
DROP TABLE IF EXISTS `cdr_log_operation`;
CREATE TABLE `cdr_log_operation`  (
  `ID` decimal(65, 30) NOT NULL COMMENT '主键id',
  `USER_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `USERNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `OPERATION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作',
  `TIME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法',
  `IP` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `CREATE_ON` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PARAMS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_log_operation
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medical_card
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medical_card`;
CREATE TABLE `cdr_medical_card`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORGANIZATION_CODE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `HOSPITAL_ID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织机构代码',
  `DOMAIN_ID` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `MEDICAL_CARD` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊卡号',
  `PATIENT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者姓名',
  `GENDER` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者性别代码',
  `BIRTH_TIME` datetime(0) NULL DEFAULT NULL COMMENT '患者出生日期',
  `COMPANY_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位名称',
  `MOBILE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者联系电话',
  `NATION_CODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族代码',
  `HOME_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者完整地址',
  `RELATION_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人关系代码',
  `RELATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `RELATION_PHONE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `MEDICAL_CARD_STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊卡状态',
  `CREATE_CARD_DATE` datetime(0) NULL DEFAULT NULL COMMENT '建卡日期时间',
  `PRIVINCE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省（自治区、直辖市）',
  `CITY` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市（地区）',
  `AREA` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '县（区）',
  `STREET` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乡（镇、街道办事处）',
  `ROAD` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '村（街、路、弄等）',
  `DOOR_NUMBER` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门牌号码',
  `POSTCODE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `MARRY_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻代码',
  `MARRY_DESCRIBE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻描述',
  `NATION_DESCRIBE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族描述',
  `JOB_TITLE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业类别代码',
  `COMPANY_MOBILE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位电话',
  `RELATION_DESCRIBE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人关系描述',
  `INSURANCE_TYPE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗保险类别代码',
  `INSURANCE_DESCRIBE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗保险类别描述',
  `GENDER_DESCRIBE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者性别描述',
  `CARD_BUILDER_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '建卡者工号',
  `CARD_BUILDER_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '建卡者姓名',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medical_card
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medical_rec
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medical_rec`;
CREATE TABLE `cdr_medical_rec`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集团编码01',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码001',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域id02',
  `UNICODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一编码',
  `TYPE_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历类型',
  `TYPE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历类型名称',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者id',
  `VISIT_TIMES` decimal(65, 30) NOT NULL COMMENT '患者就诊次数',
  `STATUS` decimal(1, 0) NOT NULL COMMENT '状态|病历编辑状态：-1-已作废；\r\n1-已书写；\r\n2-书写完成；\r\n3-已签名；\r\n4-已审订；\r\n5-需重签（针对于患者签名）;\r\n6-需重签（针对于医生签名）;',
  `SNO` decimal(5, 0) NULL DEFAULT NULL COMMENT '病历显示序号',
  `PAGE_NO` decimal(2, 0) NULL DEFAULT NULL COMMENT '页面序号',
  `MR_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历记录ID|病历记录唯一键，用GUID',
  `DEPT_ID` decimal(18, 0) NOT NULL COMMENT '科室ID|书写本次病历的医生或护士所在科室ID',
  `DEPT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '科室名称',
  `CREATOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人ID',
  `CREATOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人|创建人',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间|创建时间',
  `EDITOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人ID|最后修改人ID',
  `EDITOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '修改人|最后修改人',
  `EDIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间|最后修改时间',
  `CMPLTR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完成人ID|首次非实习医生签名人ID',
  `CMPLTR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '完成人|首次非实习医生签名人',
  `CMPLT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '完成时间|完成时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病历记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medical_rec
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medical_rec_bk
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medical_rec_bk`;
CREATE TABLE `cdr_medical_rec_bk`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UNICODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VISIT_TIMES` decimal(65, 30) NOT NULL,
  `STATUS` decimal(1, 0) NOT NULL,
  `SNO` decimal(5, 0) NULL DEFAULT NULL,
  `PAGE_NO` decimal(2, 0) NULL DEFAULT NULL,
  `MR_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DEPT_ID` decimal(18, 0) NOT NULL,
  `DEPT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATE_TIME` datetime(0) NOT NULL,
  `EDITOR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EDITOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `CMPLTR_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CMPLTR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CMPLT_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medical_rec_bk
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medical_rec_content
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medical_rec_content`;
CREATE TABLE `cdr_medical_rec_content`  (
  `MR_CONTENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历内容ID|病历内容主键，用GUID',
  `MR_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历记录ID|病历记录唯一键，用GUID',
  `MR_FRMT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历内容格式|病历内容格式',
  `MR_TEXT_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病历记录文本内容',
  `MR_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病历内容|病历具体内容',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '病历创建时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病历内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medical_rec_content
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medical_rec_content_bk
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medical_rec_content_bk`;
CREATE TABLE `cdr_medical_rec_content_bk`  (
  `MR_CONTENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MR_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MR_FRMT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MR_TEXT_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `MR_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medical_rec_content_bk
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicalexamination_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicalexamination_report`;
CREATE TABLE `cdr_medicalexamination_report`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体检报告号',
  `EXAM_MAIN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '主检时间',
  `EXAM_MAIN_DOCTORID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主检医生编码',
  `EXAM_MAIN_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主检医生姓名',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告生成时间',
  `RECORD_PERSONID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生编码',
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生',
  `EXAM_MAIN_CONCLUSION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '总检结论',
  `EXAM_MAIN_CONCLUSION_JY` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '总检健康建议',
  `REPORT_INFO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报告信息',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicalexamination_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicalexamination_report230920
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicalexamination_report230920`;
CREATE TABLE `cdr_medicalexamination_report230920`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_MAIN_DATE` datetime(0) NULL DEFAULT NULL,
  `EXAM_MAIN_DOCTORID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_MAIN_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `RECORD_PERSONID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_PERSON` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXAM_MAIN_CONCLUSION` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXAM_MAIN_CONCLUSION_JY` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `REPORT_INFO` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicalexamination_report230920
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicalexamination_report_base64
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicalexamination_report_base64`;
CREATE TABLE `cdr_medicalexamination_report_base64`  (
  `REPORT_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告id',
  `BASE64` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'base64转码',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '报告生成时间',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicalexamination_report_base64
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicalexamination_report_ltsubitem
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicalexamination_report_ltsubitem`;
CREATE TABLE `cdr_medicalexamination_report_ltsubitem`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体检报告号',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告生成时间',
  `MTESUB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目名称',
  `LIST_SUBITEM_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检查项目明细唯一记录号',
  `LT_SUBITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查明细项目编码',
  `LT_SUBITEM_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查明细项目',
  `LT_SUBITEM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查结果排列序号',
  `LT_SUBITEM_CONCLUSION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '检查明细项目实验室检查结果',
  `LT_SUBITEM_REFERENCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参考值范围',
  `LT_SUBITEM_UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实验室检验项目单位',
  `ABNORMAL_TIPS` decimal(2, 0) NULL DEFAULT NULL COMMENT '检查结果是否正常 1,正常;2,异常',
  `LT_SUBITEM_NORMAL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查结果异常标识 结果是否正常,正常—, 偏高↑或偏低↓',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `MTESUB_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目编码'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicalexamination_report_ltsubitem
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicalexamination_report_ltsubitem230920
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicalexamination_report_ltsubitem230920`;
CREATE TABLE `cdr_medicalexamination_report_ltsubitem230920`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `MTESUB_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_SUBITEM_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LT_SUBITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LT_SUBITEM_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LT_SUBITEM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LT_SUBITEM_CONCLUSION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LT_SUBITEM_REFERENCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LT_SUBITEM_UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ABNORMAL_TIPS` decimal(2, 0) NULL DEFAULT NULL,
  `LT_SUBITEM_NORMAL` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicalexamination_report_ltsubitem230920
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicalexamination_report_mtesub
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicalexamination_report_mtesub`;
CREATE TABLE `cdr_medicalexamination_report_mtesub`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体检报告号',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告生成时间',
  `LIST_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '检查项目唯一记录号',
  `MTESUB_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目编码',
  `MTESUB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目名称',
  `MTE_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目执行科室编码',
  `MTE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目执行科室',
  `MTE_AUDIT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '项目检查时间',
  `MTE_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目检查医生编码',
  `MTE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目检查医生',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicalexamination_report_mtesub
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicalexamination_report_mtesub230920
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicalexamination_report_mtesub230920`;
CREATE TABLE `cdr_medicalexamination_report_mtesub230920`  (
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `MTESUB_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MTESUB_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MTE_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MTE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MTE_AUDIT_DATE` datetime(0) NULL DEFAULT NULL,
  `MTE_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MTE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicalexamination_report_mtesub230920
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicine_queue
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicine_queue`;
CREATE TABLE `cdr_medicine_queue`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `OUTPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `ORDER_DETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱号',
  `ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品编码',
  `ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `SPECIFICATION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品规格名称',
  `USINGROUTE` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品用法名称',
  `FREQUENCY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用药频率名称',
  `QUANTITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '待发药数量',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发药药房名称',
  `DEPT_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药房地址',
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱开立时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicine_queue
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicine_queue_lt
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicine_queue_lt`;
CREATE TABLE `cdr_medicine_queue_lt`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORDER_DETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPECIFICATION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USINGROUTE` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FREQUENCY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QUANTITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicine_queue_lt
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_medicine_queue_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_medicine_queue_records`;
CREATE TABLE `cdr_medicine_queue_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DETAILID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPECIFICATION` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `USINGROUTE` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FREQUENCY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `QUANTITY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_medicine_queue_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mr_template
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mr_template`;
CREATE TABLE `cdr_mr_template`  (
  `TEMPLATE_ID` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEMPLATE_TYPE` decimal(65, 30) NULL DEFAULT NULL,
  `TYPE_ID` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEMPLATE_CODE` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEMPLATE_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_TYPE` decimal(65, 30) NULL DEFAULT NULL,
  `CREATOR` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `EDITOR` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `NOTE` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BASIC_TEMPLATE_ID` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_CONTROL` decimal(65, 30) NULL DEFAULT NULL,
  `IS_ENABLE` decimal(65, 30) NULL DEFAULT NULL,
  `TEMPLATE_TYPE_ID` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_SEND_CDA` decimal(65, 30) NULL DEFAULT NULL,
  `IS_SEND_PDF` decimal(65, 30) NULL DEFAULT NULL,
  `TASK_CONTROL` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mr_template
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mr_type
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mr_type`;
CREATE TABLE `cdr_mr_type`  (
  `TYPE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TYPE_CLASS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TYPE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FREQUENCY` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIME_LIMIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TIME_LIMIT_UNIT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_COURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `EDITOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `NOTE` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESS_GROUP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_INDEPEND_PRINT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MR_TYPE_PAGE_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CDA_DOC_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BUSINESS_GROUP_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_NEW_PAGE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mr_type
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mr_type_page
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mr_type_page`;
CREATE TABLE `cdr_mr_type_page`  (
  `MR_TYPE_PAGE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历类型页面ID',
  `MR_TYPE_PAGE_CODE` decimal(5, 0) NOT NULL COMMENT '页面编码',
  `MR_TYPE_PAGE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面名称',
  `CREATOR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人|创建人',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间|创建时间',
  `EDITOR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人|最后修改人',
  `EDIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间|最后修改时间',
  `DEFAULT_FOCUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '默认定位|用于连续书写界面定位页面中病历'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '病历类型页面' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mr_type_page
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_charge_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_charge_detail`;
CREATE TABLE `cdr_mz_charge_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `CHARGE_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费明细ID',
  `SETTLE_SCENE` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费场景代码 1：挂号时产生费用；2：门诊收费产生费用',
  `RECIPEL_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应处方明细ID',
  `CHARGE_ITEM_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项目类别代码01西药02中成药03中药饮片04卫生材料05检验06检查07手术08护理09床位10治疗11麻醉12输血13输氧99其他',
  `CHARGE_TYPE_HOSPITAL` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用收入归类代码',
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL COMMENT '费用发生时间',
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用结算ID',
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室',
  `DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生编号',
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生',
  `EXEC_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `EXEC_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人员编号',
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人员',
  `DETAIL_ITEMCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目代码',
  `DETAIL_ITEMNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目名称',
  `DETAIL_ITEMUNIT` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目单位',
  `DETAIL_ITEMUNIT_PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目单价',
  `DETAIL_ITEM_QUANTITY` decimal(8, 3) NULL DEFAULT NULL COMMENT '明细项目数量',
  `DETAIL_ITEM_RECEIVABLE` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目应收金额',
  `DETAIL_ITEM_RECEIVED` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目实收金额',
  `CHARGE_EMPSN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费员编码',
  `CHARGE_DEPTSN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费科室编码',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态 1未缴费2已缴费3退费',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应被退费的收费记录ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_charge_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_charge_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_charge_detail_records`;
CREATE TABLE `cdr_mz_charge_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_SCENE` decimal(1, 0) NULL DEFAULT NULL,
  `RECIPEL_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_ITEM_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_TYPE_HOSPITAL` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL,
  `DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMUNIT` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMUNIT_PRICE` decimal(12, 4) NULL DEFAULT NULL,
  `DETAIL_ITEM_QUANTITY` decimal(8, 3) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVABLE` decimal(12, 4) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVED` decimal(12, 4) NULL DEFAULT NULL,
  `CHARGE_EMPSN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DEPTSN` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_charge_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_diagnose_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_diagnose_detail`;
CREATE TABLE `cdr_mz_diagnose_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `DIAGNOSED_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断ID',
  `DIAGNOSED_METHOD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断方法代码 01：西医；02：中医',
  `DIAGNOSED_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断类别代码',
  `DIAGNOSED_PRIMARY_SECONDARY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断主次代码 01：主要诊断；02：次要诊断',
  `SORT_NO` decimal(2, 0) NULL DEFAULT NULL COMMENT '诊断顺序',
  `DIAGNOSIS_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断代码',
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `DIAGNOSIS_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断医生编码',
  `DIAGNOSIS_DOC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断医生姓名',
  `TCM_PATTERN_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医病证区别代码 01：病；02：证；诊断方法代码为02 时必须填写 ，中医科及相关专业应填',
  `TCM_PATTERN_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医证候名',
  `SUSPECTED_DIAGNOSIS` decimal(1, 0) NULL DEFAULT NULL COMMENT '是否疑诊 0 否；1 是',
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL COMMENT '诊断记录时间',
  `LAST_EDIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后编辑时间',
  `LAST_EDIT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后编辑人编码',
  `LAST_EDITOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后编辑人',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志 0：否，1：是',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_diagnose_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_diagnose_detail_20240531
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_diagnose_detail_20240531`;
CREATE TABLE `cdr_mz_diagnose_detail_20240531`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIAGNOSED_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSED_METHOD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSED_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSED_PRIMARY_SECONDARY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SORT_NO` decimal(2, 0) NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_DOC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_PATTERN_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_PATTERN_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUSPECTED_DIAGNOSIS` decimal(1, 0) NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_EDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_EDIT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_EDITOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_diagnose_detail_20240531
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_diagnose_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_diagnose_detail_records`;
CREATE TABLE `cdr_mz_diagnose_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIAGNOSED_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSED_METHOD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSED_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSED_PRIMARY_SECONDARY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SORT_NO` decimal(2, 0) NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_DOC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_PATTERN_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_PATTERN_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUSPECTED_DIAGNOSIS` decimal(1, 0) NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_EDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_EDIT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_EDITOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_diagnose_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_payment_detail`;
CREATE TABLE `cdr_mz_payment_detail`  (
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算记录ID',
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '记录收费状态',
  `LIST_UNICODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PAYMENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式记录ID',
  `PAY_TYPE_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式编码 01:现金02:支票03:汇款存款04:内部转账05:单位记账06:账户金07:统筹金08:银行卡09:微信10:支付宝11:银联99:其他',
  `PAYMENT_MONEY` decimal(12, 4) NULL DEFAULT NULL COMMENT '支付金额',
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `SETTLEMENT_CLERKCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员编号',
  `PAYMENT_SERIALNO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付流水号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0:正常 1:取消结算',
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被取消结算的记录ID',
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_payment_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_payment_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_payment_detail_records`;
CREATE TABLE `cdr_mz_payment_detail_records`  (
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PAYMENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAY_TYPE_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_MONEY` decimal(12, 4) NULL DEFAULT NULL,
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL,
  `SETTLEMENT_CLERKCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_SERIALNO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_payment_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_recipel
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_recipel`;
CREATE TABLE `cdr_mz_recipel`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `RECIPEL_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方ID',
  `RECIPEL_TYPE` decimal(2, 0) NULL DEFAULT NULL COMMENT '处方分类01:普通处方；02:急诊处方；03:儿科处方；04:麻醉药品和第一类精神药品处方；05:第二类精神药品处方；99:无法归类处方',
  `PRESS_CLASS` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方类别01西药处方 02中成药处方 03中药处方',
  `RECIPEL_VALIDDAYS` decimal(3, 0) NULL DEFAULT NULL COMMENT '处方有效天数',
  `RECIPEL_NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方备注信息',
  `CHINESE_MEDICINE_QUANTITY` decimal(2, 0) NULL DEFAULT NULL COMMENT '中药剂数/付数 如：5剂，中药处方必填，单位：剂',
  `CHINESE_MEDICINE_FREQUENCY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药用法频次 如：每日一剂，中药处方必填',
  `CHINESE_MEDICINE_BOILING` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药煎煮法 如：水煎，中药处方应填',
  `CHINESE_MEDICINE_WAY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药服法 如：分早晚两次空腹温服，中药处方应填',
  `NOTICES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方备注',
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL COMMENT '处方开立时间',
  `RECIPEL_START` datetime(0) NULL DEFAULT NULL COMMENT '处方开始时间',
  `RECIPEL_END` datetime(0) NULL DEFAULT NULL COMMENT '处方停止时间',
  `DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方开立医生',
  `DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方开立医生编码',
  `RECIPEL_DEPT_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方开立科室编码',
  `RECIPEL_DEPT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方开立科室',
  `OVER_REASON` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '超量开单原因内容',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_recipel
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_recipel_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_recipel_detail`;
CREATE TABLE `cdr_mz_recipel_detail`  (
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号(用于和主表进行关联)',
  `RECIPEL_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方ID(用于和主表进行关联)',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为循环数据记录唯一行',
  `RECIPEL_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方明细ID',
  `MEDICAL_ORDERNO` decimal(8, 0) NULL DEFAULT NULL COMMENT '医嘱号',
  `PARENT_ORDERNO` decimal(20, 0) NULL DEFAULT NULL COMMENT '父医嘱号',
  `ITEM_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品代码',
  `ITEM_NAME` varchar(84) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品名称',
  `ITEM_CLASSIFICATION` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品分类代码',
  `DOSAGE_FORMCODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '剂型代码',
  `DRUG_SPECIFICATION` varchar(84) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品规格',
  `DRUG_USINGROUTE` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用药途径代码',
  `DRUG_FREQUENCY_CODE` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用频次代码',
  `SINGLE_DOSAGE` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用次剂量',
  `DOSAGE_UNIT` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用剂量单位',
  `TOTAL_DOSAGE` decimal(12, 2) NULL DEFAULT NULL COMMENT '使用总剂量',
  `TOTAL_DOSAGE_UNIT` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '总剂量单位',
  `SPEED` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '滴速',
  `DRUG_PRICE` decimal(15, 4) NULL DEFAULT NULL COMMENT '标准单价',
  `SKIN_TEST_RESULTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试记录号',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `EXEC_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方执行人编号',
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方执行人',
  `EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '处方执行时间',
  `BATCH_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品批次',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态 1未缴费2已缴费3已退费',
  `REGISTRATION_TIME` datetime(0) NULL DEFAULT NULL COMMENT '收费时间',
  `CHARGE_TYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用类型',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）；1：撤销 作废时传1',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `MEDICATION_DAYS` decimal(65, 30) NULL DEFAULT NULL COMMENT '用药天数',
  `SORT_NO` decimal(65, 30) NULL DEFAULT NULL COMMENT '医嘱排序号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_recipel_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_recipel_other
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_recipel_other`;
CREATE TABLE `cdr_mz_recipel_other`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为循环数据记录唯一行',
  `RECIPEL_TYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方分类 01：普通处方；02：急诊处方；03：儿科处方；04：麻醉药品和第一类精神药品处方；05：第二类精神药品处方；99：无法归类处方',
  `RECIPEL_VALIDDAYS` decimal(3, 0) NULL DEFAULT NULL COMMENT '处方有效天数',
  `NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方备注',
  `MEDICAL_ORDERNO` decimal(8, 0) NULL DEFAULT NULL COMMENT '医嘱号',
  `RECIPEL_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方明细ID',
  `ITEM_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目代码',
  `ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `CHARGE_PRICE` decimal(15, 4) NULL DEFAULT NULL COMMENT '标准单价',
  `AMOUNT` decimal(8, 4) NULL DEFAULT NULL COMMENT '数量',
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL COMMENT '处方开嘱时间',
  `RECIPEL_START` datetime(0) NULL DEFAULT NULL COMMENT '处方开始时间',
  `RECIPEL_END` datetime(0) NULL DEFAULT NULL COMMENT '处方停止时间',
  `APPLY_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方开立医生编码',
  `APPLY_DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方开立医生',
  `RECIPEL_DEPT_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方开立科室编码',
  `RECIPEL_DEPT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方开立科室',
  `ITEM_CLASSIFICATION` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目分类代码',
  `ITEM_CLASSIFICATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目分类名称',
  `FREQUENCY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用频次代码',
  `EXEC_DEPT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方执行人编号',
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处方执行人',
  `EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '处方执行时间',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态 1未缴费2已缴费3退费',
  `REGISTRATION_TIME` datetime(0) NULL DEFAULT NULL COMMENT '收费时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销 作废时传1',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `SORT_NO` decimal(65, 30) NULL DEFAULT NULL COMMENT '医嘱排序号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_recipel_other
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_recipel_other_bf
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_recipel_other_bf`;
CREATE TABLE `cdr_mz_recipel_other_bf`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RECIPEL_TYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECIPEL_VALIDDAYS` decimal(3, 0) NULL DEFAULT NULL,
  `NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEDICAL_ORDERNO` decimal(8, 0) NULL DEFAULT NULL,
  `RECIPEL_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_PRICE` decimal(15, 4) NULL DEFAULT NULL,
  `AMOUNT` decimal(8, 4) NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `RECIPEL_START` datetime(0) NULL DEFAULT NULL,
  `RECIPEL_END` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECIPEL_DEPT_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECIPEL_DEPT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_CLASSIFICATION` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_CLASSIFICATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FREQUENCY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_TIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `REGISTRATION_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `SORT_NO` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_recipel_other_bf
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_recipel_other_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_recipel_other_records`;
CREATE TABLE `cdr_mz_recipel_other_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RECIPEL_TYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECIPEL_VALIDDAYS` decimal(3, 0) NULL DEFAULT NULL,
  `NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEDICAL_ORDERNO` decimal(8, 0) NULL DEFAULT NULL,
  `RECIPEL_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_PRICE` decimal(15, 4) NULL DEFAULT NULL,
  `AMOUNT` decimal(8, 4) NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `RECIPEL_START` datetime(0) NULL DEFAULT NULL,
  `RECIPEL_END` datetime(0) NULL DEFAULT NULL,
  `APPLY_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECIPEL_DEPT_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECIPEL_DEPT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_CLASSIFICATION` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_CLASSIFICATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FREQUENCY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_TIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `REGISTRATION_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `SORT_NO` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_recipel_other_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_register_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_register_detail`;
CREATE TABLE `cdr_mz_register_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `REGISTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号记录ID',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '流水号',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊号',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_NAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `REFUND_FLAG` decimal(2, 0) NULL DEFAULT NULL COMMENT '挂号标志1挂号2退号',
  `RECEIPT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费编号',
  `REGISTER_REFUND_TIME` datetime(0) NULL DEFAULT NULL COMMENT '实际挂/退号时间',
  `REGISTER_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号类别100普通101专科102专家103特需104专病999其他',
  `RESERVED_TYPE` decimal(1, 0) NULL DEFAULT NULL COMMENT '预约标志1:预约0:不预约',
  `EMERGENCY_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '是否急诊1:急诊0:非急诊',
  `SCHEDULE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '号源id',
  `REGISTER_WAYCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '挂号途径代码1.微信挂号 2.支付宝挂号 3.自助机挂号 4.医院APP挂号 5.电话挂号 6.网上挂号 7.挂号窗口 8.门诊诊间 9. 其它',
  `DEPARTMENT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号科室编码',
  `DEPARTMENT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号科室名称',
  `REGISTER_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号医生编号',
  `REGISTER_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号医生',
  `REGISTER_TIME_PERIOD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号时段',
  `REGISTER_CHARGE` decimal(12, 4) NULL DEFAULT NULL COMMENT '挂号总费用',
  `PAY_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付编码01现金02支票03汇款存款04内部转账05单位记账06账户金07统筹金08银行卡09微信10支付宝99其他',
  `INSURANCE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保险类型（患者属性）01城镇职工02城镇居民03新农合04贫困救助05商业险06全公费07全自费99其他',
  `GH_CLINIC_DATE` datetime(0) NULL DEFAULT NULL COMMENT '计划就诊日期',
  `MEDICAL_CARDNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊卡号',
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子健康卡号',
  `SPECIAL_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '特需标志0非特需，1特需',
  `NONLOCAL_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '外地标志1:本市 2:外地 3:境外（港澳台） 4:外国 5:未知',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志0正常 1撤销（退号时传1）',
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退号记录ID',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '操作时间（退号，更新时间）',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `RESERVED_SORT` decimal(65, 30) NULL DEFAULT NULL COMMENT '挂号序号'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_register_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_register_detail0921
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_register_detail0921`;
CREATE TABLE `cdr_mz_register_detail0921`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REGISTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFUND_FLAG` decimal(2, 0) NULL DEFAULT NULL,
  `RECEIPT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_REFUND_TIME` datetime(0) NULL DEFAULT NULL,
  `REGISTER_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESERVED_TYPE` decimal(1, 0) NULL DEFAULT NULL,
  `EMERGENCY_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `SCHEDULE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_WAYCODE` decimal(1, 0) NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_TIME_PERIOD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_CHARGE` decimal(12, 4) NULL DEFAULT NULL,
  `PAY_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURANCE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GH_CLINIC_DATE` datetime(0) NULL DEFAULT NULL,
  `MEDICAL_CARDNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPECIAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NONLOCAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `RESERVED_SORT` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_register_detail0921
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_register_detail_0911
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_register_detail_0911`;
CREATE TABLE `cdr_mz_register_detail_0911`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REGISTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFUND_FLAG` decimal(2, 0) NULL DEFAULT NULL,
  `RECEIPT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_REFUND_TIME` datetime(0) NULL DEFAULT NULL,
  `REGISTER_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESERVED_TYPE` decimal(1, 0) NULL DEFAULT NULL,
  `EMERGENCY_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `SCHEDULE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_WAYCODE` decimal(1, 0) NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_TIME_PERIOD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_CHARGE` decimal(12, 4) NULL DEFAULT NULL,
  `PAY_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURANCE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GH_CLINIC_DATE` datetime(0) NULL DEFAULT NULL,
  `MEDICAL_CARDNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPECIAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NONLOCAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `RESERVED_SORT` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_register_detail_0911
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_register_detail_bak20231029
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_register_detail_bak20231029`;
CREATE TABLE `cdr_mz_register_detail_bak20231029`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REGISTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFUND_FLAG` decimal(2, 0) NULL DEFAULT NULL,
  `RECEIPT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_REFUND_TIME` datetime(0) NULL DEFAULT NULL,
  `REGISTER_TYPE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESERVED_TYPE` decimal(1, 0) NULL DEFAULT NULL,
  `EMERGENCY_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `SCHEDULE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_WAYCODE` decimal(1, 0) NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_NAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_TIME_PERIOD` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_CHARGE` decimal(12, 4) NULL DEFAULT NULL,
  `PAY_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURANCE_TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GH_CLINIC_DATE` datetime(0) NULL DEFAULT NULL,
  `MEDICAL_CARDNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EHEALTH_CARD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPECIAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `NONLOCAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `RESERVED_SORT` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_register_detail_bak20231029
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_settle_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_settle_detail`;
CREATE TABLE `cdr_mz_settle_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算记录ID',
  `SETTLE_RECEIPTNO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算发票号',
  `RECEIPT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '开票时间',
  `PRINT_CODE` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开票人编码',
  `PRINT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开票人',
  `ELECTRONIC_INVOICE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子发票代码',
  `INSURANCE_PERSONAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保个人编码',
  `INSURANCE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保就诊编码',
  `YBTCQBM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保统筹区编码',
  `YBTCQMC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保统筹区名称',
  `TRADE_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保交易流水号',
  `SETTLE_SCENE` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费场景代码 1：挂号时产生费用；2：门诊收费产生费用',
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '记录收费状态 1：收费；2：退费',
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `MEDICAL_PAYMENT_METHOD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗付费方式代码',
  `SETTLE_TOTAL_MONEY` decimal(12, 4) NULL DEFAULT NULL COMMENT '费用结算总金额',
  `PERSONAL_EXPENSES` decimal(10, 2) NULL DEFAULT NULL COMMENT '个人承担费用金额',
  `SETTLEMENT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员编号',
  `SETTLEMENT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：取消结算',
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被取消结算的记录ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_settle_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_settle_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_settle_detail_records`;
CREATE TABLE `cdr_mz_settle_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_RECEIPTNO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIPT_TIME` datetime(0) NULL DEFAULT NULL,
  `PRINT_CODE` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ELECTRONIC_INVOICE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURANCE_PERSONAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURANCE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `YBTCQBM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `YBTCQMC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRADE_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_SCENE` decimal(1, 0) NULL DEFAULT NULL,
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL,
  `MEDICAL_PAYMENT_METHOD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_TOTAL_MONEY` decimal(12, 4) NULL DEFAULT NULL,
  `PERSONAL_EXPENSES` decimal(10, 2) NULL DEFAULT NULL,
  `SETTLEMENT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLEMENT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_settle_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_visit_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_visit_detail`;
CREATE TABLE `cdr_mz_visit_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `VISIT_DETAIL_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '就诊明细ID',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `RETURN_VISIT` decimal(2, 0) NULL DEFAULT NULL COMMENT '是否复诊1:复诊;0:初诊',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号',
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `REGISTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应挂号记录ID',
  `VISIT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊科室编码',
  `VISIT_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊科室名称',
  `CHECK_TIME` datetime(0) NULL DEFAULT NULL COMMENT '分诊台报道时间',
  `VISIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '接诊时间',
  `FINISH_VISIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '完成就诊时间',
  `VISIT_DECTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主诊医生编号',
  `VISIT_DECTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主诊医生姓名',
  `DIAGNOSIS_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊诊断代码',
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊诊断名称（主要诊断）',
  `ID_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证型代码（主要证型)',
  `ID_TYPE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证型名称（主要证型)',
  `MEDICAL_TREATMENT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治法名称',
  `DIAGNOSE_NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊诊断补充说明',
  `VISIT_STATUS_CODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '就诊状态编码0未接诊，1正在就诊，2已诊毕，3回诊',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志0:正常(选填默认);1:撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_visit_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_visit_detail_bf
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_visit_detail_bf`;
CREATE TABLE `cdr_mz_visit_detail_bf`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VISIT_DETAIL_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `RETURN_VISIT` decimal(2, 0) NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TIME` datetime(0) NULL DEFAULT NULL,
  `VISIT_TIME` datetime(0) NULL DEFAULT NULL,
  `FINISH_VISIT_TIME` datetime(0) NULL DEFAULT NULL,
  `VISIT_DECTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DECTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_TYPE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEDICAL_TREATMENT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSE_NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_STATUS_CODE` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_visit_detail_bf
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_visit_detail_bk
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_visit_detail_bk`;
CREATE TABLE `cdr_mz_visit_detail_bk`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VISIT_DETAIL_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `RETURN_VISIT` decimal(2, 0) NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TIME` datetime(0) NULL DEFAULT NULL,
  `VISIT_TIME` datetime(0) NULL DEFAULT NULL,
  `FINISH_VISIT_TIME` datetime(0) NULL DEFAULT NULL,
  `VISIT_DECTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DECTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_TYPE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEDICAL_TREATMENT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSE_NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_STATUS_CODE` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_visit_detail_bk
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_mz_visit_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_mz_visit_detail_records`;
CREATE TABLE `cdr_mz_visit_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VISIT_DETAIL_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `RETURN_VISIT` decimal(2, 0) NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHECK_TIME` datetime(0) NULL DEFAULT NULL,
  `VISIT_TIME` datetime(0) NULL DEFAULT NULL,
  `FINISH_VISIT_TIME` datetime(0) NULL DEFAULT NULL,
  `VISIT_DECTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_DECTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_TYPE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MEDICAL_TREATMENT` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSE_NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_STATUS_CODE` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_mz_visit_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_nuclein_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_nuclein_report`;
CREATE TABLE `cdr_nuclein_report`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据唯一记录号',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生工号',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `SEND_TIME` datetime(0) NULL DEFAULT NULL COMMENT '送检时间',
  `RECEIVE_STAFFID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本核收人编码',
  `RECEIVE_STAFF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本核收人',
  `RECEIVE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '标本核收时间',
  `TECHNICIAN_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验医生编码',
  `TECHNICIAN_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验医生',
  `LIS_EXAM_TIME` datetime(0) NULL DEFAULT NULL COMMENT '检验时间',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告号',
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生编码',
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '检验报告审核时间',
  `ASSIGNED_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告审核人编码',
  `ASSIGNED_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告审核人',
  `PRINT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '打印时间',
  `LIS_SAMPLE_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验标本号',
  `LIS_SAMPLE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验标本编码',
  `LIS_SAMPLE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验标本名称',
  `LIS_ITEM_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目编码',
  `LIS_ITEM_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验项目名称',
  `REPORT_TYPE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告类别代码',
  `REPORT_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检验报告类别',
  `DEVICE_NUMBER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仪器编号',
  `DEVICE_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仪器名称',
  `LIS_BARCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '条码号',
  `TOTAL_TIMES` decimal(65, 30) NULL DEFAULT NULL COMMENT '总测量次数',
  `IMAGING_NOTES` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断代码（主要诊断)',
  `DIAGNOSIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断名称（主要诊断）',
  `IMAGE_INDEX` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图像索引号',
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '整张报告图片信息',
  `WSW_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '微生物报告标志，0否1是',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志，0否1是',
  `NUCLEIN_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '核酸标志，0否1是',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_nuclein_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_nuclein_report_base64
-- ----------------------------
DROP TABLE IF EXISTS `cdr_nuclein_report_base64`;
CREATE TABLE `cdr_nuclein_report_base64`  (
  `REPORT_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BASE64` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_nuclein_report_base64
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_nuclein_report_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_nuclein_report_detail`;
CREATE TABLE `cdr_nuclein_report_detail`  (
  `REPORT_ID` decimal(18, 0) NOT NULL,
  `LIS_ITEM_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_ITEM_NAME` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(183) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LIS_RESULT_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIS_RESULT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LIS_RATION_RESULT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `LIS_RATION_RESULT_UNIT` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_DOC_NAME` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINT_SERIAL_NUMBER` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETECT_BILL_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LOINC_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETECT_INDICAT_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETECT_INDICAT_NAME` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INDICATOR_RESU_TPCODE` decimal(1, 0) NULL DEFAULT NULL,
  `ABNORMAL_TIPS` decimal(2, 0) NULL DEFAULT NULL,
  `DETECT_INDICAT_RESULT` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFERENCE_RANGE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `MEASURE_UNIT` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_nuclein_report_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_nursing_grade
-- ----------------------------
DROP TABLE IF EXISTS `cdr_nursing_grade`;
CREATE TABLE `cdr_nursing_grade`  (
  `LIST_UNICODE` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` decimal(18, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `VISIT_NO` varchar(81) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(5, 0) NOT NULL,
  `INPATIENT_NO` decimal(65, 30) NULL DEFAULT NULL,
  `AGE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` decimal(18, 0) NULL DEFAULT NULL,
  `WARD_CODE` decimal(18, 0) NULL DEFAULT NULL,
  `BED_NO` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DETAILID` decimal(65, 30) NULL DEFAULT NULL,
  `ORDER_TIME_TYPECODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CREATTIME` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DOCTOR` varchar(123) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DEPTCODE` decimal(18, 0) NULL DEFAULT NULL,
  `ORDER_REVIEWER` varchar(123) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_REVIEWDATE` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STARTTIME` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ENDTIME` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CONFIRM_NURSE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CONFIRMTIME` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOP_DOCTOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ORDER_STOP_DOCTORTIME` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOP_NURSE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOPTIME` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CANCELLER` varchar(123) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTORADVICE_CANCELLERTIEM` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_STATUSCODE` decimal(65, 30) NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` decimal(18, 0) NULL DEFAULT NULL,
  `ORDER_ILLUSTRATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXECUTION_FREQUENCY` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_DATE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_nursing_grade
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_operation_andschedule
-- ----------------------------
DROP TABLE IF EXISTS `cdr_operation_andschedule`;
CREATE TABLE `cdr_operation_andschedule`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区代码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术申请单号',
  `OPSOUCRE_ORDNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术排台号',
  `SCHEDULE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '手术排班时间',
  `OPREAT_APPOINT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '排台手术开始时间',
  `ESTIMATETIME_NUM` decimal(65, 30) NULL DEFAULT NULL COMMENT '预计手术时长',
  `ESTIMATETIME_UNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预计手术时长单位',
  `APPOINT_EQUIPMENTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约设备编码',
  `APPOINT_EQUIPMENT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约设备名称',
  `OPERATOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主刀医生工号',
  `OPERATOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主刀医生名称',
  `FIRST_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手编码',
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手姓名',
  `SECEND_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手编码',
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手姓名',
  `THIRD_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三助手编码',
  `THIRD_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三助手姓名',
  `NURSE_INSTRUMENTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '器械护士编码',
  `NURSE_INSTRUMENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '器械护士名称',
  `NURSE_PATROLID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡台护士编码',
  `NURSE_PATROL_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '巡台护士名称',
  `OPERATION_ROOM_NUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术间编号',
  `OPERATION_DEPT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术室编码',
  `OPERATION_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术室名称',
  `OPERATION_PLATFORM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术台编码',
  `ANESTHESIA_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医生编码',
  `ANESTHESIA_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医生姓名',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志 0：正常（选填默认）1：撤销',
  `WASH_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '洗手护士名称',
  `WASH_NURSE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '洗手护士编码'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_operation_andschedule
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_operation_andschedule_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_operation_andschedule_records`;
CREATE TABLE `cdr_operation_andschedule_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPSOUCRE_ORDNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULE_TIME` datetime(0) NULL DEFAULT NULL,
  `OPREAT_APPOINT_TIME` datetime(0) NULL DEFAULT NULL,
  `ESTIMATETIME_NUM` decimal(65, 30) NULL DEFAULT NULL,
  `ESTIMATETIME_UNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIPMENTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPOINT_EQUIPMENT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECEND_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `THIRD_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `THIRD_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NURSE_INSTRUMENTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NURSE_INSTRUMENT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NURSE_PATROLID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NURSE_PATROL_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_ROOM_NUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_DEPT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_PLATFORM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `WASH_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WASH_NURSE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_operation_andschedule_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_operation_appinfoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_operation_appinfoquery`;
CREATE TABLE `cdr_operation_appinfoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区代码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区',
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `DIAGNOSIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `ORDERID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱号',
  `OPERAT_APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请日期',
  `OPERATION_PORTION` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术部位',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生工号',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL COMMENT '审核日期',
  `ASSIGNED_DOC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生工号',
  `ASSIGNED_DOC` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生',
  `OPERATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术编码',
  `OPERATION_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '手术名称',
  `OPERATION_LEVELCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术等级编码',
  `PLANOPERATION_FLAG` decimal(3, 0) NULL DEFAULT NULL COMMENT '计划手术标志 0，计划手术，1，非计划再次手术',
  `OPERATION_CLASS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术类型',
  `ANESTHESIA_TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟行麻醉方式',
  `ANESTHESIA_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拟行麻醉方式',
  `OPERAT_PLANDATE` datetime(0) NULL DEFAULT NULL COMMENT '预定手术时间',
  `OPERATION_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生工号',
  `OPERATION_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术医生',
  `FIRST_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一助编码',
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一助姓名',
  `SECEND_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二助编码',
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二助姓名',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `NOTICE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项',
  `URGENT_FLAG` decimal(3, 0) NULL DEFAULT NULL COMMENT '加急标志 0：否/1：是',
  `APPLY_STATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单状态 0申请，1 排班，2手术完成3取消手术',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态 1未缴费2已缴费3退费（针对门诊手术情况）',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_operation_appinfoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_operation_appinfoquery_0408
-- ----------------------------
DROP TABLE IF EXISTS `cdr_operation_appinfoquery_0408`;
CREATE TABLE `cdr_operation_appinfoquery_0408`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDERID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERAT_APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `OPERATION_PORTION` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL,
  `ASSIGNED_DOC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_DOC` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_LEVELCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PLANOPERATION_FLAG` decimal(3, 0) NULL DEFAULT NULL,
  `OPERATION_CLASS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERAT_PLANDATE` datetime(0) NULL DEFAULT NULL,
  `OPERATION_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECEND_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTICE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URGENT_FLAG` decimal(3, 0) NULL DEFAULT NULL,
  `APPLY_STATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_operation_appinfoquery_0408
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_operation_appinfoquery_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_operation_appinfoquery_records`;
CREATE TABLE `cdr_operation_appinfoquery_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDERID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERAT_APPLY_TIME` datetime(0) NULL DEFAULT NULL,
  `OPERATION_PORTION` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_TIME` datetime(0) NULL DEFAULT NULL,
  `ASSIGNED_DOC_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ASSIGNED_DOC` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_LEVELCODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PLANOPERATION_FLAG` decimal(3, 0) NULL DEFAULT NULL,
  `OPERATION_CLASS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_TYPE_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ANESTHESIA_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERAT_PLANDATE` datetime(0) NULL DEFAULT NULL,
  `OPERATION_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATION_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECEND_ASSISTANTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTICE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `URGENT_FLAG` decimal(3, 0) NULL DEFAULT NULL,
  `APPLY_STATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_operation_appinfoquery_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_operation_status
-- ----------------------------
DROP TABLE IF EXISTS `cdr_operation_status`;
CREATE TABLE `cdr_operation_status`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会诊申请单号',
  `OPSOUCRE_ORDNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术排台号',
  `OPREAT_APPOINT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '排台手术开始时间',
  `MODIFY_DATE` datetime(0) NULL DEFAULT NULL COMMENT '登记日期',
  `MODIFY_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登记医生工号',
  `MODIFY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登记医生',
  `EXEC_STATUSCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '状态编码 0申请，1 排班，2手术完成，3取消手术，4麻醉开始，5手术开始，6手术结束',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_operation_status
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_order_status
-- ----------------------------
DROP TABLE IF EXISTS `cdr_order_status`;
CREATE TABLE `cdr_order_status`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ORDER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱ID',
  `PARENT_ORDERNO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父医嘱ID',
  `ORDER_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱停止时间',
  `ORDER_STOP_DOCTORCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停嘱医生编号',
  `ORDER_STOP_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停嘱医生',
  `ORDER_STOP_DOCTORTIME` datetime(0) NULL DEFAULT NULL COMMENT '医生停嘱时间',
  `ORDER_STOP_NURSECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认停嘱护士编号',
  `ORDER_STOP_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认停嘱护士',
  `ORDER_STOPTIME` datetime(0) NULL DEFAULT NULL COMMENT '护士确认停嘱时间',
  `ORDER_CANCELLERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱作废医生编码',
  `ORDER_CANCELLER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱作废医生',
  `ORDER_CANCELLERTIEM` datetime(0) NULL DEFAULT NULL COMMENT '医嘱作废时间',
  `REVOKE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱撤销时间',
  `REVOKE_REASON` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱撤销原因描述',
  `EXEC_STATUSCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱状态编码 1、医生录入，2、医生已提交，3、护士已确认，4、执行中，5、已停止，9、已作废',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `ORDER_TYPE` decimal(65, 30) NULL DEFAULT NULL COMMENT '1为药品类医嘱 2为非药品类医嘱'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_order_status
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_outpatient_inpatient
-- ----------------------------
DROP TABLE IF EXISTS `cdr_outpatient_inpatient`;
CREATE TABLE `cdr_outpatient_inpatient`  (
  `PATIENT_ID` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO_INPATIENT` varchar(243) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO_OUTPATIENT` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_outpatient_inpatient
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_outpatientappointstatusinfoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_outpatientappointstatusinfoquery`;
CREATE TABLE `cdr_outpatientappointstatusinfoquery`  (
  `GROUP_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `HOSPITAL_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构代码',
  `HOSPITAL_NAME` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` decimal(18, 0) NULL DEFAULT NULL COMMENT '患者ID',
  `PATIENT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '患者姓名',
  `GENDERCODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码',
  `GENDERNAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `ID_CARD` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `TELCOME` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `PATIENTAPPOINTID` decimal(18, 0) NOT NULL COMMENT '预约ID',
  `UNICODE` decimal(18, 0) NOT NULL COMMENT '唯一编码',
  `PATIENTAPPOINTDATE` datetime(0) NULL DEFAULT NULL COMMENT '预约日期时间',
  `SYS_APPOINTDATE` datetime(0) NULL DEFAULT NULL COMMENT '系统预约日期时',
  `SYS_ID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '系统id',
  `APPOINT_STATUSCODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预约状态码',
  `APPOINT_STATUS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预约状态描述',
  `DOC_REGISTERDATE` datetime(0) NULL DEFAULT NULL COMMENT '医务人员预约日期时间',
  `REGISTER_DOC_CODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预约医务人员工号',
  `REGISTER_DOC` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预约医务人员姓名',
  `SOURCEID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '资源ID',
  `SOURCE_STRATDATE` datetime(0) NULL DEFAULT NULL COMMENT '资源时段开始日期时间',
  `SOURCE_ENDDATE` datetime(0) NULL DEFAULT NULL COMMENT '资源时段结束日期时间',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_outpatientappointstatusinfoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_outpatientmedicalrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_outpatientmedicalrecord`;
CREATE TABLE `cdr_outpatientmedicalrecord`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人就诊科室编码',
  `DEPARTMENT` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人就诊科室名称',
  `DATE_CLINIC` datetime(0) NULL DEFAULT NULL COMMENT '就诊日期时间',
  `AUTHOR_ASSIGNED_ID` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊医师编码',
  `UTHOR_ASSIGNED` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊医师姓名',
  `CHARGE_DOCTORID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生编号',
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生姓名',
  `ALLERGIES_FLAR` decimal(1, 0) NULL DEFAULT NULL COMMENT '过敏标志 0:否;1:是',
  `ALLERGIES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '过敏史描述',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主诉',
  `ILLNESS_CURRENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '现病史',
  `ILLNESS_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '既往史',
  `EXAMINATION_PHYSIQUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '体格检查结果',
  `DOC_ADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '治疗意见',
  `MENSTRUAL_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '月经史',
  `PERSONAL_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人史',
  `EXAM_AUXILIARY_ITEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '辅助检查项目',
  `EXAMINATION_AUXILIARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '辅助检查结果',
  `DIAGNOSIS_PRELIMINARY` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '初诊/复诊 0 初诊 1复诊',
  `DIAGNOSIS_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主要诊断代码',
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主要诊断名称',
  `TCM_DISEASE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医病名名称',
  `TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医证候名称',
  `TCM_SYNDROMECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医证候代码',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_outpatientmedicalrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_outpatientmedicalrecord_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_outpatientmedicalrecord_records`;
CREATE TABLE `cdr_outpatientmedicalrecord_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATTIME` datetime(0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DATE_CLINIC` datetime(0) NULL DEFAULT NULL,
  `AUTHOR_ASSIGNED_ID` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UTHOR_ASSIGNED` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DOCTORID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DOCTOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ALLERGIES_FLAR` decimal(1, 0) NULL DEFAULT NULL,
  `ALLERGIES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ILLNESS_CURRENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ILLNESS_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXAMINATION_PHYSIQUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOC_ADVICE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `MENSTRUAL_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `PERSONAL_HISTORY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXAM_AUXILIARY_ITEM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXAMINATION_AUXILIARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DIAGNOSIS_PRELIMINARY` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_DISEASE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_SYNDROMENAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_SYNDROMECODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_outpatientmedicalrecord_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_pathology_applyinfo
-- ----------------------------
DROP TABLE IF EXISTS `cdr_pathology_applyinfo`;
CREATE TABLE `cdr_pathology_applyinfo`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门急诊号',
  `INPATIENT_NO` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区代码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区',
  `DIAGNOSIS_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病编码',
  `DIAGNOSIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '疾病名称',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生工号',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `APPLY_DESC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单详细内容',
  `CHECK_APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '检查申请日期',
  `CHECK_TYPECODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型编码',
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型名称',
  `SPECIMEN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送检组织',
  `SPECIMEN_AMOUNT` decimal(3, 0) NULL DEFAULT NULL COMMENT '送检组织数量',
  `SPECIMEN_AMOUNT_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送检组织数量单位',
  `SAMPLE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本条码号',
  `COLLECT_SITE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取材部位',
  `COLLECT_AMOUNT` decimal(3, 0) NULL DEFAULT NULL COMMENT '取材数量',
  `COLLECT_AMOUNT_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取材数量单位',
  `FIXATIVE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定液',
  `MEDICAL_RECORDS_SUMMARY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '病历摘要及手术所见',
  `CHECK_ITEM_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目编码',
  `CHECK_ITEM_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目名称',
  `CHECK_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查方法名称',
  `CHECK_SITE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查部位名称',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `NOTICE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注意事项 ',
  `URGENT_FLAG` decimal(3, 0) NULL DEFAULT NULL COMMENT '加急标志 0：否/1：是',
  `APPLY_STATE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请单状态 0,\'待检\',1,登记\',2,\'已出报告,3,拒绝执行4，取消执行',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态 1未缴费2已缴费3退费',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_pathology_applyinfo
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_pathology_report
-- ----------------------------
DROP TABLE IF EXISTS `cdr_pathology_report`;
CREATE TABLE `cdr_pathology_report`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `LAST_MENS_DATE` datetime(0) NULL DEFAULT NULL COMMENT '末次月经时间',
  `APPLICATIONNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子申请单编号',
  `APPLY_DOC_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生工号',
  `APPLY_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `APPLY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `REGISTER_TIME` datetime(0) NULL DEFAULT NULL COMMENT '检查登记时间',
  `REGISTER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查登记人编码',
  `REGISTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查登记人',
  `REPORT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '报告时间',
  `REPORT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生编码',
  `REPORT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告医生',
  `REVIEW_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `REVIEW_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生',
  `REPORT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告号',
  `IMAGE_CONTENT` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '整张报告图片信息',
  `REPORT_ORDER_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查号',
  `CHECK_ITEM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类项目编码',
  `CHECK_ITEM_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查项目名称',
  `CHECK_TYPECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型编码',
  `CHECK_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查类型名称',
  `REPORT_MEMO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查备注',
  `IMAGING_FINDING` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客观所见内容',
  `IMAGING_CONCLUSION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主观提示内容',
  `DIAGNOSIS_CODE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断代码（主要诊断)',
  `DIAGNOSIS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '临床诊断名称（主要诊断）',
  `DIAG_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断医生编码',
  `DIAG_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断医生',
  `SUBVISIT_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生编码',
  `SUBVISIT_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核医生',
  `SUGGESTION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补充意见',
  `PATHOLOGY_DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病理诊断意见',
  `CHECK_METHOD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查方法名称',
  `EXAM_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查医生编码',
  `EXAM_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查医生名称',
  `EXAM_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查科室编码',
  `EXAM_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '检查科室名称',
  `EXAM_DATE` datetime(0) NULL DEFAULT NULL COMMENT '检查时间',
  `SPECI_MENNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本号',
  `SPECIMEN_TYPENAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本名称',
  `MANUFACTURE_RCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仪器型号',
  `PATHLOGY_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病理编号',
  `SPECI_CONNECT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '标本采集日期',
  `DNA_DISTILL_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DNA提取方法编码',
  `DNA_DISTILL_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'DNA提取方法名称',
  `DRAW_POSITION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取材部位编码',
  `DRAW_POSITION_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取材部位名称',
  `DRAW_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取样医生编码',
  `DRAW_DOC_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取样医生名称',
  `SPECIMEN_FIXATIVE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标本固定液',
  `RECEIVED_DATE` datetime(0) NULL DEFAULT NULL COMMENT '样本接收时间',
  `ITEM_RESULT_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '检查结果标志 1,正常;2,异常9,不确定',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_pathology_report
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_pathology_report_base64
-- ----------------------------
DROP TABLE IF EXISTS `cdr_pathology_report_base64`;
CREATE TABLE `cdr_pathology_report_base64`  (
  `REPORT_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BASE64` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_pathology_report_base64
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_rehabilitation_fees
-- ----------------------------
DROP TABLE IF EXISTS `cdr_rehabilitation_fees`;
CREATE TABLE `cdr_rehabilitation_fees`  (
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ID',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `ORDER_DETAILID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱明细号',
  `DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室代码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生编码',
  `DOCTOR_NAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室代码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `EXEC_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行医生代码',
  `EXEC_DOCTOR` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行医生名称',
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL COMMENT '结算时间',
  `DETAIL_ITEMUNIT_PRICE` decimal(5, 0) NULL DEFAULT NULL,
  `DETAIL_ITEM_QUANTITY` decimal(3, 0) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVED` decimal(5, 0) NULL DEFAULT NULL,
  `DETAIL_ITEMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目编码',
  `CHARGE_EMPCODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_STATUS` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `DELETE_UNICODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_rehabilitation_fees
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_scald_risk_info
-- ----------------------------
DROP TABLE IF EXISTS `cdr_scald_risk_info`;
CREATE TABLE `cdr_scald_risk_info`  (
  `日期` datetime(0) NULL DEFAULT NULL,
  `护理单元` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `评估人数` decimal(65, 30) NULL DEFAULT NULL,
  `原有烫伤人数` decimal(65, 30) NULL DEFAULT NULL,
  `今日新发高风险` decimal(65, 30) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `UNICODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_scald_risk_info
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_signin_infoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_signin_infoquery`;
CREATE TABLE `cdr_signin_infoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `SIGN_TYPE` decimal(2, 0) NULL DEFAULT NULL COMMENT '签到场景 1挂号 2药房 3检查 4检验 5收费结算',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `TICKET_NUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '票号',
  `SIGN_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到科室编码',
  `SIGN_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到科室',
  `SIGN_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到医生编码',
  `SIGN_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到医生',
  `SIGN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '签到时间',
  `WIND_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分派窗口号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `SIGN_ROOM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到诊室编码',
  `SIGN_ROOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到诊室'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_signin_infoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_signin_infoquery_lt
-- ----------------------------
DROP TABLE IF EXISTS `cdr_signin_infoquery_lt`;
CREATE TABLE `cdr_signin_infoquery_lt`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `SIGN_TYPE` decimal(2, 0) NULL DEFAULT NULL COMMENT '签到场景 1挂号 2药房 3检查 4检验 5收费结算',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `TICKET_NUMBER` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '票号',
  `SIGN_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到科室编码',
  `SIGN_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到科室',
  `SIGN_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到医生编码',
  `SIGN_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到医生',
  `SIGN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '签到时间',
  `WIND_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分派窗口号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `SIGN_ROOM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到诊室编码',
  `SIGN_ROOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到诊室'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_signin_infoquery_lt
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_skintest_infoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_skintest_infoquery`;
CREATE TABLE `cdr_skintest_infoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门（急）诊号标识',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISITID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `BEDNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床号',
  `SKIN_TEST_RESULTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试结果唯一记录号',
  `ADVICE_ORDER_ID` decimal(65, 30) NULL DEFAULT NULL COMMENT '关联医嘱序号',
  `ADVICE_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联医嘱号',
  `APPLY_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生编码',
  `APPLY_DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请医生',
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室编码',
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请科室',
  `EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `EXCUTE_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试科室编码',
  `EXCUTE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试科室',
  `EXCUTE_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试医生编码',
  `EXCUTE_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试医生',
  `TEST_DATE` datetime(0) NULL DEFAULT NULL COMMENT '皮试时间',
  `TEST_RESULT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试结果',
  `TEST_DESCRIBE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试过程描述',
  `RECORD_DATE` datetime(0) NULL DEFAULT NULL COMMENT '皮试结果录入时间',
  `RECORD_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录入人编码',
  `RECORD_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录入人',
  `PROJECT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试项目编码',
  `PROJECT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试项目名称',
  `BATCH_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试药品批号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志0正常 1撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_skintest_infoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_skintest_infoquery_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_skintest_infoquery_records`;
CREATE TABLE `cdr_skintest_infoquery_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUTPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISITID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BEDNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SKIN_TEST_RESULTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADVICE_ORDER_ID` decimal(65, 30) NULL DEFAULT NULL,
  `ADVICE_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `APPLY_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_TIME` datetime(0) NULL DEFAULT NULL,
  `EXCUTE_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCUTE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCUTE_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXCUTE_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEST_DATE` datetime(0) NULL DEFAULT NULL,
  `TEST_RESULT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TEST_DESCRIBE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_DATE` datetime(0) NULL DEFAULT NULL,
  `RECORD_DOC_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_DOC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PROJECT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BATCH_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_skintest_infoquery_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_source_andschedule
-- ----------------------------
DROP TABLE IF EXISTS `cdr_source_andschedule`;
CREATE TABLE `cdr_source_andschedule`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATE_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排班计划医生工号',
  `SUBSPECIALTY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '号源专业代码',
  `SCHEDULE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '号源记录唯一标识号',
  `DEPT_FLAG` decimal(65, 30) NULL DEFAULT NULL COMMENT '科室号标识',
  `DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出诊科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出诊科室',
  `DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出诊医生编码',
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出诊医生',
  `TECHNICAL_TITLE_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出诊医生专业技能职务类别代码',
  `SHIFT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '班别名称',
  `REQ_TYPE` decimal(3, 0) NULL DEFAULT NULL COMMENT '号类 100 =普通号；101=专科号；102=专家号；103=特需号；104=专病号；999 =其他。',
  `REQ_SEQUENCE` decimal(4, 0) NULL DEFAULT NULL COMMENT '挂号顺序号',
  `TIME_PERIOD` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂号时段',
  `REGISTER_CHARGE` decimal(12, 4) NULL DEFAULT NULL COMMENT '挂号总费用',
  `REQ_STRATTIME` datetime(0) NULL DEFAULT NULL COMMENT '排班开始日期时间',
  `REQ_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '排班结束日期时间',
  `REQ_CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '排班时间',
  `REG_STATUS` decimal(65, 30) NULL DEFAULT NULL COMMENT '号源状态 出诊状态，0-停诊,1-正常未挂出,2-已挂出,',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_source_andschedule
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_source_andschedule_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_source_andschedule_records`;
CREATE TABLE `cdr_source_andschedule_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CREATE_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUBSPECIALTY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SCHEDULE_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_FLAG` decimal(65, 30) NULL DEFAULT NULL,
  `DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TECHNICAL_TITLE_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SHIFT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQ_TYPE` decimal(3, 0) NULL DEFAULT NULL,
  `REQ_SEQUENCE` decimal(4, 0) NULL DEFAULT NULL,
  `TIME_PERIOD` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REGISTER_CHARGE` decimal(12, 4) NULL DEFAULT NULL,
  `REQ_STRATTIME` datetime(0) NULL DEFAULT NULL,
  `REQ_ENDTIME` datetime(0) NULL DEFAULT NULL,
  `REQ_CREATTIME` datetime(0) NULL DEFAULT NULL,
  `REG_STATUS` decimal(65, 30) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_source_andschedule_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_surgery_his
-- ----------------------------
DROP TABLE IF EXISTS `cdr_surgery_his`;
CREATE TABLE `cdr_surgery_his`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域id',
  `UNICODE` decimal(18, 0) NOT NULL COMMENT '数据主键',
  `PATIENT_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人id',
  `VISIT_TIMES` decimal(5, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `OPERATION_DATE` datetime(0) NULL DEFAULT NULL COMMENT '手术日期',
  `START_TIME` datetime(0) NULL DEFAULT NULL COMMENT '手术开始时间',
  `END_TIME` datetime(0) NULL DEFAULT NULL COMMENT '手术结束时间',
  `SURGERY_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已行手术名称',
  `OPERATION_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术操作id',
  `TREATMENT_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊疗项目id',
  `OPERATOR_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主刀医师',
  `FIRST_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第一助手',
  `SECEND_ASSISTANT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第二助手',
  `NURSE_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术护士',
  `ANESTHE_BEGDATE` datetime(0) NULL DEFAULT NULL COMMENT '麻醉开始时间',
  `ANESTHE_ENDDATE` datetime(0) NULL DEFAULT NULL COMMENT '麻醉结束时间',
  `ANESTHESIA_METHOD` decimal(18, 0) NULL DEFAULT NULL COMMENT '麻醉方式',
  `ANESTHESIA_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉类型',
  `ANESTHESIA_QUALITY` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉质量',
  `INFLUSION_AMOUNT` decimal(5, 0) NULL DEFAULT NULL COMMENT '输液总量',
  `ANESTHESIA_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '麻醉医师',
  `OXYGEN_STARTTIME` datetime(0) NULL DEFAULT NULL COMMENT '输氧开始时间',
  `OXYGEN_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '输氧结束时间',
  `INCISION_LEVEL` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切口类别 1 0类切口,2 Ⅰ类切口,3 Ⅱ类切口,4 Ⅲ类切口',
  `INCISION_HEAL_LEVEL` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '愈合等级',
  `RECORD_DATE` datetime(0) NULL DEFAULT NULL COMMENT '记录日期',
  `CREATOR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录人',
  `CANCEL_TIME` datetime(0) NULL DEFAULT NULL COMMENT '取消时间',
  `CANCEL_OPERATOR` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取消人',
  `OPERATION_CONDITION` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手术情况',
  `ASA` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ASA分级',
  `IS_AGAIN` decimal(1, 0) NULL DEFAULT NULL COMMENT '再次手术标志',
  `INCISION_LEVEL_CODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '切口',
  `OPERATION_LEVEL` decimal(2, 0) NULL DEFAULT NULL COMMENT '手术级别',
  `READY_DAYS` decimal(3, 0) NULL DEFAULT NULL COMMENT '准备天数',
  `BACTERIAL_TIME` datetime(0) NULL DEFAULT NULL COMMENT '抗菌用药时间',
  `INCISION_SITE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '切口部位',
  `BACKAGAIN_PLAN` decimal(1, 0) NULL DEFAULT NULL COMMENT '重返计划',
  `BACKAGAIN_PURPOSE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重返目的',
  `INCISION_INFECT_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '切口感染标志0否1是',
  `IS_OPCOMPLICATE` decimal(1, 0) NULL DEFAULT NULL COMMENT '手术并发症标志0否1是',
  `PRE_BACTERIAL_MEDICINE` decimal(1, 0) NULL DEFAULT NULL COMMENT '术前抗菌用药标志0否1是',
  `BACTERIAL_DAYS` decimal(5, 0) NULL DEFAULT NULL COMMENT '抗菌用药天数标志0否1是',
  `SURPRISED_SURGERY` decimal(1, 0) NULL DEFAULT NULL COMMENT '非预期的二次手术标志0否1是',
  `ANESTHESIA_OPCOMPLICATE` decimal(1, 0) NULL DEFAULT NULL COMMENT '麻醉并发症标志0否1是',
  `RESERVED_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '术中异物遗留标志0否1是',
  `SURGERY_OPCOMPLICATE` decimal(1, 0) NULL DEFAULT NULL COMMENT '手术并发症标志0否1是',
  `PRO_BLOOD` decimal(1, 0) NULL DEFAULT NULL COMMENT '术后出血或血肿标志0否1是',
  `WOUND_DEHISCENCE` decimal(1, 0) NULL DEFAULT NULL COMMENT '手术伤口裂开标志0否1是',
  `VEIN_THROMBOSIS` decimal(1, 0) NULL DEFAULT NULL COMMENT '术后深静脉血栓标志0否1是',
  `METABOLIC_DISTURBANCE` decimal(1, 0) NULL DEFAULT NULL COMMENT '术后生理代谢紊乱标志0否1是',
  `RASPIRATORY` decimal(1, 0) NULL DEFAULT NULL COMMENT '术后呼吸衰竭标志0否1是',
  `PULMONARY_EMBOLISM` decimal(1, 0) NULL DEFAULT NULL COMMENT '术后肺栓塞标志0否1是',
  `HEMATOSEPSIS` decimal(1, 0) NULL DEFAULT NULL COMMENT '术后败血症标志0否1是',
  `FRACTURE` decimal(1, 0) NULL DEFAULT NULL COMMENT '术后髋关节骨折标志0否1是',
  `SORT_NO` decimal(2, 0) NULL DEFAULT NULL COMMENT '手术次序',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_surgery_his
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_tobase64_task_info
-- ----------------------------
DROP TABLE IF EXISTS `cdr_tobase64_task_info`;
CREATE TABLE `cdr_tobase64_task_info`  (
  `ID` decimal(65, 30) NOT NULL COMMENT '主键id',
  `EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `DATA_MAX_TIME` datetime(0) NULL DEFAULT NULL COMMENT '数据的最大时间',
  `BASE_INFO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'exam检验 ，check检查，bodyTest体检',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_tobase64_task_info
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_transferinfoquery
-- ----------------------------
DROP TABLE IF EXISTS `cdr_transferinfoquery`;
CREATE TABLE `cdr_transferinfoquery`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `TRANS_RECORDID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转科记录ID',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者id',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `TRANS_INDEX` decimal(3, 0) NULL DEFAULT NULL COMMENT '转科记录顺序号',
  `CHARGE_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生工号',
  `CHARGE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生',
  `RESPONS_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士工号',
  `RESPONS_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士',
  `TRANS_OUT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '转出时间',
  `ORIGDEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出科室编码',
  `ORIGDEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出科室',
  `ORIGWARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出病区编码',
  `ORIGWARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出病区',
  `ORIGROOM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出病房号',
  `ORIGBED_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出床号',
  `CURRENT_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生工号',
  `CURRENT_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生',
  `CURRENT_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士工号',
  `CURRENT_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士',
  `TRANS_IN_DATE` datetime(0) NULL DEFAULT NULL COMMENT '转入时间',
  `CURRENTDEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入科室编码',
  `CURRENTDEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入科室',
  `CURRENTWARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入病区编码',
  `CURRENTWARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入病区',
  `CURRENTROOMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入病房号',
  `CURRENTBED_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入床号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `TRANSFER_PURPOSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转科目的',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_transferinfoquery
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_transferinfoquery_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_transferinfoquery_records`;
CREATE TABLE `cdr_transferinfoquery_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRANS_RECORDID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANS_INDEX` decimal(3, 0) NULL DEFAULT NULL,
  `CHARGE_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESPONS_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESPONS_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANS_OUT_DATE` datetime(0) NULL DEFAULT NULL,
  `ORIGDEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORIGDEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORIGWARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORIGWARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORIGROOM_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORIGBED_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENT_DOCTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENT_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENT_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENT_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRANS_IN_DATE` datetime(0) NULL DEFAULT NULL,
  `CURRENTDEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENTDEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENTWARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENTWARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENTROOMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CURRENTBED_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `TRANSFER_PURPOSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_transferinfoquery_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_transferredrecord
-- ----------------------------
DROP TABLE IF EXISTS `cdr_transferredrecord`;
CREATE TABLE `cdr_transferredrecord`  (
  `GROUP_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一编码',
  `PATIENT_ID` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `VISITTIMES` decimal(4, 0) NOT NULL COMMENT '就诊次数 ',
  `VISIT_NO` varchar(219) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `CREATETIME` datetime(0) NULL DEFAULT NULL COMMENT '文档生成时间，如“20121024154823”',
  `SERIAL_NUMBER` varchar(144) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档流水号',
  `INPATIENT_NO` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '住院号',
  `ID_CARD` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者身份证号',
  `PATIENT_NAME` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码，生理性别代码表(GB/T 2261.1 )',
  `AGE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '年龄',
  `AGE_UNIT` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄单位（岁/月）',
  `RECORD_CREATEDATE` datetime(0) NULL DEFAULT NULL COMMENT '文档创建日期',
  `RECORD_PERSONID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文档创建医生编码',
  `RECORD_PERSON` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档创建医生',
  `ORGID_CUSTODIAL` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档保存机构编号',
  `ORG_CUSTODIAL` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文档保存机构名称',
  `TRANSFER_OUT_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '转出日期时间',
  `TRANSFER_OUT_DOCTOR` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转出医生编码',
  `TRANSFER_OUT_DOCTORID` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出医生姓名',
  `SHIFT_TO_DATETIME` datetime(0) NULL DEFAULT NULL COMMENT '转入日期时间',
  `SHIFT_TO_DOCTORID` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转入医生编码',
  `SHIFT_TO_DOCTOR` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入医生姓名',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期时间，数字格式，“20210618112105”',
  `BED_NO` decimal(8, 0) NULL DEFAULT NULL COMMENT '病床号',
  `ROOM_NO` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `DEPARTMENT` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `DEPARTMENTID` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室编码',
  `WARD_CODE` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区编码',
  `WARD_NAME` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区名称',
  `HOSPITAL_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构代码',
  `HOSPITAL_NAME` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗医疗机构名称',
  `ILLNESS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主诉',
  `ADMISSION_HOSPITAL_STATE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院情况',
  `ADMISSION_DIAGNOSIS_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断编码',
  `ADMISSION_DIAGNOSIS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院诊断名称',
  `ADMIDIAG_TCM_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医病名代码,中医病证分类与代码表( GB/T 15657)',
  `ADMIDIAG_TCM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医病名',
  `ADMIDIAG_TCM_SYNDROMENAME` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医证候名称',
  `ADMIDIAG_TCM_SYNDROMECODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断-中医证候代码，中医病证分类与代码表( GB/T 15657)',
  `CURRENT_SITUATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '目前情况',
  `CURRDIAG_WM` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '目前诊断-西医诊断名称',
  `CURRDIAG_WM_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目前诊断-西医诊断编码，诊断代码表ICD-10',
  `CURRDIAG_TCM_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目前诊断-中医病名代码,中医病证分类与代码表( GB/T 15657)',
  `CURRDIAG_TCM` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目前诊断-中医病名',
  `CURRDIAG_TCM_SYNDROMENAME` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目前诊断-中医证候名称',
  `CURRDIAG_TCM_SYNDROMECODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目前诊断-中医证候代码，中医病证分类与代码表( GB/T 15657)',
  `TCM_OBSERVATIONS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医“四诊”观察结果',
  `SHIFT_TREATMENT_PLAN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转入诊疗计划',
  `THERAPEUTIC_PRINCIPLEANDMETHOD` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '治则治法',
  `NOTICES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注意事项',
  `TRANSFER_OUT_RECORDCODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出记录代码, 转科记录类型代码表',
  `TRANSFER_OUT_RECORD` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出记录名称',
  `TRANSFER_OUT_DEPARTMENTID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出科室编码',
  `TRANSFER_OUT_DEPARTMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转出科室名称',
  `TRANSFER_OUT_AREA_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出病区代码',
  `TRANSFER_OUT_AREA` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转出病区名称',
  `SHIFT_TO_DEPARTMENTID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入科室编码',
  `SHIFT_TO_DEPARTMENT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转入科室名称',
  `SHIFT_TO_AREA_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入病区代码',
  `SHIFT_TO_AREA` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转入病区名称',
  `TRANSFER_PURPOSE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '转科目的',
  `TCM_DECOCTING_WAYS` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药煎煮方法',
  `TCM_MEDICATION` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药用药方法',
  `TREATMENT_PROCESS_DESCRIPTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '诊疗过程描述',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_transferredrecord
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_type_count
-- ----------------------------
DROP TABLE IF EXISTS `cdr_type_count`;
CREATE TABLE `cdr_type_count`  (
  `TYPE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `NUM` decimal(65, 30) NULL DEFAULT NULL COMMENT '数量',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_type_count
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_view_query_log
-- ----------------------------
DROP TABLE IF EXISTS `cdr_view_query_log`;
CREATE TABLE `cdr_view_query_log`  (
  `USER_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `QUERY_TIME` datetime(0) NOT NULL COMMENT '查询时间',
  `QUERY_COUNT` decimal(65, 30) NOT NULL COMMENT '查询次数',
  `QUERY_CONDITION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '查询条件',
  `PATIENT_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '患者姓名',
  `PATIENT_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者ID',
  `ID` decimal(65, 30) NOT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '历史查询表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_view_query_log
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_admission_cz
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_admission_cz`;
CREATE TABLE `cdr_zy_admission_cz`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(66) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人ID',
  `IDNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `PAT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `PAT_SEX` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `PAT_BRSDATE` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `MARI_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `PAT_HOME_ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `PAT_HOME_PHNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家庭电话',
  `CONTACTS_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `CONTACTS_RELATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人关系',
  `CONTACTS_ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系地址',
  `CONTACTS_PHNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `PAT_CONTACT_IDNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人身份证号',
  `GRDN_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '监护人姓名',
  `OCPT_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业',
  `EDU_LEVEL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学历',
  `NATION` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `NTVPLC` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '籍贯',
  `PAT_BADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出生地',
  `COUNTRY_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍',
  `EMP_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `PAT_EMP_PHNO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位电话',
  `PAT_HOUS_ADDR` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '户口地址',
  `PHNO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `REGION` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域',
  `PAT_CARD_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡类别ID',
  `PAT_CARD_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `PAT_CARD_PSWD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `APPOINT_SIGN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约标志',
  `PAT_NATURE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人性质',
  `INP_SOURCE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院方式',
  `ADTA_TIME` datetime(0) NULL DEFAULT NULL COMMENT '入院时间',
  `INP_RESON` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院目的',
  `DEPT_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院科室ID',
  `INP_WARD_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病区ID',
  `BED_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床号',
  `PAY_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗付款方式',
  `DSCPLAN_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费别',
  `OPRTR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员姓名',
  `INP_NATURE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院属性',
  `INP_CONDITION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '入院病况',
  `PAT_TYPE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人类型',
  `EMR_URL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病历链接',
  `CREATIONTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_admission_cz
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_admission_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_admission_detail`;
CREATE TABLE `cdr_zy_admission_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `ADMISSION_RECORDS` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院记录ID',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `GENDERCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BIRTH_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `MARRIAGE_CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻编码',
  `NATION_CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族编码',
  `MOBILE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `RELATION_MOBILE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `RELATION_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `RELATION_SHIP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人关系代码',
  `LIVE_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '现住址',
  `LIVE_STREET` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细街道',
  `WORK_PLACE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `OCCUPATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业代码',
  `DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊医生编号',
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门诊医生',
  `ADMISSION_CONDITION` decimal(1, 0) NULL DEFAULT NULL COMMENT '入院情况 1：危；2：急；9：一般',
  `ADMISSION_WAY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院途径代码',
  `ADMISSION_REASON` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院原因代码',
  `ADMISSION_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院科室编码',
  `ADMISSION_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院科室',
  `ADMISSION_WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院病区编码',
  `ADMISSION_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院病区',
  `ADMISSION_SICKROOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `ADMISSION_BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院床位',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院时间',
  `IN_DEPARTMENT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入科时间',
  `ADMISSION_REGISTER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院登记员编号',
  `ADMISSION_REGISTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院登记员',
  `ADMISSION_REGISTER_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院登记时间',
  `DOCTOR_DIRECTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任(副主任)医生编号',
  `DOCTOR_DIRECTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任(副主任)医生',
  `CHARGE_DOCTOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医生编码',
  `CHARGE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医生',
  `REFER_PHYSICIANID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医生编码',
  `REFER_PHYSICIAN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医生',
  `RESPONS_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士编码',
  `RESPONS_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士',
  `ADMISSION_DIAGNOSIS_CODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断编码,ICD-10',
  `ADMISSION_DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院诊断',
  `STATUS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在院状态 1在院 2退院 ',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `OBSERVATION_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留观标志 0 住院；1留观'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_admission_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_admission_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_admission_detail_records`;
CREATE TABLE `cdr_zy_admission_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ADMISSION_RECORDS` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` decimal(1, 0) NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BIRTH_DATE` datetime(0) NULL DEFAULT NULL,
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MARRIAGE_CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NATION_CODE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MOBILE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATION_MOBILE` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATION_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RELATION_SHIP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIVE_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIVE_STREET` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WORK_PLACE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OCCUPATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_CONDITION` decimal(1, 0) NULL DEFAULT NULL,
  `ADMISSION_WAY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_REASON` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_SICKROOM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_BED_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL,
  `IN_DEPARTMENT_DATE` datetime(0) NULL DEFAULT NULL,
  `ADMISSION_REGISTER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_REGISTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_REGISTER_DATE` datetime(0) NULL DEFAULT NULL,
  `DOCTOR_DIRECTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_DIRECTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DOCTOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFER_PHYSICIANID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REFER_PHYSICIAN` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESPONS_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RESPONS_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_DIAGNOSIS_CODE` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ADMISSION_DIAGNOSIS` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STATUS_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `OBSERVATION_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_admission_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_advance_payment
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_advance_payment`;
CREATE TABLE `cdr_zy_advance_payment`  (
  `GROUP_CODE` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `HOSPITAL_ID` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构代码',
  `HOSPITAL_NAME` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗机构',
  `UNICODE` varchar(153) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '唯一键',
  `PATIENT_ID` decimal(18, 0) NULL DEFAULT NULL COMMENT '个人标识号',
  `VISITTIMES` decimal(18, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(243) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `INPATIENT_NO` decimal(18, 0) NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '患者姓名',
  `GENDERNAME` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别名称',
  `GENDERCODE` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别编码',
  `AGE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BIRTHTIME` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `ID_CARD` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `OCCUPATION` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业',
  `NATION` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族',
  `NATIONALITY` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍',
  `MARRIAGE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `MOBILE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `PAYMENT_MONEY` decimal(16, 5) NULL DEFAULT NULL COMMENT '支付金额',
  `CHARGE_STATUS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预交状态（1-正常收，2退款的负记录，3退款的正记录）',
  `TRANS_NO` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `RECEIPT_NO` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据号',
  `PAYMENT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款方式名称',
  `PAYMENT_CODE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款方式编码',
  `OPERATOR` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员姓名',
  `OPERATOR_CODE` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员编码',
  `CHARGE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '收款时间',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_advance_payment
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_charge_cz_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_charge_cz_detail`;
CREATE TABLE `cdr_zy_charge_cz_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `DETAIL_ITEMID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费明细ID',
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱明细ID',
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用结算ID',
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL COMMENT '费用发生时间',
  `CHARGE_REPORTTIME` datetime(0) NULL DEFAULT NULL COMMENT '费用上账时间',
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室',
  `DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生编号',
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `EXEC_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人员编号',
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人员',
  `CHARGE_ITEM_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项目类别代码',
  `CHARGE_TYPE_HOSPITAL` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用收入归类代码',
  `DETAIL_ITEMCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目代码 ',
  `DETAIL_ITEMNAME` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目名称',
  `DETAIL_ITEMUNIT` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目单位',
  `DETAIL_ITEMUNIT_PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目单价',
  `DETAIL_ITEM_QUANTITY` decimal(8, 3) NULL DEFAULT NULL COMMENT '明细项目数量',
  `DETAIL_ITEM_RECEIVABLE` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目应收金额',
  `DETAIL_ITEM_RECEIVED` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目实收金额',
  `CHARGE_EMPCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费员编码',
  `CHARGE_EMP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费员',
  `CHARGE_DEPTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费科室编码',
  `CHARGE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费科室',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志0：正常（选填默认）1：撤销',
  `DELETE_UNICODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被退费明细ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `CHARGE_CZ_TYPE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长照收费项目类别代码，0：伙食费\r\n1：长照险抵扣（长照护理险报销）\r\n2：照护费\r\n3：其他\r\n4：床位费\r\n5：营养费\r\n6：电费\r\n7水费\r\n'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_charge_cz_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_charge_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_charge_detail`;
CREATE TABLE `cdr_zy_charge_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `DETAIL_ITEMID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费明细ID',
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱明细ID',
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用结算ID',
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL COMMENT '费用发生时间',
  `CHARGE_REPORTTIME` datetime(0) NULL DEFAULT NULL COMMENT '费用上账时间',
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室',
  `DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生编码',
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `EXEC_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人编码',
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人',
  `CHARGE_ITEM_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项目类别代码',
  `CHARGE_TYPE_HOSPITAL` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用收入归类代码',
  `DETAIL_ITEMCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目代码',
  `DETAIL_ITEMNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '明细项目名称',
  `DETAIL_ITEMUNIT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目单位',
  `DETAIL_ITEMUNIT_PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目单价',
  `DETAIL_ITEM_QUANTITY` decimal(8, 3) NULL DEFAULT NULL COMMENT '明细项目数量',
  `DETAIL_ITEM_RECEIVABLE` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目应收金额',
  `DETAIL_ITEM_RECEIVED` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目实收金额',
  `CHARGE_EMPCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费员编码',
  `CHARGE_EMP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费员',
  `CHARGE_DEPTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费科室编码',
  `CHARGE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费科室',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态1未缴费2已缴费3退费',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志',
  `DELETE_UNICODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被退费明细ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_charge_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_charge_detail_backup
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_charge_detail_backup`;
CREATE TABLE `cdr_zy_charge_detail_backup`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_REPORTTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL,
  `DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_ITEM_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_TYPE_HOSPITAL` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DETAIL_ITEMUNIT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMUNIT_PRICE` decimal(12, 4) NULL DEFAULT NULL,
  `DETAIL_ITEM_QUANTITY` decimal(8, 3) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVABLE` decimal(12, 4) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVED` decimal(12, 4) NULL DEFAULT NULL,
  `CHARGE_EMPCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_EMP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DEPTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_charge_detail_backup
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_charge_detail_bak
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_charge_detail_bak`;
CREATE TABLE `cdr_zy_charge_detail_bak`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `DETAIL_ITEMID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费明细ID',
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱明细ID',
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用结算ID',
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL COMMENT '费用发生时间',
  `CHARGE_REPORTTIME` datetime(0) NULL DEFAULT NULL COMMENT '费用上账时间',
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室编码',
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单科室',
  `DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生编号',
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开单医生',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `EXEC_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人员编号',
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人员',
  `CHARGE_ITEM_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费项目类别代码',
  `CHARGE_TYPE_HOSPITAL` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用收入归类代码',
  `DETAIL_ITEMCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目代码',
  `DETAIL_ITEMNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '明细项目名称',
  `DETAIL_ITEMUNIT` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '明细项目单位',
  `DETAIL_ITEMUNIT_PRICE` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目单价',
  `DETAIL_ITEM_QUANTITY` decimal(8, 3) NULL DEFAULT NULL COMMENT '明细项目数量',
  `DETAIL_ITEM_RECEIVABLE` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目应收金额',
  `DETAIL_ITEM_RECEIVED` decimal(12, 4) NULL DEFAULT NULL COMMENT '明细项目实收金额',
  `CHARGE_EMPCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费员编码',
  `CHARGE_EMP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费员',
  `CHARGE_DEPTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费科室编码',
  `CHARGE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收/退费科室',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '收费状态 1未缴费2已缴费3退费',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志0：正常（选填默认）1：撤销',
  `DELETE_UNICODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被退费明细ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_charge_detail_bak
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_charge_detail_re90
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_charge_detail_re90`;
CREATE TABLE `cdr_zy_charge_detail_re90`  (
  `GROUP_CODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` decimal(18, 0) NOT NULL,
  `VISIT_NO` decimal(65, 30) NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(5, 0) NOT NULL,
  `PATIENT_ID` decimal(18, 0) NOT NULL,
  `PATIENT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AGE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` decimal(65, 30) NULL DEFAULT NULL,
  `DETAIL_ITEMID` decimal(18, 0) NOT NULL,
  `ORDER_DETAILID` decimal(18, 0) NULL DEFAULT NULL,
  `CHARGE_SETTLEID` decimal(18, 0) NULL DEFAULT NULL,
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_REPORTTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL,
  `DEPT_CODE` decimal(18, 0) NULL DEFAULT NULL,
  `DEPT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOCTOR_CODE` decimal(65, 30) NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(123) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` decimal(18, 0) NULL DEFAULT NULL,
  `EXEC_DEPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXEC_DOCTOR_CODE` decimal(65, 30) NULL DEFAULT NULL,
  `EXEC_DOCTOR` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_ITEM_TYPE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_TYPE_HOSPITAL` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMCODE` decimal(18, 0) NOT NULL,
  `DETAIL_ITEMNAME` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMUNIT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMUNIT_PRICE` decimal(16, 5) NULL DEFAULT NULL,
  `DETAIL_ITEM_QUANTITY` decimal(65, 30) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVABLE` decimal(20, 5) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVED` decimal(20, 5) NULL DEFAULT NULL,
  `CHARGE_EMPCODE` decimal(65, 30) NULL DEFAULT NULL,
  `CHARGE_EMP` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DEPTCODE` decimal(65, 30) NULL DEFAULT NULL,
  `CHARGE_DEPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CHARGE_STATUS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_UNICODE` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_charge_detail_re90
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_charge_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_charge_detail_records`;
CREATE TABLE `cdr_zy_charge_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_SETTLEID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_REPORTTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL,
  `DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPT_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_ITEM_TYPE` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_TYPE_HOSPITAL` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DETAIL_ITEMUNIT` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMUNIT_PRICE` decimal(12, 4) NULL DEFAULT NULL,
  `DETAIL_ITEM_QUANTITY` decimal(8, 3) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVABLE` decimal(12, 4) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVED` decimal(12, 4) NULL DEFAULT NULL,
  `CHARGE_EMPCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_EMP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DEPTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_charge_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_charge_detail_se90
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_charge_detail_se90`;
CREATE TABLE `cdr_zy_charge_detail_se90`  (
  `GROUP_CODE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` decimal(18, 0) NOT NULL,
  `VISIT_NO` decimal(65, 30) NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(5, 0) NOT NULL,
  `PATIENT_ID` decimal(18, 0) NOT NULL,
  `PATIENT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AGE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` decimal(65, 30) NULL DEFAULT NULL,
  `DETAIL_ITEMID` decimal(18, 0) NOT NULL,
  `ORDER_DETAILID` decimal(18, 0) NULL DEFAULT NULL,
  `CHARGE_SETTLEID` decimal(18, 0) NOT NULL,
  `CHARGE_HAPPENTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_REPORTTIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_SETTLETIME` datetime(0) NULL DEFAULT NULL,
  `DEPT_CODE` decimal(18, 0) NULL DEFAULT NULL,
  `DEPT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DOCTOR_CODE` decimal(65, 30) NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(123) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` decimal(18, 0) NULL DEFAULT NULL,
  `EXEC_DEPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXEC_DOCTOR_CODE` decimal(65, 30) NULL DEFAULT NULL,
  `EXEC_DOCTOR` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_ITEM_TYPE` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_TYPE_HOSPITAL` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMCODE` decimal(18, 0) NOT NULL,
  `DETAIL_ITEMNAME` varchar(240) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMUNIT` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DETAIL_ITEMUNIT_PRICE` decimal(16, 5) NULL DEFAULT NULL,
  `DETAIL_ITEM_QUANTITY` decimal(65, 30) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVABLE` decimal(20, 5) NULL DEFAULT NULL,
  `DETAIL_ITEM_RECEIVED` decimal(20, 5) NULL DEFAULT NULL,
  `CHARGE_EMPCODE` decimal(65, 30) NULL DEFAULT NULL,
  `CHARGE_EMP` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_DEPTCODE` decimal(65, 30) NULL DEFAULT NULL,
  `CHARGE_DEPT` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `CHARGE_STATUS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_UNICODE` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_charge_detail_se90
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_charge_unicode
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_charge_unicode`;
CREATE TABLE `cdr_zy_charge_unicode`  (
  `ID` decimal(18, 0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_charge_unicode
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_cur_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_cur_detail`;
CREATE TABLE `cdr_zy_cur_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `INPATIENT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号标识',
  `VISIT_TIMES` decimal(10, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `GENDER` decimal(1, 0) NULL DEFAULT NULL COMMENT '性别编码',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `SICKROOM_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病房编号',
  `BED_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病床号',
  `MOBILE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `RELATION_MOBILE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `RELATION_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `RELATION_SHIP` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人关系',
  `LIVE_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住地址',
  `LIVE_STREET` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '居住街道',
  `WORK_PLACE` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作单位',
  `JOB_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业类别代码 ',
  `JOB_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业类别描述',
  `BIRTHTIME` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `NATIONALITY_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍编码',
  `NATIONALITY_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍名称',
  `NATION_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族编码',
  `NATION_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '民族名称',
  `MARRY_STATUS` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况代码',
  `MARRY_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '婚姻状况名称',
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `CUR_DEPTCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院科室编码',
  `CUR_DEPTNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院科室名称',
  `CUR_WARDCODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院病区编码',
  `CUR_WARDNAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '入院病区名称',
  `IN_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入院日期',
  `IN_DEPARTMENT_DATE` datetime(0) NULL DEFAULT NULL COMMENT '入科时间',
  `OBSERVATION_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留观标志',
  `RESIDENT_DOCTOR_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师编号',
  `RESIDENT_DOCTOR_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院医师姓名',
  `DOCTOR_DIRECTORID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任(副主任)医师编号',
  `DOCTOR_DIRECTOR` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任(副主任)医师姓名',
  `CHARGE_DOCTOR_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师编码',
  `CHARGE_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主治医师名称',
  `RESPONS_NURSE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士编码',
  `RESPONS_NURSE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任护士名称',
  `NURSING_LEVEL` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '护理等级',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '删除标志'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_cur_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_diagnose_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_diagnose_detail`;
CREATE TABLE `cdr_zy_diagnose_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `DIAGNOSED_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断记录ID',
  `DIAGNOSED_METHOD` decimal(1, 0) NULL DEFAULT NULL COMMENT '诊断方法代码 01：西医；02：中医',
  `DIAGNOSED_PRIMARY_SECONDARY` decimal(2, 0) NULL DEFAULT NULL COMMENT '诊断主次代码 01：主要诊断；02：次要诊断',
  `SORT_NO` decimal(2, 0) NULL DEFAULT NULL COMMENT '诊断顺序',
  `DIAGNOSIS_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断代码',
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断名称',
  `SUSPECTEDDIAGNOSIS` decimal(2, 0) NULL DEFAULT NULL COMMENT '是否疑诊 01：疑诊；02：非疑诊',
  `DIAG_CLASS_CODE` decimal(4, 0) NULL DEFAULT NULL COMMENT '诊断分类代码 1：出院诊断2：门诊诊断3：入院诊断4：术前诊断5：术后诊断6：尸检诊断7：放射诊断8：超声诊断9：病理诊断10：并发症诊断99：其他',
  `DIAGNOSED_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断类型代码 1：初步诊断2：修正诊断3：确诊诊断',
  `DIAGNOSIS_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断医生编码',
  `DIAGNOSIS_DOC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊断医生',
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL COMMENT '诊断录入时间',
  `REVOKE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '撤销时间',
  `LAST_EDIT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后编辑时间',
  `LAST_EDIT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后编辑人编码',
  `LAST_EDITOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后编辑人',
  `TCM_PATTERN_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医病证区别代码 01：病；02：证；诊断方法代码为02 时填写 ',
  `TCM_PATTERN_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中医证候名',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_diagnose_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_diagnose_detail_20240531
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_diagnose_detail_20240531`;
CREATE TABLE `cdr_zy_diagnose_detail_20240531`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIAGNOSED_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSED_METHOD` decimal(1, 0) NULL DEFAULT NULL,
  `DIAGNOSED_PRIMARY_SECONDARY` decimal(2, 0) NULL DEFAULT NULL,
  `SORT_NO` decimal(2, 0) NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUSPECTEDDIAGNOSIS` decimal(2, 0) NULL DEFAULT NULL,
  `DIAG_CLASS_CODE` decimal(4, 0) NULL DEFAULT NULL,
  `DIAGNOSED_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_DOC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `REVOKE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_EDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_EDIT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_EDITOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_PATTERN_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_PATTERN_NAME` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_diagnose_detail_20240531
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_diagnose_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_diagnose_detail_records`;
CREATE TABLE `cdr_zy_diagnose_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DIAGNOSED_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSED_METHOD` decimal(1, 0) NULL DEFAULT NULL,
  `DIAGNOSED_PRIMARY_SECONDARY` decimal(2, 0) NULL DEFAULT NULL,
  `SORT_NO` decimal(2, 0) NULL DEFAULT NULL,
  `DIAGNOSIS_CODE` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SUSPECTEDDIAGNOSIS` decimal(2, 0) NULL DEFAULT NULL,
  `DIAG_CLASS_CODE` decimal(4, 0) NULL DEFAULT NULL,
  `DIAGNOSED_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_DOC_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DIAGNOSIS_DOC` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECORD_TIME` datetime(0) NULL DEFAULT NULL,
  `REVOKE_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_EDIT_TIME` datetime(0) NULL DEFAULT NULL,
  `LAST_EDIT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_EDITOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_PATTERN_CODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_PATTERN_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_diagnose_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_dischargereg
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_dischargereg`;
CREATE TABLE `cdr_zy_dischargereg`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `DISCHARGE_RECORDS` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院记录ID',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `GENDERNAME` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别代码',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `BIRTHTIME` datetime(0) NULL DEFAULT NULL COMMENT '出生日期',
  `OUT_DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院科室编码',
  `OUT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院科室',
  `OUT_WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院病区编码',
  `OUT_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院病区',
  `BED_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位号',
  `DOCTOR_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生编号',
  `OUT_REGISTER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院登记人编码',
  `OUT_REGISTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出院登记人',
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出院时间',
  `INSURANCE_TYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗费用类型代码',
  `NONLOCAL_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '外地标志 1：本市；2：外地；3：境外（港澳台）；4：外国；5：未知',
  `SPECIAL_FLAG` decimal(3, 0) NULL DEFAULT NULL COMMENT '特需标志 0非特需，1特需',
  `OUTCOME_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病情转归代码',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：出院（选填默认）1：出院召回',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任医生名称',
  `OBSERVATION_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '留观标志 0 住院；1留观'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_dischargereg
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_dischargereg_20240109
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_dischargereg_20240109`;
CREATE TABLE `cdr_zy_dischargereg_20240109`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DISCHARGE_RECORDS` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERNAME` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BIRTHTIME` datetime(0) NULL DEFAULT NULL,
  `OUT_DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_REGISTER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_REGISTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL,
  `INSURANCE_TYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NONLOCAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `SPECIAL_FLAG` decimal(3, 0) NULL DEFAULT NULL,
  `OUTCOME_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBSERVATION_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_dischargereg_20240109
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_dischargereg_backup
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_dischargereg_backup`;
CREATE TABLE `cdr_zy_dischargereg_backup`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DISCHARGE_RECORDS` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERNAME` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BIRTHTIME` datetime(0) NULL DEFAULT NULL,
  `OUT_DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_REGISTER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_REGISTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL,
  `INSURANCE_TYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NONLOCAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `SPECIAL_FLAG` decimal(3, 0) NULL DEFAULT NULL,
  `OUTCOME_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBSERVATION_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_dischargereg_backup
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_dischargereg_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_dischargereg_records`;
CREATE TABLE `cdr_zy_dischargereg_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DISCHARGE_RECORDS` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ID_CARD` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERNAME` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `GENDERCODE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BIRTHTIME` datetime(0) NULL DEFAULT NULL,
  `OUT_DEPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTOR_CODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_REGISTER_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_REGISTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL,
  `INSURANCE_TYPE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NONLOCAL_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `SPECIAL_FLAG` decimal(3, 0) NULL DEFAULT NULL,
  `OUTCOME_CODE` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DOCTOR_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OBSERVATION_FLAG` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_dischargereg_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_drugorder
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_drugorder`;
CREATE TABLE `cdr_zy_drugorder`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人姓名',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `BED_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱明细ID',
  `ORDER_TIME_TYPECODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱时间类别代码 1长期、2临时，9其它，医嘱类别代码表',
  `ITEM_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊疗项目类别编码 1:西药 2:中成药 3:中药饮片',
  `EXEC_STATUSCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱状态编码 1、医生录入，2、医生已提交，3、护士已确认，4、执行中，5、已停止，9、已作废',
  `ORDER_ISSUEDATE` datetime(0) NULL DEFAULT NULL COMMENT '医嘱开立时间',
  `ORDER_ISSUERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立医生编码',
  `ORDER_ISSUER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立医生',
  `ORDER_ISSUEDEPARTMENTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立科室编码',
  `ORDER_ISSUEDEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立科室',
  `ORDER_CONTENT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱内容',
  `EXEC_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `ORDER_REVIEWERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱审核医生编码',
  `ORDER_REVIEWER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱审核医生',
  `ORDER_REVIEWDATE` datetime(0) NULL DEFAULT NULL COMMENT '医嘱审核时间',
  `ORDER_STARTTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱开始时间',
  `ORDER_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱停止时间',
  `ORDER_CONFIRM_NURSECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱确认护士编码',
  `ORDER_CONFIRM_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱确认护士',
  `ORDER_CONFIRM_TIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱确认时间',
  `ORDER_STOP_DOCTORCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停嘱医生编号',
  `ORDER_STOP_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停嘱医生',
  `ORDER_STOP_DOCTORTIME` datetime(0) NULL DEFAULT NULL COMMENT '医生停嘱时间',
  `ORDER_STOP_NURSECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认停嘱护士编号',
  `ORDER_STOP_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认停嘱护士',
  `ORDER_STOPTIME` datetime(0) NULL DEFAULT NULL COMMENT '护士确认停嘱时间',
  `ORDER_CANCELLERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱作废医生编码',
  `ORDER_CANCELLER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱作废医生',
  `ORDER_CANCELLERTIEM` datetime(0) NULL DEFAULT NULL COMMENT '医嘱作废时间',
  `ORDER_ILLUSTRATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱说明',
  `ORDER_SORTNO` decimal(8, 0) NULL DEFAULT NULL COMMENT '医嘱序号',
  `PARENT_ORDERNO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父医嘱ID',
  `ORDER_DETAILCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱项目代码',
  `ORDER_DETAILNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱项目名称',
  `DRUG_SPECIFICATION` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品规格',
  `DOSAGE_FORMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药物剂型代码',
  `DRUG_FLAG` decimal(3, 0) NULL DEFAULT NULL COMMENT '毒麻标志 0，非毒麻，1毒麻药品',
  `BATCHNO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '药品批次',
  `DRUG_INSTRUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱用法',
  `DRUG_FREQUENCY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱频率代码',
  `EVERY_DOSAGE` decimal(8, 3) NULL DEFAULT NULL COMMENT '每次使用剂量',
  `EVERY_DOSAGEUNIT` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '每次使用剂量单位',
  `EVERY_QUANTITY` decimal(8, 3) NULL DEFAULT NULL COMMENT '每次使用数量',
  `EVERY_QUANTITYUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '每次使用数量单位',
  `SPEED` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '滴速',
  `CHARACTER` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱费用性质类型 0,自备、1,嘱托、2外配、9常规',
  `CLINIC_PATH` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱临床路径标志 0径内，2径外',
  `DRUG_PURPOSE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用药目的',
  `SKIN_TEST_RESULTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试记录号',
  `TCM_DECOCTING_METHOD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药煎煮法',
  `NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `DAYS` decimal(65, 30) NULL DEFAULT NULL COMMENT '用药天数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_drugorder
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_drugorder_bf
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_drugorder_bf`;
CREATE TABLE `cdr_zy_drugorder_bf`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人姓名',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `BED_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱明细ID',
  `ORDER_TIME_TYPECODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱时间类别代码 1长期、2临时，9其它，医嘱类别代码表',
  `ITEM_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊疗项目类别编码 1:西药 2:中成药 3:中药饮片',
  `EXEC_STATUSCODE` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱状态编码 1、医生录入，2、医生已提交，3、护士已确认，4、执行中，5、已停止，9、已作废',
  `ORDER_ISSUEDATE` datetime(0) NULL DEFAULT NULL COMMENT '医嘱开立时间',
  `ORDER_ISSUERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立医生编码',
  `ORDER_ISSUER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立医生',
  `ORDER_ISSUEDEPARTMENTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立科室编码',
  `ORDER_ISSUEDEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立科室',
  `ORDER_CONTENT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱内容',
  `EXEC_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `ORDER_REVIEWERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱审核医生编码',
  `ORDER_REVIEWER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱审核医生',
  `ORDER_REVIEWDATE` datetime(0) NULL DEFAULT NULL COMMENT '医嘱审核时间',
  `ORDER_STARTTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱开始时间',
  `ORDER_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱停止时间',
  `ORDER_CONFIRM_NURSECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱确认护士编码',
  `ORDER_CONFIRM_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱确认护士',
  `ORDER_CONFIRM_TIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱确认时间',
  `ORDER_STOP_DOCTORCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停嘱医生编号',
  `ORDER_STOP_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停嘱医生',
  `ORDER_STOP_DOCTORTIME` datetime(0) NULL DEFAULT NULL COMMENT '医生停嘱时间',
  `ORDER_STOP_NURSECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认停嘱护士编号',
  `ORDER_STOP_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认停嘱护士',
  `ORDER_STOPTIME` datetime(0) NULL DEFAULT NULL COMMENT '护士确认停嘱时间',
  `ORDER_CANCELLERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱作废医生编码',
  `ORDER_CANCELLER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱作废医生',
  `ORDER_CANCELLERTIEM` datetime(0) NULL DEFAULT NULL COMMENT '医嘱作废时间',
  `ORDER_ILLUSTRATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱说明',
  `ORDER_SORTNO` decimal(8, 0) NULL DEFAULT NULL COMMENT '医嘱序号',
  `PARENT_ORDERNO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父医嘱ID',
  `ORDER_DETAILCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱项目代码',
  `ORDER_DETAILNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱项目名称',
  `DRUG_SPECIFICATION` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品规格',
  `DOSAGE_FORMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药物剂型代码',
  `DRUG_FLAG` decimal(3, 0) NULL DEFAULT NULL COMMENT '毒麻标志 0，非毒麻，1毒麻药品',
  `BATCHNO` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '药品批次',
  `DRUG_INSTRUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱用法',
  `DRUG_FREQUENCY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱频率代码',
  `EVERY_DOSAGE` decimal(8, 3) NULL DEFAULT NULL COMMENT '每次使用剂量',
  `EVERY_DOSAGEUNIT` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '每次使用剂量单位',
  `EVERY_QUANTITY` decimal(8, 3) NULL DEFAULT NULL COMMENT '每次使用数量',
  `EVERY_QUANTITYUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '每次使用数量单位',
  `SPEED` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '滴速',
  `CHARACTER` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱费用性质类型 0,自备、1,嘱托、2外配、9常规',
  `CLINIC_PATH` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱临床路径标志 0径内，2径外',
  `DRUG_PURPOSE` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用药目的',
  `SKIN_TEST_RESULTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '皮试记录号',
  `TCM_DECOCTING_METHOD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中药煎煮法',
  `NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `DAYS` decimal(65, 30) NULL DEFAULT NULL COMMENT '用药天数'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_drugorder_bf
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_drugorder_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_drugorder_records`;
CREATE TABLE `cdr_zy_drugorder_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_TIME_TYPECODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_STATUSCODE` decimal(1, 0) NULL DEFAULT NULL,
  `ORDER_ISSUEDATE` datetime(0) NULL DEFAULT NULL,
  `ORDER_ISSUERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ISSUER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ISSUEDEPARTMENTID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ISSUEDEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CONTENT` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_REVIEWERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_REVIEWER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_REVIEWDATE` datetime(0) NULL DEFAULT NULL,
  `ORDER_STARTTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_ENDTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_CONFIRM_NURSECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CONFIRM_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CONFIRM_TIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_STOP_DOCTORCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOP_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOP_DOCTORTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_STOP_NURSECODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOP_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOPTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_CANCELLERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CANCELLER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CANCELLERTIEM` datetime(0) NULL DEFAULT NULL,
  `ORDER_ILLUSTRATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ORDER_SORTNO` decimal(8, 0) NULL DEFAULT NULL,
  `PARENT_ORDERNO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DETAILCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DETAILNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DRUG_SPECIFICATION` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOSAGE_FORMCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DRUG_FLAG` decimal(3, 0) NULL DEFAULT NULL,
  `BATCHNO` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DRUG_INSTRUCTION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `DRUG_FREQUENCY_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EVERY_DOSAGE` decimal(8, 3) NULL DEFAULT NULL,
  `EVERY_DOSAGEUNIT` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EVERY_QUANTITY` decimal(8, 3) NULL DEFAULT NULL,
  `EVERY_QUANTITYUNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SPEED` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARACTER` decimal(1, 0) NULL DEFAULT NULL,
  `CLINIC_PATH` decimal(1, 0) NULL DEFAULT NULL,
  `DRUG_PURPOSE` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SKIN_TEST_RESULTNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TCM_DECOCTING_METHOD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NOTICES` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DAYS` decimal(65, 30) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_drugorder_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_medical_plan
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_medical_plan`;
CREATE TABLE `cdr_zy_medical_plan`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱ID',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `RECORD_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行记录ID',
  `PLAN_EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '计划执行时间',
  `REAL_EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '实际执行时间',
  `DRUG_EXEC` decimal(8, 3) NULL DEFAULT NULL COMMENT '用量',
  `QTY_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用量单位',
  `EXEC_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '执行状态 0未执行,1已执行,2已撤销,3已暂停，4执行中',
  `EXEC_OPERA_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人编码',
  `EXEC_OPERA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `EXEC_WARDCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行病区编码',
  `EXEC_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行病区',
  `P_BAR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '条形码',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `CHARGE_STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用状态 0执行单转计费 1执行销账'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_medical_plan
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_medical_plan_backup
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_medical_plan_backup`;
CREATE TABLE `cdr_zy_medical_plan_backup`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱ID',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `RECORD_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行记录ID',
  `PLAN_EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '计划执行时间',
  `REAL_EXEC_TIME` datetime(0) NULL DEFAULT NULL COMMENT '实际执行时间',
  `DRUG_EXEC` decimal(8, 3) NULL DEFAULT NULL COMMENT '用量',
  `QTY_UNIT` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用量单位',
  `EXEC_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '执行状态 0未执行,1已执行,2已撤销,3已暂停，4执行中',
  `EXEC_OPERA_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人编码',
  `EXEC_OPERA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行人',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `EXEC_WARDCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行病区编码',
  `EXEC_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行病区',
  `P_BAR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '条形码',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `CHARGE_STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '费用状态 0执行单转计费 1执行销账'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_medical_plan_backup
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_medical_plan_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_medical_plan_records`;
CREATE TABLE `cdr_zy_medical_plan_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RECORD_ID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PLAN_EXEC_TIME` datetime(0) NULL DEFAULT NULL,
  `REAL_EXEC_TIME` datetime(0) NULL DEFAULT NULL,
  `DRUG_EXEC` decimal(8, 3) NULL DEFAULT NULL,
  `QTY_UNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `EXEC_OPERA_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_OPERA` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_WARDCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `P_BAR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `CHARGE_STATUS` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_medical_plan_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_otherorder
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_otherorder`;
CREATE TABLE `cdr_zy_otherorder`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `BED_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '床位',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱明细ID',
  `ORDER_TIME_TYPECODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱时间类别代码 1长期、2临时，9其它',
  `ITEM_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '诊疗项目类别编码 04:卫生材料05:检验06:检查07:手术08:护理09:床位10:治疗11:麻醉12:输血13:输氧99:其他',
  `ORDER_CREATTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱开立时间',
  `ORDER_DOCTORCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立医生编码',
  `ORDER_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立医生',
  `ORDER_DEPTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立科室编码',
  `ORDER_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱开立科室',
  `ORDER_REVIEWERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱审核医生编码',
  `ORDER_REVIEWER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱审核医生',
  `ORDER_REVIEWDATE` datetime(0) NULL DEFAULT NULL COMMENT '医嘱审核时间',
  `ORDER_STARTTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱开始时间',
  `ORDER_ENDTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱停止时间',
  `ORDER_CONFIRM_NURSECODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱确认护士编号',
  `ORDER_CONFIRM_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱确认护士',
  `ORDER_CONFIRMTIME` datetime(0) NULL DEFAULT NULL COMMENT '医嘱确认时间',
  `ORDER_STOP_DOCTORCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停嘱医生编号',
  `ORDER_STOP_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '停嘱医生',
  `ORDER_STOP_DOCTORTIME` datetime(0) NULL DEFAULT NULL COMMENT '医生停嘱时间',
  `ORDER_STOP_NURSECODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认停嘱护士编号',
  `ORDER_STOP_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认停嘱护士',
  `ORDER_STOPTIME` datetime(0) NULL DEFAULT NULL COMMENT '护士确认停嘱时间',
  `ORDER_CANCELLERID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱作废医生编码',
  `ORDER_CANCELLER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱作废医生',
  `DOCTORADVICE_CANCELLERTIEM` datetime(0) NULL DEFAULT NULL COMMENT '医嘱作废时间',
  `EXEC_STATUSCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱状态编码 1、医生录入，2、医生已提交，3、护士已确认，4、执行中，5、已停止，9、已作废',
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室编码',
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行科室',
  `ORDER_ILLUSTRATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱说明',
  `ORDER_DETAILCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医嘱项目代码',
  `ORDER_DETAILNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '医嘱项目名称',
  `EXECUTION_FREQUENCY` varchar(72) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行频率代码',
  `CHARACTER` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱费用性质类型 0,自备、1,嘱托、2外配',
  `CLINIC_PATH` decimal(1, 0) NULL DEFAULT NULL COMMENT '医嘱临床路径标志 0径内，2径外',
  `NOTICES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `BATCHNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卫材批次',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常1：撤销',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `DAYS` decimal(65, 30) NULL DEFAULT NULL COMMENT '用药天数',
  `EVERY_QUANTITY` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '每次使用数量',
  `EVERY_QUANTITYUNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '每次使用数量单位',
  `ORDER_COMMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行时间方案'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_otherorder
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_otherorder_bf
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_otherorder_bf`;
CREATE TABLE `cdr_zy_otherorder_bf`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BED_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ORDER_DETAILID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_TIME_TYPECODE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ITEM_TYPE` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CREATTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_DOCTORCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DEPTCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_REVIEWERID` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_REVIEWER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_REVIEWDATE` datetime(0) NULL DEFAULT NULL,
  `ORDER_STARTTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_ENDTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_CONFIRM_NURSECODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CONFIRM_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CONFIRMTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_STOP_DOCTORCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOP_DOCTOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOP_DOCTORTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_STOP_NURSECODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOP_NURSE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_STOPTIME` datetime(0) NULL DEFAULT NULL,
  `ORDER_CANCELLERID` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_CANCELLER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOCTORADVICE_CANCELLERTIEM` datetime(0) NULL DEFAULT NULL,
  `EXEC_STATUSCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EXEC_DEPT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_ILLUSTRATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ORDER_DETAILCODE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORDER_DETAILNAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `EXECUTION_FREQUENCY` varchar(72) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARACTER` decimal(1, 0) NULL DEFAULT NULL,
  `CLINIC_PATH` decimal(1, 0) NULL DEFAULT NULL,
  `NOTICES` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `BATCHNO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `DAYS` decimal(65, 30) NULL DEFAULT NULL,
  `EVERY_QUANTITY` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EVERY_QUANTITYUNIT` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_otherorder_bf
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_padvancepayment_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_padvancepayment_detail`;
CREATE TABLE `cdr_zy_padvancepayment_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `PATIENT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室编码',
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在科室',
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区编码',
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '病人所在病区',
  `PAYMENT_MONEY` decimal(12, 4) NULL DEFAULT NULL COMMENT '预交金额',
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '预交状态 1、收款，2、退款，3、冲账',
  `TRANS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `RECEIPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单据号',
  `PAYMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款方式编码 01：现金02：支票03：汇款存款04：内部转账05：单位记账06：账户金07：统筹金08：银行卡09：微信10：支付宝11：银联99：其他',
  `OPERATOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费员编码',
  `OPERATOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收费员',
  `CHARGE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '收款时间',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被退预交金记录ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_padvancepayment_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_padvancepayment_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_padvancepayment_detail_records`;
CREATE TABLE `cdr_zy_padvancepayment_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DEPARTMENT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `WARD` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_MONEY` decimal(12, 4) NULL DEFAULT NULL,
  `CHARGE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `TRANS_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIPT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATOR_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OPERATOR` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CHARGE_TIME` datetime(0) NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_padvancepayment_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_payment_detail`;
CREATE TABLE `cdr_zy_payment_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `SETTLE_RECORDID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算记录ID',
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '记录收费状态',
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `PAYMENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式记录ID',
  `PAYMENT_WAY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式代码 01：现金02：支票03：汇款存款04：内部转账05：单位记账06：账户金07：统筹金08：银行卡09：微信10：支付宝11：银联99：其他',
  `PAYMENT_MONEY` decimal(12, 4) NULL DEFAULT NULL COMMENT '支付金额',
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `SETTLEMENT_CLERKCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员编号',
  `SETTLEMENT_CLERK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员',
  `PAYMENT_SERIALNO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付流水号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：取消结算',
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应被取消结算的支付记录ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间',
  `PAYMENT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式名称'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_payment_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_payment_detail_bak
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_payment_detail_bak`;
CREATE TABLE `cdr_zy_payment_detail_bak`  (
  `GROUP_CODE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(81) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(5, 0) NOT NULL,
  `PATIENT_ID` decimal(18, 0) NULL DEFAULT NULL,
  `PATIENT_NAME` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `AGE` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_RECORDID` decimal(18, 0) NOT NULL,
  `SETTLE_STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LIST_UNICODE` decimal(18, 0) NOT NULL,
  `PAYMENT_ID` decimal(18, 0) NOT NULL,
  `PAYMENT_WAY` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_MONEY` decimal(65, 30) NULL DEFAULT NULL,
  `SETTLE_TIME` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLEMENT_CLERKCODE` decimal(65, 30) NULL DEFAULT NULL,
  `SETTLEMENT_CLERK` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_SERIALNO` decimal(18, 0) NOT NULL,
  `DELETE_FLAG` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_payment_detail_bak
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_payment_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_payment_detail_records`;
CREATE TABLE `cdr_zy_payment_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_RECORDID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `LIST_UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `PAYMENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_WAY` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_MONEY` decimal(12, 4) NULL DEFAULT NULL,
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL,
  `SETTLEMENT_CLERKCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLEMENT_CLERK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PAYMENT_SERIALNO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL,
  `PAYMENT_NAME` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_payment_detail_records
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_settle_cz_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_settle_cz_detail`;
CREATE TABLE `cdr_zy_settle_cz_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出院时间',
  `SETTLE_RECORDID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算记录ID',
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '记录收费状态',
  `SETTLE_RECEIPTNO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算发票号',
  `SETTLE_SCENE` decimal(1, 0) NULL DEFAULT NULL COMMENT '结算场景代码',
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `MEDICAL_PAYMENT_METHOD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗付费方式代码',
  `SETTLE_TOTAL_MONEY` decimal(12, 4) NULL DEFAULT NULL COMMENT '费用结算总金额',
  `PERSONAL_EXPENSES` decimal(10, 2) NULL DEFAULT NULL COMMENT '个人承担费用金额',
  `SETTLEMENT_CLERKCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员编号',
  `SETTLEMENT_CLERK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员',
  `RECEIPT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '开票时间',
  `PRINT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开票人编码',
  `PRINTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开票人',
  `ELECTRONIC_INVOICE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子发票代码',
  `INSURANCE_PERSONAL_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保个人编码',
  `INSURANCE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保就诊编码',
  `YBTCQBM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保统筹区编码',
  `TRADE_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保交易流水号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志',
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应被取消结算ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_settle_cz_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_settle_detail
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_settle_detail`;
CREATE TABLE `cdr_zy_settle_detail`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集团编码',
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织编码',
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统域标识',
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据记录主键，作为数据记录唯一行',
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院就诊流水号',
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '住院号',
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL COMMENT '就诊次数',
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人标识号',
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '患者姓名',
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年龄',
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL COMMENT '出院时间',
  `SETTLE_RECORDID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算记录ID',
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL COMMENT '记录收费状态 1：收费；2：退费',
  `SETTLE_RECEIPTNO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算发票号',
  `SETTLE_SCENE` decimal(1, 0) NULL DEFAULT NULL COMMENT '结算场景代码 1：住院中途结算；2：住院出院结算',
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '费用结算时间',
  `MEDICAL_PAYMENT_METHOD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医疗付费方式代码',
  `SETTLE_TOTAL_MONEY` decimal(12, 4) NULL DEFAULT NULL COMMENT '费用结算总金额',
  `PERSONAL_EXPENSES` decimal(10, 2) NULL DEFAULT NULL COMMENT '个人承担费用金额',
  `SETTLEMENT_CLERKCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员编号',
  `SETTLEMENT_CLERK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算人员',
  `RECEIPT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '开票时间',
  `PRINT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开票人编码',
  `PRINTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开票人',
  `ELECTRONIC_INVOICE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子发票代码',
  `INSURANCE_PERSONAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保个人编码',
  `INSURANCE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保就诊编码',
  `YBTCQBM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保统筹区编码',
  `TRADE_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医保交易流水号',
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL COMMENT '修改标志 0：正常（选填默认）1：撤销',
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对应被取消结算ID',
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_settle_detail
-- ----------------------------

-- ----------------------------
-- Table structure for cdr_zy_settle_detail_records
-- ----------------------------
DROP TABLE IF EXISTS `cdr_zy_settle_detail_records`;
CREATE TABLE `cdr_zy_settle_detail_records`  (
  `GROUP_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ORGANIZATION_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DOMAIN_ID` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UNICODE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `VISIT_NO` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INPATIENT_NO` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `VISIT_TIMES` decimal(3, 0) NULL DEFAULT NULL,
  `PATIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PATIENT_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AGE` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `OUT_HOSPITAL_DATE` datetime(0) NULL DEFAULT NULL,
  `SETTLE_RECORDID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_STATUS` decimal(1, 0) NULL DEFAULT NULL,
  `SETTLE_RECEIPTNO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_SCENE` decimal(1, 0) NULL DEFAULT NULL,
  `SETTLE_TIME` datetime(0) NULL DEFAULT NULL,
  `MEDICAL_PAYMENT_METHOD` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLE_TOTAL_MONEY` decimal(12, 4) NULL DEFAULT NULL,
  `PERSONAL_EXPENSES` decimal(10, 2) NULL DEFAULT NULL,
  `SETTLEMENT_CLERKCODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `SETTLEMENT_CLERK` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RECEIPT_TIME` datetime(0) NULL DEFAULT NULL,
  `PRINT_CODE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PRINTER` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ELECTRONIC_INVOICE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURANCE_PERSONAL_CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INSURANCE_CODE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `YBTCQBM` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `TRADE_NO` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DELETE_FLAG` decimal(1, 0) NULL DEFAULT NULL,
  `DELETE_UNICODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime(0) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdr_zy_settle_detail_records
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
