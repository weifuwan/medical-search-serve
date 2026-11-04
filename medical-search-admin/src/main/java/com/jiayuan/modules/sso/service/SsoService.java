package com.jiayuan.modules.sso.service;

import com.jiayuan.modules.security.dto.SsoUserDTO;
import com.jiayuan.modules.sys.entity.SysUserEntity;

/**
 * @Title: com.jiayuan.modules.sso.service
 * @Package: SsoService
 * @Description: 单点登录接口
 * @Author: 李建奎
 * @Date: 创建时间 2024/8/22
 */
public interface SsoService {

    /**
     * sso token校验
     *
     * @param singleToken
     * @return
     */
    SsoUserDTO ssoTokenValidate(String singleToken);

    /**
     * 单点登录注册接口
     *
     * @param sysUserEntity
     */
    void ssoUserRegister(SysUserEntity sysUserEntity);

}
