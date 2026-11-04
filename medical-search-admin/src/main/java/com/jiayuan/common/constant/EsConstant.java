package com.jiayuan.common.constant;

import cn.hutool.core.collection.ListUtil;

import java.util.List;

/**
 * @Title: ESConstant
 * @Package: com.jiayuan.common.constant
 * @Description: es常量
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/16
 */
public interface EsConstant {

    /**
     * 内嵌聚合名称
     */
    String AGG_NESTED = "nestedAgg";
    /**
     * 分组聚合名称
     */
    String AGG_GROUP = "groupAgg";
    /**
     * 分组桶topHits聚合名称
     */
    String AGG_TOP_HITS = "topHitsAgg";
    /**
     * 分页聚合名称
     */
    String AGG_PAGE = "pageAgg";
    /**
     * 分页总数聚合名称
     */
    String AGG_TOTAL = "totalAgg";
    /**
     * 分组聚合字段-患者id
     */
    String FIELD_GROUP = "ms_visit_record.patient_id";

    /**
     * KEYWORD
     */
    String KEYWORD = ".keyword";

    /**
     * precisionThreshold
     */
    Long MAX_PRECISION_THRESHOLD = 40000L;

    /**
     * 内嵌聚合路径
     */
    String NESTED_PATH = "ms_visit_record";
    /**
     * 就诊主表
     */
    String MS_VISIT_RECORD = "ms_visit_record";

    /**
     * 就诊类型
     */
    String VISIT_TYPE = "visit_type";

    /**
     * 就诊日期
     */
    String VISIT_DATE = "visit_date";

    /**
     * 患者id
     */
    String PATIENT_ID = "patient_id";

    /**
     * 患者id
     */
    String PATIENT_NAME = "patient_name";

    /**
     * ES索引结构使用的就诊流水号字段
     */
    String VISIT_NO = "visit_no";

    /**
     * 数据类型数组 long , integer , short , byte , double
     */
    List<String> dataTypes = ListUtil.of("long", "integer", "short", "byte", "double");


}
