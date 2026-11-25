package com.jiayuan.modules.search.component.matcher;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.search.dto.KeywordConfigDTO;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.service.KeywordConfigService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import java.util.Arrays;
import java.util.Collections;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class KeywordMatcherTest {

    private static final Long CONFIG_USER_ID = 1952931360885829633L;

    @Mock
    private KeywordConfigService keywordConfigService;

    @InjectMocks
    private KeywordMatcher keywordMatcher;

    @Test
    public void loadsKeywordFieldsForExplicitConfigurationOwner() {
        KeywordConfigDTO textField = keywordConfig("diagnosis", "text");
        KeywordConfigDTO numericField = keywordConfig("age", "long");
        when(keywordConfigService.getDefaultSearchFieldList(CONFIG_USER_ID))
                .thenReturn(Arrays.asList(textField, numericField));

        SearchDTO searchDTO = new SearchDTO();
        keywordMatcher.toSetKeywordSearchFields(searchDTO, CONFIG_USER_ID);

        verify(keywordConfigService).getDefaultSearchFieldList(CONFIG_USER_ID);
        assertEquals(1, searchDTO.getKeywordSearchFields().size());
        assertEquals("diagnosis", searchDTO.getKeywordSearchFields().get(0).getFieldCode());
    }

    @Test
    public void keepsCurrentUserConfigurationLookupForExistingCallers() {
        when(keywordConfigService.getDefaultSearchFieldList())
                .thenReturn(Collections.singletonList(keywordConfig("diagnosis", "text")));

        SearchDTO searchDTO = new SearchDTO();
        keywordMatcher.toSetKeywordSearchFields(searchDTO);

        verify(keywordConfigService).getDefaultSearchFieldList();
        assertEquals(1, searchDTO.getKeywordSearchFields().size());
    }

    @Test
    public void rejectsMissingConfigurationForExplicitOwner() {
        when(keywordConfigService.getDefaultSearchFieldList(CONFIG_USER_ID))
                .thenReturn(Collections.emptyList());

        try {
            keywordMatcher.toSetKeywordSearchFields(new SearchDTO(), CONFIG_USER_ID);
            fail("Expected BizException");
        } catch (BizException expected) {
            assertEquals("没有设置默认匹配规则", expected.getMessage());
        }
    }

    private KeywordConfigDTO keywordConfig(String fieldCode, String dataType) {
        KeywordConfigDTO config = new KeywordConfigDTO();
        config.setTableCode("ms_visit_record");
        config.setTableName("ms_visit_record");
        config.setFieldCode(fieldCode);
        config.setFieldName(fieldCode);
        config.setDataType(dataType);
        return config;
    }
}
