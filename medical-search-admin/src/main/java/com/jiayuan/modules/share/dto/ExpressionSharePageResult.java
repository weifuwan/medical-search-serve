package com.jiayuan.modules.share.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 检索条件分享列表的分页响应。
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ExpressionSharePageResult<T> {
    private List<T> records;
    private long total;
    private int pageNum;
    private int pageSize;
}
