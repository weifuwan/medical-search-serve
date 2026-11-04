package com.jiayuan.modules.search.dto;

import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Title: HighlightDTO
 * @Package: com.jiayuan.modules.search.dto
 * @Description: 高亮DTO
 * @Author: 李建奎
 * @Date: 创建时间 2024-02-01
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HighlightDTO {
    /**
     * 检索显示记录
     */
    private List rows;
    /**
     * 表达式解析项
     */
    private List<SearchDTO.Item> items;
    /**
     * 检索维度
     */
    private BizConstant.Dimension dimension;
    /**
     * 显示表头
     */
    private List<FieldDTO> columnList;
    /**
     * 是否需要高亮
     */
    private Boolean highlight;
}
