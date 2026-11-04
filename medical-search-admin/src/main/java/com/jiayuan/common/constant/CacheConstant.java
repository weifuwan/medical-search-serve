package com.jiayuan.common.constant;

/**
 * @Title: CacheConstant
 * @Package: com.jiayuan.common.constant
 * @Description: 字典缓存key
 * @Author: 李建奎
 * @Date: 创建时间 2023/2/16
 */
public class CacheConstant {

    /**
     * 字典管理 cache key
     */
    public static final String SYS_DICT_KEY = "msApi:dictData:type:";
    /**
     * 系统配置 cache key
     */
    public static final String SYS_CONFIG_KEY = "msApi:sysConfig:configCode:";
    /**
     * 导出 cache key
     */
    public static final String EXPORT_USER_TOKEN_KEY = "msApi:export:userToken:";

    /*-------------------脱敏配置缓存key------------------------ */
    public static final String DM_ENABLED = "desensitize.config.enabled"; //脱敏开关
    public static final String DM_SYS_ID = "desensitize.config.sys.id"; //脱敏系统ID
    public static final String DM_URL = "desensitize.config.url"; //脱敏地址
    public static final String DM_ACCESS_TOKEN = "desensitize.config.token"; //访问token
}
