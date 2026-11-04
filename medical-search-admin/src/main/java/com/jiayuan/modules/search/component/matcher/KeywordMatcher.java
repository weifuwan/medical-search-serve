package com.jiayuan.modules.search.component.matcher;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ReUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.modules.search.dto.KeywordConfigDTO;
import com.jiayuan.modules.search.dto.SearchDTO;
import com.jiayuan.modules.search.service.KeywordConfigService;
import com.jiayuan.modules.sys.entity.SysDictDataEntity;
import com.jiayuan.modules.sys.service.SysDictDataService;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.service.TableFieldService;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @Title: DefaultMatcher
 * @Package: com.jiayuan.common.component.matcher
 * @Description: 默认匹配器
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/22
 */
@Order(5)
@Component
public class KeywordMatcher  {
    @Resource
    protected TableFieldService tableFieldService;

    @Resource
    protected KeywordConfigService keywordConfigService;



    public Symbol.Type regex() {
        return Symbol.Type.DATA_SINGLE;
    }


    /**
     * 自动匹配映射
     *
     * @param dto
     * @return
     */
    public void toSetKeywordSearchFields(SearchDTO dto) {
        // 检索三步进行：1.优先按照正则进行匹配 2.其次按照字典进行匹配 3.最后按照默认的进行确定
        final List<KeywordConfigDTO> list = keywordConfigService.getDefaultSearchFieldList();
        if (CollectionUtil.isNotEmpty(list)) {
            final List<FieldDTO> fieldList = ConvertUtils.sourceToTarget(list, FieldDTO.class);
            //过滤掉非文本类型的字段
            fieldList.removeIf(e -> !Symbol.DataTypeEnum.TEXT.getCode().equals(e.getDataType()));
            dto.setKeywordSearchFields(fieldList);
            return;
        }

        throw new BizException("没有设置默认匹配规则");
    }
}
