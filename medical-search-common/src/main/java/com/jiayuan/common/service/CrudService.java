package com.jiayuan.common.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.jiayuan.common.page.PageData;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @Title: CrudService
 * @Package: com.jiayuan.common.service
 * @Description: CRUD基础服务接口 这一层主要与 D 交互 命名：save|get|list
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-17
 */
public interface CrudService<T, D> extends BaseService<T> {

    /**
     * 分页检索
     *
     * @param params
     * @return
     */
    PageData<D> page(Map<String, Object> params);

    /**
     * 列表检索
     *
     * @param params
     * @return
     */
    List<D> list(Map<String, Object> params);

    /**
     * 列表检索
     *
     * @param queryWrapper
     * @return
     */
    List<D> list(Wrapper<T> queryWrapper);

    D get(Long id);

    void save(D dto);

    void update(D dto);

    /**
     * 批量删除
     *
     * @param ids
     */
    void delete(Long[] ids);

    /**
     * 批量逻辑删除
     *
     * @param ids
     * @throws Exception
     */
    void deletedLogicallyBatchIds(Long[] ids) throws Exception;

    /**
     * 单个检索
     *
     * @param queryWrapper
     * @return
     */
    D selectOne(Wrapper<T> queryWrapper);

    T selectOneWithWrapper(Wrapper<T> queryWrapper);

    /**
     * 列表检索（返回map结构）
     *
     * @param queryWrapper
     * @return
     */
    List<Map<String, Object>> selectMaps(Wrapper<T> queryWrapper);

    /**
     * 批量保存
     *
     * @param dtoList
     */
    void saveBatch(List<D> dtoList);


    /**
     * 保存或更新
     *
     * @param dto
     * @return
     */
    boolean saveOrUpdate(D dto);


    /**
     * 批量修改插入
     *
     * @param dtoList   实体对象集合
     * @param batchSize 每次的数量
     * @return
     */
    boolean saveOrUpdateDtoBatch(Collection<D> dtoList, int batchSize);
}