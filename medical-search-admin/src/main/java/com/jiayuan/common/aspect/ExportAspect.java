package com.jiayuan.common.aspect;

import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.redis.RedisCache;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 用于处理导出前和导出后的操作
 */
@Aspect
@Component
public class ExportAspect {
    @Resource
    private RedisCache redisCache;

    @Pointcut("@annotation(com.jiayuan.common.annotation.ExportOperation)")
    public void exportPointCut() {

    }

//    @Before("exportPointCut()")
//    public void beforeAdvice() {
//        String token = getToken();
//
//        Object key = redisCache.get(CacheConstant.EXPORT_USER_TOKEN_KEY + token);
//        if (Objects.nonNull(key)) {
//            throw new RuntimeException("任务正在执行!!!");
//        }
//        //300s 5分钟
//        redisCache.set(CacheConstant.EXPORT_USER_TOKEN_KEY + token, token, 300);
//    }

    @After("exportPointCut()")
    public void afterAdvice() {
        redisCache.delete(getToken());
    }

    private String getToken() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        //从header中获取token
        String token = request.getHeader(Constant.TOKEN_HEADER);

        //如果header中不存在token，则从参数中获取token
        if (StringUtils.isBlank(token)) {
            token = request.getParameter(Constant.TOKEN_HEADER);
        }

        return token;
    }
}
