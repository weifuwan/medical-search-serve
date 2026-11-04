package com.jiayuan.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Title: BizCodeEnum
 * @Package: com.jiayuan.common.enums
 * @Description: 错误编码
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-05
 * <p>
 * 错误码和错误信息定义类
 * 1. 错误码定义规则为5为数字
 * 2. 前两位表示业务场景，最后三位表示错误码。例如：100001。
 * 10:通用 001:系统未知异常
 * 20:搜索
 * 3. 维护错误码后需要维护错误描述，将他们定义为枚举形式
 * 错误码列表：
 **/

@Getter
@AllArgsConstructor
public enum ErrorCode {
    INTERNAL_SERVER_ERROR(500, "服务器错误"),
    UNAUTHORIZED(401, "未认证"),
    NOT_NULL(10001, "参数为空"),
    DB_RECORD_EXISTS(10002, "XXX"),
    PARAMS_GET_ERROR(10003, "XXX"),
    ACCOUNT_PASSWORD_ERROR(10004, "账号密码错误"),
    ACCOUNT_DISABLE(10005, "账号停用"),
    IDENTIFIER_NOT_NULL(10006, "验证码不能为空"),
    CAPTCHA_ERROR(10007, "验证码错误"),
    SUB_MENU_EXIST(10008, "XXX"),
    PASSWORD_ERROR(10009, "XXX"),
    SUPERIOR_MENU_ERROR(10012, "XXX"),
    TOKEN_INVALID(10021, "token失效"),
    ACCOUNT_LOCK(10022, "账号锁定"),
    REDIS_ERROR(10027, "redis错误"),
    INVALID_SYMBOL(10029, "非法标识"),

    NO_API_PERMISSION(10030, "没有接口权限"),
    EXPRESSION_MATCH_ERROR(20001, "表达式匹配错误"),
    EXPRESSION_PARSE_ERROR(20002, "表达式解析错误"),
    FIELD_NULL_ERROR(20003, "字段为空");

    private Integer code;
    private String message;
}
