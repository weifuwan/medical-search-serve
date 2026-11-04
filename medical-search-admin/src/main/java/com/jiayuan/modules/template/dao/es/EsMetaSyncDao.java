package com.jiayuan.modules.template.dao.es;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.jiayuan.common.enums.FieldUseType;
import com.jiayuan.common.enums.TableSlaveType;
import com.jiayuan.common.utils.uuid.SnowflakeIdGenerator;
import com.jiayuan.modules.template.dao.MetaSyncDao;
import com.jiayuan.modules.template.dto.TableDTO;
import com.jiayuan.modules.template.entity.TableEntity;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import com.jiayuan.modules.template.service.TableFieldService;
import com.jiayuan.modules.template.service.TableService;
import org.apache.commons.lang3.StringUtils;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.client.indices.GetIndexRequest;
import org.elasticsearch.client.indices.GetIndexResponse;
import org.elasticsearch.client.indices.GetMappingsRequest;
import org.elasticsearch.client.indices.GetMappingsResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.*;
import java.util.stream.Stream;

/**
 * DAO for synchronizing Elasticsearch metadata with database
 */
@Component
public class EsMetaSyncDao {
    private static final Logger log = LoggerFactory.getLogger(EsMetaSyncDao.class);

    @Resource
    private TableService tableService;

    @Resource
    private TableFieldService tableFieldService;

    @Resource
    private MetaSyncDao metaSyncDao;

    @Resource
    private RestHighLevelClient client;

    /**
     * Loads all Elasticsearch indices (excluding system indices) and synchronizes their metadata
     *
     * @throws IOException if there's an error communicating with Elasticsearch
     */
    public void loadAllIndexes() throws IOException {
        GetIndexRequest getIndexRequest = new GetIndexRequest("*");
        GetIndexResponse getIndexResponse = client.indices().get(getIndexRequest, RequestOptions.DEFAULT);

        String[] allIndexNames = getIndexResponse.getIndices();

        // Filter out system indices (those starting with '.')
        String[] filteredIndexNames = Stream.of(allIndexNames)
                .filter(index -> !index.startsWith("."))
                .toArray(String[]::new);

        SnowflakeIdGenerator snowflakeIdGenerator = new SnowflakeIdGenerator(2, 2);
        for (String indexName : filteredIndexNames) {
            syncMeta(indexName, snowflakeIdGenerator);
        }
    }

    /**
     * Synchronizes metadata for a specific Elasticsearch index
     *
     * @param indexName The name of the index to synchronize
     * @param snowflakeIdGenerator ID generator for table records
     * @throws IOException if there's an error communicating with Elasticsearch
     */
    public void syncMeta(String indexName, SnowflakeIdGenerator snowflakeIdGenerator) throws IOException {
        log.info("=============== Start synchronizing [{}] =================", indexName);

        // Check and clean existing metadata
        cleanExistingMetadata(indexName);

        // Get Elasticsearch mappings
        Map<String, Object> mappings = getIndexMappings(indexName);
        if (mappings.get("_meta") == null) {
            log.info("Skipping index without _meta information - {}", indexName);
            return;
        }

        // Process metadata
        Map<String, Object> meta = (Map<String, Object>) mappings.get("_meta");
        String tableNameChi = (String) meta.get("description");
        if (StringUtils.isBlank(tableNameChi)) {
            log.info("Skipping index with empty description - {}", indexName);
            return;
        }

        // Create and save table entity
        TableEntity table = createTableEntity(indexName, tableNameChi, snowflakeIdGenerator);
        tableService.insert(table);

        // Process and save fields
        List<TableFieldEntity> fields = processIndexFields(
                mappings,
                (Map<String, String>) meta.get("fields"),
                table
        );
        tableFieldService.insertBatch(fields);

        log.info("Successfully synchronized metadata for index [{}]", indexName);
        log.info("=============== Finished synchronizing [{}] =================", indexName);
    }

    /**
     * Checks for existing metadata and deletes it if found
     *
     * @param indexName The index name to check
     */
    private void cleanExistingMetadata(String indexName) {
        LambdaQueryWrapper<TableEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TableEntity::getTableCode, indexName);
        TableDTO existingTable = tableService.selectOne(wrapper);

        if (existingTable != null) {
            log.info("Found existing metadata for index {}, deleting...", indexName);
            tableFieldService.deleteByTableCode(existingTable.getId());
            tableService.deleteById(existingTable.getId());
        }
    }

    /**
     * Retrieves Elasticsearch index mappings
     *
     * @param indexName The index name
     * @return Map of index mappings
     * @throws IOException if there's an error communicating with Elasticsearch
     */
    private Map<String, Object> getIndexMappings(String indexName) throws IOException {
        GetMappingsRequest getMappingsRequest = new GetMappingsRequest();
        getMappingsRequest.indices(indexName);
        GetMappingsResponse getMappingsResponse = client.indices()
                .getMapping(getMappingsRequest, RequestOptions.DEFAULT);

        return getMappingsResponse.mappings()
                .get(indexName).getSourceAsMap();
    }

    /**
     * Creates a new TableEntity from index information
     *
     * @param indexName The Elasticsearch index name
     * @param tableNameChi The Chinese table name from metadata
     * @param idGenerator ID generator for the table record
     * @return Configured TableEntity
     */
    private TableEntity createTableEntity(String indexName, String tableNameChi,
                                          SnowflakeIdGenerator idGenerator) {
        TableEntity entity = TableEntity.builder()
                .tableName(tableNameChi)
                .tableCode(indexName.toLowerCase())
                .classifyId(-1L)
                .slaveType(TableSlaveType.NONE.getCode())
                .isLoop(true)
                .isEffective(true)
                .build();
        entity.setId(idGenerator.nextId());
        return entity;
    }

    /**
     * Processes index fields and creates corresponding TableFieldEntity objects
     *
     * @param mappings Elasticsearch mappings
     * @param fieldsMapping Field name mappings from _meta
     * @param table The parent table entity
     * @return List of TableFieldEntity objects
     */
    private List<TableFieldEntity> processIndexFields(Map<String, Object> mappings,
                                                      Map<String, String> fieldsMapping,
                                                      TableEntity table) {
        List<TableFieldEntity> fields = new ArrayList<>();
        Map<String, String> fieldTypes = getFieldTypes(mappings);
        Map<String, Integer> oracleColumnOrders = getOracleColumnOrder(table.getTableCode());
        SnowflakeIdGenerator fieldsIdGen = new SnowflakeIdGenerator(4, 4);

        for (Map.Entry<String, String> entry : fieldsMapping.entrySet()) {
            String fieldCode = entry.getKey();
            String fieldName = entry.getValue();

            if (StringUtils.isBlank(fieldName)) {
                log.warn("Empty field name for table {} - field {}",
                        table.getTableName(), fieldCode);
                fieldName = "Default Value";
            }

            TableFieldEntity field = TableFieldEntity.builder()
                    .fieldName(fieldName)
                    .fieldCode(fieldCode)
                    .tableId(table.getId())
                    .tableCode(table.getTableCode().toLowerCase())
                    .isEffective(true)
                    .sort(oracleColumnOrders.getOrDefault(fieldCode, 0))
                    .dataType(fieldTypes.getOrDefault(fieldCode, "text"))
                    .fieldType(FieldUseType.OTHER.getCode())
                    .build();
            field.setId(fieldsIdGen.nextId());
            field.setCreator(1L);
            field.setCreatorName("管理员");
            field.setUpdaterName("管理员");
            field.setCreateDate(new Date());
            fields.add(field);
        }

        return fields;
    }



    /**
     * Retrieves column order information from Oracle metadata
     *
     * @param tableName The table name to query (case-insensitive)
     * @return Map of column names (lowercase) to their sort order
     */
    private Map<String, Integer> getOracleColumnOrder(String tableName) {
        Map<String, Integer> columnOrders = new HashMap<>();

        try {
            String upperTableName = tableName.toUpperCase();
            List<TableFieldEntity> results = metaSyncDao.queryMetaOrder(upperTableName);

            for (TableFieldEntity fieldEntity : results) {
                String columnName = fieldEntity.getFieldCode().toLowerCase();
                columnOrders.put(columnName, fieldEntity.getSort());
            }
        } catch (Exception e) {
            log.error("Failed to get Oracle column order for table: {}", tableName, e);
        }

        return columnOrders;
    }

    /**
     * Categorizes Elasticsearch field types into simplified types
     *
     * @param fieldType The Elasticsearch field type
     * @return The simplified type category
     */
    private String categorizeFieldType(String fieldType) {
        switch (fieldType) {
            case "integer":
            case "long":
            case "float":
            case "double":
                return "number";
            case "date":
                return "date";
            case "text":
            case "keyword":
                return "text";
            default:
                return "text";
        }
    }

    /**
     * Extracts field types from Elasticsearch mappings
     *
     * @param mappings The Elasticsearch mappings
     * @return Map of field names to their categorized types
     */
    private Map<String, String> getFieldTypes(Map<String, Object> mappings) {
        Map<String, String> fieldTypes = new HashMap<>();

        Map<String, Object> properties = (Map<String, Object>) mappings.get("properties");
        if (properties == null) {
            return fieldTypes;
        }

        for (Map.Entry<String, Object> entry : properties.entrySet()) {
            String fieldName = entry.getKey();
            Map<String, Object> fieldMapping = (Map<String, Object>) entry.getValue();
            String fieldType = (String) fieldMapping.getOrDefault("type", "text");
            fieldTypes.put(fieldName, categorizeFieldType(fieldType));
        }

        return fieldTypes;
    }

    /**
     * Synchronizes metadata for a specific index by name
     *
     * @param indexName The name of the index to synchronize
     */
    public void syncMetaByIndexName(String indexName) {
        SnowflakeIdGenerator snowflakeIdGenerator = new SnowflakeIdGenerator(2, 2);
        try {
            syncMeta(indexName, snowflakeIdGenerator);
        } catch (IOException e) {
            log.error("Failed to synchronize index: {}", indexName, e);
        }
    }

    /**
     * Deletes metadata for a specific index by name
     *
     * @param indexName The name of the index to delete
     */
    public void deleteByIndexName(String indexName) {
        log.info("=============== Start deleting [{}] =================", indexName);

        LambdaQueryWrapper<TableEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TableEntity::getTableCode, indexName);
        TableDTO tableDTO = tableService.selectOne(wrapper);

        if (tableDTO != null) {
            tableFieldService.deleteByTableCode(tableDTO.getId());
            tableService.deleteById(tableDTO.getId());
        } else {
            log.info("No metadata found for index: {}", indexName);
        }

        log.info("=============== Finished deleting [{}] =================", indexName);
    }

}
