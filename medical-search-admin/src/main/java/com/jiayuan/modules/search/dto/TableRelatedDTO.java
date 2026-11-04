package com.jiayuan.modules.search.dto;

import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Title: com.jiayuan.modules.search.dto
 * @Package: TableRelatedDTO
 * @Description: 表关联DTO
 * @Author: 李建奎
 * @Date: 创建时间 2024/10/24
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TableRelatedDTO {
    /**
     * 表id
     */
    private Long tableId;

    /**
     * 表名称
     */
    private String tableName;

    /**
     * 表编码
     */
    private String tableCode;

    /**
     * 是否是循环表
     */
    private Boolean isLoop;

    /**
     * 表类型
     */
    private Integer slaveType;

    /**
     * 关联字段
     */
    private String relatedFieldCode;

    /**
     * 主键字段
     */
    private String primaryFieldCode;

    /**
     * 需过滤的字段列表
     */
    private List<FieldDTO> fieldList;
}
