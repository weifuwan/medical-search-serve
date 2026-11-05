package com.jiayuan.modules.share.entity;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class ExpressionShareRecord {
    private String id;
    private String code;
    private String title;
    private String expression;
    private Long ownerId;
    private String groupCode;
    private String organizationCode;
    private String scope;
    private String permission;
    private String status;
    private Timestamp expiresAt;
    private Integer version;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
