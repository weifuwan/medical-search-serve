package com.jiayuan.modules.research.controller;

import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.research.dto.ResearchStatisticsRequest;
import com.jiayuan.modules.research.service.ResearchStatisticsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Statistics APIs for the research data center.
 *
 * <p>These endpoints use the application's normal OAuth2 authentication chain.
 * They are intentionally not added to the shared patient API token allowlist.</p>
 */
@RestController
@RequestMapping("research/statistics")
@Api(tags = "科研数据中心统计")
public class ResearchStatisticsController {

    @Resource
    private ResearchStatisticsService researchStatisticsService;

    @GetMapping("overview")
    @ApiOperation("科研数据总览：患者、就诊、时间跨度、机构、字段及最近更新时间")
    public Result<Map<String, Object>> overview(@ModelAttribute ResearchStatisticsRequest request) {
        return Result.ok(researchStatisticsService.overview(request));
    }

    @GetMapping("visit-trend")
    @ApiOperation("就诊趋势及就诊类型分布")
    public Result<Map<String, Object>> visitTrend(@ModelAttribute ResearchStatisticsRequest request) {
        return Result.ok(researchStatisticsService.visitTrend(request));
    }

    @GetMapping("patient-profile")
    @ApiOperation("患者画像：性别、地域、民族、婚姻、职业及医保类型")
    public Result<Map<String, Object>> patientProfile(@ModelAttribute ResearchStatisticsRequest request) {
        return Result.ok(researchStatisticsService.patientProfile(request));
    }

    @GetMapping("empi-operations")
    @ApiOperation("EMPI 患者操作统计及趋势")
    public Result<Map<String, Object>> empiOperations(@ModelAttribute ResearchStatisticsRequest request) {
        return Result.ok(researchStatisticsService.empiOperations(request));
    }

    @GetMapping("outpatient-summary")
    @ApiOperation("门诊业务统计：挂号、接诊、诊断、处方、收费及结算")
    public Result<Map<String, Object>> outpatientSummary(@ModelAttribute ResearchStatisticsRequest request) {
        return Result.ok(researchStatisticsService.outpatientSummary(request));
    }

    @GetMapping("inpatient-summary")
    @ApiOperation("住院业务统计：入院、出院、病案、诊断及费用")
    public Result<Map<String, Object>> inpatientSummary(@ModelAttribute ResearchStatisticsRequest request) {
        return Result.ok(researchStatisticsService.inpatientSummary(request));
    }

    @GetMapping("disease-distribution")
    @ApiOperation("疾病分布：门诊及住院诊断分别统计")
    public Result<Map<String, Object>> diseaseDistribution(@ModelAttribute ResearchStatisticsRequest request) {
        return Result.ok(researchStatisticsService.diseaseDistribution(request));
    }

    @GetMapping("medical-tech-summary")
    @ApiOperation("医技统计：检验、检查、手术、输血、危急值、不良事件及生命体征")
    public Result<Map<String, Object>> medicalTechSummary(@ModelAttribute ResearchStatisticsRequest request) {
        return Result.ok(researchStatisticsService.medicalTechSummary(request));
    }
}