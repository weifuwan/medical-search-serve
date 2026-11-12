package com.jiayuan.modules.share.dto;

import lombok.Data;

/**
 * 分页查询检索条件分享列表。
 */
@Data
public class ExpressionSharePageQuery {
    private Integer pageNum = 1;
    private Integer pageSize = 10;
    private String keyword;
    private String sortField;
    private String sortOrder;
    private String status;
    private String scope;
    private String permission;
    private String source;
}
