INSERT INTO sys_config
VALUES (2011, '1', 'sso.service.certificate', '单点登录凭证', '单点登录注册用户凭证', '4tuh3CfMbdfUhd84vLn6ZmWtnZ3M1C2dapWslChJk3CH3ilxl4XokiSCxRiboUQt', '1', 1, '0', '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), 'CBDSES', 'N', '单点登录');

INSERT INTO sys_config
VALUES (2012, '1', 'sso.service.registration.switch', '单点登录注册用户开关', '默认关闭', 'Y', '2', 2, '0', '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), 'CBDSES', 'N', '单点登录');

INSERT INTO sys_config
VALUES (2013, '1', 'sso.service.registration.addr', '单点登录人员注册地址', '单点登录人员注册地址', 'https://192.168.17.47:9000/sso/userRegistration', '1', 3, '0', '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), 'CBDSES', 'N', '单点登录');

INSERT INTO sys_config
VALUES (2014, '1', 'sso.service.tokenverification.addr', '单点登录token校验地址', '单点登录校验地址', 'https://192.168.17.47:9000/sso/tokenVerification', '1', 4, '0', '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), 'CBDSES', 'N', '单点登录');

INSERT INTO sys_config
VALUES (10582, '8', 'desensitize.config.enabled', '脱敏开关', '脱敏开关', 'Y', '2', 3, '0', '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), 'CBDSES', 'Y', '脱敏配置');

INSERT INTO sys_config
VALUES (10583, '8', 'desensitize.config.sys.id', '脱敏系统ID', '脱敏系统ID', 'CBDSES', '1', 1, '0', '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), 'CBDSES', 'Y', '脱敏配置');

INSERT INTO sys_config
VALUES (10584, '8', 'desensitize.config.url', '脱敏地址', '脱敏地址', 'http://192.168.17.41:8096/outdesen/queryDesenRule', '1', 2, '0', '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), 'CBDSES', 'Y', '脱敏配置');

INSERT INTO sys_config
VALUES (10586, '8', 'desensitize.config.token', '访问token', '访问token', 'IfnKS7366u8RNCGHEuDh5fpvv28RCYCR', '1', 5, '0', '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), '1067246875800000001', TO_DATE('2023-11-23 02:15:45', 'YYYY-MM-DD HH24:MI:SS'), 'CBDSES', 'Y', '脱敏配置');
