package com.jiayuan.modules.search.service;

import com.jiayuan.common.service.CrudService;
import com.jiayuan.modules.search.dto.LogSearchDTO;
import com.jiayuan.modules.search.entity.LogSearchEntity;
import com.jiayuan.modules.search.request.SearchRequest;

import java.util.List;

/**
 * 检索日志
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
public interface LogSearchService extends CrudService<LogSearchEntity, LogSearchDTO> {

    /**
     * 历史检索列表(只查自己的检索历史)
     *
     * @param top
     * @return
     */
    List<LogSearchDTO> listOfHistorySearch(Integer top);


    /**
     * 热门检索列表
     *
     * @param top
     * @return
     */
    List<LogSearchDTO> listOfPopularSearch(Integer top);

    /**
     * 保存检索日志
     *
     * @param request
     */
    void saveLog(SearchRequest request);
}