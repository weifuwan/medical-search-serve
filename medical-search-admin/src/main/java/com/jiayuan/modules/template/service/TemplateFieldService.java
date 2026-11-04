package com.jiayuan.modules.template.service;

import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.template.dto.TemplateFieldDTO;
import com.jiayuan.modules.template.entity.TemplateFieldEntity;

import java.util.List;

/**
 * 模板和字段的映射关系
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
public interface TemplateFieldService extends CrudService<TemplateFieldEntity, TemplateFieldDTO> {


    /**
     * 删除模板关联字段
     *
     * @param templateId
     */
    void deleteBatchByTemplateId(Long templateId);

    /**
     * 模板关联字段列表
     *
     * @param templateId
     * @return
     */
    List<TemplateFieldDTO> list(Long templateId);

    /**
     * 获取需要更新的模板字段id
     *
     * @param tfCodeList
     * @return
     */
    List<Long> getNeedUpdateConfigIds(List<String> tfCodeList);
}