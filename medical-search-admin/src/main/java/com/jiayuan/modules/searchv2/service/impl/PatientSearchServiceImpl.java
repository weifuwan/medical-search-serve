package com.jiayuan.modules.searchv2.service.impl;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.searchv2.component.PatientSearchComponent;
import com.jiayuan.modules.searchv2.component.SearchV2Component;
import com.jiayuan.modules.searchv2.dto.PatientCountVO;
import com.jiayuan.modules.searchv2.dto.PatientListVO;
import com.jiayuan.modules.searchv2.dto.PatientSearchRequest;
import com.jiayuan.modules.searchv2.service.PatientSearchService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PatientSearchServiceImpl implements PatientSearchService {

    @Resource
    private SearchV2Component searchV2Component;

    @Resource
    private PatientSearchComponent patientSearchComponent;

    /**
     * Owner of the keyword search configuration used by the fixed-token APIs.
     * This is a configuration scope, not an authenticated user identity.
     */
    @Value("${medical-search.patient-api.keyword-config-user-id:0}")
    private Long keywordConfigUserId;

    @Override
    public PatientCountVO count(PatientSearchRequest request) {
        validateRequest(request);
        List<String> visitNos = searchV2Component.searchVisitNos(
                request.getExpression(), getKeywordConfigUserId());
        try {
            return new PatientCountVO(patientSearchComponent.count(visitNos, request.getFilters()));
        } catch (Exception e) {
            throw new BizException("患者范围统计失败: " + e.getMessage(), e);
        }
    }

    @Override
    public PatientListVO list(PatientSearchRequest request) {
        validateRequest(request);
        List<String> visitNos = searchV2Component.searchVisitNos(
                request.getExpression(), getKeywordConfigUserId());
        try {
            return patientSearchComponent.list(visitNos, request);
        } catch (Exception e) {
            throw new BizException("患者列表查询失败: " + e.getMessage(), e);
        }
    }

    private Long getKeywordConfigUserId() {
        return keywordConfigUserId != null && keywordConfigUserId > 0
                ? keywordConfigUserId
                : null;
    }

    private void validateRequest(PatientSearchRequest request) {
        if (request == null || StringUtils.isBlank(request.getExpression())) {
            throw new BizException("检索表达式不能为空");
        }
    }
}
