package com.jiayuan.modules.export.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.export.entity.ExportRecordFieldContentEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 数据导出记录字段信息(高级导出)选择内容
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Mapper
public interface ExportRecordFieldContentDao extends BaseDao<ExportRecordFieldContentEntity> {

}