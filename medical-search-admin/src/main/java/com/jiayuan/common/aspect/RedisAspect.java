
package com.jiayuan.common.aspect;

import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.exception.BizException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @Title: RedisAspect
 * @Package: com.jiayuan.common.aspect
 * @Description: Redis切面处理类
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-04
 */
@Aspect
@Component
public class RedisAspect {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private CustomConfig customConfig;

    @Around("execution(* com.jiayuan.common.redis.RedisCache.*(..))")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        Object result = null;
        if (customConfig.getRedisOpen()) {
            try {
                result = point.proceed();
            } catch (Exception e) {
                logger.error("redis error", e);
                throw new BizException(ErrorCode.REDIS_ERROR.getCode());
            }
        }
        return result;
    }
}
