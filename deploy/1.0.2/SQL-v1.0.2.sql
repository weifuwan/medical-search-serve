-- 元数据字段添加是否有效字段
-- ms_table
ALTER TABLE ms_table
ADD COLUMN is_effective tinyint(1) COMMENT '是否有效';
update ms_table set is_effective = 1;

-- ms_table_field
ALTER TABLE ms_table_field
ADD COLUMN is_effective tinyint(1) COMMENT '是否有效';
update ms_table_field set is_effective = 1;

-- ms_keyword_config
ALTER TABLE ms_keyword_config
ADD COLUMN is_deleted int(0) COMMENT '是否删除';
update ms_keyword_config set is_deleted = 0;

ALTER TABLE ms_keyword_config
ADD COLUMN updater BIGINT(0) COMMENT '更新者';
update ms_keyword_config set updater = '1067246875800000001';

ALTER TABLE ms_keyword_config
ADD COLUMN update_date datetime(0) COMMENT '更新日期';
update ms_keyword_config set update_date = now();



-- 系统配置
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1011, '1', 'auto.logout.time', '自动登出时间', '一定时间未操作自动登出，默认30分钟，单位分钟', '200', '1', 9, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '设置');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1012, '1', 'failed.login.attempts.time', '连续登录时间', '用户登录连续时间，连续失败次数到达次数时，将禁止一段时间登录（分钟）', '5', '3', 6, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '设置');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1013, '1', 'failed.login.attempts.count', '允许连续登录失败次数', '用户登录连续失败次数到达次数时，将禁止一段时间登录', '5', '3', 7, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '设置');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1014, '1', 'disable.login.time', '禁止登录时间', '用户登录连续失败次数到达次数时，禁止登录时间（分钟）', '5', '3', 8, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '设置');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1021, '2', 'enable.periodic.log.clearing', '是否开启日志定期清理', '选择是开启，选择否关闭', 'Y', '2', 1, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '日志清理');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1022, '2', 'config.log.retention.time', '配置日志保留时间', '单位天，默认180天', '180', '3', 2, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2024-06-27 10:20:09', 'CBDSES', 'Y', '日志清理');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1061, '6', 'config.user.password.unique', '是否允许修改密码与上次相同', '是否允许修改密码与上次相同', 'Y', '2', 4, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '用户配置');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1062, '6', 'config.user.expire.time', '用户密码过期时间', '用户密码过期时间多久(天)', '5', '3', 4, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '用户配置');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1063, '6', 'config.user.expire.remind', '用户密码即将过期提醒日期', '用户密码即将过期前多少天提供提醒', '5', '3', 4, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '用户配置');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1064, '6', 'config.user.expire.force', '密码过期是否强制用户修改密码', '用户密码过期后是否强制用户进行密码修改后操作', 'Y', '2', 4, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '用户配置');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (1065, '6', 'config.user.password.strength', '密码强度登录', '至少几种不同字符组合，0-不限制，1-大小写、数字、特殊符号任意两种，2 大小写+数字+特殊符号，3 大小写+数字+特殊符号+密码位数大于8，4极强度密码', '0', '3', 4, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'CBDSES', 'Y', '用户配置');


-- ms_table_field 增加两个字段 tableCode
ALTER TABLE ms_table_field ADD COLUMN table_code VARCHAR(50) COMMENT '表编码';
-- 初始化table_code
UPDATE ms_table_field SET table_code = (select table_code from ms_table where ms_table_field.table_id = ms_table.id);

-- ms_template_field 增加两个字段 fieldCode tableCode
ALTER TABLE ms_template_field ADD COLUMN field_code VARCHAR(50)  COMMENT '字段编码';
ALTER TABLE ms_template_field ADD COLUMN table_code VARCHAR(50)  COMMENT '表编码';
-- 初始化table_code、field_code
UPDATE ms_template_field SET field_code = (select field_code from ms_table_field where ms_template_field.field_id = ms_table_field.id);
UPDATE ms_template_field SET table_code = (select table_code from ms_table_field where ms_template_field.field_id = ms_table_field.id);


-- ms_result_field 增加删除标志，更新人、更新时间
ALTER TABLE ms_result_field ADD COLUMN is_deleted int(0) COMMENT '是否删除(1-删除, 0-未删除)';
ALTER TABLE ms_result_field ADD COLUMN updater VARCHAR(50) COMMENT '更新者';
ALTER TABLE ms_result_field ADD COLUMN update_date DATETIME COMMENT '更新时间';
-- 初始化is_deleted
UPDATE ms_result_field SET is_deleted = 0;




INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (2011, '1', 'sso.service.certificate', '单点登录凭证', '单点登录注册用户凭证', 'KNE0xQTsplpz2dUFErVyIcZPSKettLEn3YlQeoL00QYHdo3HMUVhRaYEBYj6pApm', '1', 1, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'MRMS', 'Y', '单点登录');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (2012, '1', 'sso.service.registration.switch', '单点登录注册用户开关', '默认关闭', 'Y', '2', 2, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'MRMS', 'Y', '单点登录');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (2013, '1', 'sso.service.registration.addr', '单点登录人员注册地址', '单点登录人员注册地址', 'https://192.168.30.133:9000/sso/userRegistration', '1', 3, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'MRMS', 'Y', '单点登录');
INSERT INTO `sys_config`(`id`, `module_id`, `config_code`, `config_name`, `description`, `config_value`, `config_type`, `sort_code`, `deleted_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `sys_id`, `web_show`, `module_name`) VALUES (2014, '1', 'sso.service.tokenverification.addr', '单点登录token校验地址', '单点登录校验地址', 'https://192.168.30.133:9000/sso/tokenVerification', '1', 4, '0', '1067246875800000001', '2023-11-23 02:15:45', '1067246875800000001', '2023-11-23 02:15:45', 'MRMS', 'Y', '单点登录');



INSERT INTO `sys_permission`(`permission_id`, `parent_id`, `permission_name`, `url`, `permissions`, `menu_type`, `icon`, `sort`, `creator`, `create_date`, `updater`, `update_date`, `group_code`, `organization_code`, `sys_id`, `description`) VALUES (1067246875800000025, 1067246875800000035, '医院名称/logo配置', 'sys/logo', 'sys:config:logo', 0, '', 1, 1067246875800000001, '2022-11-03 21:23:34', 1067246875800000001, '2022-11-03 21:23:34', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission`(`permission_id`, `parent_id`, `permission_name`, `url`, `permissions`, `menu_type`, `icon`, `sort`, `creator`, `create_date`, `updater`, `update_date`, `group_code`, `organization_code`, `sys_id`, `description`) VALUES (1067246875800000040, 1067246875800000035, '默认展示字段配置', 'sys/defaultShowField', 'sys:config:defaultShowField', 0, '', 3, 1067246875800000001, '2022-11-03 21:23:34', 1067246875800000001, '2022-11-03 21:23:34', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission`(`permission_id`, `parent_id`, `permission_name`, `url`, `permissions`, `menu_type`, `icon`, `sort`, `creator`, `create_date`, `updater`, `update_date`, `group_code`, `organization_code`, `sys_id`, `description`) VALUES (1067246875800000041, 1067246875800000035, '个人中心', 'sys/personal', 'sys:config:personal', 0, '', 5, 1067246875800000001, '2022-11-03 21:23:34', 1067246875800000001, '2022-11-03 21:23:34', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission`(`permission_id`, `parent_id`, `permission_name`, `url`, `permissions`, `menu_type`, `icon`, `sort`, `creator`, `create_date`, `updater`, `update_date`, `group_code`, `organization_code`, `sys_id`, `description`) VALUES (1067246875800000042, 1067246875800000035, '基本配置', 'sys/basic', 'sys:config:basic', 0, '', 0, 1067246875800000001, '2022-11-03 21:23:34', 1067246875800000001, '2022-11-03 21:23:34', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission`(`permission_id`, `parent_id`, `permission_name`, `url`, `permissions`, `menu_type`, `icon`, `sort`, `creator`, `create_date`, `updater`, `update_date`, `group_code`, `organization_code`, `sys_id`, `description`) VALUES (1067246875800000043, 1067246875800000035, '用户展示字段配置', 'sys/userShowField', 'sys:config:userShowField', 0, '', 2, 1067246875800000001, '2022-11-03 21:23:34', 1067246875800000001, '2022-11-03 21:23:34', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission`(`permission_id`, `parent_id`, `permission_name`, `url`, `permissions`, `menu_type`, `icon`, `sort`, `creator`, `create_date`, `updater`, `update_date`, `group_code`, `organization_code`, `sys_id`, `description`) VALUES (1067246875800000044, 1067246875800000035, '默认检索字段配置', 'sys/defaultCheck', 'sys:config:defaultCheck', 0, '', 4, 1067246875800000001, '2022-11-03 21:23:34', 1067246875800000001, '2022-11-03 21:23:34', NULL, NULL, NULL, NULL);



-- ms_table01的table_name字段设置ms_table的table_name, ms_table和ms_table01表结构是一样的
-- UPDATE ms_table mt SET mt.table_name = IFNULL((select bak.table_name from ms_table20240717153046 bak where bak.table_code = mt.table_code),mt.table_code) where mt.table_name = mt.table_code;
-- 同上，字段注释补充
-- UPDATE ms_table_field mtf SET mtf.field_name = IFNULL((select bak.field_name from ms_table_field20240723111451 bak where bak.table_code = mtf.table_code and mtf.field_code = bak.field_code),mtf.field_code) where mtf.field_name = mtf.field_code;



INSERT INTO `sys_dict_data`(`id`, `dict_type`, `dict_label`, `dict_value`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`) VALUES (1160061146967879682, 'visit_type', '门诊', '01', '', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO `sys_dict_data`(`id`, `dict_type`, `dict_label`, `dict_value`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`) VALUES (1160061146967879683, 'visit_type', '住院', '02', '', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO `sys_dict_data`(`id`, `dict_type`, `dict_label`, `dict_value`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`) VALUES (1160061146967879684, 'visit_type', '体检', '03', '', 1, 1067246875800000001, now(), 1067246875800000001, now());
INSERT INTO `sys_dict_data`(`id`, `dict_type`, `dict_label`, `dict_value`, `remark`, `sort`, `creator`, `create_date`, `updater`, `update_date`) VALUES (1160061146967879685, 'visit_type', '急诊', '04', '', 1, 1067246875800000001, now(), 1067246875800000001, now());


-- 设置字段数据类型为日期，模板和高级检索需要通过日期类型识别来显示时间控件
UPDATE ms_table_field
SET data_type = 'datetime'
WHERE field_name LIKE '%日期' OR field_name LIKE '%时间';


-- 表 增加是否循环字段，主键编码，主附表类型(1主表2附表)，关联字段 从属类型
ALTER TABLE ms_table ADD COLUMN is_loop tinyint(1) DEFAULT 1 COMMENT '是否是循环字段';
ALTER TABLE ms_table ADD COLUMN primary_code varchar(50) DEFAULT 'unicode' COMMENT '主键编码';
ALTER TABLE ms_table ADD COLUMN slave_type tinyint(1) DEFAULT 1 COMMENT '类型(1主表2附表)';
ALTER TABLE ms_table ADD COLUMN related_field varchar(50) DEFAULT NULL COMMENT '关联字段';
ALTER TABLE ms_table ADD COLUMN main_table_code varchar(50) DEFAULT NULL COMMENT '主表编码';

-- ms_table的字段包含unicode，就把 primary_code设置成unicode，包含list_unicode，就把 primary_code设置成list_unicode
UPDATE ms_table ms
    JOIN (
        SELECT DISTINCT ms.id
        FROM ms_table ms
                 INNER JOIN ms_table_field mtf ON ms.id = mtf.table_id
        WHERE mtf.field_code = 'unicode'
    ) sub ON ms.id = sub.id
SET ms.primary_code = 'unicode';

UPDATE ms_table ms
    JOIN (
        SELECT DISTINCT ms.id
        FROM ms_table ms
                 INNER JOIN ms_table_field mtf ON ms.id = mtf.table_id
        WHERE mtf.field_code = 'list_unicode'
    ) sub ON ms.id = sub.id
SET ms.primary_code = 'list_unicode';



-- 元数据增加是否显示字段，默认显示
ALTER TABLE ms_table ADD COLUMN is_show tinyint(1) DEFAULT 1 COMMENT '是否显示(1显示0不显示)';
ALTER TABLE ms_table_field ADD COLUMN is_show tinyint(1) DEFAULT 1 COMMENT '是否显示(1显示0不显示)';
update ms_table set is_show = 1;
update ms_table_field set is_show = 1;

update ms_table_field set field_type = 1 where field_code = 'unicode';
update ms_table_field set field_type = 1 where field_code = 'list_unicode';

-- 编码字段不需要显示
update ms_table_field set is_show=0 where field_name like '%编码';
update ms_table_field set is_show = 0 where field_code = 'unicode';
update ms_table_field set is_show = 0 where field_code = 'list_unicode';





