package com.jiayuan.modules.search.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.search.dao.KeywordConfigDao;
import com.jiayuan.modules.search.dto.KeywordConfigDTO;
import com.jiayuan.modules.search.entity.KeywordConfigEntity;
import com.jiayuan.modules.search.service.KeywordConfigService;
import com.jiayuan.modules.security.user.SecurityUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 关键字检索配置
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Service
public class KeywordConfigServiceImpl extends CrudServiceImpl<KeywordConfigDao, KeywordConfigEntity, KeywordConfigDTO> implements KeywordConfigService {

    @Override
    public QueryWrapper<KeywordConfigEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        QueryWrapper<KeywordConfigEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }

    @Override
    public List<KeywordConfigDTO> getDefaultSearchFieldList() {
        List<KeywordConfigDTO> list = this.baseDao.getDefaultSearchFieldList(SecurityUser.getUserId());
        return list;
    }


    @Override
    public void saveKeywordConfig(KeywordConfigDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        if (BooleanEnum.FALSE.getCode().equals(dto.getIsDefault())) {
            dto.setUserId(SecurityUser.getUserId());
        }
        initialization(dto);
        this.save(dto);
    }

    @Override
    public void updateKeywordConfig(KeywordConfigDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        if (BooleanEnum.FALSE.getCode().equals(dto.getIsDefault())) {
            dto.setUserId(SecurityUser.getUserId());
        }
        this.update(dto);
    }

    @Override
    public void deleteKeywordConfig(Long[] ids) {
        //效验数据
        AssertUtils.isArrayEmpty(ids, "id");
        final List<KeywordConfigEntity> list = this.baseDao.selectList(Wrappers.<KeywordConfigEntity>lambdaQuery()
                .in(KeywordConfigEntity::getId, ids)
                .eq(KeywordConfigEntity::getIsDefault, BooleanEnum.TRUE.getCode()));
        if (CollectionUtil.isNotEmpty(list)) {
            throw new BizException("默认检索配置项不能删除");
        }

        this.delete(ids);
    }

    @Override
    public void defaultSearchItemReset() {
        //重置：删除用户自定义配置项
        this.baseDao.delete(Wrappers.<KeywordConfigEntity>lambdaQuery()
                .eq(KeywordConfigEntity::getUserId, SecurityUser.getUserId())
                .eq(KeywordConfigEntity::getIsDefault, BooleanEnum.FALSE.getCode())
        );
    }

    @Override
    public void saveBatch(ValidList<KeywordConfigDTO> list) {
        if (CollectionUtil.isEmpty(list)) {
            return;
        }
        ValidatorUtils.validateEntity(list);
        final List<KeywordConfigDTO> defaultFieldList = this.getDefaultSearchFieldList();
        final List<String> existList = defaultFieldList.stream().map(e -> e.getTableCode() + e.getFieldCode()).collect(Collectors.toList());
        final List<KeywordConfigDTO> collect = list.stream().filter(e -> nonContain(e, existList)).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(collect)) {
            collect.forEach(e -> initialization(e));
            final List<KeywordConfigEntity> entities = ConvertUtils.sourceToTarget(collect, KeywordConfigEntity.class);
            this.insertBatch(entities);
        }
    }

    @Override
    public List<Long> getNeedUpdateConfigIds(List<String> tfCodeList) {
        return this.baseDao.getNeedUpdateConfigIds(tfCodeList);
    }

    /**
     * 不包含
     *
     * @param e
     * @param existList
     * @return
     */
    private boolean nonContain(KeywordConfigDTO e, List<String> existList) {
        return BooleanEnum.FALSE.getCode().equals(e.getIsDefault()) &&
                !existList.contains(e.getTableCode() + e.getFieldCode());
    }

    /**
     * 初始化
     *
     * @param e
     */
    private void initialization(KeywordConfigDTO e) {
        e.setKeywordType(BizConstant.KeywordType.DEFAULT.getCode());
        e.setIsDefault(0);
        e.setIsConvert(0);
        e.setUserId(SecurityUser.getUserId());
    }


}