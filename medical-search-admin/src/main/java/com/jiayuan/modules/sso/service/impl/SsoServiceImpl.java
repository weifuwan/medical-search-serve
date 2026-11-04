package com.jiayuan.modules.sso.service.impl;

import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONUtil;
import com.jiayuan.common.cache.SysConfigCache;
import com.jiayuan.common.config.SsoConfig;
import com.jiayuan.common.constant.SysConstant;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.modules.security.dto.SsoUserDTO;
import com.jiayuan.modules.sso.dto.SsoUserRegisterDto;
import com.jiayuan.modules.sso.service.SsoService;
import com.jiayuan.modules.sys.entity.SysUserEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.Objects;

/**
 * @Title: com.jiayuan.modules.sso.service.impl
 * @Package: SsoServiceImpl
 * @Description: 单点登录接口实现
 * @Author: 李建奎
 * @Date: 创建时间 2024/8/22
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SsoServiceImpl implements SsoService {


    private final SsoConfig ssoConfig;


    @Override
    public SsoUserDTO ssoTokenValidate(String singleToken) {
        // sso token验证
        String ssoUrlOfDb = SysConfigCache.getConfigValue(SysConstant.SSO_SERVICE_TOKENVERIFICATION_ADDR);
        log.info("ssoUrlOfDb -> " + ssoUrlOfDb);
        if (StrUtil.isBlank(ssoUrlOfDb)) {
            log.info("ssoUrlOfDb is null ");
            ssoUrlOfDb = ssoConfig.getLoginUrl();
        }
        log.info("ssoUrlOfDb mid -> " + ssoUrlOfDb);

        log.info("ssoUrlOfDb backend -> " + ssoUrlOfDb);
        Map<String, Object> param = MapUtil.newHashMap();
        param.put("systemId", ssoConfig.getSystemId());
        param.put("token", singleToken);
        final String body = JSONUtil.toJsonStr(param);
        final String result = HttpUtil.post(ssoUrlOfDb, body, 60000);
        log.info("result -> " + result);
        if (StrUtil.isEmpty(result)) {
            throw new BizException("单点登录返回空！");
        }
        final SsoUserDTO ssoUserDTO = JSONUtil.toBean(result, SsoUserDTO.class, true);
        log.info("单点登录token校验返回结果:{}", result);
        if (Objects.isNull(ssoUserDTO)) {
            throw new BizException("单点登录token验证返回结果对象解析为空");
        }
        final String userName = ssoUserDTO.getUserId();
        if (StrUtil.isBlank(userName)) {
            throw new BizException("单点登录token验证返回结果对象属性userName为空");
        }

        return ssoUserDTO;
    }


    @Async("taskExecutorSync")
    @Override
    public void ssoUserRegister(SysUserEntity sysUserEntity) {
        String ssoUserRegisterUrlOfDb = SysConfigCache.getConfigValue(SysConstant.SSO_SERVICE_REGISTRATION_ADDR);
        if (StrUtil.isBlank(ssoUserRegisterUrlOfDb)) {
            ssoUserRegisterUrlOfDb = ssoConfig.getUserRegisterUrl();
        }

        String ssoCertificateOfDb = SysConfigCache.getConfigValue(SysConstant.SSO_SERVICE_CERTIFICATE);
        if (StrUtil.isBlank(ssoCertificateOfDb)) {
            ssoCertificateOfDb = ssoConfig.getCertificate();
        }

        //性别转化
//        String gender = null;
        String gender = sysUserEntity.getGender();
//        if (Objects.nonNull(sex)) {
//            gender = sex == 1 ? "M" : "F";
//        }

        SsoUserRegisterDto ssoUserRegisterDto = SsoUserRegisterDto.builder()
                .systemId(ssoConfig.getSystemId())
                .groupCode(ssoConfig.getGroupCode())
                .orgCode(ssoConfig.getOrgCode())
                .userId(sysUserEntity.getLoginId())
                .userName(sysUserEntity.getUserName())
                .certificate(ssoCertificateOfDb)
                .deleteFlag("0")
                .gender(gender)
                .idCard(sysUserEntity.getIdCard())
                .type(Objects.nonNull(sysUserEntity.getUserId()) ? "UPDATE" : "NEW")
                .build();
        final String body = JSONUtil.toJsonStr(ssoUserRegisterDto);
        final String result = HttpUtil.post(ssoUserRegisterUrlOfDb, body, 60000);
        log.info("单点登录用户注册返回结果:{}", result);
    }
}
