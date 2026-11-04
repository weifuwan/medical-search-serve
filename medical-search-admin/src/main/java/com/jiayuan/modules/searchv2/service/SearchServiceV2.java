package com.jiayuan.modules.searchv2.service;

import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.searchv2.modal.SearchVo;

/**
 * @Title: SearchService
 * @Package: com.jiayuan.modules.search.service
 * @Description: 检索接口
 * @Author: 魏福万
 * @Date: 创建时间 2025/02/27
 */
public interface SearchServiceV2 {

    /**
     * 检索
     *
     * @param request 输入参数
     * @return 返回数据
     */
    SearchVo search(SearchRequest request);

}
