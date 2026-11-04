package com.jiayuan.modules.sys.service;

import com.jiayuan.common.dto.KeyValue;
import com.jiayuan.common.service.CrudService;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.modules.sys.dto.SysConfigDTO;
import com.jiayuan.modules.sys.entity.SysConfigEntity;

import java.util.List;

/**
 * 系统配置表
 *
 * @author lijiankui
 * @since 1.0.0 2023-11-22
 */
public interface SysConfigService extends CrudService<SysConfigEntity, SysConfigDTO> {

    /**
     * 获取系统配置
     *
     * @return
     */
    List<SysConfigDTO> findList();

    /**
     * 更新系统设置
     *
     * @param configList
     */
    void updateByConfigCode(ValidList<KeyValue> configList);

    /**
     * 获取配置
     *
     * @param configCode
     * @return
     */
    SysConfigEntity getByCode(String configCode);
}