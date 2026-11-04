package com.jiayuan.modules.export.service;

import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.export.dto.ExportRecycleBinDTO;
import com.jiayuan.modules.export.dto.ExportSearchResultDTO;
import com.jiayuan.modules.export.entity.ExportRecycleBinEntity;

/**
 * 数据检索保存记录回收站
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
public interface ExportRecycleBinService extends CrudService<ExportRecycleBinEntity, ExportRecycleBinDTO> {


    /**
     * 撤销
     *
     * @param ids 主键集合
     * @throws Exception
     */
    void revoke(Long[] ids) throws Exception;

    /**
     * 清理过期回收站
     */
    void clear();

    /**
     * 回收站保存
     *
     * @param exportSearchResultDTO 检索记录
     */
    void save(ExportSearchResultDTO exportSearchResultDTO);

}