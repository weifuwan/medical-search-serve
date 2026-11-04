
package com.jiayuan.common.exception;

import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.log.service.SysLogErrorService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.annotation.Resource;


/**
 * @Title: GlobalExceptionHandler
 * @Package: com.jiayuan.common.exception
 * @Description: 异常处理器
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-03
 */
@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @Resource
    private SysLogErrorService sysLogErrorService;

    /**
     * 处理自定义异常
     */
    @ExceptionHandler(BizException.class)
    public Result handleRenException(BizException ex) {
        Result result = Result.error(ex.getCode(), ex.getMsg());

        return result;
    }

    @ExceptionHandler(DuplicateKeyException.class)
    public Result handleDuplicateKeyException(DuplicateKeyException ex) {
        log.info("报错了---", ex);
        Result result = Result.error(ErrorCode.DB_RECORD_EXISTS.getCode());

        return result;
    }

    @ExceptionHandler(UnauthorizedException.class)
    public Result handleUnauthorizedException(UnauthorizedException ex) {
        Result result = Result.error(ErrorCode.NO_API_PERMISSION.getCode());

        return result;
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result handleMethodArgumentNotValidException(MethodArgumentNotValidException ex) {
        Result result = Result.error(ex.getMessage());

        return result;
    }

    @ExceptionHandler(Exception.class)
    public Result handleException(Exception ex) {
        logger.error(ex.getMessage(), ex);

        saveLog(ex);

        return Result.error(ex.getMessage());
    }


    /**
     * 保存异常日志
     */
    private void saveLog(Exception ex) {
        log.error(ex.getMessage());
    }
}