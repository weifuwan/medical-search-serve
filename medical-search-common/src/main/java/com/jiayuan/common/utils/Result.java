
package com.jiayuan.common.utils;

import com.jiayuan.common.enums.ErrorCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * @Title: Result
 * @Package: com.jiayuan.common.utils
 * @Description: 响应数据
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-21
 */
@Data
@ApiModel(value = "响应数据")
public class Result<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 编码：0表示成功，其他值表示失败
     */
    @ApiModelProperty(value = "编码：0表示成功，其他值表示失败")
    private int code = 0;
    /**
     * 消息内容
     */
    @ApiModelProperty(value = "消息内容")
    private String msg = "success";
    /**
     * 响应数据
     */
    @ApiModelProperty(value = "响应数据")
    private T data;

    public static <T> Result<T> ok(T data) {
        final Result<T> result = new Result<>();
        result.setData(data);
        return result;
    }

    public static <T> Result<T> ok() {
        final Result<T> result = new Result<>();
        return result;
    }

    public static <T> Result<T> error() {
        final Result<T> result = new Result<>();
        result.setCode(ErrorCode.INTERNAL_SERVER_ERROR.getCode());
        result.setMsg(MessageUtils.getMessage(ErrorCode.INTERNAL_SERVER_ERROR.getCode()));
        return result;
    }

    public static <T> Result<T> error(int code) {
        final Result<T> result = new Result<>();
        result.setCode(code);
        result.setMsg(MessageUtils.getMessage(code));
        return result;
    }

    public static <T> Result<T> error(int code, String msg) {
        final Result<T> result = new Result<>();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }

    public static <T> Result<T> error(String msg) {
        final Result<T> result = new Result<>();
        result.setCode(ErrorCode.INTERNAL_SERVER_ERROR.getCode());
        result.setMsg(msg);
        return result;
    }
}
