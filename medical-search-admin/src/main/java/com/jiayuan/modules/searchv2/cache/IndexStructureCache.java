package com.jiayuan.modules.searchv2.cache;

import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.client.indices.GetIndexResponse;
import org.elasticsearch.client.indices.GetMappingsRequest;
import org.elasticsearch.client.indices.GetMappingsResponse;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Stream;

@Service
public class IndexStructureCache {

    @Resource
    private RestHighLevelClient client;

    // Cache to store index mappings
    private final Map<String, Map<String, String>> indexMappingsCache = new ConcurrentHashMap<>();

    @PostConstruct
    public void init() throws IOException {
        loadAllIndexes();
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
            Map<String, String> fieldTypes = getFieldTypes(indexName);
            indexMappingsCache.put(indexName, fieldTypes);
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
}

