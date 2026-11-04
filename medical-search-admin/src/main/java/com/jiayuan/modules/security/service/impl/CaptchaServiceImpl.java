
package com.jiayuan.modules.security.service.impl;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.redis.RedisCache;
import com.jiayuan.common.redis.RedisKeys;
import com.jiayuan.modules.security.service.CaptchaService;
import com.wf.captcha.SpecCaptcha;
import com.wf.captcha.base.Captcha;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @Title: CaptchaServiceImpl
 * @Package: com.jiayuan.modules.security.service.impl
 * @Description: 验证码
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-04
 */
@Service
public class CaptchaServiceImpl implements CaptchaService {
    @Resource
    private RedisCache redisCache;

    @Resource
    private CustomConfig customConfig;
    /**
     * Local Cache  5分钟过期
     */
    Cache<String, String> localCache = CacheBuilder.newBuilder().maximumSize(1000).expireAfterAccess(5, TimeUnit.MINUTES).build();

    @Override
    public void create(HttpServletResponse response, String uuid) throws IOException {
        response.setContentType("image/gif");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //生成验证码
        SpecCaptcha captcha = new SpecCaptcha(150, 40);
        captcha.setLen(5);
        captcha.setCharType(Captcha.TYPE_DEFAULT);
        captcha.out(response.getOutputStream());

        //保存到缓存
        setCache(uuid, captcha.text());
    }

    @Override
    public boolean validate(String uuid, String code) {
        //获取验证码
        String captcha = getCache(uuid);

        //效验成功
        if (code.equalsIgnoreCase(captcha)) {
            return true;
        }

        return false;
    }

    private void setCache(String key, String value) {
        if (customConfig.getRedisOpen()) {
            key = RedisKeys.getCaptchaKey(key);
            redisCache.set(key, value, 300);
        } else {
            localCache.put(key, value);
        }
    }

    private String getCache(String key) {
        if (customConfig.getRedisOpen()) {
            key = RedisKeys.getCaptchaKey(key);
            String captcha = (String) redisCache.get(key);
            //删除验证码
            if (captcha != null) {
                redisCache.delete(key);
            }

            return captcha;
        }

        String captcha = localCache.getIfPresent(key);
        //删除验证码
        if (captcha != null) {
            localCache.invalidate(key);
        }
        return captcha;
    }
}