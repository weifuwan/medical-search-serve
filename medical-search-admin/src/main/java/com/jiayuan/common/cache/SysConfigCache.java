package com.jiayuan.common.cache;

import cn.hutool.core.util.StrUtil;
import com.jiayuan.common.constant.CacheConstant;
import com.jiayuan.common.redis.RedisCache;
import com.jiayuan.common.utils.SpringContextUtils;
import com.jiayuan.modules.sys.entity.SysConfigEntity;
import com.jiayuan.modules.sys.service.SysConfigService;

import java.util.Objects;

/**
 * @Title: DictCache
 * @Package: com.jiayuan.common.utils
 * @Description: 系统配置缓存
 * @Author: 李建奎
 * @Date: 创建时间 2023-02-16
 */
public class SysConfigCache {

    private static RedisCache redisCache;
    private static SysConfigService sysConfigService;


    static {
        redisCache = SpringContextUtils.getBean("redisCache", RedisCache.class);
        sysConfigService = SpringContextUtils.getBean(SysConfigService.class);
    }


    /**
     * 获取字典名称
     *
     * @param key
     * @return
     */
    public static String getConfigValue(String key) {
        if (StrUtil.isNotBlank(key)) {
            final String cacheKey = getCacheKey(key);
            final Object o = redisCache.get(cacheKey);
            if (Objects.nonNull(o)) {
                return o.toString();
            } else {
                final SysConfigEntity byCode = sysConfigService.getByCode(key);
                if (Objects.nonNull(byCode)) {
                    final String configValue = byCode.getConfigValue();
                    redisCache.set(cacheKey, configValue);
                    return configValue;
                }
            }
        }
        return null;
    }


    /**
     * 删除指定字典缓存
     *
     * @param key 字典键
     */
    public static void removeCache(String key) {
        redisCache.delete(getCacheKey(key));
    }

    /**
     * 设置cache key
     *
     * @param configKey 参数键
     * @return 缓存键key
     */
    public static String getCacheKey(String configKey) {
        return CacheConstant.SYS_CONFIG_KEY + configKey;
    }
}
