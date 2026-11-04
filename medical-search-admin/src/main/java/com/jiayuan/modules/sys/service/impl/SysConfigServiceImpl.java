package com.jiayuan.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.cache.SysConfigCache;
import com.jiayuan.common.constant.SysConstant;
import com.jiayuan.common.dto.KeyValue;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.modules.sys.dao.SysConfigDao;
import com.jiayuan.modules.sys.dto.SysConfigDTO;
import com.jiayuan.modules.sys.entity.SysConfigEntity;
import com.jiayuan.modules.sys.service.SysConfigService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * 系统配置表
 *
 * @author lijiankui
 * @since 1.0.0 2023-11-22
 */
@Service
public class SysConfigServiceImpl extends CrudServiceImpl<SysConfigDao, SysConfigEntity, SysConfigDTO> implements SysConfigService {

    @Override
    public QueryWrapper<SysConfigEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        QueryWrapper<SysConfigEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


    @Override
    public List<SysConfigDTO> findList() {
        return this.list(Wrappers.<SysConfigEntity>lambdaQuery()
                .eq(SysConfigEntity::getWebShow, "Y")
                .eq(SysConfigEntity::getSysId, SysConstant.SYS_ID)
                .orderByAsc(SysConfigEntity::getModuleId)
                .orderByAsc(SysConfigEntity::getSortCode)
        );
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateByConfigCode(ValidList<KeyValue> configList) {
        if (CollectionUtil.isNotEmpty(configList)) {
            configList.forEach(e -> {
                final String key = e.getKey().toString();
                this.update(new SysConfigEntity(), Wrappers.<SysConfigEntity>lambdaUpdate()
                        .eq(SysConfigEntity::getConfigCode, key)
                        .set(SysConfigEntity::getConfigValue, e.getValue()));
                //缓存移除
                SysConfigCache.removeCache(key);
            });
        }
    }

    @Override
    public SysConfigEntity getByCode(String configCode) {
        if (StrUtil.isNotBlank(configCode)) {
            return this.baseDao.selectOne(Wrappers.<SysConfigEntity>lambdaQuery()
                    .eq(SysConfigEntity::getConfigCode, configCode)
                    .eq(SysConfigEntity::getSysId, "CBDSES"));
        }
        return null;
    }
}