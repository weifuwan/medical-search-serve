-- ms_table
INSERT INTO ms_table(id, table_name, table_code, sort, classify_id, is_deleted, creator, create_date, updater,
                     update_date, remark)
VALUES (1619994797120479234, '就诊记录', 'ms_visit_record', 0, 2, 0, 1067246875800000001, now(), 1067246875800000001, now(),
        NULL);
-- ms_table_field
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806388, '流水号', 'visit_no', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001, now(),
        1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806389, '患者ID', 'patient_id', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001,
        now(), 1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806390, '患者姓名', 'patient_name', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001,
        now(), 1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806391, '身份证号码', 'id_card', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001, now(),
        1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806392, '性别', 'gendername', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001, now(),
        1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806393, '年龄', 'age', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001, now(),
        1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806394, '出生日期', 'birthtime', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001,
        now(), 1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806395, '门诊住院', 'visit_type', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001,
        now(), 1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806396, '就诊日期', 'visit_date', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001,
        now(), 1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806397, '诊断医生', 'diagnose_doctor', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001,
        now(), 1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806398, '诊断科室', 'diagnose_department', 1619994797120479234, 0, NULL, 'varchar', 0,
        1067246875800000001, now(), 1067246875800000001, now(), 'admin', 'admin', NULL);
INSERT INTO ms_table_field(id, field_name, field_code, table_id, sort, field_type, data_type, is_deleted, creator,
                           create_date, updater, update_date, creator_name, updater_name, remark)
VALUES (1619973853626806399, '院区', 'area_no', 1619994797120479234, 0, NULL, 'varchar', 0, 1067246875800000001, now(),
        1067246875800000001, now(), 'admin', 'admin', NULL);
