package com.jiayuan.modules.template.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.template.dao.TableClassifyDao;
import com.jiayuan.modules.template.dto.TableClassifyDTO;
import com.jiayuan.modules.template.entity.TableClassifyEntity;
import com.jiayuan.modules.template.service.TableClassifyService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 表分类
 *
 * @author lijiankui
 * @since 1.0.0 2023-02-15
 */
@Service
public class TableClassifyServiceImpl extends CrudServiceImpl<TableClassifyDao, TableClassifyEntity, TableClassifyDTO> implements TableClassifyService {

    @Override
    public Wrapper<TableClassifyEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        return Wrappers.<TableClassifyEntity>lambdaQuery()
//                .eq(TableClassifyEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .eq(StringUtils.isNotBlank(id), TableClassifyEntity::getId, id)
                .orderByAsc(TableClassifyEntity::getSort);
    }

}