package com.scjydz.desen.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.scjydz.desen.consts.DesenConst;
import com.scjydz.desen.convert.AbstractDesenProcess;
import com.scjydz.desen.convert.DesenProcessFactory;
import com.scjydz.desen.entity.SysDesenRule;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * @Title : DesenConvertUtil
 * @Package :com.scjydz.utils
 * @Description :TODO（）
 * @Author: 刘涛
 * @Date: 创建时间 2021-11-16
 */
public class DesenConvertUtil {

    public static String convertDesen(SysDesenRule rule, String inputStr, String strType) throws JsonProcessingException {
        // 为了应对多个字段间的情况，所以这里循环取多个字段
        String[] columns = rule.getDesenColumn().split(",");
        if (columns.length < 1) {
            return inputStr;
        }
        List<String> columnList = Arrays.asList(columns);
        if (DesenConst.STR_TYPE_JSON.equalsIgnoreCase(strType)) {
            // 工具类中将JSON串转成 MAp结构的数据，如果是数组的话，转成 MAP ->  List -> MaP
            ObjectMapper mapper = new ObjectMapper();
            Object obj = mapper.readValue(inputStr, Object.class);

            conver(rule, columnList, null, null, obj);
            inputStr = mapper.writeValueAsString(obj);
        } else if (DesenConst.STR_TYPE_XML.equalsIgnoreCase(strType)) {
            for (String desenkey : columnList) {
                // xml的直接去截取字符串进行判断就行
                String valueOfField = StringUtil.getFieldValue4Xml(desenkey, inputStr);
                // 这里的截取字符串，如果是截取是空的，要么没有值，要么就是没有该字段，这个时候直接不做处理
                if (StringUtils.hasLength(valueOfField)) {
                    inputStr = callDesenProcess(rule, valueOfField, inputStr);
                }
            }
        } else if (DesenConst.STR_TYPE_VALUE.equals(strType)) {
            inputStr = callDesenProcess(rule, inputStr, inputStr);
        }
        return inputStr;
    }

    public static List convertDesen(SysDesenRule rule, List rows, String strType) throws JsonProcessingException {
        // 为了应对多个字段间的情况，所以这里循环取多个字段
        String[] columns = rule.getDesenColumn().split(",");
        if (columns.length < 1) {
            return rows;
        }
        List<String> columnList = Arrays.asList(columns);
        if (DesenConst.STR_TYPE_JSON.equalsIgnoreCase(strType)) {
            // 工具类中将JSON串转成 MAp结构的数据，如果是数组的话，转成 MAP ->  List -> MaP
            conver(rule, columnList, null, null, rows);
        }

        return rows;
    }

    private static void conver(SysDesenRule rule, List<String> columnList, Map<String, Object> data, String inputKey, Object inputValue) {
        if (inputValue instanceof java.util.Map) {
            Map<String, Object> jsonMap = (Map<String, Object>) inputValue;
            for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
                conver(rule, columnList, jsonMap, entry.getKey(), entry.getValue());
            }
        } else if (inputValue instanceof java.util.List) {
            List<Map<String, Object>> list = (List<Map<String, Object>>) inputValue;
            for (Map<String, Object> jsonMap : list) {
                conver(rule, columnList, jsonMap, null, jsonMap);
            }
        } else {
            if (Objects.nonNull(inputValue) && Objects.nonNull(data) && columnList.contains(inputKey)) {
                AbstractDesenProcess process = DesenProcessFactory.getDesenProcess(rule.getReplaceType());
                String value2 = process.handle(rule, inputValue.toString());
                data.put(inputKey, value2);
            }
        }
    }

    /**
     * 描述  脱敏核心，用简单工厂处理多种脱敏的可能，如果改动，只需要注册新的脱敏方案
     *
     * @param rule 脱敏规则。  desenVal 待脱敏的字段， inputStr  待脱敏的数据
     * @return {@link null  }
     * @throws
     * @author 刘涛
     */
    private static String callDesenProcess(SysDesenRule rule, String desenVal, String inputStr) {
        //包含脱敏，开启脱敏模式
        AbstractDesenProcess process = DesenProcessFactory.getDesenProcess(rule.getReplaceType());
        String value2 = process.handle(rule, desenVal);

        return inputStr.replace(desenVal, value2);
    }
}
