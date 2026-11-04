package com.jiayuan.modules.search.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.search.entity.LogSearchEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 检索日志
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Mapper
public interface LogSearchDao extends BaseDao<LogSearchEntity> {

}