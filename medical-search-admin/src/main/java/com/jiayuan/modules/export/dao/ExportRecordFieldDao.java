package com.jiayuan.modules.export.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.export.dto.SeniorExportRecordFieldContentDTO;
import com.jiayuan.modules.export.dto.SeniorExportRecordFieldDTO;
import com.jiayuan.modules.export.entity.ExportRecordFieldEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 数据导出记录字段信息(高级导出)
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Mapper
public interface ExportRecordFieldDao extends BaseDao<ExportRecordFieldEntity> {

    /**
     * 高级导出excel表头
     *
     * @param exportRecordId 导出记录ID
     * @return
     */
    List<SeniorExportRecordFieldDTO> querySeniorTableHeader(@Param("exportRecordId") Long exportRecordId);

    /**
     * 查询选择字段的多选内容
     *
     * @param fieldId 选择字段主键ID
     * @return
     */
    List<SeniorExportRecordFieldContentDTO> queryFieldContent(@Param("fieldId") Long fieldId);
}