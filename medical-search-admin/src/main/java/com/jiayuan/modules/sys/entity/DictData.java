package com.jiayuan.modules.sys.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

/**
 * 字典数据
 *
 * @author lijiankui
 */
@Data
public class DictData {
    @JsonIgnore
    private Long dictType;
    private String dictLabel;
    private String dictValue;
}
