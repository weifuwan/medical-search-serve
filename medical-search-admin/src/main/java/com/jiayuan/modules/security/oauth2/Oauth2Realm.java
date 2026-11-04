
package com.jiayuan.modules.security.oauth2;

import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.utils.MessageUtils;
import com.jiayuan.modules.security.entity.SysUserTokenEntity;
import com.jiayuan.modules.security.service.ShiroService;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sys.entity.SysUserEntity;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Set;

/**
 * 认证
 *
 * @author lijiankui
 */
@Component
public class Oauth2Realm extends AuthorizingRealm {
    @Autowired
    private ShiroService shiroService;

    @Override
    public boolean supports(AuthenticationToken token) {
        return token instanceof Oauth2Token;
    }

    /**
     * 授权(验证权限时调用)
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        UserDetail user = (UserDetail) principals.getPrimaryPrincipal();

        //用户权限列表
        Set<String> permsSet = shiroService.getUserPermissions(user);

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setStringPermissions(permsSet);
        return info;
    }

    /**
     * 认证(登录时调用)
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String accessToken = (String) token.getPrincipal();

        //根据accessToken，查询用户信息
        SysUserTokenEntity tokenEntity = shiroService.getByToken(accessToken);
        //token失效
        if (tokenEntity == null || tokenEntity.getExpireDate().getTime() < System.currentTimeMillis()) {
            throw new IncorrectCredentialsException(MessageUtils.getMessage(ErrorCode.TOKEN_INVALID.getCode()));
        }

        //查询用户信息
        SysUserEntity userEntity = shiroService.getUser(tokenEntity.getUserId());

        //转换成UserDetail对象
        UserDetail userDetail = ConvertUtils.sourceToTarget(userEntity, UserDetail.class);

        userDetail.setStatus(Integer.valueOf(userEntity.getUserStatus()));
        userDetail.setUserName(userEntity.getUserName());
        userDetail.setSuperAdmin(userEntity.getFgAdmin().equals("Y") ? 1 : 0);
        //账号锁定
        if (userDetail.getStatus() == 0) {
            throw new LockedAccountException(MessageUtils.getMessage(ErrorCode.ACCOUNT_LOCK.getCode()));
        }

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(userDetail, accessToken, getName());
        return info;
    }

}