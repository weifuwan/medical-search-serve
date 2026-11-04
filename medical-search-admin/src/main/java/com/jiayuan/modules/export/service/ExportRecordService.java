package com.jiayuan.modules.export.service;

import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.export.dto.ExportRecordDTO;
import com.jiayuan.modules.export.dto.ExportSearchResultDTO;
import com.jiayuan.modules.export.dto.SeniorExportRecordDTO;
import com.jiayuan.modules.export.entity.ExportRecordEntity;
import com.jiayuan.modules.security.user.UserDetail;

/**
 * 数据导出记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
public interface ExportRecordService extends CrudService<ExportRecordEntity, ExportRecordDTO> {

    /**
     * 保存导出记录
     *
     * @param searchResult 检索结果
     * @param exportType   导出类型
     */
    ExportRecordDTO save(ExportSearchResultDTO searchResult, BizConstant.ExportType exportType, UserDetail curUser);

    /**
     * 开启导出任务
     */
    ExportRecordDTO startExportTask(ExportSearchResultDTO searchResult, BizConstant.ExportType exportType);


    /**
     * 结束导出任务
     *
     * @param searchResult 搜索结果
     * @param exportRecord 导出记录
     */
    void endExportTask(ExportSearchResultDTO searchResult, ExportRecordDTO exportRecord);

    /**
     * 高级导出，保存选择字段和字段的内容
     *
     * @param exportId        导出记录ID
     * @param selectFieldList 选择的字段和字段内容
     */
    void saveField(Long exportId, SeniorExportRecordDTO selectFieldList);


    /**
     * 检查是否存在正在导出的任务
     *
     * @param saveDataId 数据保存id
     * @return
     */
    boolean checkExportTask(Long saveDataId);

}