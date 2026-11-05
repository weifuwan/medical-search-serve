package com.jiayuan.modules.searchv2.service.impl;

import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.search.service.LogSearchService;
import com.jiayuan.modules.search.service.ResultFieldService;
import com.jiayuan.modules.searchv2.component.SearchV2Component;
import com.jiayuan.modules.searchv2.modal.SearchVo;
import com.jiayuan.modules.searchv2.service.SearchServiceV2;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.dto.TemplateDTO;
import com.jiayuan.modules.template.dto.TemplateSearchConfig;
import com.jiayuan.modules.template.service.TemplateService;
import com.jiayuan.modules.template.service.TableFieldService;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.common.exception.BizException;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
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

    @Resource
    private TemplateService templateService;

    @Resource
    private TableFieldService tableFieldService;

    @Override
    public SearchVo search(SearchRequest request) {
        List<FieldDTO> columns = resultFieldService.getUserShowFieldList();
        if (request.getTemplateId() != null) {
            TemplateDTO template = templateService.getById(request.getTemplateId());
            if (template == null || (!Objects.equals(template.getUseScope(), 0)
                    && !Objects.equals(template.getCreator(), SecurityUser.getUserId()))) {
                throw new BizException("无权使用该检索模板");
            }
            TemplateSearchConfig config = TemplateSearchConfig.parse(template.getSearchConfig());
            if (config != null) {
                if (config.getScopeExpression() != null && !config.getScopeExpression().trim().isEmpty()) {
                    request.setExpression(request.getExpression() + " AND " + config.getScopeExpression().trim());
                }
                if (config.getSort() != null) {
                    request.setOrderTableCode("ms_visit_record");
                    request.setOrderFieldCode(config.getSort().getFieldCode());
                    request.setOrderMode(config.getSort().getMode());
                }
                if (config.getColumns() != null && !config.getColumns().isEmpty()) {
                    Map<String, FieldDTO> available = new LinkedHashMap<>();
                    for (FieldDTO field : tableFieldService.getShowFieldsByTableId("ms_visit_record")) {
                        available.put(field.getFieldCode(), field);
                    }
                    List<FieldDTO> selected = new ArrayList<>();
                    for (TemplateSearchConfig.Column column : config.getColumns()) {
                        FieldDTO field = available.get(column.getFieldCode());
                        if (field == null) {
                            throw new BizException("检索模板中的展示字段已不可用: " + column.getFieldCode());
                        }
                        selected.add(field);
                    }
                    columns = selected;
                }
            }
        }
        request.setColumnList(columns);
        request.setHighlight(true);

        final SearchVo pageData = searchV2Component.search(request);

        //异步保存日志
        logSearchService.saveLog(request);

        return pageData;
    }
}
