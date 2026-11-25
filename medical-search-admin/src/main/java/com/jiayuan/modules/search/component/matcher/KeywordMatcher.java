package com.jiayuan.modules.search.component.matcher;

import cn.hutool.core.collection.CollectionUtil;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.modules.search.dto.KeywordConfigDTO;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.service.KeywordConfigService;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * 默认关键词匹配器。
 */
@Order(5)
@Component
public class KeywordMatcher {

    @Resource
    protected KeywordConfigService keywordConfigService;

    /**
     * 使用当前登录用户的关键词匹配配置。
     * 保持原有后台搜索行为不变。
     */
    public void toSetKeywordSearchFields(SearchDTO dto) {
        setKeywordSearchFields(dto, keywordConfigService.getDefaultSearchFieldList());
    }

    /**
     * 使用指定用户的关键词匹配配置。
     * 供不经过 Shiro 用户登录的服务端 API 使用。
     */
    public void toSetKeywordSearchFields(SearchDTO dto, Long userId) {
        setKeywordSearchFields(dto, keywordConfigService.getDefaultSearchFieldList(userId));
    }

    private void setKeywordSearchFields(SearchDTO dto, List<KeywordConfigDTO> configs) {
        if (CollectionUtil.isEmpty(configs)) {
            throw new BizException("没有设置默认匹配规则");
        }

        List<FieldDTO> fieldList = ConvertUtils.sourceToTarget(configs, FieldDTO.class);
        // 关键词匹配只使用文本类型字段。
        fieldList.removeIf(field -> !"text".equals(field.getDataType()));
        if (CollectionUtil.isEmpty(fieldList)) {
            throw new BizException("默认匹配规则中没有可用的文本字段");
        }
        dto.setKeywordSearchFields(fieldList);
    }
}
