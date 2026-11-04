package com.jiayuan.modules.searchv2.cache;

import com.jiayuan.modules.searchv2.component.TableFieldInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CacheVo {
    private Map<String, Map<String, TableFieldInfo>> cache; // 表中文名 -> 字段中文名 -> TableFieldInfo
    private Map<String, Map<String, TableFieldInfo>> cacheEnToChi; // 表英文名 -> 字段英文名 -> TableFieldInfo

}
