package com.jiayuan.modules.template.service;

import com.jiayuan.modules.template.request.CommentRequest;
import com.jiayuan.modules.template.request.ESMetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataMergeRequest;

/**
 * @Title: MetaSyncService
 * @Package: com.jiayuan.modules.template.service
 * @Description: 元数据同步接口
 * @Author: 魏福万
 * @Date: 创建时间 2025/3/18
 */
public interface ESMetaSyncService {

    /**
     * 执行同步（初步同步元数据，从源数据库同步数据结构）
     *
     */
    void execute();


    /**
     * 同步单表
     *
     * @param request
     */
    void executeByIndexName(ESMetaDataInitRequest request);

    /**
     * 同步单表
     *
     * @param request
     */
    void deleteByIndexName(ESMetaDataInitRequest request);




}
