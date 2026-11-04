
package com.jiayuan.modules.sys.service;

import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.BaseService;
import com.jiayuan.modules.sys.dto.SysDictTypeDTO;
import com.jiayuan.modules.sys.entity.DictType;
import com.jiayuan.modules.sys.entity.SysDictTypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 数据字典
 *
 * @author lijiankui
 */
public interface SysDictTypeService extends BaseService<SysDictTypeEntity> {

    PageData<SysDictTypeDTO> page(Map<String, Object> params);

    SysDictTypeDTO get(Long id);

    void save(SysDictTypeDTO dto);

    void update(SysDictTypeDTO dto);

    void delete(Long[] ids);

    /**
     * 获取所有字典
     */
    List<DictType> getAllList();

}