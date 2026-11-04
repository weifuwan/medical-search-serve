package com.jiayuan.modules.searchv2.service.impl;

import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.search.service.LogSearchService;
import com.jiayuan.modules.search.service.ResultFieldService;
import com.jiayuan.modules.searchv2.component.SearchV2Component;
import com.jiayuan.modules.searchv2.modal.SearchVo;
import com.jiayuan.modules.searchv2.service.SearchServiceV2;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Title: SearchServiceV2Impl
 * @Package: com.jiayuan.modules.search.service.impl
 * @Description: 检索业务实现类
 * @Author: 魏福万
 * @Date: 创建时间 2025/02/27
 */
@Service
public class SearchServiceV2Impl implements SearchServiceV2 {

    @Resource
    private ResultFieldService resultFieldService;

    @Resource
    private SearchV2Component searchV2Component;

    @Resource
    private LogSearchService logSearchService;

    @Override
    public SearchVo search(SearchRequest request) {
        final List<FieldDTO> columnList = resultFieldService.getUserShowFieldList();
        request.setColumnList(columnList);
        request.setHighlight(true);

        final SearchVo pageData = searchV2Component.search(request);

        //异步保存日志
        logSearchService.saveLog(request);

        return pageData;
    }
}
