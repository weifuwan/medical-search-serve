package com.jiayuan.modules.searchv2.component;

import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.SearchWay;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.search.component.BuilderQueryUtil;
import com.jiayuan.modules.search.component.matcher.KeywordMatcher;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.searchv2.modal.SearchVo;
import com.jiayuan.modules.template.dto.FieldDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author weifw
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class SearchV2Component {

    private final ExpressionParserComponent expressionParserComponent;  // Component for parsing search expressions
    private final KeywordMatcher keywordMatcher;  // Component for matching keywords

    /**
     * Performs search based on the search request
     *
     * @param request The search request containing expression and other parameters
     * @return SearchVo containing search results
     */
    public SearchVo search(SearchRequest request) {
        request.setExport(false);
        // Build search DTO from request
        SearchDTO dto = SearchDTO.builder().searchRequest(request).build();

        try {
            // Check if the expression matches single data pattern
            final boolean match = ReUtil.isMatch(Symbol.Type.DATA_SINGLE.getRegex(), request.getExpression());
            // Set search way based on pattern match (KEYWORD or EXPRESSION)
            dto.setSearchWay(match ? SearchWay.KEYWORD : SearchWay.EXPRESSION);

            if (SearchWay.KEYWORD.equals(dto.getSearchWay())) {
                // Save original expression before processing
                String sourceExpression = request.getExpression();
                // Configure keyword search fields in DTO
                keywordMatcher.toSetKeywordSearchFields(dto);
                List<FieldDTO> keywordSearchFields = dto.getKeywordSearchFields();

                // Perform keyword search
                SearchVo searchVo = expressionParserComponent.keywordSearch(keywordSearchFields, request);
                // Restore original expression in request
                request.setExpression(sourceExpression);
                return searchVo;

            } else if (SearchWay.EXPRESSION.equals(dto.getSearchWay())) {
                // Perform expression-based search
                return expressionParserComponent.search(request);
            } else {
                // Invalid search way
                String message = "Search expression error, please check and resubmit";
                throw new BizException(message);
            }

        } catch (Exception e) {
            // Handle exceptions and provide appropriate error message
            String message = StrUtil.isNotBlank(e.getMessage()) ? e.getMessage() : "Search expression error, please check and resubmit";
            log.error(message, e);
            throw new BizException(message, e);
        }
    }
}