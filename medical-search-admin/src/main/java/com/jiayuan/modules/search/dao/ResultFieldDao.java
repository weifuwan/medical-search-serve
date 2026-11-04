package com.jiayuan.modules.search.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.search.entity.ResultFieldEntity;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 返回结果表头
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Mapper
public interface ResultFieldDao extends BaseDao<ResultFieldEntity> {

    /**
     * 获取默认显示字段列表
     *
     * @param userId
     * @return
     */
    List<FieldDTO> getUserSaveFieldList(@Param(value = "userId") Long userId);

    /**
     * 获取字段列表
     *
     * @param ids
     * @return
     */
    List<FieldDTO> getFieldList(List<Long> ids);

    /**
     * 获取默认配置字段列表
     *
     * @return
     */
    List<FieldDTO> getDefaultShowFieldList();

    /**
     * 获取需要更新的表头id
     *
     * @param tfCodeList
     * @return
     */
    List<Long> getNeedUpdateConfigIds(List<String> tfCodeList);
}