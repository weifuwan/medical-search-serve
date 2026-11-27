package com.jiayuan.modules.research.service.impl;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.research.component.ResearchStatisticsEsComponent;
import com.jiayuan.modules.research.dto.ResearchStatisticsRequest;
import com.jiayuan.modules.template.service.TableFieldService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verifyNoInteractions;

class ResearchStatisticsServiceImplTest {

    private ResearchStatisticsEsComponent esComponent;
    private TableFieldService tableFieldService;
    private ResearchStatisticsServiceImpl service;

    @BeforeEach
    void setUp() {
        esComponent = mock(ResearchStatisticsEsComponent.class);
        tableFieldService = mock(TableFieldService.class);
        service = new ResearchStatisticsServiceImpl(esComponent, tableFieldService);
    }

    @Test
    void rejectsUnsupportedInterval() {
        ResearchStatisticsRequest request = new ResearchStatisticsRequest();
        request.setInterval("quarter");

        assertThrows(BizException.class, () -> service.visitTrend(request));
        verifyNoInteractions(esComponent);
    }

    @Test
    void rejectsInvalidDateRange() {
        ResearchStatisticsRequest request = new ResearchStatisticsRequest();
        request.setStartDate("2026-11-28");
        request.setEndDate("2026-11-01");

        assertThrows(BizException.class, () -> service.visitTrend(request));
        verifyNoInteractions(esComponent);
    }

    @Test
    void rejectsInvalidTopSize() {
        ResearchStatisticsRequest request = new ResearchStatisticsRequest();
        request.setTopSize(100);

        assertThrows(BizException.class, () -> service.patientProfile(request));
        verifyNoInteractions(esComponent);
    }
}