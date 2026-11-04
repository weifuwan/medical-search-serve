package com.jiayuan.modules.export.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.export.entity.ExportSearchFieldEntity;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 数据保存显示字段
 *
 * @author lijiankui
 * @since 1.0.0 2024-10-08
 */
@Mapper
public interface ExportSearchFieldDao extends BaseDao<ExportSearchFieldEntity> {

    /**
     * 获取数据保存关联显示字段列表
     *
     * @param saveRecordId
     * @return
     */
    List<FieldDTO> findList(@Param(value = "saveRecordId") Long saveRecordId);
}