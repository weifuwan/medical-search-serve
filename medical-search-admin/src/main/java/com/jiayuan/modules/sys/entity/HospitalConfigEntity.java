package com.jiayuan.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * @author Henry
 * @date 2025/7/10
 *
 * 医院配置信息实体
 */
@Data
@TableName("CBDSES_HOSPITAL_CONFIG")
public class HospitalConfigEntity {
    /**
     * 主键ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 医院名称
     */
    private String hospitalName;

    /**
     * Logo的Base64编码
     */
    private String logoBase64;

}