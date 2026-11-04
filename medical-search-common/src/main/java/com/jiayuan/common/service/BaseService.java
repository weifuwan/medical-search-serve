
package com.jiayuan.common.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

/**
 * @Title: BaseService
 * @Package: com.jiayuan.common.service
 * @Description: 基础服务接口，所有Service接口都要继承 这一层主要与 T 交互 命名：insert|update|select
 * @Author: 李建奎
 * @Date: 创建时间 2022-12-09
 */
public interface BaseService<T> {
    Class<T> currentModelClass();

    /**
     * <p>
     * 插入一条记录（选择字段，策略插入）
     * </p>
     *
     * @param entity 实体对象
     */
    boolean insert(T entity);

    /**
     * <p>
     * 插入（批量），该方法不支持 Oracle、SQL Server
     * </p>
     *
     * @param entityList 实体对象集合
     */
    boolean insertBatch(Collection<T> entityList);

    /**
     * <p>
     * 插入（批量），该方法不支持 Oracle、SQL Server
     * </p>
     *
     * @param entityList 实体对象集合
     * @param batchSize  插入批次数量
     */
    boolean insertBatch(Collection<T> entityList, int batchSize);

    /**
     * <p>
     * 根据 ID 选择修改
     * </p>
     *
     * @param entity 实体对象
     */
    boolean updateById(T entity);

    /**
     * <p>
     * 根据 whereEntity 条件，更新记录
     * </p>
     *
     * @param entity        实体对象
     * @param updateWrapper 实体对象封装操作类 {@link com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper}
     */
    boolean update(T entity, Wrapper<T> updateWrapper);

    /**
     * <p>
     * 根据ID 批量更新
     * </p>
     *
     * @param entityList 实体对象集合
     */
    boolean updateBatchById(Collection<T> entityList);

    /**
     * <p>
     * 根据ID 批量更新
     * </p>
     *
     * @param entityList 实体对象集合
     * @param batchSize  更新批次数量
     */
    boolean updateBatchById(Collection<T> entityList, int batchSize);

    /**
     * <p>
     * 根据 ID 查询
     * </p>
     *
     * @param id 主键ID
     */
    T selectById(Serializable id);

    /**
     * <p>
     * 根据 ID 删除
     * </p>
     *
     * @param id 主键ID
     */
    boolean deleteById(Serializable id);

    /**
     * <p>
     * 删除（根据ID 批量删除）
     * </p>
     *
     * @param idList 主键ID列表
     */
    boolean deleteBatchIds(Collection<? extends Serializable> idList);


    /**
     * 保存或更新
     *
     * @param entity
     * @return
     */
    boolean insertOrUpdate(T entity);

    /**
     * 列表
     *
     * @param queryWrapper
     * @return
     */
    List<T> selectList(Wrapper<T> queryWrapper);


    /**
     * 批量修改插入
     *
     * @param entityList 实体对象集合
     * @param batchSize  每次的数量
     */
    boolean saveOrUpdateBatch(Collection<T> entityList, int batchSize);
}