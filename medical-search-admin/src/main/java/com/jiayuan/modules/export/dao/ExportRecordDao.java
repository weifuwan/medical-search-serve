package com.jiayuan.modules.export.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.export.entity.ExportRecordEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 数据导出记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Mapper
public interface ExportRecordDao extends BaseDao<ExportRecordEntity> {

}