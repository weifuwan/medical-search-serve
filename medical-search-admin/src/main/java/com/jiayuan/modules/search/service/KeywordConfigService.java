package com.jiayuan.modules.search.service;

import com.jiayuan.common.service.CrudService;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.modules.search.dto.KeywordConfigDTO;
import com.jiayuan.modules.search.entity.KeywordConfigEntity;

import java.util.List;

/**
 * @Title: KeywordConfigService
 * @Package: com.jiayuan.modules.search.service
 * @Description: 关键字检索配置
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-18
 */
public interface KeywordConfigService extends CrudService<KeywordConfigEntity, KeywordConfigDTO> {


    /**
     * 默认检索字段列表
     *
     * @return
     */
    List<KeywordConfigDTO> getDefaultSearchFieldList();


    /**
     * 保存
     *
     * @param dto
     */
    void saveKeywordConfig(KeywordConfigDTO dto);

    /**
     * 修改
     *
     * @param dto
     */
    void updateKeywordConfig(KeywordConfigDTO dto);

    /**
     * 删除
     *
     * @param ids
     */
    void deleteKeywordConfig(Long[] ids);

    /**
     * 默认检索项重置
     */
    void defaultSearchItemReset();

    /**
     * 批量保存
     *
     * @param list
     */
    void saveBatch(ValidList<KeywordConfigDTO> list);


    /**
     * 获取需要待更新的配置id
     *
     * @param tfCodeList
     * @return
     */
    List<Long> getNeedUpdateConfigIds(List<String> tfCodeList);
}