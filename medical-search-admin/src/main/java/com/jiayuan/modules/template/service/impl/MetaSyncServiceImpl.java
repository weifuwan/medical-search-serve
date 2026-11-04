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
import com.jiayuan.modules.template.dto.TableDTO;
import com.jiayuan.modules.template.dto.TableFieldDTO;
import com.jiayuan.modules.template.entity.TableEntity;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import com.jiayuan.modules.template.entity.TemplateFieldEntity;
import com.jiayuan.modules.template.request.CommentRequest;
import com.jiayuan.modules.template.request.MetaDataInitRequest;
import com.jiayuan.modules.template.request.MetaDataMergeRequest;
import com.jiayuan.modules.template.service.MetaSyncService;
import com.jiayuan.modules.template.service.TableFieldService;
import com.jiayuan.modules.template.service.TableService;
import com.jiayuan.modules.template.service.TemplateFieldService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @Title: MetaSyncServiceImpl
 * @Package: com.jiayuan.modules.template.service.impl
 * @Description: 元数据同步实现接口
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/9
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class MetaSyncServiceImpl implements MetaSyncService {

    private final TableFieldService tableFieldService;
    private final TableService tableService;
    private final MetaSyncDao metaSyncDao;
    private final KeywordConfigService keywordConfigService;
    private final ResultFieldService resultFieldService;
    private final TemplateFieldService templateFieldService;
    private final SearchComponent searchComponent;
    private final CustomConfig customConfig;
    private final List<String> excludeTableList = ListUtil.of(EsConstant.MS_VISIT_RECORD, EsConstant.VISIT_NO);


    @Override
    public void execute(MetaDataInitRequest request) {
        String regex = request.getRegex();
        Boolean negation = request.getNegation();
        String dbType = request.getDbType();

        // cdr_% 和 patient
        final List<TableEntity> tableList = metaSyncDao.selectTableList(regex, negation, dbType);
        for (TableEntity table : tableList) {
            final List<TableFieldEntity> columnList = metaSyncDao.selectColumnList(table.getTableCode(), dbType);
            if (StrUtil.isBlank(table.getTableName())) {
                table.setTableName(table.getTableCode().toLowerCase());
            }
            table.setTableCode(table.getTableCode().toLowerCase());
            table.setClassifyId(1L);
            table.setSlaveType(TableSlaveType.NONE.getCode());
            table.setIsLoop(true);
            table.setIsEffective(true);
            tableService.insert(table);
            columnList.stream().forEach(e -> {
                if (StrUtil.isBlank(e.getFieldName())) {
                    e.setFieldName(e.getFieldCode().toLowerCase());
                }
                e.setFieldCode(e.getFieldCode().toLowerCase());
                e.setTableId(table.getId());
                e.setTableCode(table.getTableCode().toLowerCase());
                e.setIsEffective(true);
            });
            tableFieldService.insertBatch(columnList);
        }
    }


    @Override
    public void merge(MetaDataMergeRequest request) {
        log.info("===============元数据合并开始");
        // 查询es mapping结构
        final Map<String, Object> indexMapping = searchComponent.getIndexMapping();
        if (CollectionUtil.isEmpty(indexMapping)) {
            throw new BizException("es索引[" + customConfig.getEsIndexName() + "]mapping结构为空");
        }

        List<TableDTO> tableList = tableService.getTableList(null, true, null);

        //元数据备份
        if (CollectionUtil.isNotEmpty(tableList)) {
            tableService.metaDataBackup();
        }


        if (request.getIsReset()) {
            //重置元数据
            tableService.deleteAll();
            tableFieldService.deleteAll();
            //es索引结构生成元数据
            esIndexMappingGenerateMetaData(indexMapping);
        } else {
            //合并
            //表数据处理
            tableDataHandle(indexMapping);
            //字段数据处理
            fieldDataHandle(indexMapping);
        }


        //元数据相关业务信息变更
        metaDataRelatedBizInfoChange();

        //元数据注释标注
        //读取源数据注释
        if (request.getIsAddComment()) {
            metadataCommentSupplements(CommentRequest.builder().dbType(request.getDbType()).build());
        }

        log.info("===============元数据合并结束");
    }

    @Override
    public void metadataCommentSupplements(CommentRequest request) {
        log.info("===============元数据注释标注开始");
        String dbType = request.getDbType();
        List<TableEntity> tableInfos = metaSyncDao.selectTableList(null, false, dbType);
        if (CollectionUtil.isEmpty(tableInfos)) {
            return;
        }

        //转化成map
        Map<String, String> tableMap = new CaseInsensitiveMap();
        tableInfos.stream()
                .filter(e -> Objects.nonNull(e) && StrUtil.isNotBlank(e.getTableCode()))
                .forEach(tableInfo -> tableMap.put(tableInfo.getTableCode(), Optional.ofNullable(tableInfo).map(TableEntity::getTableName).orElse("")));

        List<TableDTO> tableList = tableService.getTableList(null, true, null);
        if (CollectionUtil.isEmpty(tableList)) {
            return;
        }

        tableList.forEach(table -> {
            String tableCode = table.getTableCode();
            if (StrUtil.isNotBlank(tableCode)) {
                if (!EsConstant.MS_VISIT_RECORD.equals(tableCode)) {

                    //表注释更新
                    if (tableCode.equals(table.getTableName()) || StrUtil.isBlank(table.getTableName())) {
                        String tableName = tableMap.get(tableCode);
                        if (StrUtil.isNotBlank(tableName)) {
                            tableService.update(new TableEntity(), Wrappers.<TableEntity>lambdaUpdate()
                                    .eq(TableEntity::getId, table.getId())
                                    .set(TableEntity::getTableName, tableName));
                        }
                    }


                    //字段注释更新
                    List<TableFieldEntity> fieldList = table.getFieldList();
                    if (CollectionUtil.isNotEmpty(fieldList)) {
                        List<TableFieldEntity> metaFieldList = metaSyncDao.selectColumnList(tableCode.toUpperCase(), dbType);
                        if (CollectionUtil.isNotEmpty(metaFieldList)) {
                            Map<String, String> fieldMap = new CaseInsensitiveMap();
                            metaFieldList.stream().forEach(fieldInfo -> fieldMap.put(fieldInfo.getFieldCode(), Optional.ofNullable(fieldInfo).map(TableFieldEntity::getFieldName).orElse("")));

                            fieldList.forEach(field -> {
                                String fieldCode = field.getFieldCode();
                                if (StrUtil.isNotBlank(fieldCode) && (field.getFieldName().equals(fieldCode) || StrUtil.isBlank(field.getFieldName()))) {
                                    if (fieldMap.containsKey(fieldCode)) {
                                        String fieldName = fieldMap.get(fieldCode);
                                        if (StrUtil.isNotBlank(fieldName)){
                                            tableFieldService.update(new TableFieldEntity(), Wrappers.<TableFieldEntity>lambdaUpdate()
                                                    .eq(TableFieldEntity::getId, field.getId())
                                                    .set(TableFieldEntity::getFieldName, fieldName));
                                        }

                                    }
                                }
                            });
                        }
                    }
                }


            }
        });

        log.info("===============元数据注释标注结束");

    }

    @Override
    public void metaUpdate(MetaDataMergeRequest request) {
        // 查询es mapping结构
        final Map<String, Object> indexMapping = searchComponent.getIndexMapping();
        if (CollectionUtil.isEmpty(indexMapping)) {
            throw new BizException("es索引[" + customConfig.getEsIndexName() + "]mapping结构为空");
        }

        List<TableDTO> tableList = tableService.getTableList(null, true, null);

        //元数据备份
        if (CollectionUtil.isNotEmpty(tableList)) {
            tableService.metaDataBackup();
        }


        //tableList转换成map,key为tableCode,value为tableList的第一个元素
        Map<String, TableDTO> tableMap = tableList.stream().collect(Collectors.toMap(TableDTO::getTableCode, table -> table));
        for (Map.Entry<String, Object> entry : indexMapping.entrySet()) {
            String tableCode = entry.getKey();
            if (StrUtil.isNotBlank(tableCode) && !excludeTableList.contains(tableCode)) {
                TableDTO table = tableMap.get(tableCode);
                if (Objects.isNull(table)) {
                    newMetaInfo(indexMapping, tableCode);
                } else {
                    updateMetaInfo(indexMapping, tableCode, table);
                }
            }
        }
    }

    /**
     * 更新字段信息
     *
     * @param indexMapping
     * @param tableCode
     * @param table
     */
    private void updateMetaInfo(Map<String, Object> indexMapping, String tableCode, TableDTO table) {
        //只更新存在字段的数据类型
        Map<String, Object> fieldMap = (Map<String, Object>) ((Map<String, Object>) indexMapping.get(tableCode)).get("properties");
        if (CollectionUtil.isNotEmpty(fieldMap)) {
            Map<String, TableFieldEntity> fieldDataMap = table.getFieldList().stream().collect(Collectors.toMap(TableFieldEntity::getFieldCode, field -> field));

            for (Map.Entry<String, Object> fieldEntry : fieldMap.entrySet()) {
                String fieldCode = fieldEntry.getKey();
                TableFieldEntity field = fieldDataMap.get(fieldCode);
                if (Objects.nonNull(field)) {
                    String dataType = field.getDataType();
                    if (StrUtil.isBlank(dataType) || !"datetime".equals(dataType)) {
                        Map<String, Object> fieldValMap = (Map<String, Object>) fieldEntry.getValue();
                        TableFieldDTO fieldDTO = new TableFieldDTO();
                        fieldDTO.setId(field.getId());
                        fieldDTO.setDataType(fieldValMap.get("type").toString());
                        tableFieldService.update(fieldDTO);
                    }
                }
            }
        }
    }


    /**
     * 新增元数据结构信息
     *
     * @param indexMapping
     * @param tableCode
     */
    private void newMetaInfo(Map<String, Object> indexMapping, String tableCode) {
        //保存表
        final TableDTO insert = new TableDTO();
        insert.setTableCode(tableCode);
        insert.setTableName(tableCode);
        insert.setIsEffective(true);
        //随机分组，最后页面手动分组处理
        insert.setClassifyId(1L);
        insert.setSlaveType(TableSlaveType.NONE.getCode());
        insert.setIsLoop(true);
        tableService.save(insert);

        //新增字段
        Map<String, Object> fieldMap = (Map<String, Object>) ((Map<String, Object>) indexMapping.get(tableCode)).get("properties");
        if (CollectionUtil.isNotEmpty(fieldMap)) {
            List<TableFieldDTO> newFieldList = fieldMap.entrySet().stream().map(fEntry -> {
                String type = ((Map<String, Object>) fEntry.getValue()).get("type").toString();
                if (!"nested".equals(type)) {
                    TableFieldDTO fieldDTO = new TableFieldDTO();
                    fieldDTO.setTableId(insert.getId());
                    fieldDTO.setTableCode(tableCode);
                    fieldDTO.setFieldCode(fEntry.getKey());
                    fieldDTO.setFieldName(fEntry.getKey());
                    fieldDTO.setFieldType(FieldUseType.OTHER.getCode());
                    fieldDTO.setDataType(type);
                    fieldDTO.setIsEffective(true);
                    return fieldDTO;
                }
                return null;
            }).filter(Objects::nonNull).collect(Collectors.toList());

            tableFieldService.saveBatch(newFieldList);
        }
    }


    /**
     * es索引结构生成元数据
     *
     * @param indexMapping
     */
    private void esIndexMappingGenerateMetaData(Map<String, Object> indexMapping) {
        indexMapping.entrySet().forEach(entry -> {
            String tableCode = entry.getKey();
            if (StrUtil.isNotBlank(tableCode)
                    && !EsConstant.MS_VISIT_RECORD.equals(tableCode)
                    && !EsConstant.VISIT_NO.equals(tableCode)) {
                //保存表
                final TableDTO insert = new TableDTO();
                insert.setTableCode(tableCode);
                insert.setTableName(tableCode);
                insert.setIsEffective(true);
                //随机分组，最后页面手动分组处理
                insert.setClassifyId(1L);
                tableService.save(insert);
                //字段保存
                Map<String, Object> fieldMap = (Map<String, Object>) ((Map<String, Object>) indexMapping.get(tableCode)).get("properties");
                if (CollectionUtil.isNotEmpty(fieldMap)) {
                    for (Map.Entry<String, Object> fieldEntry : fieldMap.entrySet()) {
                        String fieldCode = fieldEntry.getKey();
                        String type = ((Map<String, Object>) fieldEntry.getValue()).get("type").toString();
                        if (!"nested".equals(type)) {
                            TableFieldDTO fieldDTO = new TableFieldDTO();
                            fieldDTO.setFieldCode(fieldCode);
                            fieldDTO.setIsEffective(true);
                            fieldDTO.setTableId(insert.getId());
                            fieldDTO.setTableCode(tableCode);
                            fieldDTO.setFieldName(fieldCode);
                            fieldDTO.setDataType(type);
                            tableFieldService.save(fieldDTO);
                        }

                    }
                }
            }
        });

    }


    /**
     * 元数据相关业务信息变更
     */
    private void metaDataRelatedBizInfoChange() {
        log.info("===============元数据相关业务信息变更开始");
        final List<TableDTO> latestTableList = tableService.getTableList(null, true, null);
        if (CollectionUtil.isNotEmpty(latestTableList)) {

            List<String> tableCodeList = latestTableList.stream().map(TableDTO::getTableCode).collect(Collectors.toList());
            List<String> tfCodeList = latestTableList.stream().flatMap(e -> {
                List<TableFieldEntity> fieldList = e.getFieldList();
                if (CollectionUtil.isNotEmpty(fieldList)) {
                    return fieldList.stream().filter(Objects::nonNull).map(f -> e.getTableCode() + "." + f.getFieldCode());
                }
                return null;
            }).filter(Objects::nonNull).collect(Collectors.toList());


            // 默认检索字段配置失效
            // 表中不存在直接标记删除
            if (CollectionUtil.isNotEmpty(tableCodeList)) {
                keywordConfigService.update(new KeywordConfigEntity(),
                        Wrappers.<KeywordConfigEntity>lambdaUpdate()
                                .set(KeywordConfigEntity::getIsDeleted, BooleanEnum.TRUE.getCode())
                                .notIn(KeywordConfigEntity::getTableCode, tableCodeList));
            }
            //表存在字段不存在的字段删除
            List<Long> needUpdateConfigIds = keywordConfigService.getNeedUpdateConfigIds(tfCodeList);
            if (CollectionUtil.isNotEmpty(needUpdateConfigIds)) {
                keywordConfigService.update(new KeywordConfigEntity(),
                        Wrappers.<KeywordConfigEntity>lambdaUpdate().set(KeywordConfigEntity::getIsDeleted, BooleanEnum.TRUE.getCode())
                                .in(KeywordConfigEntity::getId, needUpdateConfigIds));
            }


            //表头配置失效处理
            resultFieldService.update(new ResultFieldEntity(), Wrappers.<ResultFieldEntity>lambdaUpdate()
                    .set(ResultFieldEntity::getIsDeleted, BooleanEnum.TRUE.getCode())
                    .notIn(ResultFieldEntity::getTableCode, tableCodeList));
            List<Long> needUpdateResultFieldIds = resultFieldService.getNeedUpdateConfigIds(tfCodeList);
            if (CollectionUtil.isNotEmpty(needUpdateResultFieldIds)) {
                resultFieldService.update(new ResultFieldEntity(),
                        Wrappers.<ResultFieldEntity>lambdaUpdate()
                                .set(ResultFieldEntity::getIsDeleted, BooleanEnum.TRUE.getCode())
                                .in(ResultFieldEntity::getId, needUpdateResultFieldIds));
            }


            //模板和模板字段失效处理
            templateFieldService.update(new TemplateFieldEntity(),
                    Wrappers.<TemplateFieldEntity>lambdaUpdate()
                            .set(TemplateFieldEntity::getIsDeleted, BooleanEnum.TRUE.getCode())
                            .notIn(TemplateFieldEntity::getTableCode, tableCodeList));
            List<Long> needUpdateTemplateFieldIds = templateFieldService.getNeedUpdateConfigIds(tfCodeList);
            if (CollectionUtil.isNotEmpty(needUpdateTemplateFieldIds)) {
                templateFieldService.update(new TemplateFieldEntity(),
                        Wrappers.<TemplateFieldEntity>lambdaUpdate()
                                .set(TemplateFieldEntity::getIsDeleted, BooleanEnum.TRUE.getCode())
                                .in(TemplateFieldEntity::getId, needUpdateTemplateFieldIds));
            }

        }

        log.info("===============元数据相关业务信息变更结束");
    }

    /**
     * 字段数据处理
     *
     * @param indexMapping
     */
    private void fieldDataHandle(Map<String, Object> indexMapping) {

        log.info("===============字段数据处理开始");
        // 获取元数据
        final List<TableDTO> tableList = tableService.getTableList(null, true, null);

        //获取交集(更新为有效字段)
        List<TableFieldEntity> xFields = tableList.stream().filter(e -> indexMapping.containsKey(e.getTableCode())).flatMap(e -> {
            final List<TableFieldEntity> fieldList = e.getFieldList();
            if (CollectionUtil.isNotEmpty(fieldList)) {
                Map<String, Object> fieldMap = (Map<String, Object>) ((Map<String, Object>) indexMapping.get(e.getTableCode())).get("properties");
                if (CollectionUtil.isNotEmpty(fieldMap)) {
                    return fieldList.stream().filter(f -> fieldMap.containsKey(f.getFieldCode())).map(f -> {
                        f.setDataType(((Map<String, Object>) fieldMap.get(f.getFieldCode())).get("type").toString());
                        return f;
                    });
                }
            }
            return null;
        }).filter(Objects::nonNull).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(xFields)) {
            List<TableFieldEntity> updateFields = xFields.stream().map(x -> TableFieldEntity.builder().isEffective(true).dataType(x.getDataType()).build()).collect(Collectors.toList());
            tableFieldService.updateBatchById(updateFields);
        }

        //获取不存在与索引结构中的字段:indexMapping-交集(标记失效字段)
        List<Long> noEsFieldIds = tableList.stream().filter(e -> indexMapping.containsKey(e.getTableCode())).flatMap(e -> {
            final List<TableFieldEntity> fieldList = e.getFieldList();
            if (CollectionUtil.isNotEmpty(fieldList)) {
                Map<String, Object> fieldMap = (Map<String, Object>) ((Map<String, Object>) indexMapping.get(e.getTableCode())).get("properties");
                if (CollectionUtil.isNotEmpty(fieldMap)) {
                    return fieldList.stream().filter(f -> !fieldMap.containsKey(f.getFieldCode())).map(TableFieldEntity::getId);
                }
            }
            return null;
        }).filter(Objects::nonNull).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(noEsFieldIds)) {
            final TableFieldEntity tableField = TableFieldEntity.builder().build();
            tableField.setIsEffective(false);
            tableFieldService.update(tableField, Wrappers.<TableFieldEntity>lambdaQuery().in(TableFieldEntity::getId, noEsFieldIds)
                    .ne(TableFieldEntity::getTableCode, EsConstant.MS_VISIT_RECORD));
        }

        //获取不存在与表数据中的字段:tableList-交集(新增字段)
        List<TableFieldDTO> insertField = tableList.stream().filter(e -> indexMapping.containsKey(e.getTableCode())).flatMap(e -> {
            String tableCode = e.getTableCode();
            Map<String, Object> fieldMap = (Map<String, Object>) ((Map<String, Object>) indexMapping.get(tableCode)).get("properties");
            return fieldFilter(e, fieldMap);
        }).filter(Objects::nonNull).collect(Collectors.toList());

        if (CollectionUtil.isNotEmpty(insertField)) {
            tableFieldService.saveBatch(insertField);
        }

        log.info("===============字段数据处理结束");
    }

    /**
     * 字段过滤
     *
     * @param table
     * @param fieldMap
     * @return
     */
    private Stream<TableFieldDTO> fieldFilter(TableDTO table, Map<String, Object> fieldMap) {
        if (CollectionUtil.isNotEmpty(fieldMap)) {
            String tableCode = table.getTableCode();
            if (!excludeTableList.contains(tableCode)) {
                List<TableFieldEntity> fieldList = table.getFieldList();
                Set<String> fieldCodes;
                if (CollectionUtil.isNotEmpty(fieldList)) {
                    fieldCodes = fieldList.stream().map(TableFieldEntity::getFieldCode).collect(Collectors.toSet());
                } else {
                    // 返回一个不可变的空Set
                    fieldCodes = Collections.emptySet();
                }

                Stream<TableFieldDTO> stream = fieldMap.entrySet().stream().map(entry -> {
                    String fieldCode = entry.getKey();
                    Map<String, Object> itemMap = (Map<String, Object>) entry.getValue();
                    String type = itemMap.get("type").toString();
                    if (!fieldCodes.contains(fieldCode) && !"nested".equals(type)) {
                        TableFieldDTO fieldDTO = new TableFieldDTO();
                        fieldDTO.setFieldCode(fieldCode);
                        fieldDTO.setIsEffective(true);
                        fieldDTO.setTableId(table.getId());
                        fieldDTO.setTableCode(tableCode);
                        fieldDTO.setFieldName(fieldCode);
                        fieldDTO.setFieldType(FieldUseType.OTHER.getCode());
                        fieldDTO.setDataType(type);
                        return fieldDTO;
                    }
                    return null;
                }).filter(Objects::nonNull);
                return stream;
            }
        }
        return null;
    }

    /**
     * 表数据处理
     *
     * @param indexMapping
     */
    private void tableDataHandle(Map<String, Object> indexMapping) {

        log.info("===============表数据处理开始");
        List<TableDTO> tableList = tableService.getTableList(null, true, null);
        final Map<String, TableDTO> tableMap = tableList.stream().collect(Collectors.toMap(TableDTO::getTableCode, Function.identity(), (key1, key2) -> key2));

        //indexMapping和tableList交集（标记有效）
        List<Long> xTableIds = tableList.stream().filter(e -> indexMapping.containsKey(e.getTableCode())).map(TableDTO::getId).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(xTableIds)) {
            final TableEntity update = TableEntity.builder().build();
            update.setIsEffective(true);
            tableService.update(update, Wrappers.<TableEntity>lambdaQuery().in(TableEntity::getId, xTableIds)
                    .ne(TableEntity::getTableCode, EsConstant.MS_VISIT_RECORD));
        }
        //tableList-交集 tableList 减去 交集(不存在于indexMapping的表，标记失效)
        List<Long> noEsTableIds = tableList.stream().filter(e -> !indexMapping.containsKey(e.getTableCode())).map(TableDTO::getId).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(noEsTableIds)) {
            final TableEntity update = TableEntity.builder().build();
            update.setIsEffective(false);
            tableService.update(update, Wrappers.<TableEntity>lambdaQuery().in(TableEntity::getId, noEsTableIds)
                    .ne(TableEntity::getTableCode, EsConstant.MS_VISIT_RECORD));
        }
        //indexMapping-交集（es结构中不存在的表，新增表）
        Set<Map.Entry<String, Object>> noInsertTable = indexMapping.entrySet().stream().filter(entry -> !tableMap.containsKey(entry.getKey())).collect(Collectors.toSet());
        if (CollectionUtil.isNotEmpty(noInsertTable)) {
            List<TableDTO> insertList = noInsertTable.stream().map(entry -> {
                String tableCode = entry.getKey();
                if (!excludeTableList.contains(tableCode)) {
                    final TableDTO insert = new TableDTO();
                    insert.setTableCode(tableCode);
                    insert.setTableName(tableCode);
                    insert.setIsEffective(true);
                    //随机分组，最后页面手动分组处理
                    insert.setClassifyId(1L);
                    insert.setSlaveType(TableSlaveType.NONE.getCode());
                    insert.setIsLoop(true);
                    return insert;
                }
                return null;
            }).filter(Objects::nonNull).collect(Collectors.toList());
            tableService.saveBatch(insertList);
        }

        log.info("===============表数据处理结束");
    }
}
