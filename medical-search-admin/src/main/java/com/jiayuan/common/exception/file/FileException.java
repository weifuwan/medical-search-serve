package com.jiayuan.common.exception.file;

import com.jiayuan.common.exception.base.BaseException;

/**
 * @Title: FileException
 * @Package: com.jiayuan.common.exception.file
 * @Description: 文件信息异常类
 * @Author: 李建奎
 * @Date: 创建时间 2023-08-07
 */
public class FileException extends BaseException {
    private static final long serialVersionUID = 1L;

    public FileException(String code, Object[] args) {
        super("file", code, args, null);
    }

}
