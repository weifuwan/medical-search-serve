package com.jiayuan.modules.export.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.export.dao.ExportSearchFieldDao;
import com.jiayuan.modules.export.dto.ExportSearchFieldDTO;
import com.jiayuan.modules.export.entity.ExportSearchFieldEntity;
import com.jiayuan.modules.export.service.ExportSearchFieldService;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 数据保存显示字段
 *
 * @author lijiankui
 * @since 1.0.0 2024-10-08
 */
@Service
public class ExportSearchFieldServiceImpl extends CrudServiceImpl<ExportSearchFieldDao, ExportSearchFieldEntity, ExportSearchFieldDTO> implements ExportSearchFieldService {

    @Override
    public QueryWrapper<ExportSearchFieldEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        QueryWrapper<ExportSearchFieldEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


    @Override
    public List<FieldDTO> findList(Long saveRecordId) {
        return this.baseDao.findList(saveRecordId);
    }

    @Override
    public void deleteBySaveRecordId(Long saveRecordId) {
        this.baseDao.delete(Wrappers.<ExportSearchFieldEntity>lambdaQuery().eq(ExportSearchFieldEntity::getSaveRecordId, saveRecordId));
    }
}