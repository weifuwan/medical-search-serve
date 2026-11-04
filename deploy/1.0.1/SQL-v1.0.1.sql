-- ms_result_field
ALTER TABLE ms_result_field
ADD COLUMN user_id BIGINT COMMENT '用户id';


-- ms_keyword_config
ALTER TABLE ms_keyword_config
ADD COLUMN user_id BIGINT(0) COMMENT '用户id';

ALTER TABLE ms_keyword_config
ADD COLUMN is_default tinyint(1) COMMENT '是否默认';

update ms_keyword_config set is_default = 1;