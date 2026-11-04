package com.jiayuan.common.utils;

import cn.afterturn.easypoi.excel.entity.params.ExcelExportEntity;
import cn.hutool.core.bean.BeanUtil;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.jiayuan.common.constant.ExportConstant;
import com.jiayuan.modules.search.dto.EsPageData;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;

import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

import static com.jiayuan.common.constant.EsConstant.NESTED_PATH;

/**
 * ExcelExportEntity
 */
public class ExcelExportEntityUtil {

    /**
     * 构造人次（维度）单元格表头
     *
     * @param columnList
     * @param rowsList
     * @return
     */
    public static List<ExcelExportEntity> buildBaseExcelHeader(List<FieldDTO> columnList, List rowsList) {
        List<ExcelExportEntity> headerList = Lists.newArrayList();
        if (CollectionUtils.isNotEmpty(columnList)) {
            Map<String, Object> data = CollectionUtils.isNotEmpty(rowsList) ? (Map<String, Object>) rowsList.get(0) : Maps.newHashMap();
            columnList.stream()
                    .collect(Collectors.groupingBy(FieldDTO::getTableCode))
                    .forEach((key, value) -> {
                        Object obj = data.get(key);
                        if (Objects.isNull(obj)) {
                            AtomicReference<String> pTableCode = new AtomicReference<>(key);
                            List<ExcelExportEntity> extraEntity = Lists.newArrayList();

                            value.stream().collect(Collectors.groupingBy(FieldDTO::getTableCode))
                                    .forEach((key1, value1) -> {
                                        if (key.equals(key1)) {
                                            List<ExcelExportEntity> extraDetailEntity = Lists.newArrayList();
                                            value1.stream().sorted(Comparator.comparing(FieldDTO::getSort, Comparator.nullsLast(Integer::compareTo))).forEach(f -> {
                                                pTableCode.set(f.getMainTableCode());
                                                ExcelExportEntity excelExportEntity = createExcelExportEntity(
                                                        f.getSort(),
                                                        f.getFieldCode(),
                                                        String.format("%s.%s", f.getTableName(), f.getFieldName()),
                                                        null);
                                                extraDetailEntity.add(excelExportEntity);
                                            });

                                            ExcelExportEntity entity = createExcelExportEntity(
                                                    99,
                                                    key1,
                                                    null,
                                                    extraDetailEntity);
                                            extraEntity.add(entity);
                                        } else {
                                            value1.stream()
                                                    .sorted(Comparator.comparing(FieldDTO::getSort, Comparator.nullsLast(Integer::compareTo)))
                                                    .forEach(field -> {
                                                        ExcelExportEntity entity = createExcelExportEntity(
                                                                field.getSort(),
                                                                field.getFieldCode(),
                                                                String.format("%s.%s", field.getTableName(), field.getFieldName()),
                                                                null);
                                                        extraEntity.add(entity);
                                                    });
                                        }
                                    });
                            ExcelExportEntity entity = createExcelExportEntity(
                                    99,
                                    pTableCode.get(),
                                    null,
                                    extraEntity);
                            headerList.add(entity);
                        } else if (obj instanceof List) {
                            List<ExcelExportEntity> extraEntity = Lists.newArrayList();
                            value.stream().sorted(Comparator.comparing(FieldDTO::getSort, Comparator.nullsLast(Integer::compareTo))).forEach(f -> {
                                ExcelExportEntity excelExportEntity = createExcelExportEntity(
                                        f.getSort(),
                                        f.getFieldCode(),
                                        String.format("%s.%s", f.getTableName(), f.getFieldName()),
                                        null);
                                extraEntity.add(excelExportEntity);
                            });
                            ExcelExportEntity entity = createExcelExportEntity(
                                    99,
                                    key,
                                    null,
                                    extraEntity);
                            headerList.add(entity);
                        } else {
                            value.stream()
                                    .sorted(Comparator.comparing(FieldDTO::getSort, Comparator.nullsLast(Integer::compareTo)))
                                    .forEach(field -> {
                                        ExcelExportEntity entity = createExcelExportEntity(
                                                field.getSort(),
                                                field.getFieldCode(),
                                                Objects.nonNull(obj) ? field.getFieldName() : String.format("%s.%s", field.getTableName(), field.getFieldName()),
                                                null);
                                        headerList.add(entity);
                                    });
                        }
                    });
        }

        return headerList;
    }

    /**
     * 构造人次（维度）单元格数据
     *
     * @param rowsList 源数据
     * @return
     */
    public static List<Map<String, Object>> buildBaseExcelRow(List<FieldDTO> columnList, List rowsList) {
        List<Map<String, Object>> newRowsList = Lists.newArrayList();
        if (CollectionUtils.isNotEmpty(rowsList)) {
            Set<String> tableCodes = Sets.newHashSet();
            for (FieldDTO fieldDTO : columnList) {
                if (StringUtils.isNotBlank(fieldDTO.getTableCode())) {
                    tableCodes.add(fieldDTO.getTableCode());
                }
                if (StringUtils.isNotBlank(fieldDTO.getMainTableCode())) {
                    tableCodes.add(fieldDTO.getMainTableCode());
                }
            }
            for (Object obj : rowsList) {
                newRowsList.addAll(convert((Map<String, Object>) obj, tableCodes));
            }
        }
        return newRowsList;
    }

    /**
     * 构造人(维度)导出excel表头
     *
     * @param columnList 表头集合
     * @return
     */
    public static List<ExcelExportEntity> buildExcelHeader(List<FieldDTO> columnList, List rowsList) {
        Map<Integer, List<FieldDTO>> basicMap = columnList.stream()
                .collect(Collectors.groupingBy(FieldDTO::getIsBasic));

        // 患者基础字段
        List<ExcelExportEntity> headerList = basicMap.get(1)
                .stream()
                .sorted(Comparator.comparing(FieldDTO::getSort, Comparator.nullsLast(Integer::compareTo)))
                .map(field -> createExcelExportEntity(
                        field.getSort(),
                        field.getFieldCode(),
                        field.getFieldName(),
                        null))
                .collect(Collectors.toList());

        // 其他字段
        List<FieldDTO> subFieldList = basicMap.get(0);
        if (CollectionUtils.isNotEmpty(subFieldList) && CollectionUtils.isNotEmpty(rowsList)) {
            EsPageData.Group rows = BeanUtil.toBean(rowsList.get(0), EsPageData.Group.class);

            ExcelExportEntity entity = createExcelExportEntity(subFieldList.size(), NESTED_PATH,
                    null,
                    buildBaseExcelHeader(subFieldList, rows.getSubList()));

            headerList.add(entity);
        }

        return headerList;
    }


    /**
     * 构造人（维度）单元格数据
     *
     * @param rowsList 源数据
     * @return
     */
    public static List<Map<String, Object>> buildExcelRow(List<FieldDTO> columnList, List rowsList) {
        List<Map<String, Object>> newRowsList = Lists.newArrayList();
        Set<String> tableCodes = Sets.newHashSet();
        for (FieldDTO fieldDTO : columnList) {
            if (StringUtils.isNotBlank(fieldDTO.getTableCode())) {
                tableCodes.add(fieldDTO.getTableCode());
            }
            if (StringUtils.isNotBlank(fieldDTO.getMainTableCode())) {
                tableCodes.add(fieldDTO.getMainTableCode());
            }
        }
        for (Object obj : rowsList) {
            EsPageData.Group rows = BeanUtil.toBean(obj, EsPageData.Group.class);
            //子表
            List<Map<String, Object>> subList = rows.getSubList();

            List<Map<String, Object>> subRowsList = Lists.newArrayList();
            for (Map<String, Object> subMap : subList) {
                subRowsList.addAll(convert(subMap, tableCodes));
            }
            for (Map<String, Object> subRow : subRowsList) {
                Map<String, Object> data = Maps.newHashMap();
                // 基础信息字段导出
                data.putAll(((Map<String, Object>) rows.getBasic()));
                data.put(NESTED_PATH, Lists.newArrayList(subRow));
                newRowsList.add(data);
            }
        }
        return newRowsList;
    }

    private static List<Map<String, Object>> convert(Map<String, Object> rows, Set<String> tableCodes) {
        List<Map<String, Object>> newRowList = Lists.newArrayList();
        int index = 0;
        int max = 1;

        while (index < max) {
            Map<String, Object> data = Maps.newHashMap();
            for (Map.Entry<String, Object> tableEntry : rows.entrySet()) {
                Object object = tableEntry.getValue();
                if (tableCodes.contains(tableEntry.getKey())) {
                    if (object instanceof Map) {
                        data.putAll((Map<String, Object>) object);
                    } else if (object instanceof List) {
                        List list = (List) object;
                        if (index < list.size()) {
                            data.put(tableEntry.getKey(), Lists.newArrayList(list.get(index)));
                        }
                        if (max < list.size()) {
                            max = list.size();
                        }
                    }
                }
            }
            newRowList.add(data);
            ++index;
        }

        return newRowList;
    }

    private static ExcelExportEntity createExcelExportEntity(Integer orderNum, String key, String name, List<ExcelExportEntity> entityList) {
        ExcelExportEntity entity = new ExcelExportEntity();
        entity.setWrap(true);
        entity.setKey(key);
        entity.setName(name);
        entity.setWidth(15);
        entity.setOrderNum(Objects.isNull(orderNum) ? ExportConstant.MAX_EXPORT_FIELD : orderNum);
        entity.setList(entityList);
        return entity;
    }
}
