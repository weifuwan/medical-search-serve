package com.jiayuan.modules.search.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.search.dto.KeywordConfigDTO;
import com.jiayuan.modules.search.entity.KeywordConfigEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 关键字检索配置
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Mapper
public interface KeywordConfigDao extends BaseDao<KeywordConfigEntity> {


    /**
     * 默认检索字段列表
     *
     * @param userId
     * @return
     */
    List<KeywordConfigDTO> getDefaultSearchFieldList(@Param(value = "userId") Long userId);

    /**
     * 获取不需要更新的配置ids
     *
     * @param tfCodeList
     * @return
     */
    List<Long> getNeedUpdateConfigIds(List<String> tfCodeList);
}