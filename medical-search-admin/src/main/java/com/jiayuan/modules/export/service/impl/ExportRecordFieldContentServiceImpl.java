package com.jiayuan.modules.export.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.export.dao.ExportRecordFieldContentDao;
import com.jiayuan.modules.export.dto.ExportRecordFieldContentDTO;
import com.jiayuan.modules.export.entity.ExportRecordFieldContentEntity;
import com.jiayuan.modules.export.service.ExportRecordFieldContentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 数据导出记录字段信息(高级导出)选择内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Service
public class ExportRecordFieldContentServiceImpl extends CrudServiceImpl<ExportRecordFieldContentDao, ExportRecordFieldContentEntity, ExportRecordFieldContentDTO> implements ExportRecordFieldContentService {

    @Override
    public Wrapper<ExportRecordFieldContentEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        return Wrappers.<ExportRecordFieldContentEntity>lambdaQuery()
                .eq(StringUtils.isNotBlank(id), ExportRecordFieldContentEntity::getId, id);
    }


}