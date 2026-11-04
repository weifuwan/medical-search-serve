package com.jiayuan.modules.search.service;

import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;

/**
 * @Title: SearchService
 * @Package: com.jiayuan.modules.search.service
 * @Description: 检索接口
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/1
 */
public interface SearchService {

    /**
     * 检索
     *
     * @param request
     * @return
     */
    EsPageData search(SearchRequest request);

}
