package com.jiayuan.modules.template.service;

import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.template.dto.TableDTO;
import com.jiayuan.modules.template.entity.TableEntity;
import com.jiayuan.modules.template.request.MetaSearchRequest;

import java.util.List;

/**
 * 表
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
public interface TableService extends CrudService<TableEntity, TableDTO> {


    /**
     * 获取所有的表列表
     *
     * @param tableName  表名
     * @param include    是否需要包含字段
     * @param classifyId 分类id
     * @return
     */
    List<TableDTO> getTableList(String tableName, boolean include, Long classifyId);

    /**
     * 保存表数据
     *
     * @param dto
     */
    void saveTable(TableDTO dto);

    /**
     * 更新表数据
     *
     * @param dto
     */
    void updateTable(TableDTO dto);

    /**
     * 元数据备份
     */
    void metaDataBackup();

    /**
     * 清空所有数据(排除掉就诊主表)
     */
    void deleteAll();

    /**
     * 获取表信息
     *
     * @param request
     * @return
     */
    List<TableDTO> getTableInfo(MetaSearchRequest request);

    /**
     * 查询表信息
     *
     * @param request
     * @return
     */
    List<TableDTO> findTableInfo(MetaSearchRequest request);


    /**
     * 更新表的显示状态
     *
     * @param tableId
     * @param isShow
     */
    void updateDisplayStatus(Long tableId, Boolean isShow);
}