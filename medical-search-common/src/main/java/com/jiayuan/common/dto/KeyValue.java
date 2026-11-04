package com.jiayuan.common.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Title: KeyValue
 * @Package: com.jiayuan.modules.search.dto
 * @Description: key-value数据格式
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-13
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel(value = "key-value数据格式", description = "key-value数据格式")
public class KeyValue<K, V> {

    @ApiModelProperty(value = "obj-key")
    K key;

    @ApiModelProperty(value = "obj-value")
    V value;
}
