package com.jiayuan.modules.searchv2.component;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.search.component.matcher.KeywordMatcher;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Collections;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyList;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class SearchV2ComponentTest {

    private static final Long CONFIG_USER_ID = 1952931360885829633L;

    @Mock
    private ExpressionParserComponent expressionParserComponent;

    @Mock
    private KeywordMatcher keywordMatcher;

    @InjectMocks
    private SearchV2Component searchV2Component;

    @Test
    public void keywordSearchUsesExplicitConfigurationOwner() throws Exception {
        FieldDTO field = FieldDTO.builder()
                .tableCode("ms_visit_record")
                .tableName("ms_visit_record")
                .fieldCode("diagnosis")
                .fieldName("diagnosis")
                .dataType("text")
                .build();

        doAnswer(invocation -> {
            SearchDTO dto = invocation.getArgument(0);
            dto.setKeywordSearchFields(Collections.singletonList(field));
            return null;
        }).when(keywordMatcher).toSetKeywordSearchFields(any(SearchDTO.class), eq(CONFIG_USER_ID));

        when(expressionParserComponent.keywordSearchVisitNos(anyList(), eq("糖尿病")))
                .thenReturn(Collections.singletonList("VISIT-1"));

        List<String> visitNos = searchV2Component.searchVisitNos("糖尿病", CONFIG_USER_ID);

        assertEquals(Collections.singletonList("VISIT-1"), visitNos);
        verify(keywordMatcher).toSetKeywordSearchFields(any(SearchDTO.class), eq(CONFIG_USER_ID));
    }

    @Test
    public void keywordSearchRejectsMissingConfigurationOwner() {
        try {
            searchV2Component.searchVisitNos("糖尿病", null);
            fail("Expected BizException");
        } catch (BizException expected) {
            assertTrue(expected.getMessage().contains("keyword-config-user-id"));
        }
        verifyNoInteractions(keywordMatcher);
    }

    @Test
    public void expressionSearchDoesNotRequireKeywordConfigurationOwner() throws Exception {
        String expression = "ms_visit_record[diagnosis]=糖尿病";
        when(expressionParserComponent.getMatchedVisitNos(expression))
                .thenReturn(Collections.singletonList("VISIT-2"));

        List<String> visitNos = searchV2Component.searchVisitNos(expression, null);

        assertEquals(Collections.singletonList("VISIT-2"), visitNos);
        verifyNoInteractions(keywordMatcher);
    }

    @Test
    public void legacySearchEntryPointStillUsesCurrentUserConfiguration() throws Exception {
        FieldDTO field = FieldDTO.builder()
                .tableCode("ms_visit_record")
                .tableName("ms_visit_record")
                .fieldCode("diagnosis")
                .fieldName("diagnosis")
                .dataType("text")
                .build();

        doAnswer(invocation -> {
            SearchDTO dto = invocation.getArgument(0);
            dto.setKeywordSearchFields(Collections.singletonList(field));
            return null;
        }).when(keywordMatcher).toSetKeywordSearchFields(any(SearchDTO.class));

        when(expressionParserComponent.keywordSearchVisitNos(anyList(), eq("糖尿病")))
                .thenReturn(Collections.singletonList("VISIT-3"));

        List<String> visitNos = searchV2Component.searchVisitNos("糖尿病");

        assertEquals(Collections.singletonList("VISIT-3"), visitNos);
        verify(keywordMatcher).toSetKeywordSearchFields(any(SearchDTO.class));
    }
}
