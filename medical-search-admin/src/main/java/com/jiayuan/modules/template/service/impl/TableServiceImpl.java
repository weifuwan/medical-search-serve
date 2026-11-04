package com.jiayuan.modules.template.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Assert;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.searchv2.cache.TableFieldUpdateEvent;
import com.jiayuan.modules.template.dao.TableDao;
import com.jiayuan.modules.template.dto.TableDTO;
import com.jiayuan.modules.template.entity.TableEntity;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import com.jiayuan.modules.template.request.MetaSearchRequest;
import com.jiayuan.modules.template.service.TableFieldService;
import com.jiayuan.modules.template.service.TableService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 表
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class TableServiceImpl extends CrudServiceImpl<TableDao, TableEntity, TableDTO> implements TableService {

    private final TableFieldService tableFieldService;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Override
    public Wrapper<TableEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");
        String classifyId = (String) params.get("classifyId");
        String tableName = (String) params.get("tableName");

        return Wrappers.<TableEntity>lambdaQuery()
                .eq(TableEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .eq(StringUtils.isNotBlank(id), TableEntity::getId, id)
                .like(StrUtil.isNotBlank(tableName), TableEntity::getTableName, tableName)
                .eq(StringUtils.isNotBlank(classifyId), TableEntity::getClassifyId, classifyId)
                .orderByAsc(TableEntity::getTableName);
    }


    @Override
    public List<TableDTO> getTableList(String tableName, boolean include, Long classifyId) {
        List<TableDTO> tableList = this.list(Wrappers.<TableEntity>lambdaQuery()
                .like(StrUtil.isNotBlank(tableName), TableEntity::getTableName, tableName)
                .eq(TableEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .eq(TableEntity::getIsEffective, true)
                .eq(TableEntity::getIsShow, true)
                .eq(Objects.nonNull(classifyId), TableEntity::getClassifyId, classifyId)
                .orderByAsc(TableEntity::getSort));
        if (include) {
            if (CollectionUtil.isNotEmpty(tableList)) {
                final List<TableFieldEntity> fieldList = tableFieldService.findList();
                if (CollectionUtil.isNotEmpty(fieldList)) {
                    final Map<Long, List<TableFieldEntity>> collect = fieldList.stream().collect(Collectors.groupingBy(TableFieldEntity::getTableId));
                    tableList.stream().forEach(table -> {
                        List<TableFieldEntity> fields = collect.get(table.getId());
                        if (CollectionUtil.isNotEmpty(fields)) {
                            fields = fields.stream().sorted(Comparator.comparing(TableFieldEntity::getSort)).collect(Collectors.toList());
                        }
                        table.setFieldList(fields);
                    });
                }
            }
        }

        return tableList;
    }

    @Override
    public void saveTable(TableDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        dto.setIsEffective(Objects.isNull(dto.getIsEffective()) ? true : dto.getIsEffective());
        this.save(dto);
    }

    @Override
    public void updateTable(TableDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        dto.setIsEffective(Objects.isNull(dto.getIsEffective()) ? true : dto.getIsEffective());
        this.update(dto);

        eventPublisher.publishEvent(new TableFieldUpdateEvent(dto.getTableName(), dto.getTableCode()));
    }

    @Override
    public void metaDataBackup() {
        log.info("===========开始备份元数据");
        //获取时间戳
        String timestamp = DateUtil.format(DateUtil.date(), "yyyyMMddHHmmss");
        this.baseDao.metaDataBackupOfTable(timestamp);
        this.baseDao.metaDataBackupOfField(timestamp);
        log.info("===========备份元数据完成");
    }

    @Override
    public void deleteAll() {
        this.baseDao.deleteAll(EsConstant.MS_VISIT_RECORD);
    }

    @Override
    public List<TableDTO> getTableInfo(MetaSearchRequest request) {
        Integer type = request.getType();
        if (Objects.isNull(type)) {
            request.setType(2);
        }
        List<TableDTO> list = this.findTableInfo(request);
        return list;
    }

    @Override
    public List<TableDTO> findTableInfo(MetaSearchRequest request) {
        return this.baseDao.findTableInfo(request);
    }

    @Override
    public void updateDisplayStatus(Long tableId, Boolean isShow) {
        this.baseDao.update(new TableEntity(), Wrappers.<TableEntity>lambdaUpdate().set(TableEntity::getIsShow, isShow).eq(TableEntity::getId, tableId));
    }
}