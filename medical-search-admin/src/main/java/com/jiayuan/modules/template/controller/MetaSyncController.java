package com.jiayuan.modules.template.controller;

import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.template.request.CommentRequest;
import com.jiayuan.modules.template.request.MetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataMergeRequest;
import com.jiayuan.modules.template.service.MetaSyncService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 元数据同步controller
 *
 * @author lijiankui
 * @since 1.0.0 2024-06-25
 */
@RestController
@RequestMapping("meta")
@Api(tags = "元数据同步")
@RequiredArgsConstructor
public class MetaSyncController {

    private final MetaSyncService metaSyncService;


    /**
     * 公司测试环境：cdr_% 、patient、就诊主表;
     * 中心医院测试环境：^(?!test|count_|temp).*$, patient、就诊主表
     * @param request
     */
    @GetMapping("init")
    @ApiOperation("执行同步（初步同步元数据，从源数据库同步数据结构）")
    public void execute(MetaDataInitRequest request) {
        metaSyncService.execute(request);
    }

    @GetMapping("merge")
    @ApiOperation("合并（根据es mapping结构和现有元数据进行合并）")
    public Result metadataVerificationProcessing(MetaDataMergeRequest request) {
        metaSyncService.merge(request);
        return Result.ok("合并完成");
    }

    @GetMapping("comment")
    @ApiOperation("元数据注释补充(元数据注释为空(也就是tableName=tableCode)的填充)")
    public Result metadataCommentSupplements(CommentRequest request) {
        metaSyncService.metadataCommentSupplements(request);
        return Result.ok("注释补充完成");
    }


    @Deprecated
    @GetMapping("metaUpdate")
    @ApiOperation("元数据更新")
    public Result metaUpdate(MetaDataMergeRequest request) {
        metaSyncService.metaUpdate(request);
        return Result.ok("元数据更新完成");
    }


}