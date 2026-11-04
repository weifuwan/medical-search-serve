package com.jiayuan.modules.template.dao;

import com.jiayuan.modules.template.dto.TableFieldCodePair;
import org.apache.commons.lang3.tuple.Pair;
import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * 字段
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Mapper
public interface TableFieldDao extends BaseDao<TableFieldEntity> {

    /**
     * 获取字段列表
     *
     * @param fieldName
     * @param tableName
     * @return
     */
    FieldDTO getField(@Param(value = "fieldName") String fieldName, @Param(value = "tableName") String tableName);

    /**
     * 获取字段列表
     *
     * @param fieldIds
     * @return
     */
    List<FieldDTO> getFieldListByFieldIds(List<Long> fieldIds);

    /**
     * 删除
     *
     * @param msVisitRecord
     */
    @InterceptorIgnore(blockAttack = "true")
    void deleteAll(@Param(value = "msVisitRecord") String msVisitRecord);


    /**
     * 获取主键字段列表
     *
     * @param tableIds
     * @return
     */
    List<FieldDTO> getPrimaryFieldList(@Param(value = "tableIds") Set<Long> tableIds);

    /**
     * 根据code获取
     */
    List<FieldDTO> getFieldListByCodes(List<TableFieldCodePair> codePairs);


    /**
     * 切换字段状态
     */
    void switchShowStatus(@Param(value = "isShow") boolean isShow, @Param(value = "tableCode") String tableCode, @Param(value = "fieldCode") String fieldCode);

    /**
     * 根据表名获取字段列表
     */
    List<FieldDTO> getShowFieldsByTableId(@Param(value = "tableCode") String tableCode);
}