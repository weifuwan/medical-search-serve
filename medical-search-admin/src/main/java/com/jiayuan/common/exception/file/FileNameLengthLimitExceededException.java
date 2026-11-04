package com.jiayuan.common.exception.file;

/**
 * @Title: FileNameLengthLimitExceededException
 * @Package: com.jiayuan.common.exception.file
 * @Description: 文件名称超长限制异常类
 * @Author: 李建奎
 * @Date: 创建时间 2023-08-07
 */
public class FileNameLengthLimitExceededException extends FileException {
    private static final long serialVersionUID = 1L;

    public FileNameLengthLimitExceededException(int defaultFileNameLength) {
        super("upload.filename.exceed.length", new Object[]{defaultFileNameLength});
    }
}
