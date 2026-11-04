package com.jiayuan.modules.search.service;

import com.jiayuan.common.service.CrudService;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.modules.search.dto.ResultFieldDTO;
import com.jiayuan.modules.search.dto.SortDTO;
import com.jiayuan.modules.search.entity.ResultFieldEntity;
import com.jiayuan.modules.template.dto.FieldDTO;

import java.util.List;

/**
 * @Title: ResultFieldService
 * @Package: com.jiayuan.modules.search.service
 * @Description: 返回结果表头
 * @Author: 李建奎
 * @Date: 创建时间 2022-12-09
 */
public interface ResultFieldService extends CrudService<ResultFieldEntity, ResultFieldDTO> {

    /**
     * 获取默认显示字段列表
     *
     * @return
     */
    List<FieldDTO> getUserShowFieldList();

    /**
     * 获取字段列表
     *
     * @param ids
     * @return
     */
    List<FieldDTO> getFieldList(List<Long> ids);

    /**
     * 批量保存
     *
     * @param list
     */
    void userShowFieldBatchSave(List<ResultFieldDTO> list);


    /**
     * 修改
     *
     * @param dto
     */
    void updateResultField(ResultFieldDTO dto);

    /**
     * 显示表头重置
     */
    void defaultTitleReset();

    /**
     * 排序
     *
     * @param list
     */
    void sort(ValidList<SortDTO> list);

    /**
     * 获取默认显示字段列表
     *
     * @return
     */
    List<FieldDTO> getDefaultShowFieldList();

    /**
     * 默认显示字段批量配置
     *
     * @param list
     */
    void defaultShowFieldBatchSave(ValidList<ResultFieldDTO> list);

    /**
     * 获取需要更新的表头id
     *
     * @param tfCodeList
     * @return
     */
    List<Long> getNeedUpdateConfigIds(List<String> tfCodeList);
}