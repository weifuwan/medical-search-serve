package com.jiayuan.modules.search.request;

import lombok.Data;

import java.io.Serializable;

/**
 * 检索排序规则。
 */
@Data
public class SearchSortDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    private String tableCode;

    private String fieldCode;

    private String mode;
}
