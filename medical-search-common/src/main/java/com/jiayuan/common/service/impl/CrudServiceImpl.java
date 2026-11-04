package com.jiayuan.common.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ReflectionKit;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.CrudService;
import com.jiayuan.common.utils.ConvertUtils;
import org.springframework.beans.BeanUtils;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @Title: CrudServiceImpl
 * @Package: com.jiayuan.common.service.impl
 * @Description: CRUD基础服务类
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-04
 */
public abstract class CrudServiceImpl<M extends BaseMapper<T>, T, D> extends BaseServiceImpl<M, T> implements CrudService<T, D> {

    protected Class<D> currentDtoClass() {
        return (Class<D>) ReflectionKit.getSuperClassGenericType(getClass(), CrudServiceImpl.class, 2);
    }

    @Override
    public PageData<D> page(Map<String, Object> params) {
        IPage<T> page = baseDao.selectPage(
                getPage(params, null, false),
                getWrapper(params)
        );

        return getPageData(page, currentDtoClass());
    }

    @Override
    public List<D> list(Map<String, Object> params) {
        List<T> entityList = baseDao.selectList(getWrapper(params));

        return ConvertUtils.sourceToTarget(entityList, currentDtoClass());
    }

    public abstract Wrapper<T> getWrapper(Map<String, Object> params);

    @Override
    public D get(Long id) {
        T entity = baseDao.selectById(id);

        return ConvertUtils.sourceToTarget(entity, currentDtoClass());
    }

    @Override
    public void save(D dto) {
        T entity = ConvertUtils.sourceToTarget(dto, currentModelClass());
        insert(entity);

        //copy主键值到dto
        BeanUtils.copyProperties(entity, dto);
    }

    @Override
    public void update(D dto) {
        T entity = ConvertUtils.sourceToTarget(dto, currentModelClass());
        updateById(entity);
    }

    @Override
    public void delete(Long[] ids) {
        baseDao.deleteBatchIds(Arrays.asList(ids));
    }

    @Override
    public void deletedLogicallyBatchIds(Long[] ids) throws Exception {
        final UpdateWrapper<T> updateWrapper = new UpdateWrapper<>();
        updateWrapper.in(Constant.ID, ids).set(Constant.IS_DELETED, BooleanEnum.TRUE.getCode());
        baseDao.update(null, updateWrapper);
    }

    @Override
    public D selectOne(Wrapper<T> queryWrapper) {
        final T entity = baseDao.selectOne(queryWrapper);
        return ConvertUtils.sourceToTarget(entity, currentDtoClass());
    }

    @Override
    public T selectOneWithWrapper(Wrapper<T> queryWrapper) {
        return baseDao.selectOne(queryWrapper);
    }

    @Override
    public List<Map<String, Object>> selectMaps(Wrapper<T> queryWrapper) {
        return baseDao.selectMaps(queryWrapper);
    }


    @Override
    public List<D> list(Wrapper<T> queryWrapper) {
        List<T> entityList = baseDao.selectList(queryWrapper);
        return ConvertUtils.sourceToTarget(entityList, currentDtoClass());
    }

    @Override
    public void saveBatch(List<D> dtoList) {
        if (CollectionUtil.isEmpty(dtoList)) {
            return;
        }
        final List<T> entityList = ConvertUtils.sourceToTarget(dtoList, currentModelClass());
        this.insertBatch(entityList);
    }

    @Override
    public boolean saveOrUpdate(D dto) {
        T entity = ConvertUtils.sourceToTarget(dto, currentModelClass());
        final boolean success = this.insertOrUpdate(entity);
        //copy主键值到dto
        BeanUtils.copyProperties(entity, dto);
        return success;
    }

    @Override
    public boolean saveOrUpdateDtoBatch(Collection<D> dtoList, int batchSize) {
        if (CollectionUtil.isNotEmpty(dtoList)) {
            final List<T> entityList = ConvertUtils.sourceToTarget(dtoList, currentModelClass());
            this.saveOrUpdateBatch(entityList,entityList.size());
        }
        return true;
    }
}