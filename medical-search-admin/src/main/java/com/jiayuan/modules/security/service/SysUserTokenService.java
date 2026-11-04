
package com.jiayuan.modules.security.service;

import com.jiayuan.common.service.BaseService;
import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.security.entity.SysUserTokenEntity;

/**
 * 用户Token
 *
 * @author lijiankui
 */
public interface SysUserTokenService extends BaseService<SysUserTokenEntity> {

    /**
     * 生成token
     *
     * @param userId 用户ID
     */
    Result createToken(Long userId);

    /**
     * 退出，修改token值
     *
     * @param userId 用户ID
     */
    void logout(Long userId);

}