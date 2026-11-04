
package com.jiayuan.modules.sys.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.cache.DictCache;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.impl.BaseServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.modules.sys.dao.SysDictDataDao;
import com.jiayuan.modules.sys.dto.SysDictDataDTO;
import com.jiayuan.modules.sys.entity.SysDictDataEntity;
import com.jiayuan.modules.sys.service.SysDictDataService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 字典类型
 *
 * @author lijiankui
 */
@Service
public class SysDictDataServiceImpl extends BaseServiceImpl<SysDictDataDao, SysDictDataEntity> implements SysDictDataService {


    @Override
    public PageData<SysDictDataDTO> page(Map<String, Object> params) {
        IPage<SysDictDataEntity> page = baseDao.selectPage(
                getPage(params, "sort", true),
                getWrapper(params)
        );

        return getPageData(page, SysDictDataDTO.class);
    }

    private QueryWrapper<SysDictDataEntity> getWrapper(Map<String, Object> params) {
        String dictTypeId = (String) params.get("dictTypeId");
        String dictLabel = (String) params.get("dictLabel");
        String dictValue = (String) params.get("dictValue");

        QueryWrapper<SysDictDataEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("dict_type_id", dictTypeId);
        wrapper.like(StringUtils.isNotBlank(dictLabel), "dict_label", dictLabel);
        wrapper.like(StringUtils.isNotBlank(dictValue), "dict_value", dictValue);

        return wrapper;
    }

    @Override
    public SysDictDataDTO get(Long id) {
        SysDictDataEntity entity = baseDao.selectById(id);

        return ConvertUtils.sourceToTarget(entity, SysDictDataDTO.class);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(SysDictDataDTO dto) {
        SysDictDataEntity entity = ConvertUtils.sourceToTarget(dto, SysDictDataEntity.class);

        insert(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(SysDictDataDTO dto) {
        SysDictDataEntity entity = ConvertUtils.sourceToTarget(dto, SysDictDataEntity.class);

        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long[] ids) {
        //删除
        deleteBatchIds(Arrays.asList(ids));
    }


    @Override
    public Map<String, List<SysDictDataDTO>> findListByBatchType(List<String> typeList) {
        final List<SysDictDataEntity> entities = this.selectList(Wrappers.<SysDictDataEntity>lambdaQuery()
                .in(CollectionUtil.isNotEmpty(typeList), SysDictDataEntity::getDictType, typeList));
        if (CollectionUtil.isNotEmpty(entities)) {
            Map<String, List<SysDictDataDTO>> result = new HashMap<>(16);
            final Map<String, List<SysDictDataEntity>> collect = entities.stream().collect(Collectors.groupingBy(SysDictDataEntity::getDictType));
            collect.entrySet().forEach(entry -> {
                final List<SysDictDataDTO> list = ConvertUtils.sourceToTarget(entry.getValue(), SysDictDataDTO.class);
                result.put(entry.getKey(), list);
            });
            return result;
        }
        return null;
    }

    @Override
    public List<SysDictDataDTO> findListByType(String type) {
        Assert.notNull(type, "字典类型不能为空");
        final List<SysDictDataEntity> entities = this.selectList(Wrappers.<SysDictDataEntity>lambdaQuery()
                .eq(SysDictDataEntity::getDictType, type));
        if (CollectionUtil.isNotEmpty(entities)) {
            final List<SysDictDataDTO> result = ConvertUtils.sourceToTarget(entities, SysDictDataDTO.class);
            return result;
        }
        return null;
    }



    @Override
    public void loadingDictCache() {
        Map<String, List<SysDictDataEntity>> dictDataMap = this.selectList(Wrappers.emptyWrapper()).stream().collect(Collectors.groupingBy(SysDictDataEntity::getDictType));
        for (Map.Entry<String, List<SysDictDataEntity>> entry : dictDataMap.entrySet()) {
            final Map<String, String> collect = entry.getValue().stream().collect(Collectors.toMap(SysDictDataEntity::getDictValue, SysDictDataEntity::getDictLabel));
            DictCache.setDictCache(entry.getKey(), collect);
        }
    }

    @Override
    public void resetDictCache() {
        this.clearDictCache();
        this.loadingDictCache();
    }

    @Override
    public void clearDictCache() {
        DictCache.clearDictCache();
    }
}