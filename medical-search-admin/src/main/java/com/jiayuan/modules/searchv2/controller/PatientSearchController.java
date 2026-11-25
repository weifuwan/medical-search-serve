package com.jiayuan.modules.searchv2.controller;

import com.jiayuan.common.annotation.LogOperation;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.modules.searchv2.dto.PatientCountVO;
import com.jiayuan.modules.searchv2.dto.PatientListVO;
import com.jiayuan.modules.searchv2.dto.PatientSearchRequest;
import com.jiayuan.modules.searchv2.service.PatientSearchService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/** Patient-scope APIs. All result identity and pagination use visit_no. */
@RestController
@RequestMapping("patient")
@Api(tags = "患者范围检索")
public class PatientSearchController {

    @Resource
    private PatientSearchService patientSearchService;

    @PostMapping("count")
    @ApiOperation("统计符合检索条件的唯一 visit_no 数量")
    @LogOperation("患者范围数量统计")
    public Result<PatientCountVO> count(@RequestBody PatientSearchRequest request) {
        ValidatorUtils.validateEntity(request);
        return Result.ok(patientSearchService.count(request));
    }

    @PostMapping("list")
    @ApiOperation("查询符合检索条件的就诊主表记录")
    @LogOperation("患者范围列表查询")
    public Result<PatientListVO> list(@RequestBody PatientSearchRequest request) {
        ValidatorUtils.validateEntity(request);
        return Result.ok(patientSearchService.list(request));
    }
}
