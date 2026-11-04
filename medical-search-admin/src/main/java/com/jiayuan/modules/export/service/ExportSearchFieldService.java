package com.jiayuan.modules.export.service;

import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.export.dto.ExportSearchFieldDTO;
import com.jiayuan.modules.export.entity.ExportSearchFieldEntity;
import com.jiayuan.modules.template.dto.FieldDTO;

import java.util.List;

/**
 * 数据保存显示字段
 *
 * @author lijiankui
 * @since 1.0.0 2024-10-08
 */
public interface ExportSearchFieldService extends CrudService<ExportSearchFieldEntity, ExportSearchFieldDTO> {


    /**
     * 获取数据保存关联显示字段列表
     *
     * @param saveRecordId
     * @return
     */
    List<FieldDTO> findList(Long saveRecordId);

    /**
     * 删除保存记录关联显示字段
     *
     * @param saveRecordId
     */
    void deleteBySaveRecordId(Long saveRecordId);
}