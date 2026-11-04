
package com.jiayuan.modules.sys.redis;

import com.jiayuan.common.redis.RedisCache;
import com.jiayuan.common.redis.RedisKeys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 参数管理
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Component
public class SysParamsRedis {
    @Autowired
    private RedisCache redisCache;

    public void delete(Object[] paramCodes) {
        String key = RedisKeys.getSysParamsKey();
        redisCache.hDel(key, paramCodes);
    }

    public void set(String paramCode, String paramValue) {
        if (paramValue == null) {
            return;
        }
        String key = RedisKeys.getSysParamsKey();
        redisCache.hSet(key, paramCode, paramValue);
    }

    public String get(String paramCode) {
        String key = RedisKeys.getSysParamsKey();
        return (String) redisCache.hGet(key, paramCode);
    }

}
