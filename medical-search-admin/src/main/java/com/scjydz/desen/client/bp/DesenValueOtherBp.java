package com.scjydz.desen.client.bp;

import cn.hutool.extra.spring.SpringUtil;
import com.scjydz.desen.client.DesenClient;
import com.scjydz.desen.client.request.DesenValueRequest;
import com.scjydz.desen.client.response.DesenValueResponse;
import com.scjydz.desen.entity.DesenCallLog;
import com.scjydz.desen.entity.SysDesenRule;
import com.scjydz.desen.provider.ICommonDesenProvider;
import com.scjydz.desen.utils.DesenConvertUtil;
import com.scjydz.desen.utils.StringUtil;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Slf4j
public class DesenValueOtherBp {

    private Map<String, SysDesenRule> sysDesenRuleMap = null;

    private String sysId = "";

    private String url = "";

    private String strType = "";

    private String accessToken = "";

    private String userId = "";

    private String roleId = "";

    private String saveLogUrl = "";

    public DesenValueOtherBp(String sysId, String url, String strType, String accessToken, String userId, String roleId, String saveLogUrl) {
        this.sysId = sysId;
        this.url = url;
        this.strType = strType;
        this.accessToken = accessToken;
        this.userId = userId;
        this.roleId = roleId;
        this.saveLogUrl = saveLogUrl;
    }

    public String desenValue(String desenCode, String value) {
        DesenCallLog callLog = new DesenCallLog();
        callLog.setOperaTime(new Date());
        String desenType = (StringUtil.isEmpty(userId) && StringUtil.isEmpty(roleId)) ? "0" : "1";
        callLog.setDesenType(desenType);
        callLog.setSysId(sysId);
        callLog.setDesenCode(desenCode);
        try {
            if (null == sysDesenRuleMap) {
                DesenValueRequest request = new DesenValueRequest();
                request.setSysId(sysId);
                request.setUrl(url);
                request.setStrType(strType);
                request.setAccessToken(accessToken);
                request.setUserId(userId);
                request.setRoleId(roleId);
                DesenClient client = new DesenClient();
                DesenValueResponse response = client.execProcess(request);
                sysDesenRuleMap = response.getRuleMap();
            }
            //匹配脱敏规则
            if (sysDesenRuleMap.containsKey(desenCode)) {
                //生成匹配后的数据
                SysDesenRule rule = sysDesenRuleMap.get(desenCode);
                callLog.setDesenName(rule.getDesenName());

                //通过util处理数据
                value = DesenConvertUtil.convertDesen(rule, value, strType);
            }
            callLog.setOperaStatus("1");
        } catch (Exception e) {
            e.printStackTrace();
            callLog.setOperaStatus("0");
            callLog.setFailureReason(e.getMessage());
        }
        try {
            String saveLogUrl = url.substring(0, url.lastIndexOf("/")) + "/saveDesenLog";
            ICommonDesenProvider commonDesenProvider = SpringUtil.getBean(ICommonDesenProvider.class);
            commonDesenProvider.saveDesenCallLog(saveLogUrl, accessToken, callLog);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return value;
    }

    public String desenValue(String value) {
        try {
            if (null == sysDesenRuleMap) {
                DesenValueRequest request = new DesenValueRequest();
                request.setSysId(sysId);
                request.setUrl(url);
                request.setStrType(strType);
                request.setAccessToken(accessToken);
                request.setUserId(userId);
                request.setRoleId(roleId);
                DesenClient client = new DesenClient();
                DesenValueResponse response = client.execProcess(request);
                sysDesenRuleMap = response.getRuleMap();
            }

            DesenCallLog callLog = new DesenCallLog();
            callLog.setOperaTime(new Date());
            String desenType = (StringUtil.isEmpty(userId) && StringUtil.isEmpty(roleId)) ? "0" : "1";
            callLog.setDesenType(desenType);
            callLog.setSysId(sysId);
            //匹配脱敏规则
            for (Map.Entry<String, SysDesenRule> entry : sysDesenRuleMap.entrySet()) {
                try {
                    String desenCode = entry.getKey();
                    SysDesenRule rule = entry.getValue();

                    //通过util处理数据
                    value = DesenConvertUtil.convertDesen(rule, value, strType);

                    //生成匹配后的数据
                    callLog.setDesenName(rule.getDesenName());
                    callLog.setDesenCode(desenCode);
                    callLog.setOperaStatus("1");
                } catch (Exception e) {
                    e.printStackTrace();
                    callLog.setOperaStatus("0");
                    callLog.setFailureReason(e.getMessage());
                }

                saveDesensitizedLog(callLog);
            }
        } catch (Exception e) {
            log.error("desen value error", e);
        }

        return value;
    }


    public List desenValue(List rows) {
        try {
            if (null == sysDesenRuleMap) {
                DesenValueRequest request = new DesenValueRequest();
                request.setSysId(sysId);
                request.setUrl(url);
                request.setStrType(strType);
                request.setAccessToken(accessToken);
                request.setUserId(userId);
                request.setRoleId(roleId);
                DesenClient client = new DesenClient();
                DesenValueResponse response = client.execProcess(request);
                sysDesenRuleMap = response.getRuleMap();
            }

            DesenCallLog callLog = new DesenCallLog();
            callLog.setOperaTime(new Date());
            String desenType = (StringUtil.isEmpty(userId) && StringUtil.isEmpty(roleId)) ? "0" : "1";
            callLog.setDesenType(desenType);
            callLog.setSysId(sysId);
            //匹配脱敏规则
            for (Map.Entry<String, SysDesenRule> entry : sysDesenRuleMap.entrySet()) {
                try {
                    String desenCode = entry.getKey();
                    SysDesenRule rule = entry.getValue();

                    //通过util处理数据
                    rows = DesenConvertUtil.convertDesen(rule, rows, strType);

                    //生成匹配后的数据
                    callLog.setDesenName(rule.getDesenName());
                    callLog.setDesenCode(desenCode);
                    callLog.setOperaStatus("1");
                } catch (Exception e) {
                    e.printStackTrace();
                    callLog.setOperaStatus("0");
                    callLog.setFailureReason(e.getMessage());
                }

                saveDesensitizedLog(callLog);
            }
        } catch (Exception e) {
            log.error("desen value error", e);
        }

        return rows;
    }

    /**
     * 保存脱敏日志
     *
     * @param callLog
     */
    private void saveDesensitizedLog(DesenCallLog callLog) {
        ICommonDesenProvider commonDesenProvider = SpringUtil.getBean(ICommonDesenProvider.class);
        commonDesenProvider.saveDesenCallLog(saveLogUrl, accessToken, callLog);
    }

}
