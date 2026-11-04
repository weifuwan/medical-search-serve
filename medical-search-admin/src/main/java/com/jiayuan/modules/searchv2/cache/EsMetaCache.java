package com.jiayuan.modules.searchv2.cache;

import com.jiayuan.modules.searchv2.component.TableFieldInfo;
import com.jiayuan.modules.template.dao.TableDao;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.client.indices.GetIndexResponse;
import org.elasticsearch.client.indices.GetMappingsRequest;
import org.elasticsearch.client.indices.GetMappingsResponse;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Stream;

@Component
public class EsMetaCache {
    private static final Logger log = LoggerFactory.getLogger(EsMetaCache.class);

    @Resource
    private TableDao tableDao;

    // 用于存储缓存数据的嵌套 Map
    private final Map<String, Map<String, TableFieldInfo>> cache = new HashMap<>();

    private final Map<String, Map<String, TableFieldInfo>> cacheEnToChi = new HashMap<>();

    public Map<String, TableFieldInfo> getCache(String indexName) {
        return cache.get(indexName);
    }

    public Map<String, TableFieldInfo> getCacheEnToChi(String indexName) {
        return cacheEnToChi.get(indexName);

    }

    // Cache to store index mappings
    private final Map<String, Map<String, String>> indexMappingsCache = new ConcurrentHashMap<>();

    @Resource
    private RestHighLevelClient client;

    @PostConstruct
    public void init() {
        try {
            loadAllIndexes();
            log.info("初始缓存成功");
        } catch (IOException e) {
            e.printStackTrace();
            log.error("初始化缓存失败{}", e.getMessage());
        }

    }


    // Load all indices and their mappings into cache
    private void loadAllIndexes() throws IOException {
        // Get all index names
        GetIndexRequest getIndexRequest = new GetIndexRequest("*"); // "*" will fetch all indices
        GetIndexResponse getIndexResponse = client.indices().get(getIndexRequest, RequestOptions.DEFAULT);

        String[] allIndexNames = getIndexResponse.getIndices(); // Get the list of all index names

        // Filter out indices that start with '.'
        String[] filteredIndexNames = Stream.of(allIndexNames)
                .filter(index -> !index.startsWith("."))  // Exclude indices starting with "."
                .toArray(String[]::new);

        for (String indexName : filteredIndexNames) {
            // For each index, get its mappings and cache it
            setFieldTypesAndMeta(indexName);

        }
    }

    // Fetch and cache field types for a specific index
    public Map<String, String> getFieldTypes(String indexName) throws IOException {
        // Check if the index structure is already cached
        if (indexMappingsCache.containsKey(indexName)) {
            return indexMappingsCache.get(indexName);
        }

        // If not cached, query Elasticsearch and store the result in the cache
        GetMappingsRequest getMappingsRequest = new GetMappingsRequest();
        getMappingsRequest.indices(indexName);
        GetMappingsResponse getMappingsResponse = client.indices()
                .getMapping(getMappingsRequest, RequestOptions.DEFAULT);

        Map<String, Object> mappings = getMappingsResponse.mappings()
                .get(indexName).getSourceAsMap();
        return getFieldTypes(mappings);
    }

    // Fetch and cache field types for a specific index
    public void setFieldTypesAndMeta(String indexName) throws IOException {

        // If not cached, query Elasticsearch and store the result in the cache
        GetMappingsRequest getMappingsRequest = new GetMappingsRequest();
        getMappingsRequest.indices(indexName);
        GetMappingsResponse getMappingsResponse = client.indices()
                .getMapping(getMappingsRequest, RequestOptions.DEFAULT);

        Map<String, Object> mappings = getMappingsResponse.mappings()
                .get(indexName).getSourceAsMap();

        if (mappings.get("_meta") != null) {
            Map<String, Object> meta = (Map<String, Object>) mappings.get("_meta");
            Map<String, String> fieldsMapping = (Map<String, String>) meta.get("fields");
            if (StringUtils.isNoneBlank(indexName)) {
                String tableNameChi = (String) meta.get("description");
                Map<String, String> mapping = getFieldTypes(mappings);
                indexMappingsCache.put(indexName, mapping);

                Map<String, TableFieldInfo> fieldInfoMap = new HashMap<>();

                for (String field : fieldsMapping.keySet()) {
                    TableFieldInfo tableFieldInfo = new TableFieldInfo();
                    tableFieldInfo.setTableName(tableNameChi);
                    tableFieldInfo.setTableCode(indexName);
                    tableFieldInfo.setFieldName(fieldsMapping.get(field));
                    tableFieldInfo.setFieldCode(field);
                    tableFieldInfo.setFieldType(mapping.getOrDefault(field, "default字段"));
                    fieldInfoMap.put(fieldsMapping.get(field), tableFieldInfo);
                }
                if (tableNameChi != null) {
                    cache.put(tableNameChi, fieldInfoMap);
                }


                Map<String, TableFieldInfo> fieldInfoMapChi = new HashMap<>();

                for (String field : fieldsMapping.keySet()) {
                    TableFieldInfo tableFieldInfo = new TableFieldInfo();
                    tableFieldInfo.setTableName(tableNameChi);
                    tableFieldInfo.setTableCode(indexName);
                    tableFieldInfo.setFieldName(fieldsMapping.get(field));
                    tableFieldInfo.setFieldCode(field);
                    tableFieldInfo.setFieldType(mapping.getOrDefault(field, "default字段"));
                    fieldInfoMapChi.put(field, tableFieldInfo);
                }

                cacheEnToChi.put(indexName, fieldInfoMapChi);

                log.info("加载[ " + indexName + " ] 表元数据");
            }

        } else {
            log.info("跳过没有_meta信息的索引 - {}", indexName);
        }
    }


    private String categorizeFieldType(String fieldType) {
        // 数值类型
        switch (fieldType) {
            case "integer":
            case "long":
            case "float":
            case "double":
                return "number";

            // 时间类型
            case "date":
                return "date";

            // 文本类型
            case "text":
            case "keyword":
                return "text";
        }

        // 如果不在已知类型范围内，默认返回"未知"
        return "text";
    }

    // get field type
    private Map<String, String> getFieldTypes(Map<String, Object> mappings) {
        Map<String, String> fieldTypes = new HashMap<>();

        // 获取映射中的 properties
        Map<String, Object> properties = (Map<String, Object>) mappings.get("properties");
        if (properties != null) {
            for (Map.Entry<String, Object> entry : properties.entrySet()) {
                String fieldName = entry.getKey();
                Map<String, Object> fieldMapping = (Map<String, Object>) entry.getValue();


                // 获取字段的类型
                String fieldType = (String) fieldMapping.getOrDefault("type", "text");

                // 根据字段类型归类
                String fieldCategory = categorizeFieldType(fieldType);

                // 添加到结果Map
                fieldTypes.put(fieldName, fieldCategory);
            }
        }

        return fieldTypes;
    }

    // 根据表的中文名称和字段的中文名称查找对应的表的英文名称和字段的英文名称
    public TableFieldInfo findTableAndFieldCode(String tableName, String fieldName) {
        if (cache.containsKey(tableName)) {
            Map<String, TableFieldInfo> fieldMap = cache.get(tableName);
            if (fieldMap.containsKey(fieldName)) {
                return fieldMap.getOrDefault(fieldName, TableFieldInfo.builder()
                        .fieldName(fieldName)
                        .fieldCode(fieldName)
                        .build());
            }
        }
        return null; // 如果没有找到对应的数据，返回null
    }

    // 根据表的中文名称和字段的中文名称查找对应的表的英文名称和字段的英文名称
    public TableFieldInfo findTableAndFieldName(String tableName, String fieldName) {
        if (cacheEnToChi.containsKey(tableName)) {
            Map<String, TableFieldInfo> fieldMap = cacheEnToChi.get(tableName);
            if (fieldMap.containsKey(fieldName)) {
                return fieldMap.getOrDefault(fieldName, TableFieldInfo.builder()
                        .fieldName(fieldName)
                        .fieldCode(fieldName)
                        .build());
            } else {
                System.out.println("不存在[ " + fieldName + " ]的字段元数据");
            }
        } else {
            System.out.println("不存在[ " + tableName + " ]的表元数据");
        }
        return null; // 如果没有找到对应的数据，返回null
    }
}