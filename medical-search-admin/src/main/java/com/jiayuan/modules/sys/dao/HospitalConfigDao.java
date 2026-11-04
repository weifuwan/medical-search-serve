package com.jiayuan.modules.sys.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.sys.entity.HospitalConfigEntity;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.List;

/**
 * 医疗参数管理
 *
 * @author Henry
 * @date 2025/7/10
 */
@Mapper
public interface HospitalConfigDao  extends BaseDao<HospitalConfigEntity> {

    @Select("SELECT * FROM cbdses_hospital_config ORDER BY id DESC")
    List<HospitalConfigEntity> selectAll();

    @Delete("TRUNCATE TABLE cbdses_hospital_config")
    void deleteAll();

    @Insert("INSERT INTO cbdses_hospital_config(hospital_name, logo_base64) VALUES (#{hospitalName}, #{logoBase64})")
    int insert(HospitalConfigEntity config);

}
