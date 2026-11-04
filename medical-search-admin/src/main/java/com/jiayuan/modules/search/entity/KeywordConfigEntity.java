package com.jiayuan.modules.search.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.jiayuan.common.entity.BaseDomain;
import lombok.Data;

/**
 * 关键字检索配置
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Data
@TableName("cbdses_keyword_config")
public class KeywordConfigEntity extends BaseDomain {

    /**
     * 关键字(正则或者字典)
     */
    private String keyword;
    /**
     * 字段编码
     */
    private String fieldCode;
    /**
     * 表编码
     */
    private String tableCode;
    /**
     * 关键词类型
     *
     * @enums{BizConstant.KeywordType}
     */
    private Integer keywordType;

    /**
     * 是否转化(例如查询男es存储1)
     */
    private Integer isConvert;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 是否默认(是否通用)
     */
    private Integer isDefault;
}