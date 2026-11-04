package com.jiayuan.modules.template.controller;

import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.template.request.CommentRequest;
import com.jiayuan.modules.template.request.ESMetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataMergeRequest;
import com.jiayuan.modules.template.service.ESMetaSyncService;
import com.jiayuan.modules.template.service.MetaSyncService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * 元数据同步controller
 *
 * @author wfw
 * @since 1.0.0 2025-03-18
 */
@RestController
@RequestMapping("es-meta")
@Api(tags = "ES元数据同步")
@RequiredArgsConstructor
public class EsMetaSyncController {

    private final ESMetaSyncService esMetaSyncService;


    /**
     *
     */
    @GetMapping("init")
    @ApiOperation("执行同步（初步同步元数据，从ES数据库同步数据结构）")
    public void execute() {
        esMetaSyncService.execute();
    }

    /**
     * 同步单表
     *
     * @param request 参数
     */
    @GetMapping("execute-by-in")
    @ApiOperation("同步单表")
    public void executeByIndexName(ESMetaDataInitRequest request) {
        esMetaSyncService.executeByIndexName(request);
    }

    /**
     * 删除单表
     *
     * @param request 参数
     */
    @DeleteMapping("delete-by-in")
    @ApiOperation("单表删除")
    public void deleteByIndexName(ESMetaDataInitRequest request) {
        esMetaSyncService.deleteByIndexName(request);
    }

}