
package com.jiayuan.common.exception;


import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.utils.MessageUtils;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Title: BizException
 * @Package: com.jiayuan.common.exception
 * @Description: 自定义异常
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-04
 */
@NoArgsConstructor
@Data
public class BizException extends RuntimeException {
    private static final long serialVersionUID = 1L;

    private int code;
    private String msg;

    public BizException(int code) {
        this.code = code;
        this.msg = MessageUtils.getMessage(code);
    }

    public BizException(ErrorCode errorCode, String... params) {
        this.code = errorCode.getCode();
        this.msg = "[" + params + "]" + errorCode.getMessage();
    }

    public BizException(int code, String... params) {
        this.code = code;
        this.msg = MessageUtils.getMessage(code, params);
    }

    public BizException(int code, Throwable e) {
        super(e);
        this.code = code;
        this.msg = MessageUtils.getMessage(code);
    }

    public BizException(int code, Throwable e, String... params) {
        super(e);
        this.code = code;
        this.msg = MessageUtils.getMessage(code, params);
    }

    public BizException(String msg) {
        super(msg);
        this.code = ErrorCode.INTERNAL_SERVER_ERROR.getCode();
        this.msg = msg;
    }

    public BizException(String msg, Throwable e) {
        super(msg, e);
        this.code = ErrorCode.INTERNAL_SERVER_ERROR.getCode();
        this.msg = msg;
    }
}