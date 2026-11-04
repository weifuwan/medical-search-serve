package com.jiayuan.modules.template.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.template.dao.SearchSymbolDao;
import com.jiayuan.modules.template.dto.SearchSymbolDTO;
import com.jiayuan.modules.template.entity.SearchSymbolEntity;
import com.jiayuan.modules.template.service.SearchSymbolService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 检索符号
 *
 * @author lijiankui
 * @since 1.0.0 2025-04-16
 */
@Service
public class SearchSymbolServiceImpl
        extends CrudServiceImpl<SearchSymbolDao, SearchSymbolEntity, SearchSymbolDTO>
        implements SearchSymbolService {

    @Override
    public Wrapper<SearchSymbolEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");
        String symbolLabel = (String) params.get("symbolLabel");
        String symbolValue = (String) params.get("symbolValue");

        return Wrappers.<SearchSymbolEntity>lambdaQuery()
                .eq(SearchSymbolEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .eq(StringUtils.isNotBlank(id), SearchSymbolEntity::getId, id)
                .like(StringUtils.isNotBlank(symbolLabel), SearchSymbolEntity::getSymbolLabel, symbolLabel)
                .eq(StringUtils.isNotBlank(symbolValue), SearchSymbolEntity::getSymbolValue, symbolValue)
                .orderByAsc(SearchSymbolEntity::getSort)
                .orderByAsc(SearchSymbolEntity::getId);
    }
}