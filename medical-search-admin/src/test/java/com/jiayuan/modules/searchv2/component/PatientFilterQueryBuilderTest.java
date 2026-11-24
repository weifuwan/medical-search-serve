package com.jiayuan.modules.searchv2.component;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.searchv2.dto.PatientFilterDTO;
import org.elasticsearch.index.query.QueryBuilder;
import org.junit.Test;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

public class PatientFilterQueryBuilderTest {

    private final PatientFilterQueryBuilder builder = new PatientFilterQueryBuilder();

    @Test
    public void buildsContainsFilterForTextField() {
        PatientFilterDTO filter = filter("patient_name", "LIKE", "张三");
        QueryBuilder query = builder.build(filter, field("patient_name", "text"));

        assertTrue(query.toString().contains("wildcard"));
        assertTrue(query.toString().contains("张三"));
    }

    @Test
    public void buildsBetweenFilterForAgeInSeconds() {
        PatientFilterDTO filter = filter("age", "BETWEEN", "18");
        filter.setSecondValue("60");
        QueryBuilder query = builder.build(filter, field("age", "long"));

        assertTrue(query.toString().contains("age_seconds"));
        assertTrue(query.toString().contains("567648000"));
        assertTrue(query.toString().contains("1892160000"));
    }

    @Test
    public void mapsAgeSortAndFilterToAgeSeconds() {
        assertTrue(builder.getQueryField(field("age", "long")).equals("age_seconds"));
    }

    @Test
    public void rejectsEmptyValueForTermFilter() {
        try {
            builder.build(filter("visit_type", "EQ", " "), field("visit_type", "text"));
            fail("Expected BizException");
        } catch (BizException expected) {
            assertTrue(expected.getMessage().contains("筛选值不能为空"));
        }
    }

    private PatientFilterDTO filter(String fieldCode, String operator, String value) {
        PatientFilterDTO filter = new PatientFilterDTO();
        filter.setFieldCode(fieldCode);
        filter.setOperator(operator);
        filter.setValue(value);
        return filter;
    }

    private TableFieldInfo field(String fieldCode, String fieldType) {
        return TableFieldInfo.builder()
                .tableCode("ms_visit_record")
                .fieldCode(fieldCode)
                .fieldType(fieldType)
                .build();
    }
}
