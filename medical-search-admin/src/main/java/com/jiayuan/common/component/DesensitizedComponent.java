package com.jiayuan.common.component;

import cn.hutool.core.collection.CollectionUtil;
import com.jiayuan.common.cache.SysConfigCache;
import com.scjydz.desen.client.bp.DesenValueOtherBp;

import java.util.List;

import static com.jiayuan.common.constant.CacheConstant.*;

/**
 * @title: DesensitizedComponent
 * @package: com.jiayuan.common.component
 * @description: 脱敏
 * @author: 姜腾德
 * @date: 2024/9/18
 */
public class DesensitizedComponent {

    public static DesenValueOtherBp initDesenClient() {
        String url = SysConfigCache.getConfigValue(DM_URL);
        String saveLogUrl = url.substring(0, url.lastIndexOf("/")) + "/saveDesenLog";
        return new DesenValueOtherBp(
                SysConfigCache.getConfigValue(DM_SYS_ID),
                url,
                "JSON",
                SysConfigCache.getConfigValue(DM_ACCESS_TOKEN),
                null,
                null,
                saveLogUrl);
    }

    public String desenValue(String inputStr) {
        DesenValueOtherBp client = initDesenClient();
        return client.desenValue(inputStr);
    }


    /**
     * 脱敏数据
     *
     * @param rows
     * @return
     */
    public static List desensitization(List rows) {
        String dmEnabled = SysConfigCache.getConfigValue(DM_ENABLED);
        if ("Y".equalsIgnoreCase(dmEnabled) && CollectionUtil.isNotEmpty(rows)) {
            DesenValueOtherBp client = initDesenClient();
            rows = client.desenValue(rows);
        }
        return rows;
    }
}
