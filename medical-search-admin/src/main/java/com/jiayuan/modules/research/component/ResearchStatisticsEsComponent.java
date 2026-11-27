package com.jiayuan.modules.research.component;

import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.research.dto.ResearchStatisticsRequest;
import lombok.RequiredArgsConstructor;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.Aggregation;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.filter.Filter;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramInterval;
import org.elasticsearch.search.aggregations.bucket.histogram.Histogram;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.metrics.Cardinality;
import org.elasticsearch.search.aggregations.metrics.NumericMetricsAggregation;
import org.elasticsearch.search.builder.SearchSourceBuilder;
import org.joda.time.DateTimeZone;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * ES 7.x aggregation implementation for the research data center.
 *
 * <p>All queries return aggregation results only (size=0); no patient-level
 * documents or identifiers are returned by these endpoints.</p>
 */
@Component
@RequiredArgsConstructor
public class ResearchStatisticsEsComponent {

    private static final String PATIENT = "patient";
    private static final String VISIT = "ms_visit_record";
    private static final String MZ_REGISTER = "cdr_mz_register_detail";
    private static final String MZ_VISIT = "cdr_mz_visit_detail";
    private static final String MZ_DIAGNOSIS = "cdr_mz_diagnose_detail";
    private static final String MZ_PRESCRIPTION = "cdr_mz_recipel_info";
    private static final String MZ_CHARGE = "cdr_mz_charge_detail";
    private static final String MZ_SETTLEMENT = "cdr_mz_settle_detail";
    private static final String ZY_ADMISSION = "cdr_zy_admission_detail";
    private static final String ZY_DISCHARGE = "cdr_zy_dischargereg";
    private static final String ZY_FIRST_PAGE = "cdr_emr_firstpage_medicalrecord";
    private static final String ZY_DIAGNOSIS = "cdr_zy_diagnose_detail";
    private static final String ZY_CHARGE = "cdr_zy_charge_detail";
    private static final String LAB_REPORT = "cdr_laboratory_report";
    private static final String LAB_DETAIL = "cdr_laboratory_report_detail";
    private static final String CHECK_REPORT = "cdr_check_report";
    private static final String SURGERY = "cdr_surgery_his";
    private static final String TRANSFUSION = "cdr_emr_blood_transrecord";
    private static final String CRITICAL_VALUE = "cdr_criticalvalue_report";
    private static final String ADVERSE_EVENT = "cdr_aers_reportcard";
    private static final String VITAL_SIGNS = "cdr_emr_vitalsigns_measurerecord";

    private static final String[] UPDATE_TIME_INDICES = {
            PATIENT, MZ_REGISTER, MZ_VISIT, MZ_DIAGNOSIS, MZ_PRESCRIPTION,
            MZ_CHARGE, MZ_SETTLEMENT, ZY_ADMISSION, ZY_DISCHARGE, ZY_DIAGNOSIS,
            "cdr_zy_drugorder", ZY_CHARGE, LAB_REPORT, LAB_DETAIL, CHECK_REPORT,
            SURGERY, CRITICAL_VALUE, ADVERSE_EVENT, VITAL_SIGNS
    };

    private static final ZoneId BUSINESS_ZONE = ZoneId.of("Asia/Shanghai");
    private static final DateTimeFormatter DATE_TIME_FORMAT =
            DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").withZone(BUSINESS_ZONE);
    private static final int CARDINALITY_PRECISION = 40000;

    private final RestHighLevelClient client;

    public Map<String, Object> overview(ResearchStatisticsRequest request, int fieldCount) {
        SearchResponse patientResponse = search(PATIENT, activeQuery(null, request, "delete_flag"),
                cardinality("patient_count", "empi_id.keyword"),
                cardinality("hospital_count", "hospital_id.keyword"));

        SearchResponse visitResponse = search(VISIT, dateQuery("visit_date", request),
                cardinality("visit_count", "visit_no.keyword"),
                AggregationBuilders.min("visit_start").field("visit_date"),
                AggregationBuilders.max("visit_end").field("visit_date"));

        SearchResponse updateResponse = search(UPDATE_TIME_INDICES, QueryBuilders.matchAllQuery(),
                AggregationBuilders.max("last_update").field("last_update_time"));

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("totalPatients", cardinalityValue(patientResponse, "patient_count"));
        result.put("totalVisits", cardinalityValue(visitResponse, "visit_count"));
        result.put("visitStartDate", formatDate(metric(visitResponse.getAggregations(), "visit_start")));
        result.put("visitEndDate", formatDate(metric(visitResponse.getAggregations(), "visit_end")));
        result.put("hospitalCount", cardinalityValue(patientResponse, "hospital_count"));
        result.put("fieldCount", fieldCount);
        result.put("fieldCountDefinition", "当前有效、启用展示且未删除的字段元数据数量");
        result.put("lastDataUpdateTime", formatDate(metric(updateResponse.getAggregations(), "last_update")));
        result.put("countAccuracy", "患者数、就诊数及机构数使用 Cardinality 近似去重，适合首页概览；科研精确结果应使用 Composite 聚合");
        result.put("hospitalCountDefinition", "patient.hospital_id 去重数，表示接入机构数，不代表接入系统数");
        result.put("dateRangeNote", "患者总数按全量有效患者统计；传入日期范围只影响就诊数量和病历时间跨度");
        return result;
    }

    public Map<String, Object> visitTrend(ResearchStatisticsRequest request) {
        SearchResponse response = search(VISIT, dateQuery("visit_date", request),
                dateHistogram("trend", "visit_date", request.getInterval())
                        .subAggregation(cardinality("visits", "visit_no.keyword"))
                        .subAggregation(cardinality("patients", "patient_id.keyword")),
                terms("visit_types", "visit_type.keyword", request.getTopSize())
                        .subAggregation(cardinality("visits", "visit_no.keyword")));

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("interval", request.getInterval());
        result.put("trend", readHistogram(response, "trend", "visits", "patients"));
        result.put("visitTypes", readTermsWithDistinct(response, "visit_types", "visits"));
        result.put("totalVisits", cardinalityValue(response, "total_visits"));
        result.put("totalPatients", cardinalityValue(response, "total_patients"));
        result.put("totalRecords", totalHits(response));
        result.put("countAccuracy", "趋势桶中的就诊数和患者数使用 Cardinality 近似去重");
        return result;
    }

    public Map<String, Object> patientProfile(ResearchStatisticsRequest request) {
        BoolQueryBuilder query = QueryBuilders.boolQuery()
                .filter(QueryBuilders.existsQuery("empi_id"))
                .mustNot(QueryBuilders.termQuery("delete_flag", 1));
        SearchResponse response = search(PATIENT, query,
                cardinality("total_patients", "empi_id.keyword"),
                terms("gender", "gender", request.getTopSize()).subAggregation(cardinality("patients", "empi_id.keyword")),
                terms("province", "province.keyword", request.getTopSize()).subAggregation(cardinality("patients", "empi_id.keyword")),
                terms("city", "city.keyword", request.getTopSize()).subAggregation(cardinality("patients", "empi_id.keyword")),
                terms("nation", "nation_name.keyword", request.getTopSize()).subAggregation(cardinality("patients", "empi_id.keyword")),
                terms("marital_status", "marry_name.keyword", request.getTopSize()).subAggregation(cardinality("patients", "empi_id.keyword")),
                terms("occupation", "job_name.keyword", request.getTopSize()).subAggregation(cardinality("patients", "empi_id.keyword")),
                terms("insurance", "insurance_name.keyword", request.getTopSize()).subAggregation(cardinality("patients", "empi_id.keyword")));

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("totalPatients", cardinalityValue(response, "total_patients"));
        result.put("gender", readTermsWithDistinct(response, "gender", "patients"));
        result.put("province", readTermsWithDistinct(response, "province", "patients"));
        result.put("city", readTermsWithDistinct(response, "city", "patients"));
        result.put("nation", readTermsWithDistinct(response, "nation", "patients"));
        result.put("maritalStatus", readTermsWithDistinct(response, "marital_status", "patients"));
        result.put("occupation", readTermsWithDistinct(response, "occupation", "patients"));
        result.put("insurance", readTermsWithDistinct(response, "insurance", "patients"));
        result.put("ageDistribution", Collections.emptyList());
        result.put("ageDistributionNote", "patient.birth_time 为 date，但当前 Mapping 没有数值年龄字段；ms_visit_record.age 为 text，暂不对其做数值区间聚合");
        result.put("countAccuracy", "各画像分组中的患者数使用 empi_id Cardinality 近似去重");
        return result;
    }

    public Map<String, Object> empiOperations(ResearchStatisticsRequest request) {
        QueryBuilder query = dateQuery("operate_time", request);
        SearchResponse response = search(PATIENT, query,
                terms("operation_types", "operate_type", 20),
                dateHistogram("trend", "operate_time", request.getInterval())
                        .subAggregation(terms("operation_types", "operate_type", 20)));

        Map<String, String> labels = new LinkedHashMap<>();
        labels.put("1", "初次导入");
        labels.put("2", "增量导入");
        labels.put("3", "创建患者");
        labels.put("4", "更新患者");
        labels.put("5", "合并患者");
        labels.put("6", "拆分患者");
        labels.put("7", "疑似确认");
        labels.put("8", "疑似解除");

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("totalOperationRecords", totalHits(response));
        result.put("operationTypes", labelTerms(readTerms(response, "operation_types"), labels));
        result.put("trend", readHistogramWithTerms(response, "trend", "operation_types", labels));
        result.put("historyCompletenessNote", "只有在 patient 索引保留每次操作事件文档时，记录数才代表历史操作次数；若每个患者仅保留当前状态，则该接口反映当前文档中的操作类型分布");
        return result;
    }

    public Map<String, Object> outpatientSummary(ResearchStatisticsRequest request) {
        SearchResponse register = search(MZ_REGISTER, dateQuery("register_refund_time", request),
                terms("refund_types", "refund_flag", 10));

        SearchResponse visit = search(MZ_VISIT, activeQuery("visit_time", request, "delete_flag"),
                terms("return_visits", "return_visit", 10),
                terms("visit_statuses", "visit_status_code", 10));

        SearchResponse diagnosis = search(MZ_DIAGNOSIS, activeQuery("record_time", request, "delete_flag"),
                cardinality("diagnosis_ids", "diagnosed_id.keyword"));

        BoolQueryBuilder prescriptionQuery = QueryBuilders.boolQuery()
                .filter(dateQuery("record_time", request))
                .mustNot(QueryBuilders.termQuery("detail_delete_flag", 1));
        SearchResponse prescription = search(MZ_PRESCRIPTION, prescriptionQuery,
                cardinality("prescriptions", "recipel_id.keyword"),
                cardinality("prescription_details", "detail_recipel_detailid.keyword"));

        SearchResponse charge = search(MZ_CHARGE, activeQuery("charge_happentime", request, "delete_flag"),
                terms("charge_statuses", "charge_status", 10),
                AggregationBuilders.filter("paid", QueryBuilders.termQuery("charge_status", 2))
                        .subAggregation(AggregationBuilders.sum("amount").field("detail_item_received")),
                AggregationBuilders.filter("refunded", QueryBuilders.termQuery("charge_status", 3))
                        .subAggregation(AggregationBuilders.sum("amount").field("detail_item_received")));

        SearchResponse settlement = search(MZ_SETTLEMENT, activeQuery("settle_time", request, "delete_flag"),
                terms("settlement_statuses", "settle_status", 10),
                AggregationBuilders.filter("settled", QueryBuilders.termQuery("settle_status", 1))
                        .subAggregation(AggregationBuilders.sum("amount").field("settle_total_money")),
                AggregationBuilders.filter("refunded", QueryBuilders.termQuery("settle_status", 2))
                        .subAggregation(AggregationBuilders.sum("amount").field("settle_total_money")));

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("registerEvents", totalHits(register));
        result.put("registerRefundTypes", readTerms(register, "refund_types"));
        result.put("visitRecords", totalHits(visit));
        result.put("returnVisitTypes", readTerms(visit, "return_visits"));
        result.put("visitStatuses", readTerms(visit, "visit_statuses"));
        result.put("diagnosisRecords", totalHits(diagnosis));
        result.put("uniqueDiagnosisRecords", cardinalityValue(diagnosis, "diagnosis_ids"));
        result.put("prescriptionCount", cardinalityValue(prescription, "prescriptions"));
        result.put("prescriptionDetailCount", cardinalityValue(prescription, "prescription_details"));
        result.put("chargeRecords", totalHits(charge));
        result.put("chargeStatuses", readTerms(charge, "charge_statuses"));
        result.put("paidChargeAmount", filterMetric(charge, "paid", "amount"));
        result.put("refundedChargeAmount", filterMetric(charge, "refunded", "amount"));
        result.put("settlementRecords", totalHits(settlement));
        result.put("settlementStatuses", readTerms(settlement, "settlement_statuses"));
        result.put("settledAmount", filterMetric(settlement, "settled", "amount"));
        result.put("refundedSettlementAmount", filterMetric(settlement, "refunded", "amount"));
        result.put("notes", Arrays.asList(
                "挂号量按 refund_flag 区分挂号与退号事件，不将退号事件混入有效挂号数",
                "门诊收费仅将 charge_status=2 作为已缴费金额，charge_status=3 单独展示退费金额",
                "处方数量按 recipel_id 去重，处方明细数量按 detail_recipel_detailid 去重"
        ));
        return result;
    }

    public Map<String, Object> inpatientSummary(ResearchStatisticsRequest request) {
        SearchResponse admission = search(ZY_ADMISSION, activeQuery("in_hospital_date", request, "delete_flag"),
                dateHistogram("trend", "in_hospital_date", request.getInterval()));

        SearchResponse discharge = search(ZY_DISCHARGE, activeQuery("out_hospital_date", request, "delete_flag"),
                dateHistogram("trend", "out_hospital_date", request.getInterval()));

        SearchResponse firstPage = search(ZY_FIRST_PAGE, activeQuery("out_hospital_date", request, "delete_flag"),
                AggregationBuilders.avg("average_stay_days").field("in_visit_days"),
                AggregationBuilders.avg("average_total_fee").field("total_fee"),
                AggregationBuilders.sum("total_fee_sum").field("total_fee"),
                AggregationBuilders.filter("icu", QueryBuilders.termQuery("is_in_icu", 1)),
                AggregationBuilders.filter("same_diagnosis_readmission", QueryBuilders.termQuery("same_diag_in", 1)),
                AggregationBuilders.filter("death", QueryBuilders.existsQuery("death_time")),
                AggregationBuilders.filter("operation_complication", QueryBuilders.termQuery("is_opcomplicate", 1)));

        SearchResponse diagnosis = search(ZY_DIAGNOSIS, activeQuery("record_time", request, "delete_flag"),
                cardinality("diagnosis_ids", "diagnosed_id.keyword"));

        SearchResponse charge = search(ZY_CHARGE, activeQuery("charge_happentime", request, "delete_flag"),
                AggregationBuilders.filter("paid", QueryBuilders.termQuery("charge_status", 2))
                        .subAggregation(AggregationBuilders.sum("amount").field("detail_item_received")));

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("admissionRecords", totalHits(admission));
        result.put("admissionTrend", readHistogram(admission, "trend", null, null));
        result.put("dischargeRecords", totalHits(discharge));
        result.put("dischargeTrend", readHistogram(discharge, "trend", null, null));
        result.put("medicalRecordCount", totalHits(firstPage));
        result.put("averageStayDays", metric(firstPage.getAggregations(), "average_stay_days"));
        result.put("averageTotalFee", metric(firstPage.getAggregations(), "average_total_fee"));
        result.put("totalMedicalFee", metric(firstPage.getAggregations(), "total_fee_sum"));
        result.put("icuCases", filterCount(firstPage, "icu"));
        result.put("sameDiagnosisReadmissions", filterCount(firstPage, "same_diagnosis_readmission"));
        result.put("deathCases", filterCount(firstPage, "death"));
        result.put("operationComplicationCases", filterCount(firstPage, "operation_complication"));
        result.put("diagnosisRecords", totalHits(diagnosis));
        result.put("uniqueDiagnosisRecords", cardinalityValue(diagnosis, "diagnosis_ids"));
        result.put("paidChargeAmount", filterMetric(charge, "paid", "amount"));
        result.put("notes", Arrays.asList(
                "住院首页指标按出院日期筛选；未出院且没有 out_hospital_date 的病例不进入该时间范围统计",
                "平均住院天数、平均费用以住院病案首页记录为统计粒度",
                "再入院统计使用 same_diag_in=1 标志，不等同于基于完整患者轨迹重新计算的再入院率"
        ));
        return result;
    }

    public Map<String, Object> diseaseDistribution(ResearchStatisticsRequest request) {
        Map<String, Object> result = new LinkedHashMap<>();
        result.put("outpatient", diseaseBuckets(MZ_DIAGNOSIS, request));
        result.put("inpatient", diseaseBuckets(ZY_DIAGNOSIS, request));
        result.put("notes", Arrays.asList(
                "门诊和住院分别统计，避免同一患者跨索引重复后将患者数直接相加",
                "患者数和病例数分别按 patient_id、visit_no 去重，使用 Cardinality 近似算法",
                "默认包含有效的主要及次要诊断记录；如需仅统计主要诊断，应另行明确两类索引的主次诊断编码口径"
        ));
        return result;
    }

    public Map<String, Object> medicalTechSummary(ResearchStatisticsRequest request) {
        SearchResponse labReport = search(LAB_REPORT, activeQuery("report_date", request, "delete_flag"),
                dateHistogram("trend", "report_date", request.getInterval()));

        SearchResponse labDetail = search(LAB_DETAIL, dateQuery("report_date", request),
                terms("abnormal_types", "abnormal_tips", 10),
                cardinality("report_count", "report_no.keyword"));

        SearchResponse checkReport = search(CHECK_REPORT, activeQuery("report_date", request, "delete_flag"),
                terms("result_types", "item_result_flag", 10));

        SearchResponse surgery = search(SURGERY, activeQuery("operation_date", request, "delete_flag"),
                terms("operation_levels", "operation_level_code", 10),
                AggregationBuilders.filter("complications", QueryBuilders.termQuery("is_opcomplicate", 1)));

        SearchResponse transfusion = search(TRANSFUSION, dateQuery("blood_trans_date", request),
                terms("abo_blood_types", "abo_blood_type.keyword", 10),
                terms("rh_blood_types", "rh_blood_type.keyword", 10));

        SearchResponse critical = search(CRITICAL_VALUE, activeQuery("send_time", request, "delete_flag"),
                terms("process_steps", "process_step", 10));

        SearchResponse adverse = search(ADVERSE_EVENT, activeQuery("happen_time", request, "delete_flag"),
                terms("event_classes", "class_code", request.getTopSize()));

        SearchResponse vital = search(VITAL_SIGNS, dateQuery("record_createdate", request),
                AggregationBuilders.avg("average_temperature").field("temperature"),
                AggregationBuilders.avg("average_pulse").field("pulse"),
                AggregationBuilders.avg("average_systolic_pressure").field("pressure_systolic"));

        Map<String, Object> result = new LinkedHashMap<>();
        result.put("laboratoryReports", totalHits(labReport));
        result.put("laboratoryReportTrend", readHistogram(labReport, "trend", null, null));
        result.put("laboratoryReportDetails", totalHits(labDetail));
        result.put("laboratoryUniqueReports", cardinalityValue(labDetail, "report_count"));
        result.put("laboratoryAbnormalTypes", readTerms(labDetail, "abnormal_types"));
        result.put("checkReports", totalHits(checkReport));
        result.put("checkResultTypes", readTerms(checkReport, "result_types"));
        result.put("surgeries", totalHits(surgery));
        result.put("surgeryOperationLevels", readTerms(surgery, "operation_levels"));
        result.put("surgeryComplications", filterCount(surgery, "complications"));
        result.put("transfusionRecords", totalHits(transfusion));
        result.put("aboBloodTypes", readTerms(transfusion, "abo_blood_types"));
        result.put("rhBloodTypes", readTerms(transfusion, "rh_blood_types"));
        result.put("criticalValueRecords", totalHits(critical));
        result.put("criticalValueProcessSteps", readTerms(critical, "process_steps"));
        result.put("adverseEventRecords", totalHits(adverse));
        result.put("adverseEventClasses", readTerms(adverse, "event_classes"));
        result.put("averageTemperature", metric(vital.getAggregations(), "average_temperature"));
        result.put("averagePulse", metric(vital.getAggregations(), "average_pulse"));
        result.put("averageSystolicPressure", metric(vital.getAggregations(), "average_systolic_pressure"));
        result.put("notes", Arrays.asList(
                "检验异常按 cdr_laboratory_report_detail.abnormal_tips 统计，9（不确定）单独保留",
                "检查结果按 item_result_flag 统计，9（不确定）单独保留",
                "生命体征均值是测量记录均值，不是患者级均值；transfusion_volume 当前为 text，暂不汇总输血总量"
        ));
        return result;
    }

    private List<Map<String, Object>> diseaseBuckets(String index, ResearchStatisticsRequest request) {
        SearchResponse response = search(index, activeQuery("record_time", request, "delete_flag"),
                terms("diseases", "diagnosis_code.keyword", request.getTopSize())
                        .subAggregation(cardinality("patients", "patient_id.keyword"))
                        .subAggregation(cardinality("visits", "visit_no.keyword"))
                        .subAggregation(terms("names", "diagnosis.keyword", 1)));

        List<Map<String, Object>> result = new ArrayList<>();
        Terms diseases = response.getAggregations().get("diseases");
        if (diseases == null) {
            return result;
        }
        for (Terms.Bucket bucket : diseases.getBuckets()) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("diagnosisCode", bucket.getKeyAsString());
            row.put("diagnosisName", firstTermKey(bucket.getAggregations(), "names"));
            row.put("patientCount", cardinalityValue(bucket.getAggregations(), "patients"));
            row.put("visitCount", cardinalityValue(bucket.getAggregations(), "visits"));
            row.put("recordCount", bucket.getDocCount());
            result.add(row);
        }
        return result;
    }

    private SearchResponse search(String index, QueryBuilder query, AggregationBuilder... aggregations) {
        return search(new String[]{index}, query, aggregations);
    }

    private SearchResponse search(String[] indices, QueryBuilder query, AggregationBuilder... aggregations) {
        SearchSourceBuilder source = new SearchSourceBuilder()
                .query(query == null ? QueryBuilders.matchAllQuery() : query)
                .size(0)
                .trackTotalHits(true);
        for (AggregationBuilder aggregation : aggregations) {
            source.aggregation(aggregation);
        }
        try {
            return client.search(new SearchRequest(indices).source(source), RequestOptions.DEFAULT);
        } catch (IOException e) {
            throw new BizException("科研统计查询 Elasticsearch 失败: " + e.getMessage(), e);
        }
    }

    private QueryBuilder dateQuery(String dateField, ResearchStatisticsRequest request) {
        BoolQueryBuilder query = QueryBuilders.boolQuery();
        addDateRange(query, dateField, request);
        return query;
    }

    private QueryBuilder activeQuery(String dateField,
                                     ResearchStatisticsRequest request,
                                     String deleteField) {
        BoolQueryBuilder query = QueryBuilders.boolQuery()
                .mustNot(QueryBuilders.termQuery(deleteField, 1));
        addDateRange(query, dateField, request);
        return query;
    }

    private void addDateRange(BoolQueryBuilder query, String dateField, ResearchStatisticsRequest request) {
        if (dateField == null || request == null) {
            return;
        }
        if (request.getStartDate() == null && request.getEndDate() == null) {
            return;
        }
        org.elasticsearch.index.query.RangeQueryBuilder range = QueryBuilders.rangeQuery(dateField);
        if (request.getStartDate() != null) {
            range.gte(request.getStartDate());
        }
        if (request.getEndDate() != null) {
            range.lt(LocalDate.parse(request.getEndDate()).plusDays(1).toString());
        }
        query.filter(range);
    }

    private org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder terms(
            String name, String field, int size) {
        return AggregationBuilders.terms(name).field(field).size(size);
    }

    private org.elasticsearch.search.aggregations.metrics.CardinalityAggregationBuilder cardinality(
            String name, String field) {
        return AggregationBuilders.cardinality(name).field(field)
                .precisionThreshold(CARDINALITY_PRECISION);
    }

    private org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramAggregationBuilder dateHistogram(
            String name, String field, String interval) {
        DateHistogramInterval dateInterval;
        if ("day".equals(interval)) {
            dateInterval = DateHistogramInterval.DAY;
        } else if ("week".equals(interval)) {
            dateInterval = DateHistogramInterval.WEEK;
        } else {
            dateInterval = DateHistogramInterval.MONTH;
        }
        return AggregationBuilders.dateHistogram(name)
                .field(field)
                .calendarInterval(dateInterval)
                .timeZone(DateTimeZone.forID(BUSINESS_ZONE.getId()));
    }

    private long totalHits(SearchResponse response) {
        return response.getHits().getTotalHits() == null
                ? 0L
                : response.getHits().getTotalHits().value;
    }

    private long cardinalityValue(SearchResponse response, String name) {
        return cardinalityValue(response.getAggregations(), name);
    }

    private long cardinalityValue(Aggregations aggregations, String name) {
        Cardinality aggregation = aggregations.get(name);
        return aggregation == null ? 0L : aggregation.getValue();
    }

    private Double metric(Aggregations aggregations, String name) {
        Aggregation aggregation = aggregations.get(name);
        if (!(aggregation instanceof NumericMetricsAggregation.SingleValue)) {
            return null;
        }
        double value = ((NumericMetricsAggregation.SingleValue) aggregation).value();
        return Double.isFinite(value) ? value : null;
    }

    private Double filterMetric(SearchResponse response, String filterName, String metricName) {
        Filter filter = response.getAggregations().get(filterName);
        return filter == null ? null : metric(filter.getAggregations(), metricName);
    }

    private long filterCount(SearchResponse response, String filterName) {
        Filter filter = response.getAggregations().get(filterName);
        return filter == null ? 0L : filter.getDocCount();
    }

    private String formatDate(Double epochMillis) {
        if (epochMillis == null) {
            return null;
        }
        return DATE_TIME_FORMAT.format(Instant.ofEpochMilli(epochMillis.longValue()));
    }

    private List<Map<String, Object>> readTerms(SearchResponse response, String name) {
        return readTerms(response.getAggregations(), name);
    }

    private List<Map<String, Object>> readTerms(Aggregations aggregations, String name) {
        List<Map<String, Object>> result = new ArrayList<>();
        Terms terms = aggregations.get(name);
        if (terms == null) {
            return result;
        }
        for (Terms.Bucket bucket : terms.getBuckets()) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("key", bucket.getKeyAsString());
            row.put("count", bucket.getDocCount());
            result.add(row);
        }
        return result;
    }

    private List<Map<String, Object>> readTermsWithDistinct(
            SearchResponse response, String name, String distinctAggregation) {
        List<Map<String, Object>> result = new ArrayList<>();
        Terms terms = response.getAggregations().get(name);
        if (terms == null) {
            return result;
        }
        for (Terms.Bucket bucket : terms.getBuckets()) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("key", bucket.getKeyAsString());
            row.put("recordCount", bucket.getDocCount());
            row.put("distinctCount", cardinalityValue(bucket.getAggregations(), distinctAggregation));
            result.add(row);
        }
        return result;
    }

    private List<Map<String, Object>> readHistogram(
            SearchResponse response, String name, String firstMetric, String secondMetric) {
        List<Map<String, Object>> result = new ArrayList<>();
        Histogram histogram = response.getAggregations().get(name);
        if (histogram == null) {
            return result;
        }
        for (Histogram.Bucket bucket : histogram.getBuckets()) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("date", bucket.getKeyAsString());
            row.put("recordCount", bucket.getDocCount());
            if (firstMetric != null) {
                row.put("visitCount", cardinalityValue(bucket.getAggregations(), firstMetric));
            }
            if (secondMetric != null) {
                row.put("patientCount", cardinalityValue(bucket.getAggregations(), secondMetric));
            }
            result.add(row);
        }
        return result;
    }

    private List<Map<String, Object>> readHistogramWithTerms(
            SearchResponse response, String histogramName, String termsName, Map<String, String> labels) {
        List<Map<String, Object>> result = new ArrayList<>();
        Histogram histogram = response.getAggregations().get(histogramName);
        if (histogram == null) {
            return result;
        }
        for (Histogram.Bucket bucket : histogram.getBuckets()) {
            Map<String, Object> row = new LinkedHashMap<>();
            row.put("date", bucket.getKeyAsString());
            row.put("recordCount", bucket.getDocCount());
            row.put("operationTypes", labelTerms(readTerms(bucket.getAggregations(), termsName), labels));
            result.add(row);
        }
        return result;
    }

    private List<Map<String, Object>> labelTerms(
            List<Map<String, Object>> rows, Map<String, String> labels) {
        for (Map<String, Object> row : rows) {
            String key = String.valueOf(row.get("key"));
            row.put("label", labels.getOrDefault(key, "其他"));
        }
        return rows;
    }

    private String firstTermKey(Aggregations aggregations, String name) {
        Terms terms = aggregations.get(name);
        if (terms == null || terms.getBuckets().isEmpty()) {
            return null;
        }
        return terms.getBuckets().get(0).getKeyAsString();
    }
}