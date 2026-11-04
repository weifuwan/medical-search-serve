
package com.jiayuan.modules.sys.service;

import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.BaseService;
import com.jiayuan.modules.sys.dto.SysDictDataDTO;
import com.jiayuan.modules.sys.entity.SysDictDataEntity;

import java.util.List;
import java.util.Map;

/**
 * @Title: SysDictDataService
 * @Package: com.jiayuan.modules.sys.service
 * @Description: 字典数据
 * @Author: 李建奎
 * @Date: 创建时间 2023-02-03
 */
public interface SysDictDataService extends BaseService<SysDictDataEntity> {

    PageData<SysDictDataDTO> page(Map<String, Object> params);

    SysDictDataDTO get(Long id);

    void save(SysDictDataDTO dto);

    void update(SysDictDataDTO dto);

    void delete(Long[] ids);

    /**
     * 加载字典缓存
     */
    void loadingDictCache();

    /**
     * 重置字典缓存
     */
    void resetDictCache();

    /**
     * 清空字典缓存
     */
    void clearDictCache();

    /**
     * 字典列表查询
     *
     * @param type
     * @return
     */
    List<SysDictDataDTO> findListByType(String type);

    /**
     * 字典列表批量查询（空就是查询全部）
     *
     * @param typeList
     * @return
     */
    Map<String, List<SysDictDataDTO>> findListByBatchType(List<String> typeList);
}