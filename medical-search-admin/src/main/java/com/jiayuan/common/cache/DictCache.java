package com.jiayuan.common.cache;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.map.MapUtil;
import com.jiayuan.common.constant.CacheConstant;
import com.jiayuan.common.redis.RedisCache;
import com.jiayuan.common.utils.SpringContextUtils;

import java.util.Collection;
import java.util.Map;

/**
 * @Title: DictCache
 * @Package: com.jiayuan.common.utils
 * @Description: 字典工具类
 * @Author: 李建奎
 * @Date: 创建时间 2023-02-16
 */
public class DictCache {

    private static RedisCache redisCache;


    static {
        redisCache = SpringContextUtils.getBean("redisCache", RedisCache.class);
    }

    /**
     * 设置字典缓存
     *
     * @param key 参数键
     * @param map 字典数据列表
     */
    public static void setDictCache(String key, Map<String, String> map) {
        redisCache.hMSet(getCacheKey(key), map);
    }

    /**
     * 获取字典缓存
     *
     * @param key 参数键
     * @return dictDatas 字典数据列表
     */
    public static Map<String, String> getDictCache(String key) {
        final Map<String, String> map = redisCache.hGetAll(getCacheKey(key));
        return CollectionUtil.isNotEmpty(map) ? map : MapUtil.empty();
    }



    /**
     * 根据字典类型和字典标签获取字典值
     *
     * @param dictType  字典类型
     * @param dictLabel 字典标签
     * @return 字典值
     */
    public static String getDictValue(String dictType, String dictLabel) {
        final Map<String, String> cache = getDictCache(dictType);
        return CollectionUtil.isNotEmpty(cache) ? cache.get(dictLabel) : null;
    }

    /**
     * 删除指定字典缓存
     *
     * @param key 字典键
     */
    public static void removeDictCache(String key) {
        redisCache.delete(getCacheKey(key));
    }

    /**
     * 清空字典缓存
     */
    public static void clearDictCache() {
        Collection<String> keys = redisCache.keys(CacheConstant.SYS_DICT_KEY + "*");
        redisCache.delete(keys);
    }

    /**
     * 设置cache key
     *
     * @param configKey 参数键
     * @return 缓存键key
     */
    public static String getCacheKey(String configKey) {
        return CacheConstant.SYS_DICT_KEY + configKey;
    }
}
