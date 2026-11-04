/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.115
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 192.168.1.115:3306
 Source Schema         : medical_search_biz

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 29/03/2023 15:19:58
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login`
(
    `id`          bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `username`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
    `login_id`    varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '登录id即 sys_user表内的登录用户id字段',
    `user_id`     bigint(0) NOT NULL COMMENT '用户id',
    `sys_id`      bigint(0) NULL DEFAULT NULL COMMENT '系统id',
    `ip`          varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '登录ip地址',
    `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1640668709613297666 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_export_record
-- ----------------------------
DROP TABLE IF EXISTS `ms_export_record`;
CREATE TABLE `ms_export_record`
(
    `id`               bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `search_id`        bigint(0) NOT NULL COMMENT '数据保存记录ID',
    `search_name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '数据保存记录名称',
    `dimension`        int(0) NOT NULL COMMENT '维度(0人次 1人)',
    `amount`           int(0) NOT NULL DEFAULT 0 COMMENT '数量',
    `expression`       varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '检索表达式',
    `order_field_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排序字段编码',
    `order_table_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排序表编码',
    `order_mode`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排序方式',
    `export_type`      int(0) NULL DEFAULT NULL COMMENT '导出类型(0-基本导出, 1-高级导出)',
    `field_amount`     int(0) NULL DEFAULT NULL COMMENT '导出字段数量',
    `is_deleted`       int(0) NOT NULL DEFAULT 0 COMMENT '是否删除(1-删除, 0-未删除)',
    `create_date`      datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建(导出)时间',
    `create_user_id`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '创建(导出)人ID',
    `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '创建(导出)人名称',
    `update_date`      datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX              `idx_search_id`(`search_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1638023693782835202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据导出记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_export_record_field
-- ----------------------------
DROP TABLE IF EXISTS `ms_export_record_field`;
CREATE TABLE `ms_export_record_field`
(
    `id`             bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `export_id`      bigint(0) NOT NULL COMMENT '数据导出记录ID',
    `table_id`       bigint(0) NOT NULL COMMENT '表ID',
    `table_field_id` bigint(0) NOT NULL COMMENT '表字段ID',
    `is_deleted`     int(0) NOT NULL DEFAULT 0 COMMENT '是否删除(1-删除, 0-未删除)',
    `create_date`    datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `update_date`    datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `idx_export_id`(`export_id`) USING BTREE,
    INDEX            `idx_table_id`(`table_id`) USING BTREE,
    INDEX            `idx_table_field_id`(`table_field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1638012025254273027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据导出记录字段信息(高级导出)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_export_record_field_content
-- ----------------------------
DROP TABLE IF EXISTS `ms_export_record_field_content`;
CREATE TABLE `ms_export_record_field_content`
(
    `id`          bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `field_id`    bigint(0) NOT NULL COMMENT '导出记录字段信息ID',
    `code`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '字段编码',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字段名称',
    `is_deleted`  int(0) NOT NULL DEFAULT 0 COMMENT '是否删除(1-删除, 0-未删除)',
    `create_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `update_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX         `idx_field_id`(`field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1623962846047592452 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据导出记录字段信息(高级导出)选择内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_export_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `ms_export_recycle_bin`;
CREATE TABLE `ms_export_recycle_bin`
(
    `id`               bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `search_id`        bigint(0) NOT NULL COMMENT '数据保存记录ID',
    `search_name`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '数据保存记录名称',
    `dimension`        int(0) NOT NULL COMMENT '维度(0人次 1人)',
    `amount`           int(0) NOT NULL DEFAULT 0 COMMENT '数量',
    `expression`       varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '检索表达式',
    `remark`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `expire_date`      datetime(0) NOT NULL COMMENT '过期清除截止日期',
    `is_deleted`       int(0) NOT NULL DEFAULT 0 COMMENT '是否删除(1-删除, 0-未删除)',
    `create_date`      datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建(删除)时间',
    `create_user_id`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '创建(删除)人ID',
    `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '创建(删除)人名称',
    `update_date`      datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX              `idx_search_id`(`search_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1626479845474656258 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据检索保存记录回收站' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_export_search_result
-- ----------------------------
DROP TABLE IF EXISTS `ms_export_search_result`;
CREATE TABLE `ms_export_search_result`
(
    `id`               bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '数据保存名称',
    `dimension`        int(0) NOT NULL COMMENT '维度(0人次 1人)',
    `amount`           int(0) NOT NULL DEFAULT 0 COMMENT '数量',
    `expression`       varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '检索表达式',
    `order_field_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排序字段编码',
    `order_table_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排序表编码',
    `order_mode`       varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '排序方式',
    `remark`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `is_deleted`       int(0) NOT NULL DEFAULT 0 COMMENT '是否删除(1-删除, 0-未删除)',
    `create_date`      datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `update_date`      datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1638011608168488963 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '数据检索保存记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_keyword_config
-- ----------------------------
DROP TABLE IF EXISTS `ms_keyword_config`;
CREATE TABLE `ms_keyword_config`
(
    `id`           bigint(0) NOT NULL COMMENT '主键',
    `keyword`      varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关键字',
    `keyword_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '关键词类型',
    `table_code`   varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表编码',
    `field_code`   varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字段编码',
    `creator`      bigint(0) NOT NULL COMMENT '创建者',
    `create_date`  datetime(0) NOT NULL COMMENT '创建时间',
    `is_convert`   tinyint(1) NULL DEFAULT NULL COMMENT '是否转化',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '关键字检索配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_log_search
-- ----------------------------
DROP TABLE IF EXISTS `ms_log_search`;
CREATE TABLE `ms_log_search`
(
    `id`          bigint(0) NOT NULL COMMENT '主键',
    `expression`  varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表达式',
    `creator`     bigint(0) NOT NULL COMMENT '创建者',
    `create_date` datetime(0) NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '检索日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_result_field
-- ----------------------------
DROP TABLE IF EXISTS `ms_result_field`;
CREATE TABLE `ms_result_field`
(
    `id`             bigint(0) NOT NULL COMMENT '主键',
    `is_default`     tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认',
    `is_basic`       tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否患者(人)基础字段(0否，1是)',
    `is_visit_basic` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否就诊(人次)基础字段(0否，1是)',
    `is_dict`        tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是字典',
    `dict_type`      varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '字典类型',
    `sort`           int(0) NOT NULL COMMENT '排序',
    `table_code`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表编码',
    `field_code`     varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字段编码',
    `creator`        bigint(0) NOT NULL COMMENT '创建者',
    `create_date`    datetime(0) NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tablefield_code`(`table_code`, `field_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '返回结果表头' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_table
-- ----------------------------
DROP TABLE IF EXISTS `ms_table`;
CREATE TABLE `ms_table`
(
    `id`          bigint(0) NOT NULL COMMENT '主键',
    `table_name`  varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表名称',
    `table_code`  varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '表编码',
    `classify_id` bigint(0) NOT NULL COMMENT '表分类ID',
    `sort`        int(0) NULL DEFAULT 0 COMMENT '排序',
    `is_deleted`  int(0) NOT NULL COMMENT '是否删除',
    `creator`     bigint(0) NOT NULL COMMENT '创建者',
    `create_date` datetime(0) NOT NULL COMMENT '创建时间',
    `updater`     bigint(0) NOT NULL COMMENT '更新者',
    `update_date` datetime(0) NOT NULL COMMENT '更新时间',
    `remark`      varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_table_code`(`table_code`) USING BTREE,
    INDEX         `idx_tablecode`(`table_code`) USING BTREE,
    INDEX         `idx_classify_id`(`classify_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '表信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_table_classify
-- ----------------------------
DROP TABLE IF EXISTS `ms_table_classify`;
CREATE TABLE `ms_table_classify`
(
    `id`          bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
    `sort`        int(0) NOT NULL DEFAULT 0 COMMENT '排列序号',
    `is_deleted`  int(0) NOT NULL DEFAULT 0 COMMENT '是否删除(1-删除, 0-未删除)',
    `create_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `update_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '最后更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '表分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_table_field
-- ----------------------------
DROP TABLE IF EXISTS `ms_table_field`;
CREATE TABLE `ms_table_field`
(
    `id`           bigint(0) NOT NULL COMMENT '主键',
    `field_name`   varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字段名称',
    `field_code`   varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字段编码',
    `table_id`     bigint(0) NOT NULL COMMENT '表id',
    `sort`         int(0) NULL DEFAULT 0 COMMENT '排序',
    `field_type`   tinyint(1) NULL DEFAULT NULL COMMENT '字段类型',
    `data_type`    varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '数据类型',
    `is_deleted`   tinyint(1) NOT NULL COMMENT '是否删除',
    `creator`      bigint(0) NOT NULL COMMENT '创建者',
    `create_date`  datetime(0) NOT NULL COMMENT '创建时间',
    `updater`      bigint(0) NOT NULL COMMENT '更新者',
    `update_date`  datetime(0) NOT NULL COMMENT '更新时间',
    `remark`       varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
    `creator_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NOT NULL COMMENT '创建人姓名',
    `updater_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NOT NULL COMMENT '更新人姓名',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tablefield_code`(`field_code`, `table_id`) USING BTREE,
    INDEX          `idx_fieldcode`(`field_code`, `table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_table_field_content
-- ----------------------------
DROP TABLE IF EXISTS `ms_table_field_content`;
CREATE TABLE `ms_table_field_content`
(
    `id`          bigint(0) NOT NULL COMMENT '主键',
    `field_id`    bigint(0) NOT NULL COMMENT '字段id',
    `code`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '编码',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名称',
    `sort`        int(0) NULL DEFAULT 0 COMMENT '排序',
    `is_deleted`  tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除(1-删除, 0-未删除)',
    `create_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) COMMENT '创建时间',
    `update_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP (0) ON UPDATE CURRENT_TIMESTAMP (0) COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字段内容' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_template
-- ----------------------------
DROP TABLE IF EXISTS `ms_template`;
CREATE TABLE `ms_template`
(
    `id`            bigint(0) NOT NULL COMMENT '主键',
    `expression`    varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表达式',
    `template_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '模板名称',
    `use_scope`     int(0) NOT NULL COMMENT '使用范围(1-全院 2-个人)',
    `sort`          int(0) NULL DEFAULT 0 COMMENT '排序',
    `is_deleted`    int(0) NOT NULL COMMENT '是否删除',
    `creator`       bigint(0) NOT NULL COMMENT '创建者',
    `create_date`   datetime(0) NOT NULL COMMENT '创建时间',
    `updater`       bigint(0) NOT NULL COMMENT '更新者',
    `update_date`   datetime(0) NOT NULL COMMENT '更新时间',
    `creator_name`  varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '创建人姓名',
    `updater_name`  varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '更新人姓名',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_tname`(`template_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ms_template_field
-- ----------------------------
DROP TABLE IF EXISTS `ms_template_field`;
CREATE TABLE `ms_template_field`
(
    `id`          bigint(0) NOT NULL COMMENT '主键',
    `template_id` bigint(0) NOT NULL COMMENT '模板id',
    `field_id`    bigint(0) NOT NULL COMMENT '字段id',
    `field_val`   varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '字段值',
    `logic`       tinyint(1) NULL DEFAULT NULL COMMENT '逻辑符号',
    `relation`    tinyint(1) NOT NULL COMMENT '关系符号',
    `sort`        int(0) NOT NULL COMMENT '排序',
    `is_deleted`  tinyint(1) NOT NULL COMMENT '是否删除',
    `creator`     bigint(0) NOT NULL COMMENT '创建者',
    `create_date` datetime(0) NOT NULL COMMENT '创建时间',
    `updater`     bigint(0) NOT NULL COMMENT '更新者',
    `update_date` datetime(0) NOT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '模板和字段的映射关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `id`          bigint(0) NOT NULL COMMENT 'id',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型ID',
    `dict_label`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标签',
    `dict_value`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典值',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `sort`        int(0) UNSIGNED NULL DEFAULT NULL COMMENT '排序',
    `creator`     bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `updater`     bigint(0) NULL DEFAULT NULL COMMENT '更新者',
    `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_dict_type_value`(`dict_type`, `dict_value`) USING BTREE,
    INDEX         `idx_sort`(`sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `id`          bigint(0) NOT NULL COMMENT 'id',
    `dict_type`   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典类型',
    `dict_name`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
    `remark`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
    `sort`        int(0) UNSIGNED NULL DEFAULT NULL COMMENT '排序',
    `creator`     bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `updater`     bigint(0) NULL DEFAULT NULL COMMENT '更新者',
    `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_error
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_error`;
CREATE TABLE `sys_log_error`
(
    `id`             bigint(0) NOT NULL COMMENT 'id',
    `request_uri`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URI',
    `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
    `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
    `user_agent`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户代理',
    `ip`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作IP',
    `error_info`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常信息',
    `creator`        bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date`    datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异常日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_operation
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_operation`;
CREATE TABLE `sys_log_operation`
(
    `id`             bigint(0) NOT NULL COMMENT 'id',
    `operation`      varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户操作',
    `request_uri`    varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求URI',
    `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
    `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数',
    `request_time`   int(0) UNSIGNED NOT NULL COMMENT '请求时长(毫秒)',
    `user_agent`     varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户代理',
    `ip`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作IP',
    `status`         tinyint(0) UNSIGNED NOT NULL COMMENT '状态  0：失败   1：成功',
    `creator_name`   varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
    `creator`        bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date`    datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX            `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_params
-- ----------------------------
DROP TABLE IF EXISTS `sys_params`;
CREATE TABLE `sys_params`
(
    `id`          bigint(0) NOT NULL COMMENT 'id',
    `param_code`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数编码',
    `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数值',
    `param_type`  tinyint(0) UNSIGNED NULL DEFAULT 1 COMMENT '类型   0：系统参数   1：非系统参数',
    `remark`      varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `creator`     bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `updater`     bigint(0) NULL DEFAULT NULL COMMENT '更新者',
    `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uk_param_code`(`param_code`) USING BTREE,
    INDEX         `idx_create_date`(`create_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`
(
    `permission_id`     bigint(0) NOT NULL COMMENT 'id',
    `parent_id`         bigint(0) NULL DEFAULT NULL COMMENT '上级ID，一级菜单为0',
    `permission_name`   varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
    `url`               varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单URL',
    `permissions`       varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:list,sys:user:save)',
    `menu_type`         tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '类型   0：菜单   1：按钮',
    `icon`              varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
    `sort`              int(0) NULL DEFAULT NULL COMMENT '排序',
    `creator`           bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date`       datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `updater`           bigint(0) NULL DEFAULT NULL COMMENT '更新者',
    `update_date`       datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `group_code`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '集团编码',
    `organization_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组织编码',
    `sys_id`            int(0) NULL DEFAULT NULL COMMENT '系统id',
    `description`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
    PRIMARY KEY (`permission_id`) USING BTREE,
    INDEX               `idx_pid`(`parent_id`) USING BTREE,
    INDEX               `idx_sort`(`sort`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `role_id`           bigint(0) NOT NULL COMMENT 'id',
    `role_name`         varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
    `description`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
    `dept_id`           bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
    `creator`           bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date`       datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `updater`           bigint(0) NULL DEFAULT NULL COMMENT '更新者',
    `update_date`       datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `group_code`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '集团编码',
    `organization_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组织编码',
    `sys_id`            int(0) NULL DEFAULT NULL COMMENT '系统id',
    `role_code`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色编码',
    `delete_flag`       int(0) NULL DEFAULT 0 COMMENT '删除标志 0否 1是',
    PRIMARY KEY (`role_id`) USING BTREE,
    INDEX               `idx_dept_id`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`
(
    `role_permission_id` bigint(0) NOT NULL COMMENT 'id',
    `role_id`            bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
    `permission_id`      bigint(0) NULL DEFAULT NULL COMMENT '菜单ID',
    `creator`            bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date`        datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `group_code`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '集团编码',
    `organization_code`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组织编码',
    `sys_id`             int(0) NULL DEFAULT NULL COMMENT '系统id',
    PRIMARY KEY (`role_permission_id`) USING BTREE,
    INDEX                `idx_role_id`(`role_id`) USING BTREE,
    INDEX                `idx_menu_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色菜单关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `group_code`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '集团编码',
    `organization_code`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组织编码',
    `user_id`                  bigint(0) NOT NULL COMMENT 'id',
    `login_id`                 varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
    `password`                 varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
    `password_expiration_date` datetime(0) NULL DEFAULT NULL COMMENT '密码失效时间',
    `password_reset`           tinyint(0) NULL DEFAULT NULL COMMENT '密码强制修改标志',
    `login_ip`                 varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前登录ip',
    `last_login_date`          datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
    `last_login_ip`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上次登录ip',
    `failed_login_attempts`    int(0) NULL DEFAULT NULL COMMENT '验证登录失败次数',
    `user_status`              int(0) NOT NULL DEFAULT 1 COMMENT '状态  0：停用   1：正常',
    `modified_date`            datetime(0) NULL DEFAULT NULL COMMENT '状态修改时间',
    `employment_id`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工工号',
    `user_name`                varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
    `mobile`                   varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
    `create_time`              datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `email`                    varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
    `sys_id`                   int(0) NULL DEFAULT NULL COMMENT '属于哪个系统',
    `gender`                   tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '性别   0：男   1：女    2：保密',
    `id_card`                  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
    `identify_type`            int(0) NULL DEFAULT NULL COMMENT '验证方式（0：密码；1：ca ；2：二维码） 默认密码',
    `account_activation_date`  datetime(0) NULL DEFAULT NULL COMMENT '账号启用日期，默认现在',
    `account_expiration_date`  datetime(0) NULL DEFAULT NULL COMMENT '账号失效日期',
    `token_expiration_time`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'token过期时间（单位小时，默认2小时）',
    `new_page_open_type`       int(0) NULL DEFAULT NULL COMMENT '新页面打开方式，1、新开一个页面，2、当前页',
    `updater`                  bigint(0) NULL DEFAULT NULL COMMENT '更新者',
    `creator`                  bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `super_admin`              tinyint(0) UNSIGNED NULL DEFAULT NULL COMMENT '超级管理员   0：否   1：是',
    `dept_id`                  bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
    `head_url`                 varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
    PRIMARY KEY (`user_id`) USING BTREE,
    UNIQUE INDEX `uk_username`(`login_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `user_role_id`      bigint(0) NOT NULL COMMENT 'id',
    `role_id`           bigint(0) NULL DEFAULT NULL COMMENT '角色ID',
    `user_id`           bigint(0) NULL DEFAULT NULL COMMENT '用户ID',
    `creator`           bigint(0) NULL DEFAULT NULL COMMENT '创建者',
    `create_date`       datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `delete_flag`       int(0) NULL DEFAULT 0 COMMENT '删除标志 0否 1是',
    `sys_id`            int(0) NULL DEFAULT NULL COMMENT '系统id',
    `group_code`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '集团编码',
    `organization_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组织编码',
    PRIMARY KEY (`user_role_id`) USING BTREE,
    INDEX               `idx_role_id`(`role_id`) USING BTREE,
    INDEX               `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色用户关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`
(
    `id`          bigint(0) NOT NULL COMMENT 'id',
    `user_id`     bigint(0) NOT NULL COMMENT '用户id',
    `token`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户token',
    `expire_date` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
    `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
    UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

SET
FOREIGN_KEY_CHECKS = 1;
