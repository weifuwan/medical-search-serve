package com.jiayuan.modules.searchv2.service.impl;

import com.jiayuan.modules.searchv2.component.PatientSearchComponent;
import com.jiayuan.modules.searchv2.component.SearchV2Component;
import com.jiayuan.modules.searchv2.dto.PatientCountVO;
import com.jiayuan.modules.searchv2.dto.PatientSearchRequest;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.test.util.ReflectionTestUtils;

import java.util.Collections;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class PatientSearchServiceImplTest {

    private static final Long CONFIG_USER_ID = 1952931360885829633L;

    @Mock
    private SearchV2Component searchV2Component;

    @Mock
    private PatientSearchComponent patientSearchComponent;

    @InjectMocks
    private PatientSearchServiceImpl patientSearchService;

    @Test
    public void countPassesConfiguredKeywordOwnerToSearchPipeline() throws Exception {
        ReflectionTestUtils.setField(patientSearchService, "keywordConfigUserId", CONFIG_USER_ID);

        PatientSearchRequest request = new PatientSearchRequest();
        request.setExpression("糖尿病");
        when(searchV2Component.searchVisitNos("糖尿病", CONFIG_USER_ID))
                .thenReturn(Collections.singletonList("VISIT-1"));
        when(patientSearchComponent.count(Collections.singletonList("VISIT-1"), null))
                .thenReturn(12L);

        PatientCountVO result = patientSearchService.count(request);

        assertEquals(12L, result.getTotal());
        verify(searchV2Component).searchVisitNos("糖尿病", CONFIG_USER_ID);
    }
}
