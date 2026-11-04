package com.jiayuan.modules.sys.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.sys.entity.SysConfigEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 系统配置表
 *
 * @author lijiankui
 * @since 1.0.0 2023-11-22
 */
@Mapper
public interface SysConfigDao extends BaseDao<SysConfigEntity> {

}