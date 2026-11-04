package com.jiayuan.modules.template.service;

import com.jiayuan.modules.template.request.CommentRequest;
import com.jiayuan.modules.template.request.MetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataMergeRequest;

/**
 * @Title: MetaSyncService
 * @Package: com.jiayuan.modules.template.service
 * @Description: 元数据同步接口
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/9
 */
public interface MetaSyncService {

    /**
     * 执行同步（初步同步元数据，从源数据库同步数据结构）
     *
     * @param request
     */
    void execute(MetaDataInitRequest request);


    /**
     * 合并（根据es mapping结构和现有元数据进行合并）
     */
    void merge(MetaDataMergeRequest request);

    /**
     * 注释补充
     */
    void metadataCommentSupplements(CommentRequest request);

    /**
     * 元数据更新
     */
    void metaUpdate(MetaDataMergeRequest request);
}
