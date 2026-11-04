package com.jiayuan.modules.export.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.export.dao.ExportRecordFieldDao;
import com.jiayuan.modules.export.dto.ExportRecordFieldDTO;
import com.jiayuan.modules.export.entity.ExportRecordFieldEntity;
import com.jiayuan.modules.export.service.ExportRecordFieldService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 数据导出记录字段信息(高级导出)
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Service
public class ExportRecordFieldServiceImpl extends CrudServiceImpl<ExportRecordFieldDao, ExportRecordFieldEntity, ExportRecordFieldDTO> implements ExportRecordFieldService {

    @Override
    public Wrapper<ExportRecordFieldEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        return Wrappers.<ExportRecordFieldEntity>lambdaQuery()
                .eq(StringUtils.isNotBlank(id), ExportRecordFieldEntity::getId, id);
    }


}