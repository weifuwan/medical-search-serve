package com.jiayuan.modules.searchv2.cache;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jiayuan.modules.searchv2.component.TableFieldInfo;
import com.jiayuan.modules.template.dao.TableDao;
import com.jiayuan.modules.template.entity.TableEntity;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import com.jiayuan.modules.template.service.TableFieldService;
import com.jiayuan.modules.template.service.TableService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class MysqlMetaCache {
    private static final Logger log = LoggerFactory.getLogger(MysqlMetaCache.class);


    /**
     * 监听 TableFieldUpdateEvent 事件
     */
    @EventListener
    public void handleTableFieldUpdateEvent(TableFieldUpdateEvent event) {
        log.info("收到表字段更新事件，表名: " + event.getTableName() + ", 字段名: " + event.getFieldName());
        // 重新加载缓存
        this.loadAllTablesAndFields();
    }


    @Resource
    private TableService tableService;

    @Resource
    private TableFieldService tableFieldService;

    // 用于存储缓存数据的嵌套 Map
    private final Map<String, Map<String, TableFieldInfo>> cache = new HashMap<>(); // 表中文名 -> 字段中文名 -> TableFieldInfo
    private final Map<String, Map<String, TableFieldInfo>> cacheEnToChi = new HashMap<>(); // 表英文名 -> 字段英文名 -> TableFieldInfo

    @PostConstruct
    public void init() {
        try {
            loadAllTablesAndFields();
            log.info("初始缓存成功");
        } catch (Exception e) {
            log.error("初始化缓存失败: {}", e.getMessage(), e);
        }
    }

    // 清理所有缓存数据
    private void removeAllInfo() {
        cache.clear();
        cacheEnToChi.clear();
        log.info("清理缓存数据");
    }

    /**
     * 从 MySQL 中加载所有表和字段信息，并构建缓存
     */
    public void loadAllTablesAndFields() {

        removeAllInfo();
        // 查询所有表
        List<TableEntity> tables = tableService.selectList(new QueryWrapper<>());
        for (TableEntity table : tables) {
            String tableNameChi = table.getTableName(); // 表中文名
            String tableCode = table.getTableCode(); // 表英文名

            // 查询该表的所有字段
            LambdaQueryWrapper<TableFieldEntity> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(TableFieldEntity::getTableId, table.getId());
            List<TableFieldEntity> fields = tableFieldService.selectList(queryWrapper);

            // 构建字段信息缓存
            Map<String, TableFieldInfo> fieldInfoMapChi = new HashMap<>(); // 字段中文名 -> TableFieldInfo
            Map<String, TableFieldInfo> fieldInfoMapEn = new HashMap<>(); // 字段英文名 -> TableFieldInfo

            for (TableFieldEntity field : fields) {
                TableFieldInfo fieldInfo = TableFieldInfo.builder()
                        .tableName(tableNameChi)
                        .tableCode(tableCode)
                        .fieldName(field.getFieldName())
                        .fieldCode(field.getFieldCode())
                        .fieldType(field.getDataType())
                        .sort(field.getSort())
                        .build();

                // 缓存字段信息
                fieldInfoMapChi.put(field.getFieldName(), fieldInfo); // 字段中文名作为 key
                fieldInfoMapEn.put(field.getFieldCode(), fieldInfo); // 字段英文名作为 key
            }

            // 缓存表信息
            if (StringUtils.isNotBlank(tableNameChi)) {
                cache.put(tableNameChi, fieldInfoMapChi);
            }
            cacheEnToChi.put(tableCode, fieldInfoMapEn);

            log.info("加载表元数据: [{}] ({})", tableNameChi, tableCode);
        }
    }

    /**
     * 根据表的中文名称获取字段信息
     */
    public Map<String, TableFieldInfo> getCache(String tableNameChi) {
        return cache.get(tableNameChi);
    }

    /**
     * 根据表的英文名称获取字段信息
     */
    public Map<String, TableFieldInfo> getCacheEnToChi(String tableCode) {
        return cacheEnToChi.get(tableCode);
    }


    /**
     * 根据表的中文名称和字段的中文名称查找字段信息
     */
    public TableFieldInfo findTableAndFieldCode(String tableNameChi, String fieldNameChi) {
        if (cache.containsKey(tableNameChi)) {
            Map<String, TableFieldInfo> fieldMap = cache.get(tableNameChi);
            return fieldMap.getOrDefault(fieldNameChi, null);
        }
        return null;
    }

    /**
     * 根据表的英文名称和字段的英文名称查找字段信息
     */
    public TableFieldInfo findTableAndFieldName(String tableCode, String fieldCode) {
        if (cacheEnToChi.containsKey(tableCode)) {
            Map<String, TableFieldInfo> fieldMap = cacheEnToChi.get(tableCode);
            return fieldMap.getOrDefault(fieldCode, null);
        }
        return null;
    }
}