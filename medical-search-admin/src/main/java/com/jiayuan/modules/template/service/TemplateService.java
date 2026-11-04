package com.jiayuan.modules.template.service;

import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.template.dto.TemplateDTO;
import com.jiayuan.modules.template.entity.TemplateEntity;

import java.util.List;
import java.util.Map;

/**
 * 模板
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
public interface TemplateService extends CrudService<TemplateEntity, TemplateDTO> {

    /**
     * 模板保存
     *
     * @param dto
     */
    void saveOrUpdateTemplate(TemplateDTO dto);

    /**
     * 获取模板信息
     *
     * @param id
     * @return
     */
    TemplateDTO getById(Long id);

    /**
     * 获取分页信息
     *
     * @param params
     * @return
     */
    PageData<TemplateDTO> getPageInfo(Map<String, Object> params);


    /**
     * 模板列表
     *
     * @return
     */
    List<TemplateDTO> selectList();

    /**
     * 模板预览
     *
     * @param dto
     * @return
     */
    String preview(TemplateDTO dto);
}