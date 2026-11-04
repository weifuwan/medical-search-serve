package com.jiayuan.modules.search.dto;

import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.SearchWay;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.elasticsearch.index.query.QueryBuilder;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Title: SearchDto
 * @Package: com.jiayuan.modules.search.dto
 * @Description: 检索DTO
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/18
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SearchDTO {

    /**
     * 检索参数
     */
    private SearchRequest searchRequest;


    /**
     * 中缀表达式
     */
    private List<String> infixExpressionList;

    /**
     * 后缀表达式
     */
    private List<String> suffixExpressionList;

    /**
     * 后缀对应具体对象
     */
    private List<Item> suffixExpressionDtoList;


    /**
     * 计算结果
     */
    private QueryBuilder finalResult;

    /**
     * 过滤字段（比返回的字段多，主要扩充检索字段、表主键、关联字段）
     */
    private Set<FieldDTO> sourceFieldList;

    /**
     * 检索字段map (主附表放在一起，主要是innerhit中指定字段使用)
     */
    private Map<String, TableRelatedDTO> fieldMap;

    /**
     * 检索方式
     */
    private SearchWay searchWay;


    /**
     * 关键字检索字段
     */
    private List<FieldDTO> keywordSearchFields;

    @Data
    public static class Item {
        /**
         * 单元类型（数据或者符号）
         */
        private Symbol.Type type;

        /**
         * 字段信息
         */
        private FieldDTO field;

        /**
         * 逻辑符号(与下一条的)
         */
        private Symbol.LogicEnum logicEnum;

        /**
         * 关系符号 等于大小的判断
         */
        private Symbol.RelationalEnum relationalEnum;

        /**
         * 检索值
         */
        private String val;
    }
}
