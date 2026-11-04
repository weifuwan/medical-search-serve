package com.jiayuan.modules.template.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.template.dto.TemplateFieldDTO;
import com.jiayuan.modules.template.entity.TemplateFieldEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 模板和字段的映射关系
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Mapper
public interface TemplateFieldDao extends BaseDao<TemplateFieldEntity> {

    /**
     * 获取需要更新的模板字段id
     *
     * @param tfCodeList
     * @return
     */
    List<Long> getNeedUpdateConfigIds(List<String> tfCodeList);

    /**
     * 获取模板字段列表
     *
     * @param templateId
     * @return
     */
    List<TemplateFieldDTO> findList(@Param(value = "templateId") Long templateId);
}