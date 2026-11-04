package com.jiayuan.modules.search.component.wrapper;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.elasticsearch.index.query.QueryBuilder;

/**
 * @Title: com.jiayuan.common.component.dto
 * @Package: QueryFieldDTO
 * @Description: queryBuilder包装类
 * @Author: 李建奎
 * @Date: 创建时间 2024/11/12
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class QueryBuilderWrapper {

    /**
     * 字段(这里主要使用表的信息)
     */
    private FieldDTO field;

    /**
     * 逻辑符
     */
    private Symbol.LogicEnum logic;

    /**
     * 检索QueryBuilder
     */
    private QueryBuilder queryBuilder;
}
