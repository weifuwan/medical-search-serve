package com.jiayuan.modules.search.service.impl;

import com.jiayuan.modules.search.component.SearchComponent;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.search.service.LogSearchService;
import com.jiayuan.modules.search.service.ResultFieldService;
import com.jiayuan.modules.search.service.SearchService;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Title: SearchServiceImpl
 * @Package: com.jiayuan.modules.search.service.impl
 * @Description: 检索业务实现类
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/1
 */
@Service
public class SearchServiceImpl implements SearchService {

    @Resource
    private ResultFieldService resultFieldService;

    @Resource
    private SearchComponent searchComponent;

    @Resource
    private LogSearchService logSearchService;

    @Override
    public EsPageData search(SearchRequest request) {
        final List<FieldDTO> columnList = resultFieldService.getUserShowFieldList();
        request.setColumnList(columnList);
        request.setHighlight(true);
        final EsPageData pageData = searchComponent.search(request);
        //异步保存日志
        logSearchService.saveLog(request);

        return pageData;
    }
}
