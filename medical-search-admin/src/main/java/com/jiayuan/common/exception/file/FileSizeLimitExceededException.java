package com.jiayuan.common.exception.file;

/**
 * @Title: FileSizeLimitExceededException
 * @Package: com.jiayuan.common.exception.file
 * @Description: 文件名大小限制异常类
 * @Author: 李建奎
 * @Date: 创建时间 2023-08-07
 */
public class FileSizeLimitExceededException extends FileException {
    private static final long serialVersionUID = 1L;

    public FileSizeLimitExceededException(long defaultMaxSize) {
        super("upload.exceed.maxSize", new Object[]{defaultMaxSize});
    }
}
