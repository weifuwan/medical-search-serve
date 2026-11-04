
package com.jiayuan.core;

import com.jiayuan.common.redis.RedisCache;
import com.jiayuan.modules.sys.entity.SysUserEntity;
import com.jiayuan.modules.task.AsyncTaskScheduledService;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.sql.DriverManager;

@RunWith(SpringRunner.class)
@SpringBootTest
public class RedisTest {
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private AsyncTaskScheduledService asyncTaskScheduledService;


    @Test
    public void contextLoads() {
        SysUserEntity user = new SysUserEntity();
        user.setEmail("123456@qq.com");
        redisCache.set("user", user);

        System.out.println(ToStringBuilder.reflectionToString(redisCache.get("user")));
    }

    @Test
    public void ssoTest() {
//        Map<String,Object> param = MapUtil.newHashMap();
//        String singleToken = "eyJhbGciOiJIUzI1NiJ9.eyJzeXNJZCI6IlNTTyIsInVzZXJOYW1lIjoi566h55CG5ZGYIiwiZXhwIjoxNjkzODc3MjY4LCJ1c2VySWQiOiJhZG1pbiIsImlhdCI6MTY5Mzc5MDg2OCwianRpIjoiNTU1NDczZTAtNWIwMS00NjQ5LWI5NGQtZjcyMGYzYjdiOTVmIn0.5-NkkSWwc0hrJ-7pisBg6XQGE-onrxxy-z9DvwG1rnk";
//        param.put("systemId",systemId);
//        param.put("token",singleToken);
//        final String body = JSONUtil.toJsonStr(param);
//        final String post = HttpUtil.post(ssoUrl, body, 60000);
//        System.out.println(post);
//        asyncTaskScheduledService.taskOfSyncAccount();

    }

}