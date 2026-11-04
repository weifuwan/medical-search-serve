package com.jiayuan.modules.ws.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.XmlUtil;
import cn.hutool.http.webservice.SoapClient;
import com.jiayuan.common.config.SsoConfig;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.modules.ws.config.EmrWsConfig;
import com.jiayuan.modules.ws.dto.EmrDTO;
import com.jiayuan.modules.ws.request.Emr1Request;
import com.jiayuan.modules.ws.request.EmrRequest;
import com.jiayuan.modules.ws.service.EmrService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @Title: com.jiayuan.modules.ws.service.impl
 * @Package: EmrServiceImpl
 * @Description: 电子病历接口实现
 * @Author: 李建奎
 * @Date: 创建时间 2024/9/18
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class EmrServiceImpl implements EmrService {
    private final EmrWsConfig emrWsConfig;
    private final SsoConfig ssoConfig;


    @Async
    @Override
    public void queryEmr(EmrDTO emrDTO) {
        ValidatorUtils.validateEntity(emrDTO, DefaultGroup.class);

        //查询返回unique
        Emr1Request request1 = Emr1Request.builder()
                .HIS_RESID(UUID.fastUUID().toString())
                .CREATIONTIME(DateUtil.format(new Date(), DatePattern.NORM_DATETIME_PATTERN))
                .REQ_SYS_CODE(ssoConfig.getSystemId())
                .GROUP_CODE(ssoConfig.getGroupCode())
                .ORGANIZATION_CODE(ssoConfig.getOrgCode())
                .DOMAIN_ID(emrDTO.getDomainId())
                .PATIENT_ID(emrDTO.getPatientId())
                .VISIT_NO(emrDTO.getVisitNo())
                .build();
        Map<String, Object> resultMap = this.executeWebService(objectToXml(request1), emrWsConfig.getSearchUrl(), emrWsConfig.getSearchMethod(), emrWsConfig.getSearchAction(), emrWsConfig.getSearchNamespace());
        if (resultMap != null) {
            //AA代表成功
            if ("AA".equals(resultMap.get("TYPE_CODE"))) {
                List<Map<String, Object>> list = (List<Map<String, Object>>) resultMap.get("LIST");
                if (CollectionUtil.isNotEmpty(list)) {
                    list.forEach(item -> {
                        //使用unique再调用电子病历接口
                        Object unicode = item.get("UNICODE");
                        if (Objects.nonNull(unicode)) {
                            EmrRequest request = EmrRequest.builder()
                                    .HIS_RESID(UUID.fastUUID().toString())
                                    .CREATIONTIME(DateUtil.format(new Date(), DatePattern.NORM_DATETIME_PATTERN))
                                    .REQ_SYS_CODE(ssoConfig.getSystemId())
                                    .GROUP_CODE(ssoConfig.getGroupCode())
                                    .ORGANIZATION_CODE(ssoConfig.getOrgCode())
                                    .DOMAIN_ID(emrDTO.getDomainId())
                                    .REQUEST(EmrRequest.RequestParam.builder().PATIENT_ID(emrDTO.getPatientId()).VISIT_NO(emrDTO.getVisitNo()).UNICODE(unicode.toString()).build())
                                    .build();
                            this.executeWebService(objectToXml(request), emrWsConfig.getQueryUrl(), emrWsConfig.getQueryMethod(), emrWsConfig.getQueryAction(), emrWsConfig.getQueryNamespace());
                        }
                    });
                }
            }

        }

    }


    /**
     * 执行webservice接口
     *
     * @param param
     * @return
     */
    public Map<String, Object> executeWebService(String param, String url, String method, String action, String namespace) {
        Map<String, Object> resultMap = null;
        String result = null;
        StringBuilder params = new StringBuilder("<![CDATA[<DATA>");
        params.append(param);
        params.append("</DATA>]]>");
        try {
            SoapClient client = SoapClient.create(url)
                    .header("SOAPAction", action)
                    .setMethod("doc:" + method, namespace)
                    .setParam("input", params.toString(), false);

            log.info("emr-ws请求:{}", client.getMsgStr(true));
            result = client.send(false);
            log.info("emr-ws响应:{}", result);
            if (result.contains("<![CDATA[")) {
                result = result.substring(result.indexOf("<![CDATA[") + 9, result.indexOf("]]>"));
            } else {
                result = result.substring(result.indexOf("Result>") + 7, result.indexOf("}</") + 1);
            }
            resultMap = XmlUtil.xmlToMap(result);
        } catch (Exception ex) {
            log.error("emr-ws执行出现异常,入参:{},出参:{},{}", params, result, ex);
        }

        return resultMap;
    }


    /**
     * 对象转xml
     *
     * @param obj
     * @return
     */
    private String objectToXml(Object obj) {
        if (obj == null) {
            return "";
        }
        StringBuilder xml = new StringBuilder();
        Class<?> clazz = obj.getClass();

        for (Field field : clazz.getDeclaredFields()) {
            field.setAccessible(true); // 设置为可访问，以便获取私有字段
            try {
                Object value = field.get(obj);
                if (value != null) {
                    String fieldName = field.getName();
                    Class<?> type = field.getType();
                    // 判断 type 是不是对象类型
                    if (type.equals(EmrRequest.RequestParam.class)) {
                        // 处理对象类型
                        xml.append("<").append(fieldName).append(">");
                        xml.append(objectToXml(value)); // 递归调用
                        xml.append("</").append(fieldName).append(">");
                    } else {
                        // 处理基本类型
                        xml.append("<").append(fieldName).append(">").append(value.toString()).append("</").append(fieldName).append(">");
                    }
                }
            } catch (IllegalAccessException e) {
                // 处理无法访问字段的情况
                log.error("Error accessing field: " + field.getName(), e);
            }
        }

        return xml.toString();
    }

}
