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
        assertEquals("visit_date", config.getEffectiveSorts().get(0).getFieldCode());
        assertEquals("patient_name", config.getColumns().get(0).getFieldCode());
    }

    @Test
    public void parsesMultipleSortsInPriorityOrder() {
        String json = "{\"sorts\":["
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"patient_name\",\"mode\":\"desc\"},"
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"age\",\"mode\":\"asc\"}]}";

        TemplateSearchConfig config = TemplateSearchConfig.parse(json);

        assertEquals(2, config.getSorts().size());
        assertEquals("patient_name", config.getSorts().get(0).getFieldCode());
        assertEquals("desc", config.getSorts().get(0).getMode());
        assertEquals("age", config.getSorts().get(1).getFieldCode());
        assertEquals("asc", config.getSorts().get(1).getMode());
    }

    @Test
    public void rejectsDuplicateSortFields() {
        expectInvalid("{\"sorts\":["
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"age\",\"mode\":\"asc\"},"
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"age\",\"mode\":\"desc\"}]}");
    }

    @Test
    public void rejectsMoreThanFiveSortFields() {
        expectInvalid("{\"sorts\":["
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"field_1\",\"mode\":\"asc\"},"
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"field_2\",\"mode\":\"asc\"},"
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"field_3\",\"mode\":\"asc\"},"
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"field_4\",\"mode\":\"asc\"},"
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"field_5\",\"mode\":\"asc\"},"
                + "{\"tableCode\":\"ms_visit_record\",\"fieldCode\":\"field_6\",\"mode\":\"asc\"}]}");
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
