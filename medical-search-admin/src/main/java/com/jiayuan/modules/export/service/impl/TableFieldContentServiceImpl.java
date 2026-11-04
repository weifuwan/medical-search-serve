package com.jiayuan.modules.export.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.export.dao.TableFieldContentDao;
import com.jiayuan.modules.export.dto.TableFieldContentDTO;
import com.jiayuan.modules.export.entity.TableFieldContentEntity;
import com.jiayuan.modules.export.service.TableFieldContentService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 字段内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-12-29
 */
@Service
public class TableFieldContentServiceImpl extends CrudServiceImpl<TableFieldContentDao, TableFieldContentEntity, TableFieldContentDTO> implements TableFieldContentService {

    @Override
    public Wrapper<TableFieldContentEntity> getWrapper(Map<String, Object> params) {
        String fieldId = (String) params.get("fieldId");
        String name = (String) params.get("name");

        return Wrappers.<TableFieldContentEntity>lambdaQuery()
                .eq(TableFieldContentEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .eq(StringUtils.isNotBlank(fieldId), TableFieldContentEntity::getFieldId, fieldId)
                .like(StringUtils.isNotBlank(name), TableFieldContentEntity::getName, name);
    }
}