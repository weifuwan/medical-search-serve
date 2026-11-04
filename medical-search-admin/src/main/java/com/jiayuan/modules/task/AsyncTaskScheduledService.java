package com.jiayuan.modules.task;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.XmlUtil;
import cn.hutool.extra.spring.SpringUtil;
import cn.hutool.http.webservice.SoapClient;
import com.jiayuan.common.cache.SysConfigCache;
import com.jiayuan.common.config.SsoConfig;
import com.jiayuan.common.config.WebserviceConfig;
import com.jiayuan.common.constant.SysConstant;
import com.jiayuan.common.utils.DateUtils;
import com.jiayuan.modules.log.service.LogLoginService;
import com.jiayuan.modules.log.service.SysLogOperationService;
import com.jiayuan.modules.sys.service.SysUserService;
import com.jiayuan.modules.task.dto.Person;
import com.jiayuan.modules.task.dto.WsResultDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.*;

/**
 * @Title: AsyncTaskScheduledService
 * @Package: com.jiayuan.common.task
 * @Description: 定时任务
 * @Author: 李建奎
 * @Date: 创建时间 2023-11-08
 */
@Component
@Slf4j
@RequiredArgsConstructor
@EnableScheduling
public class AsyncTaskScheduledService {


    private final SysLogOperationService sysLogOperationService;
    private final LogLoginService logLoginService;
    private final WebserviceConfig webserviceConfig;
    private final SysUserService sysUserService;
    private final SsoConfig ssoConfig;

    private final List<String> profiles = ListUtil.of("cdby", "cdbytest");


    /**
     * 日志清理任务
     */
    @Scheduled(cron = "0 0 2 * * ?")
    private void logClearTask() {
        try {
            //清理日志
            log.info("开始执行清理日志定时任务" + LocalDateTime.now());

            String loginLogSwitch = SysConfigCache.getConfigValue(SysConstant.LOG_CLEAR_ENABLE);
            if ("Y".equalsIgnoreCase(loginLogSwitch)) {
                String loginLogTime = SysConfigCache.getConfigValue(SysConstant.LOG_SAVE_TIME);
                int saveDays = StrUtil.isNotBlank(loginLogTime) ? Integer.valueOf(loginLogTime) : 30;
                Date date = DateUtils.addDateDays(new Date(), saveDays * (-1));
                //清除操作日志
                logLoginService.clearLog(date);

                //清除操作日志
                sysLogOperationService.clearLog(date);
            }


        } catch (Throwable e) {
            //保证定时任务不会因为异常退出
            log.error("清除日志定时任务失败", e);
        }
    }

    /**
     * 账号数据同步
     */
    @Scheduled(cron = "0 20 1 * * ?")
    public void taskOfSyncAccount() {
        String activeProfile = SpringUtil.getActiveProfile();
        log.info("activeProfile -> " + activeProfile);
        if (profiles.contains(activeProfile)) {
            WsResultDTO<Person> dto = executeWebService(webserviceConfig.getAccountDictCode(), webserviceConfig.getAccountDictName(), Person.class);
            Optional.ofNullable(dto).map(WsResultDTO::getData).ifPresent(data -> {
                if (CollectionUtil.isNotEmpty(data)) {
                    log.info("mdm data size is " + data.size());
                    sysUserService.syncSysUser(data);
                }
            });
        }
//        List<Person> data = new ArrayList<>();
//        Person person = new Person();
//        person.setCODE("009111");
//        person.setNAME("秦青青3");
//        person.setSEX("1");
//        person.setPHONE_NUMBER("112523");
//        person.setBIRTH_DATE(new Date());
//        person.setDEPT_SN("0020");
//        person.setSOCIAL_NO("500232311564");
//        person.setSTATUS(1);
//        Person person2 = new Person();
//        person2.setCODE("0074311");
//        person2.setNAME("秦青青6");
//        person2.setSEX("1");
//        person2.setPHONE_NUMBER("12351211");
//        person2.setBIRTH_DATE(new Date());
//        person2.setDEPT_SN("0022");
//        person2.setSOCIAL_NO("500231215641");
//        person2.setSTATUS(1);
//        data.add(person);
//        data.add(person2);
//        sysUserService.syncSysUser(data);

    }


    /**
     * 执行webservice接口
     *
     * @param dictCode
     * @param dictName
     * @return
     */
    public <T> WsResultDTO<T> executeWebService(String dictCode, String dictName, Class<T> clazz) {
        String result = "";
        StringBuilder params = new StringBuilder("<![CDATA[<request>");
        params.append("<dictCode>" + dictCode + "</dictCode>");
        params.append("<dictName>" + dictName + "</dictName>");
        params.append("<systemQuery>" + ssoConfig.getSystemId() + "</systemQuery>");
        params.append("<queryTime>" + DateUtil.format(new Date(), DatePattern.PURE_DATETIME_PATTERN) + "</queryTime>");
        params.append("<queryPage>1</queryPage>");
        params.append("</request>]]>");
        try {
            SoapClient client = SoapClient.create(webserviceConfig.getUrl())
                    .header("SOAPAction", "")
                    // 设置要请求的方法，此接口方法前缀为web，传入对应的命名空间
                    .setMethod("ser:" + webserviceConfig.getQueryDict(), webserviceConfig.getNamespace())
                    .setParam("xmlString", params, false);//此处写true，会自动填写命名空间

            log.info("ws入参:{}", client.getMsgStr(true));
            // 发送请求，参数true表示返回一个格式化后的XML内容
            // 返回内容为XML字符串，可以配合XmlUtil解析这个响应
            result = client.send(false);
            log.info("ws返回结果:{}", result);
            if (result.contains("<![CDATA[")) {
                result = result.substring(result.indexOf("<![CDATA[") + 9, result.indexOf("]]>"));
            } else {
                result = result.substring(result.indexOf("Result>") + 7, result.indexOf("}</") + 1);
            }
            Map<String, Object> resultMap = XmlUtil.xmlToMap(result);
            CopyOptions copyOptions = CopyOptions.create().setIgnoreError(true).setIgnoreNullValue(true);
            WsResultDTO dto = BeanUtil.mapToBean(resultMap, WsResultDTO.class, true, copyOptions);
            List<Map<String, String>> data = dto.getData();
            if (CollectionUtil.isNotEmpty(data)) {
                List<T> ts = BeanUtil.copyToList(data, clazz, copyOptions);
                dto.setData(ts);
            }
            return dto;
        } catch (Exception ex) {
            log.error("ws执行出现异常,入参:{},出参:{},{}", params, result, ex);
        }
        return null;
    }

}
