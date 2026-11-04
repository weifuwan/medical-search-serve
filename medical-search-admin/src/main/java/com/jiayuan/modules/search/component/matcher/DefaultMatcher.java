//package com.jiayuan.modules.search.component.matcher;
//
//import cn.hutool.core.collection.CollectionUtil;
//import cn.hutool.core.util.ReUtil;
//import com.baomidou.mybatisplus.core.toolkit.Wrappers;
//import com.jiayuan.common.constant.BizConstant;
//import com.jiayuan.common.constant.Symbol;
//import com.jiayuan.common.enums.BooleanEnum;
//import com.jiayuan.common.exception.BizException;
//import com.jiayuan.common.utils.ConvertUtils;
//import com.jiayuan.modules.search.dto.KeywordConfigDTO;
//import com.jiayuan.modules.search.dto.SearchDTO;
//import com.jiayuan.modules.sys.entity.SysDictDataEntity;
//import com.jiayuan.modules.template.dto.FieldDTO;
//import org.springframework.core.annotation.Order;
//import org.springframework.stereotype.Component;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Optional;
//import java.util.stream.Collectors;
//
///**
// * @Title: DefaultMatcher
// * @Package: com.jiayuan.common.component.matcher
// * @Description: 默认匹配器
// * @Author: 李建奎
// * @Date: 创建时间 2022/11/22
// */
//@Order(5)
//@Component
//public class DefaultMatcher extends AbstractMatcher {
//
//    @Override
//    public void match(SearchDTO.Item item, String expression) {
//        item.setRelationalEnum(Symbol.RelationalEnum.LIKE);
//        this.autoMatchMapping(item, expression);
//    }
//
//    @Override
//    public Symbol.Type type() {
//        return Symbol.Type.DATA_SINGLE;
//    }
//
//
//    /**
//     * 自动匹配映射
//     *
//     * @param item
//     * @param expression
//     * @return
//     */
//    private void autoMatchMapping(SearchDTO dto, String expression) {
//        // 检索三步进行：1.优先按照正则进行匹配 2.其次按照字典进行匹配 3.最后按照默认的进行确定
//        final List<KeywordConfigDTO> list = keywordConfigService.getDefaultSearchFieldList();
//        if (CollectionUtil.isEmpty(list)) {
//            throw new BizException("关键字配置为空");
//        }
//
//        // 按照正则表达式进行确定
//        List<KeywordConfigDTO> result = new ArrayList<>();
//        final List<KeywordConfigDTO> regexList = list.stream().filter(e -> BizConstant.KeywordType.REGEX.getCode().equals(e.getKeywordType())).collect(Collectors.toList());
//        if (CollectionUtil.isNotEmpty(regexList)) {
//            final List<KeywordConfigDTO> collect = regexList.stream().filter(e -> ReUtil.isMatch(e.getKeyword(), expression)).collect(Collectors.toList());
//            if (CollectionUtil.isNotEmpty(collect)) {
//                result.addAll(collect);
//                item.setVal(expression);
//            }
//        }
//
//        // 按照字典进行确定
//        if (CollectionUtil.isEmpty(result)) {
//            final List<KeywordConfigDTO> dictList = list.stream().filter(e -> BizConstant.KeywordType.DICT.getCode().equals(e.getKeywordType())).collect(Collectors.toList());
//            if (CollectionUtil.isNotEmpty(dictList)) {
//                final List<SysDictDataEntity> sysDictDataList = sysDictDataService.selectList(Wrappers.<SysDictDataEntity>lambdaQuery()
//                        .eq(SysDictDataEntity::getDictLabel, expression)
//                        .in(SysDictDataEntity::getDictType, dictList.stream().map(KeywordConfigDTO::getKeyword).collect(Collectors.toList())));
//                if (CollectionUtil.isNotEmpty(sysDictDataList)) {
//                    final List<String> meets = sysDictDataList.stream().map(SysDictDataEntity::getDictType).collect(Collectors.toList());
//                    final List<KeywordConfigDTO> collect = dictList.stream().filter(e -> meets.contains(e.getKeyword())).collect(Collectors.toList());
//                    if (CollectionUtil.isNotEmpty(collect)) {
//                        result.addAll(collect);
//                        // 目前item的值是一个val,但是如果有的转化，有的不转化，这种情况 item的val是按照字段对应的，也就是
//                        // item 中 Filed 和 val是一对一的关系，而不是现在的 List<Field> 对应 一个val
//                        final boolean flag = BooleanEnum.TRUE.getCode().equals(collect.get(0).getIsConvert());
//                        final Optional<SysDictDataEntity> optional = sysDictDataList.stream().filter(e -> e.getDictType().equals(collect.get(0).getKeyword())).findFirst();
//                        item.setVal(flag && optional.isPresent() ? optional.get().getDictValue() : expression);
//                    }
//                }
//            }
//        }
//
//        // 最后按照默认的进行确定
//        if (CollectionUtil.isEmpty(result)) {
//            final List<KeywordConfigDTO> defaultList = list.stream().filter(e -> BizConstant.KeywordType.DEFAULT.getCode().equals(e.getKeywordType())).collect(Collectors.toList());
//            result.addAll(defaultList);
//            item.setVal("*" + expression + "*");
//        }
//
//
//        if (CollectionUtil.isNotEmpty(result)) {
//            final List<FieldDTO> fieldList = ConvertUtils.sourceToTarget(result, FieldDTO.class);
//            //过滤掉非文本类型的字段
//            fieldList.removeIf(e -> !Symbol.DataTypeEnum.TEXT.getCode().equals(e.getDataType()));
//            item.setField(fieldList);
//            return;
//        }
//
//        throw new BizException("没有设置默认匹配规则");
//    }
//}
