package com.jiayuan.modules.research.service.impl;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.research.component.ResearchStatisticsEsComponent;
import com.jiayuan.modules.research.dto.ResearchStatisticsRequest;
import com.jiayuan.modules.research.service.ResearchStatisticsService;
import com.jiayuan.modules.template.service.TableFieldService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Map;

/**
 * Validates common query parameters and delegates ES aggregation work.
 */
@Service
@RequiredArgsConstructor
public class ResearchStatisticsServiceImpl implements ResearchStatisticsService {

    private final ResearchStatisticsEsComponent esComponent;
    private final TableFieldService tableFieldService;

    @Override
    public Map<String, Object> overview(ResearchStatisticsRequest request) {
        ResearchStatisticsRequest normalized = normalize(request);
        return esComponent.overview(normalized, tableFieldService.findList().size());
    }

    @Override
    public Map<String, Object> visitTrend(ResearchStatisticsRequest request) {
        return esComponent.visitTrend(normalize(request));
    }

    @Override
    public Map<String, Object> patientProfile(ResearchStatisticsRequest request) {
        return esComponent.patientProfile(normalize(request));
    }

    @Override
    public Map<String, Object> empiOperations(ResearchStatisticsRequest request) {
        return esComponent.empiOperations(normalize(request));
    }

    @Override
    public Map<String, Object> outpatientSummary(ResearchStatisticsRequest request) {
        return esComponent.outpatientSummary(normalize(request));
    }

    @Override
    public Map<String, Object> inpatientSummary(ResearchStatisticsRequest request) {
        return esComponent.inpatientSummary(normalize(request));
    }

    @Override
    public Map<String, Object> diseaseDistribution(ResearchStatisticsRequest request) {
        return esComponent.diseaseDistribution(normalize(request));
    }

    @Override
    public Map<String, Object> medicalTechSummary(ResearchStatisticsRequest request) {
        return esComponent.medicalTechSummary(normalize(request));
    }

    private ResearchStatisticsRequest normalize(ResearchStatisticsRequest request) {
        ResearchStatisticsRequest normalized = request == null
                ? new ResearchStatisticsRequest()
                : request;

        LocalDate start = parseDate(normalized.getStartDate(), "开始日期");
        LocalDate end = parseDate(normalized.getEndDate(), "结束日期");
        if (start != null && end != null && end.isBefore(start)) {
            throw new BizException("结束日期不能早于开始日期");
        }

        String interval = StringUtils.isBlank(normalized.getInterval())
                ? "month"
                : normalized.getInterval().trim().toLowerCase();
        if (!"day".equals(interval) && !"week".equals(interval) && !"month".equals(interval)) {
            throw new BizException("趋势粒度仅支持 day、week、month");
        }
        normalized.setInterval(interval);

        Integer topSize = normalized.getTopSize() == null ? 10 : normalized.getTopSize();
        if (topSize < 1 || topSize > 50) {
            throw new BizException("topSize 必须在 1 到 50 之间");
        }
        normalized.setTopSize(topSize);
        return normalized;
    }

    private LocalDate parseDate(String value, String label) {
        if (StringUtils.isBlank(value)) {
            return null;
        }
        try {
            return LocalDate.parse(value.trim());
        } catch (DateTimeParseException e) {
            throw new BizException(label + "格式不正确，请使用 yyyy-MM-dd");
        }
    }
}