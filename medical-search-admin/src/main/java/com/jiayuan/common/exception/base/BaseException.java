package com.jiayuan.common.exception.base;

import cn.hutool.core.util.StrUtil;
import com.jiayuan.common.utils.MessageUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Title: BaseException
 * @Package: com.jiayuan.common.exception.base
 * @Description: 基础异常
 * @Author: 李建奎
 * @Date: 创建时间 2023-08-07
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BaseException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    /**
     * 所属模块
     */
    private String module;

    /**
     * 错误码
     */
    private String code;

    /**
     * 错误码对应的参数
     */
    private Object[] args;

    /**
     * 错误消息
     */
    private String defaultMessage;


    @Override
    public String getMessage() {
        String message = null;
        if (StrUtil.isNotBlank(code)) {
            message = MessageUtils.message(code, args);
        }
        if (message == null) {
            message = defaultMessage;
        }
        return message;
    }

}
