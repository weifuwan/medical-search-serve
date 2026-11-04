package com.jiayuan.common.utils.file;

import cn.hutool.core.util.StrUtil;
import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.exception.file.FileNameLengthLimitExceededException;
import com.jiayuan.common.exception.file.FileSizeLimitExceededException;
import com.jiayuan.common.exception.file.InvalidExtensionException;
import com.jiayuan.common.utils.DateUtils;
import com.jiayuan.common.utils.SpringContextUtils;
import com.jiayuan.common.utils.uuid.Seq;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Paths;
import java.util.Objects;

/**
 * @Title: FileUploadUtils
 * @Package: com.jiayuan.common.utils.file
 * @Description: 文件上传工具类
 * @Author: 李建奎
 * @Date: 创建时间 2023-08-08
 */
public class FileUploadUtils {
    /**
     * 默认大小 50M
     */
    public static final long DEFAULT_MAX_SIZE = 50 * 1024 * 1024;

    /**
     * 默认的文件名最大长度 100
     */
    public static final int DEFAULT_FILE_NAME_LENGTH = 100;


    /**
     * 以默认配置进行文件上传
     *
     * @param file 上传的文件
     * @return 文件名称
     * @throws Exception
     */
    public static final String upload(MultipartFile file) throws IOException {
        try {
            return upload(getDefaultBaseDir(), file, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
        } catch (Exception e) {
            throw new IOException(e.getMessage(), e);
        }
    }

    /**
     * 获取附件上传路径
     *
     * @return
     */
    public static String getDefaultBaseDir() {
        return SpringContextUtils.getBean(CustomConfig.class).getFilePath();
    }

    /**
     * 获取导出缓存文件路径
     *
     * @return
     */
    public static String getExportPath() {
        String separator = FileSystems.getDefault().getSeparator();
        return getDefaultBaseDir() + separator + "export";
    }

    /**
     * 获取导出缓存临时文件路径
     *
     * @return
     */
    public static String getExportTmpPath() {
        return getExportPath() + "/tmp";
    }

    /**
     * /**
     * 获取logo上传路径
     *
     * @return
     */
    public static String getLogoPath() {
        return getDefaultBaseDir() + "/logo";
    }

    /**
     * 根据文件路径上传
     *
     * @param baseDir 相对应用的基目录
     * @param file    上传的文件
     * @return 文件名称
     * @throws IOException
     */
    public static final String upload(String baseDir, MultipartFile file) throws IOException {
        try {
            return upload(baseDir, file, MimeTypeUtils.DEFAULT_ALLOWED_EXTENSION);
        } catch (Exception e) {
            throw new IOException(e.getMessage(), e);
        }
    }

    /**
     * 文件上传
     *
     * @param baseDir          相对应用的基目录
     * @param file             上传的文件
     * @param allowedExtension 上传文件类型
     * @return 返回上传成功的文件名
     * @throws FileSizeLimitExceededException       如果超出最大大小
     * @throws FileNameLengthLimitExceededException 文件名太长
     * @throws IOException                          比如读写文件出错时
     * @throws InvalidExtensionException            文件校验异常
     */
    public static final String upload(String baseDir, MultipartFile file, String[] allowedExtension)
            throws FileSizeLimitExceededException, IOException, FileNameLengthLimitExceededException,
            InvalidExtensionException {
        int fileNameLength = Objects.requireNonNull(file.getOriginalFilename()).length();
        if (fileNameLength > FileUploadUtils.DEFAULT_FILE_NAME_LENGTH) {
            throw new FileNameLengthLimitExceededException(FileUploadUtils.DEFAULT_FILE_NAME_LENGTH);
        }

        assertAllowed(file, allowedExtension);

        String fileName = extractFilename(file);

        String absPath = getAbsoluteFile(baseDir, fileName).getAbsolutePath();
        file.transferTo(Paths.get(absPath));
        return getPathFileName(baseDir, fileName);
    }

    /**
     * 编码文件名
     */
    public static final String extractFilename(MultipartFile file) {
        return StrUtil.format("{}/{}_{}.{}", DateUtils.datePath(),
                FilenameUtils.getBaseName(file.getOriginalFilename()), Seq.getId(Seq.uploadSeqType), getExtension(file));
    }

    public static final File getAbsoluteFile(String uploadDir, String fileName) throws IOException {
        File desc = new File(uploadDir + File.separator + fileName);

        if (!desc.exists()) {
            if (!desc.getParentFile().exists()) {
                desc.getParentFile().mkdirs();
            }
        }
        return desc;
    }


    public static final String getPathFileName(String uploadDir, String fileName) throws IOException {
        int dirLastIndex = getDefaultBaseDir().length() + 1;
        String currentDir = StringUtils.substring(uploadDir, dirLastIndex);
        if (StrUtil.isNotBlank(currentDir)) {
            return BizConstant.RESOURCE_PREFIX + "/" + currentDir + "/" + fileName;
        }
        return BizConstant.RESOURCE_PREFIX + "/" + fileName;
    }

    /**
     * 文件大小校验
     *
     * @param file 上传的文件
     * @return
     * @throws FileSizeLimitExceededException 如果超出最大大小
     * @throws InvalidExtensionException
     */
    public static final void assertAllowed(MultipartFile file, String[] allowedExtension)
            throws FileSizeLimitExceededException, InvalidExtensionException {
        long size = file.getSize();
        if (size > DEFAULT_MAX_SIZE) {
            throw new FileSizeLimitExceededException(DEFAULT_MAX_SIZE / 1024 / 1024);
        }

        String fileName = file.getOriginalFilename();
        String extension = getExtension(file);
        if (allowedExtension != null && !isAllowedExtension(extension, allowedExtension)) {
            if (allowedExtension == MimeTypeUtils.IMAGE_EXTENSION) {
                throw new InvalidExtensionException.InvalidImageExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.FLASH_EXTENSION) {
                throw new InvalidExtensionException.InvalidFlashExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.MEDIA_EXTENSION) {
                throw new InvalidExtensionException.InvalidMediaExtensionException(allowedExtension, extension,
                        fileName);
            } else if (allowedExtension == MimeTypeUtils.VIDEO_EXTENSION) {
                throw new InvalidExtensionException.InvalidVideoExtensionException(allowedExtension, extension,
                        fileName);
            } else {
                throw new InvalidExtensionException(allowedExtension, extension, fileName);
            }
        }
    }

    /**
     * 判断MIME类型是否是允许的MIME类型
     *
     * @param extension
     * @param allowedExtension
     * @return
     */
    public static final boolean isAllowedExtension(String extension, String[] allowedExtension) {
        for (String str : allowedExtension) {
            if (str.equalsIgnoreCase(extension)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取文件名的后缀
     *
     * @param file 表单文件
     * @return 后缀名
     */
    public static final String getExtension(MultipartFile file) {
        String extension = FilenameUtils.getExtension(file.getOriginalFilename());
        if (StringUtils.isEmpty(extension)) {
            extension = MimeTypeUtils.getExtension(Objects.requireNonNull(file.getContentType()));
        }
        return extension;
    }

    /**
     * 获取附件下载路径(替换掉/profile)
     * /home/mr/attach/2023/12/05/备忘录_20231205112806A023.txt
     *
     * @return
     */
    public static String getDownloadUrl(String uri) {
        // 本地资源路径
        String localPath = getDefaultBaseDir();
        // 数据库资源地址
        String downloadPath = localPath + StringUtils.substringAfter(uri, BizConstant.RESOURCE_PREFIX);
        return downloadPath;
    }

}
