
package com.jiayuan.modules.sys.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.sys.entity.DictType;
import com.jiayuan.modules.sys.entity.SysDictTypeEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 字典类型
 *
 * @author lijiankui
 */
@Mapper
public interface SysDictTypeDao extends BaseDao<SysDictTypeEntity> {

    /**
     * 字典类型列表
     */
    List<DictType> getDictTypeList();

}
