package com.jiayuan.modules.search.component.matcher;

import cn.hutool.core.collection.CollectionUtil;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.search.service.KeywordConfigService;
import com.jiayuan.modules.sys.service.SysDictDataService;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.service.TableFieldService;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

/**
 * @Title: AbstractMatcher
 * @Package: com.jiayuan.common.component.matcher
 * @Description: 抽象匹配器
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/1
 */
@Slf4j
public abstract class AbstractMatcher implements Matcher {

    @Resource
    protected TableFieldService tableFieldService;

    @Resource
    protected KeywordConfigService keywordConfigService;

    @Resource
    protected SysDictDataService sysDictDataService;


    /**
     * 获取字段信息
     *
     * @param fieldName
     * @param tableName
     * @return
     */
    protected FieldDTO getFieldList(String fieldName, String tableName) {
        final FieldDTO field = tableFieldService.getField(fieldName, tableName);
        if (Objects.isNull(field)) {
            throw new BizException("[" + tableName + "." + fieldName + "]无对应的元数据或已标记为无效");
        }
        return field;
    }



}
