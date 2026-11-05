package com.jiayuan.modules.template.dto;

import com.jiayuan.common.exception.BizException;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.fail;

public class TemplateSearchConfigTest {

    @Test
    public void legacyTemplateHasNoConfig() {
        assertNull(TemplateSearchConfig.parse(null));
        assertNull(TemplateSearchConfig.parse(""));
    }

    @Test
    public void parsesSearchParameters() {
        String json = "{\"dimension\":1,\"scopeExpression\":\"住院[就诊记录.门诊住院]\","
                + "\"sort\":{\"tableCode\":\"ms_visit_record\","
                + "\"fieldCode\":\"visit_date\",\"mode\":\"desc\"},"
                + "\"pageSize\":20,\"viewMode\":\"CARD\","
                + "\"columns\":[{\"tableCode\":\"ms_visit_record\","
                + "\"fieldCode\":\"patient_name\"}]}";

        TemplateSearchConfig config = TemplateSearchConfig.parse(json);

        assertEquals(Integer.valueOf(1), config.getDimension());
        assertEquals(Integer.valueOf(20), config.getPageSize());
        assertEquals("CARD", config.getViewMode());
        assertEquals("visit_date", config.getSort().getFieldCode());
        assertEquals("patient_name", config.getColumns().get(0).getFieldCode());
    }

    @Test
    public void rejectsUnsupportedSortingTable() {
        expectInvalid("{\"sort\":{\"tableCode\":\"ms_diagnosis\","
                + "\"fieldCode\":\"code\",\"mode\":\"asc\"}}");
    }

    @Test
    public void rejectsMultipleScopeConditions() {
        expectInvalid("{\"scopeExpression\":\"A[就诊记录.性别] OR B[就诊记录.性别]\"}");
    }

    private void expectInvalid(String json) {
        try {
            TemplateSearchConfig.parse(json);
            fail("Expected invalid template config");
        } catch (BizException expected) {
            // Validated by the API before saving.
        }
    }
}
