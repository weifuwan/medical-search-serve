
package com.jiayuan.modules.sys.service;


import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.BaseService;
import com.jiayuan.modules.sys.dto.SysParamsDTO;
import com.jiayuan.modules.sys.entity.HospitalConfigEntity;
import com.jiayuan.modules.sys.entity.SysParamsEntity;
import com.jiayuan.modules.sys.request.HospitalRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 参数管理
 *
 * @author lijiankui
 * @since 1.0.0
 */
public interface SysParamsService extends BaseService<SysParamsEntity> {

    PageData<SysParamsDTO> page(Map<String, Object> params);

    List<SysParamsDTO> list(Map<String, Object> params);

    SysParamsDTO get(Long id);

    void save(SysParamsDTO dto);

    void update(SysParamsDTO dto);

    void delete(Long[] ids);

    /**
     * 根据参数编码，获取参数的value值
     *
     * @param paramCode 参数编码
     */
    String getValue(String paramCode);

    /**
     * 根据参数编码，获取value的Object对象
     *
     * @param paramCode 参数编码
     * @param clazz     Object对象
     */
    <T> T getValueObject(String paramCode, Class<T> clazz);

    /**
     * 根据参数编码，更新value
     *
     * @param paramCode  参数编码
     * @param paramValue 参数值
     */
    int updateValueByCode(String paramCode, String paramValue);

    /**
     * logo上传
     *
     * @param request
     * @param servletRequest
     * @return
     */
//    String settingLogo(MultipartFile file, HttpServletRequest servletRequest);
    String settingLogo(HospitalRequest request, HttpServletRequest servletRequest);


    /**
     * 医院参数配置
     *
     * @param request
     * @param servletRequest
     * @return
     */
    void saveHospitalConfig(HospitalRequest request, HttpServletRequest servletRequest);

    /**
     * 获取医院配置接口
     *
     * @return
     */
//    List<SysParamsEntity> getHospitalConfig();

    HospitalConfigEntity getHospitalConfig();

}
