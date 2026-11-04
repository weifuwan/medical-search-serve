
package com.jiayuan.modules.sys.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.sys.entity.DictData;
import com.jiayuan.modules.sys.entity.SysDictDataEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Title: SysDictDataDao
 * @Package: com.jiayuan.modules.sys.dao
 * @Description: 字典数据
 * @Author: 李建奎
 * @Date: 创建时间 2023-02-03
 */
@Mapper
public interface SysDictDataDao extends BaseDao<SysDictDataEntity> {

    /**
     * 字典数据列表
     *
     * @return
     */
    List<DictData> getDictDataList();
}
