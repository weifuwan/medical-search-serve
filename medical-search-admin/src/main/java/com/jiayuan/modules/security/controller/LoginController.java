
package com.jiayuan.modules.security.controller;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.utils.IpUtils;
import com.jiayuan.common.utils.Result;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.modules.log.entity.LogLoginEntity;
import com.jiayuan.modules.log.service.LogLoginService;
import com.jiayuan.modules.security.dto.LoginDTO;
import com.jiayuan.modules.security.dto.SsoUserDTO;
import com.jiayuan.modules.security.password.PasswordUtils;
import com.jiayuan.modules.security.service.CaptchaService;
import com.jiayuan.modules.security.service.SysUserTokenService;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sso.service.SsoService;
import com.jiayuan.modules.sys.dto.SysUserDTO;
import com.jiayuan.modules.sys.entity.HospitalConfigEntity;
import com.jiayuan.modules.sys.service.SysParamsService;
import com.jiayuan.modules.sys.enums.UserStatusEnum;
import com.jiayuan.modules.sys.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * @Title: LoginController
 * @Package: com.jiayuan.modules.security.controller
 * @Description: 登录controller
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-20
 */
@Slf4j
@RestController
@Api(tags = "登录管理")
@RequiredArgsConstructor
public class LoginController {
    private final SysUserService sysUserService;
    private final SysUserTokenService sysUserTokenService;
    private final CaptchaService captchaService;
    private final LogLoginService logLoginService;
    private final SsoService ssoService;
    private final CustomConfig customConfig;
    private final SysParamsService sysParamsService;


    @GetMapping("captcha")
    @ApiOperation(value = "验证码", produces = "application/octet-stream")
    @ApiImplicitParam(paramType = "query", dataType = "string", name = "uuid", required = true)
    public void captcha(HttpServletResponse response, String uuid) throws IOException {
        //uuid不能为空
        AssertUtils.isBlank(uuid, ErrorCode.IDENTIFIER_NOT_NULL.getCode());

        //生成验证码
        captchaService.create(response, uuid);
    }

    @GetMapping("login/branding")
    @ApiOperation(value = "登录页医院信息")
    public Result<Map<String, String>> loginBranding() {
        HospitalConfigEntity config = sysParamsService.getHospitalConfig();
        Map<String, String> branding = new HashMap<>();
        if (config != null) {
            branding.put("hospitalName", config.getHospitalName());
            branding.put("logoBase64", config.getLogoBase64());
        }
        return Result.ok(branding);
    }

    @PostMapping("login")
    @ApiOperation(value = "登录")
    public Result login(HttpServletRequest request, @RequestBody LoginDTO login) {
        if (customConfig.getLoginCaptchaDisabled()) {
            //效验数据
            ValidatorUtils.validateEntity(login, DefaultGroup.class, AddGroup.class);
            //验证码是否正确
            boolean flag = captchaService.validate(login.getUuid(), login.getCaptcha());
            if (!flag) {
                return Result.error(ErrorCode.CAPTCHA_ERROR.getCode());
            }
        } else {
            //效验数据
            ValidatorUtils.validateEntity(login, DefaultGroup.class);
        }


        //用户信息
        SysUserDTO user = sysUserService.getByUsername(login.getUsername());

        //用户不存在
        if (user == null) {
            throw new BizException(ErrorCode.ACCOUNT_PASSWORD_ERROR.getCode());
        }

        //密码错误
        if (!PasswordUtils.matches(login.getPassword(), user.getPassword())) {
            throw new BizException(ErrorCode.ACCOUNT_PASSWORD_ERROR.getCode());
        }

        //账号停用
        if (user.getUserStatus().equals(UserStatusEnum.DISABLE.value() + "")) {
            throw new BizException(ErrorCode.ACCOUNT_DISABLE.getCode());
        }

        saveLog(request, user);

        return sysUserTokenService.createToken(user.getUserId());
    }

    @PostMapping("logout")
    @ApiOperation(value = "退出")
    public Result logout(HttpServletRequest request) {
        UserDetail user = SecurityUser.getUser();

        //退出
        sysUserTokenService.logout(user.getUserId());

        return Result.ok();
    }

    @PostMapping(value = "/sso")
    @ApiOperation(value = "sso单点登录")
    public Result ssoLogin(@RequestParam(value = "singleToken", required = false) String singleToken) {
        // sso token验证
        SsoUserDTO ssoUserDTO = ssoService.ssoTokenValidate(singleToken);
        log.info("ssoUserDTO -> " + ssoUserDTO);
        String userId = ssoUserDTO.getUserId();
        // 本系统验证是否存在该用户
        SysUserDTO user = sysUserService.getByUsername(userId);
        if (Objects.isNull(user)) {
            throw new BizException("大数据搜索引擎种没有查询到系统用户 " + userId);
        }
        return sysUserTokenService.createToken(user.getUserId());
    }


    private void saveLog(HttpServletRequest request, SysUserDTO user) {
        //登录成功
        LogLoginEntity log = new LogLoginEntity();
//        log.setLoginId(user.getUserId());
        log.setId(IdWorker.getId());
        log.setLoginId(String.valueOf(user.getUserId()));
        log.setUserId(user.getUserId());
        log.setUsername(user.getUsername());
        log.setLoginTime(new Date());
        log.setIp(IpUtils.getIpAddr(request));

        logLoginService.save(log);
    }

}