package com.jiayuan.modules.template.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.modules.template.dao.TemplateFieldDao;
import com.jiayuan.modules.template.dto.TemplateFieldDTO;
import com.jiayuan.modules.template.entity.TemplateFieldEntity;
import com.jiayuan.modules.template.service.TemplateFieldService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 模板和字段的映射关系
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Service
public class TemplateFieldServiceImpl extends CrudServiceImpl<TemplateFieldDao, TemplateFieldEntity, TemplateFieldDTO> implements TemplateFieldService {

    @Override
    public QueryWrapper<TemplateFieldEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        QueryWrapper<TemplateFieldEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


    @Override
    public void deleteBatchByTemplateId(Long templateId) {
        AssertUtils.isNull(templateId, "templateId");
        this.baseDao.delete(Wrappers.<TemplateFieldEntity>lambdaQuery().eq(TemplateFieldEntity::getTemplateId, templateId));
    }

    @Override
    public List<TemplateFieldDTO> list(Long templateId) {
        AssertUtils.isNull(templateId, "templateId");
        return this.baseDao.findList(templateId);
    }

    @Override
    public List<Long> getNeedUpdateConfigIds(List<String> tfCodeList) {
        return this.baseDao.getNeedUpdateConfigIds(tfCodeList);
    }
}