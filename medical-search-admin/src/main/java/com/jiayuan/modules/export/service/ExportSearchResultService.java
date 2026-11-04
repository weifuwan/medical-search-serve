package com.jiayuan.modules.export.service;

import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.export.dto.ExportSearchResultDTO;
import com.jiayuan.modules.export.dto.ExportSearchResultDimensionDTO;
import com.jiayuan.modules.export.dto.SeniorExportRecordDTO;
import com.jiayuan.modules.export.dto.SeniorExportRecordFieldDTO;
import com.jiayuan.modules.export.entity.ExportSearchResultEntity;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.template.dto.FieldDTO;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Set;

/**
 * 数据检索保存记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
public interface ExportSearchResultService extends CrudService<ExportSearchResultEntity, ExportSearchResultDTO> {

    /**
     * 高级导出excel表头
     *
     * @param exportRecordId 导出记录ID
     * @return
     */
    List<SeniorExportRecordFieldDTO> querySeniorColumnList(Long exportRecordId);

    /**
     * ES检索数据
     *
     * @param searchRequest 检索参数
     * @return
     */
    EsPageData search(SearchRequest searchRequest);

    /**
     * 构造高级检索参数
     *
     * @param expression      表达式
     * @param dimension       维度
     * @param orderTableCode  排序表编码
     * @param orderFieldCode  排序字段编码
     * @param order           排序方式
     * @param page            开始页
     * @param size            每页数量
     * @param selectFieldList 选择字段集合
     * @param recordId        数据保存记录id
     * @return
     */
    SearchRequest buildSeniorParam(String expression, Integer dimension, String orderTableCode, String orderFieldCode,
                                   String order, Integer page, Integer size, List<SeniorExportRecordFieldDTO> selectFieldList,
                                   Long recordId);

    /**
     * 导出
     *
     * @param pageData      首次查询数据
     * @param searchRequest 请求体
     */
    String export(String fileName, EsPageData pageData, SearchRequest searchRequest);

    /**
     * 导出v2
     *
     * @param pageData      首次查询数据
     * @param searchRequest 请求体
     */
    String exportV2(String fileName, EsPageData pageData, SearchRequest searchRequest);


    /**
     * 保存数据检索记录
     *
     * @param dto
     */
    void saveDataSearchRecord(ExportSearchResultDTO dto);

    /**
     * 数据检索升级
     *
     * @param dto
     */
    void updateDataSearchRecord(ExportSearchResultDimensionDTO dto);


    /**
     * 基本导出
     *
     * @param taskRecordId
     * @param searchResult
     */
    void basicForExport(Long taskRecordId, ExportSearchResultDTO searchResult);

    /**
     * 基本导出V2
     *
     * @param taskRecordId
     * @param searchResult
     */
    void basicForExportV2(Long taskRecordId, String searchName, ExportSearchResultDTO searchResult);


    /**
     * 高级导出
     *
     * @param seniorExportRecordDTO
     * @param taskRecordId
     * @param searchResult
     */
    void seniorForExport(Long taskRecordId, SeniorExportRecordDTO seniorExportRecordDTO, ExportSearchResultDTO searchResult);


    /**
     * 基本导出V2
     *
     * @param taskRecordId
     * @param searchResult
     */
    void seniorForExportV2(Long taskRecordId, String searchName, ExportSearchResultDTO searchResult);

    /**
     * 获取导出字段列表
     *
     * @param saveDataId
     * @return
     */
    Set<FieldDTO> getExportSearchFields(Long saveDataId);
}