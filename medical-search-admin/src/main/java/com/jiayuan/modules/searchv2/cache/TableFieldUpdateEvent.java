package com.jiayuan.modules.searchv2.cache;

public class TableFieldUpdateEvent {
    // 可以包含一些事件相关的数据，比如表名、字段名等
    private String tableName;
    private String fieldName;

    public TableFieldUpdateEvent() {
    }

    public TableFieldUpdateEvent(String tableName, String fieldName) {
        this.tableName = tableName;
        this.fieldName = fieldName;
    }

    // Getters and Setters
    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }
}