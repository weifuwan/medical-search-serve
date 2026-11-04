
package com.jiayuan.modules.security.service;

import com.jiayuan.modules.security.entity.SysUserTokenEntity;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sys.entity.SysUserEntity;

import java.util.Set;

/**
 * shiro相关接口
 *
 * @author lijiankui
 */
public interface ShiroService {
    /**
     * 获取用户权限列表
     */
    Set<String> getUserPermissions(UserDetail user);

    SysUserTokenEntity getByToken(String token);

    /**
     * 根据用户ID，查询用户
     *
     * @param userId
     */
    SysUserEntity getUser(Long userId);
}
