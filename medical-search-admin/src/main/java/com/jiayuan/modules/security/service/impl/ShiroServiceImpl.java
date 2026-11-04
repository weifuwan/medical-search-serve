
package com.jiayuan.modules.security.service.impl;

import com.jiayuan.modules.security.dao.SysUserTokenDao;
import com.jiayuan.modules.security.entity.SysUserTokenEntity;
import com.jiayuan.modules.security.service.ShiroService;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sys.dao.SysPermissionDao;
import com.jiayuan.modules.sys.entity.SysUserEntity;
import com.jiayuan.modules.sys.enums.SuperAdminEnum;
import com.jiayuan.modules.sys.service.SysUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service
public class ShiroServiceImpl implements ShiroService {
    @Resource
    private SysPermissionDao sysPermissionDao;

    @Resource
    private SysUserService sysUserService;
    @Resource
    private SysUserTokenDao sysUserTokenDao;


    @Override
    public Set<String> getUserPermissions(UserDetail user) {
        //系统管理员，拥有最高权限
        List<String> permissionsList;
        if (Objects.nonNull(user.getSuperAdmin()) && user.getSuperAdmin() == SuperAdminEnum.YES.value()) {
            permissionsList = sysPermissionDao.getPermissionsList();
        } else {
            permissionsList = sysPermissionDao.getUserPermissionsList(user.getUserId());
        }

        //用户权限列表
        Set<String> permsSet = new HashSet<>();
        for (String permissions : permissionsList) {
            if (StringUtils.isBlank(permissions)) {
                continue;
            }
            permsSet.addAll(Arrays.asList(permissions.trim().split(",")));
        }

        return permsSet;
    }

    @Override
    public SysUserTokenEntity getByToken(String token) {
        return sysUserTokenDao.getByToken(token);
    }


    @Override
    public SysUserEntity getUser(Long userId) {
        return sysUserService.getUserById(userId);
    }

}