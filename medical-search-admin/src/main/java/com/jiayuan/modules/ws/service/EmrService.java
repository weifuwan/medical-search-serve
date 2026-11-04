package com.jiayuan.modules.ws.service;

import com.jiayuan.modules.ws.dto.EmrDTO;

/**
 * @Title: com.jiayuan.modules.ws
 * @Package: EmrService
 * @Description: 电子病历接口
 * @Author: 李建奎
 * @Date: 创建时间 2024/9/18
 */
public interface EmrService {

    /**
     * 电子病历查询接口
     */
    void queryEmr(EmrDTO emrDTO);

}
