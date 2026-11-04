
package com.jiayuan.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.impl.BaseServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.utils.JsonUtils;
import com.jiayuan.modules.sys.dao.HospitalConfigDao;
import com.jiayuan.modules.sys.dao.SysParamsDao;
import com.jiayuan.modules.sys.dto.SysParamsDTO;
import com.jiayuan.modules.sys.entity.HospitalConfigEntity;
import com.jiayuan.modules.sys.entity.SysParamsEntity;
import com.jiayuan.modules.sys.redis.SysParamsRedis;
import com.jiayuan.modules.sys.request.HospitalRequest;
import com.jiayuan.modules.sys.service.SysParamsService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

/**
 * 参数管理
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Service
@RequiredArgsConstructor
public class SysParamsServiceImpl extends BaseServiceImpl<SysParamsDao, SysParamsEntity> implements SysParamsService {

    private final SysParamsRedis sysParamsRedis;
    private final CustomConfig customConfig;

    @Autowired
    private HospitalConfigDao hospitalConfigDao;

    /**
     * 医院LOG URL
     */
    private final static String HOSPITAL_LOGO_URL = "HOSPITAL_LOGO_URL";

    /**
     * 医院name
     */
    private final static String HOSPITAL_NAME = "HOSPITAL_NAME";

    /**
     * 图片文件大小的上限值(1MB)
     */
    public static final int LOGO_MAX_SIZE = 1;
    /**
     * 允许上传的图片的文件类型
     */
    public static final List<String> LOGO_TYPES = new ArrayList<String>();

    /** 初始化允许上传的图片的文件类型 */
    static {
        LOGO_TYPES.add("image/jpeg");
        LOGO_TYPES.add("image/jpg");
        LOGO_TYPES.add("image/png");
        LOGO_TYPES.add("image/bmp");
        LOGO_TYPES.add("image/gif");
        LOGO_TYPES.add("image/pjpeg");
        LOGO_TYPES.add("image/x-png");
    }


    @Override
    public PageData<SysParamsDTO> page(Map<String, Object> params) {
        IPage<SysParamsEntity> page = baseDao.selectPage(
                getPage(params, Constant.CREATE_DATE, false),
                getWrapper(params)
        );

        return getPageData(page, SysParamsDTO.class);
    }

    @Override
    public List<SysParamsDTO> list(Map<String, Object> params) {
        List<SysParamsEntity> entityList = baseDao.selectList(getWrapper(params));

        return ConvertUtils.sourceToTarget(entityList, SysParamsDTO.class);
    }

    private QueryWrapper<SysParamsEntity> getWrapper(Map<String, Object> params) {
        String paramCode = (String) params.get("paramCode");

        QueryWrapper<SysParamsEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("param_type", 1);
        wrapper.like(StringUtils.isNotBlank(paramCode), "param_code", paramCode);

        return wrapper;
    }

    @Override
    public SysParamsDTO get(Long id) {
        SysParamsEntity entity = baseDao.selectById(id);

        return ConvertUtils.sourceToTarget(entity, SysParamsDTO.class);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(SysParamsDTO dto) {
        SysParamsEntity entity = ConvertUtils.sourceToTarget(dto, SysParamsEntity.class);
        insert(entity);

        sysParamsRedis.set(entity.getParamCode(), entity.getParamValue());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(SysParamsDTO dto) {
        SysParamsEntity entity = ConvertUtils.sourceToTarget(dto, SysParamsEntity.class);
        updateById(entity);

        sysParamsRedis.set(entity.getParamCode(), entity.getParamValue());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long[] ids) {
        //删除Redis数据
        List<String> paramCodeList = baseDao.getParamCodeList(ids);
        String[] paramCodes = paramCodeList.toArray(new String[paramCodeList.size()]);
        sysParamsRedis.delete(paramCodes);

        //删除
        deleteBatchIds(Arrays.asList(ids));
    }

    @Override
    public String getValue(String paramCode) {
        String paramValue = sysParamsRedis.get(paramCode);
        if (paramValue == null) {
            paramValue = baseDao.getValueByCode(paramCode);

            sysParamsRedis.set(paramCode, paramValue);
        }
        return paramValue;
    }

    @Override
    public <T> T getValueObject(String paramCode, Class<T> clazz) {
        String paramValue = getValue(paramCode);
        if (StringUtils.isNotBlank(paramValue)) {
            return JsonUtils.parseObject(paramValue, clazz);
        }

        try {
            return clazz.newInstance();
        } catch (Exception e) {
            throw new BizException(ErrorCode.PARAMS_GET_ERROR.getCode());
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateValueByCode(String paramCode, String paramValue) {
        int count = baseDao.updateValueByCode(paramCode, paramValue);
        sysParamsRedis.set(paramCode, paramValue);
        return count;
    }


//    @Override
//    public String settingLogo(MultipartFile file, HttpServletRequest servletRequest) {
//        // 判断上传的文件是否为空
//        if (file == null || file.isEmpty()) {
//            throw new BizException("上传的头像文件不允许为空");
//        }
//
//        Integer imageSize = customConfig.getFileImageSize();
//        if (imageSize == null || imageSize == 0) {
//            imageSize = LOGO_MAX_SIZE;
//        }
//        int sizeByte = imageSize * 1024 * 1024;
//        // 判断上传的文件大小是否超出限制值
//        // getSize()：返回文件的大小，以字节为单位
//        if (file.getSize() > sizeByte) {
//            throw new BizException("不允许上传超过" + (sizeByte / 1024) + "KB的头像文件");
//        }
//
//        // 判断上传的文件类型是否超出限制
//        final String contentType = file.getContentType();
//        if (!LOGO_TYPES.contains(contentType)) {
//            throw new BizException("不支持使用该类型的文件作为头像，允许的文件类型：" + LOGO_TYPES);
//        }
//
//        // 保存头像文件的文件夹
//        File dir = new File(FileUploadUtils.getLogoPath());
//        if (!dir.exists()) {
//            dir.mkdirs();
//        }
//
//        //文件新名称
//        String newFileName = "logo" + System.currentTimeMillis() + "." + StringUtils.split(contentType, "/")[1];
//        // 创建文件对象，表示保存的头像文件
//        File dest = new File(FileUploadUtils.getLogoPath() + "/" + newFileName);
//        // 执行保存头像文件
//        try {
//            file.transferTo(dest);
//        } catch (IllegalStateException e) {
//            log.error("文件状态异常，可能文件已被移动或删除：" + e.getMessage(), e);
//            throw new BizException("文件状态异常，可能文件已被移动或删除");
//        } catch (IOException e) {
//            log.error("上传文件时读写错误，请稍后重新尝试：" + e.getMessage(), e);
//            throw new BizException("上传文件时读写错误，请稍后重新尝试");
//        }
//        // 将图片路径写到系统设置中
//        this.updateValueByCode(HOSPITAL_LOGO_URL, this.getBaseUrl(servletRequest) + "/static/img/" + newFileName);
//
//        return FileUploadUtils.getLogoPath();
//    }

    @Override
    public String settingLogo(HospitalRequest request, HttpServletRequest servletRequest) {
        MultipartFile file = request.getFile();

        if (request.getId() != null && file == null) {
            HospitalConfigEntity hospitalConfigEntity = new HospitalConfigEntity();
            hospitalConfigEntity.setHospitalName(request.getHospitalName());
            hospitalConfigEntity.setId(request.getId());
            hospitalConfigDao.updateById(hospitalConfigEntity);
            return "Base64 image saved to database";
        }


        if (file == null || file.isEmpty()) {
            throw new BizException("上传的头像文件不允许为空");
        }

        Integer imageSize = customConfig.getFileImageSize();
        if (imageSize == null || imageSize == 0) {
            imageSize = LOGO_MAX_SIZE;
        }
        int sizeByte = imageSize * 1024 * 1024;

        if (file.getSize() > sizeByte) {
            throw new BizException("不允许上传超过" + (sizeByte / 1024) + "KB的头像文件");
        }

        final String contentType = file.getContentType();
        if (!LOGO_TYPES.contains(contentType)) {
            throw new BizException("不支持使用该类型的文件作为头像，允许的文件类型：" + LOGO_TYPES);
        }

        try {
            byte[] bytes = file.getBytes();
            String base64Image = Base64.getEncoder().encodeToString(bytes);
            String fullBase64 = "data:" + contentType + ";base64," + base64Image;

            // 删除已有的配置，保持只有一条记录
            hospitalConfigDao.deleteAll();

            // 创建新实体
            HospitalConfigEntity config = new HospitalConfigEntity();
            config.setLogoBase64(fullBase64);

            String hospitalName = getHospitalNameFromRequest(servletRequest);
            if (hospitalName == null) {
                hospitalName = "中心医院"; // 默认值
            }
            config.setHospitalName(hospitalName);

            hospitalConfigDao.insert(config);
            return "Base64 image saved to database";
        } catch (IOException e) {
            log.error("图片转换失败: {}");
            throw new BizException("图片处理失败: " + e.getMessage());
        }
    }

    // 辅助方法：从请求中获取医院名称
    private String getHospitalNameFromRequest(HttpServletRequest request) {
        // 根据实际参数传递方式调整
        return request.getParameter("hospitalName");
    }

    @Override
    public void saveHospitalConfig(HospitalRequest request, HttpServletRequest servletRequest) {
//        this.settingLogo(request.getFile(), servletRequest);
//        this.updateValueByCode(HOSPITAL_NAME, request.getHospitalName());
        this.settingLogo(request, servletRequest);
//
    }

    //    @Override
//    public List<SysParamsEntity> getHospitalConfig() {
//        return this.selectList(Wrappers.<SysParamsEntity>lambdaQuery().in(SysParamsEntity::getParamCode, HOSPITAL_NAME, HOSPITAL_LOGO_URL));
//    }
    @Override
    public HospitalConfigEntity getHospitalConfig() {
//        List<HospitalConfigEntity> all = hospitalConfigDao.selectAll();

//    if (all == null || all.isEmpty()) {
//        // 表为空，插入一条默认数据
//        HospitalConfigEntity defaultConfig = new HospitalConfigEntity();
//        defaultConfig.setHospitalName("中心医院");
//        defaultConfig.setLogoBase64(""); // 默认空图
//        hospitalConfigDao.insert(defaultConfig);
//        return defaultConfig;
//    }

        // 返回最新的一条
//        if (all.size() > 0) {
//            return all.get(0);
//        }
//        return new HospitalConfigEntity();
        QueryWrapper<HospitalConfigEntity> wrapper = new QueryWrapper<>();
        wrapper.last("where ROWNUM = 1");
        return hospitalConfigDao.selectOne(wrapper);
    }

    /**
     * 获取URL
     *
     * @param request
     * @return
     */
    private String getBaseUrl(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
}