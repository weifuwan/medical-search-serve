package com.jiayuan.modules.template.service;

import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.template.dto.TableFieldCodePair;
import org.apache.commons.lang3.tuple.Pair;
import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.dto.TableFieldDTO;
import com.jiayuan.modules.template.entity.TableFieldEntity;

import java.util.List;
import java.util.Set;

/**
 * @Title: TableFieldService
 * @Package: com.jiayuan.modules.template.service
 * @Description: 字段Service
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-11
 */
public interface TableFieldService extends CrudService<TableFieldEntity, TableFieldDTO> {

    /**
     * 获取字段列表
     *
     * @param tableId
     * @param fieldName
     * @return
     */
    List<TableFieldDTO> getFieldList(Long tableId, String fieldName);

    /**
     * 获取字段列表
     *
     * @param fieldName
     * @param tableName
     * @return
     */
    FieldDTO getField(String fieldName, String tableName);

    /**
     * 获取字段列表
     *
     * @param fieldIds
     * @return
     */
    List<FieldDTO> getFieldList(List<Long> fieldIds);

    /**
     * 字段数据保存
     *
     * @param dto
     */
    void saveTableField(TableFieldDTO dto);

    /**
     * 更新字段
     *
     * @param dto
     */
    void updateTableField(TableFieldDTO dto);

    /**
     * 清空所有数据(排除掉就诊主表)
     */
    void deleteAll();


    /**
     * 根据表进行删除
     */
    void deleteByTableCode(long tableId);


    /**
     * 获取所有字段
     *
     * @return
     */
    List<TableFieldEntity> findList();


    /**
     * 获取主键字段列表
     */
    List<FieldDTO> getPrimaryFieldList(Set<Long> tableIds);

    /**
     * 根据表和字段获取列表信息
     */
    List<FieldDTO> getFieldListByCodes(List<TableFieldCodePair> codePairs);

    /**
     * 切换表字段展示情况
     */
    void switchFieldsStatus(TableFieldDTO dto);

    /**
     * 获取需要展示的字段列表
     */
    List<FieldDTO> getShowFieldsByTableId(String tableId);
}