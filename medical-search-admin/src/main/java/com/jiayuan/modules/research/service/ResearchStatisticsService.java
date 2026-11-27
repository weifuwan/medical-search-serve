package com.jiayuan.modules.research.service;

import com.jiayuan.modules.research.dto.ResearchStatisticsRequest;

import java.util.Map;

/**
 * Research data center statistics.
 */
public interface ResearchStatisticsService {

    Map<String, Object> overview(ResearchStatisticsRequest request);

    Map<String, Object> visitTrend(ResearchStatisticsRequest request);

    Map<String, Object> patientProfile(ResearchStatisticsRequest request);

    Map<String, Object> empiOperations(ResearchStatisticsRequest request);

    Map<String, Object> outpatientSummary(ResearchStatisticsRequest request);

    Map<String, Object> inpatientSummary(ResearchStatisticsRequest request);

    Map<String, Object> diseaseDistribution(ResearchStatisticsRequest request);

    Map<String, Object> medicalTechSummary(ResearchStatisticsRequest request);
}