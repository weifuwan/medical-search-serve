package com.jiayuan.modules.template.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.map.CaseInsensitiveMap;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.enums.FieldUseType;
import com.jiayuan.common.enums.TableSlaveType;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.search.component.SearchComponent;
import com.jiayuan.modules.search.entity.KeywordConfigEntity;
import com.jiayuan.modules.search.entity.ResultFieldEntity;
import com.jiayuan.modules.search.service.KeywordConfigService;
import com.jiayuan.modules.search.service.ResultFieldService;
import com.jiayuan.modules.template.dao.MetaSyncDao;
import com.jiayuan.modules.template.dao.es.EsMetaSyncDao;
import com.jiayuan.modules.template.dto.TableDTO;
import com.jiayuan.modules.template.dto.TableFieldDTO;
import com.jiayuan.modules.template.entity.TableEntity;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import com.jiayuan.modules.template.entity.TemplateFieldEntity;
import com.jiayuan.modules.template.request.CommentRequest;
import com.jiayuan.modules.template.request.ESMetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataMergeRequest;
import com.jiayuan.modules.template.service.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @Title: MetaSyncServiceImpl
 * @Package: com.jiayuan.modules.template.service.impl
 * @Description: 元数据同步实现接口
 * @Author: 魏福万
 * @Date: 创建时间 2025/3/18
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class EsMetaSyncServiceImpl implements ESMetaSyncService {

    @Resource
    private EsMetaSyncDao esMetaSyncDao;


    @Override
    public void execute() {
        log.info("===============Start synchronizing the data table=================");
        try {
            esMetaSyncDao.loadAllIndexes();
        } catch (IOException e) {
            e.printStackTrace();
        }
        log.info("===============Finish synchronizing the data table=================");
    }

    @Override
    public void executeByIndexName(ESMetaDataInitRequest request) {
        esMetaSyncDao.syncMetaByIndexName(request.getIndexName());
    }

    @Override
    public void deleteByIndexName(ESMetaDataInitRequest request) {
        esMetaSyncDao.deleteByIndexName(request.getIndexName());
    }
}
