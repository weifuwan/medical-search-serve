
package com.jiayuan.modules.log.service;

import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.BaseService;
import com.jiayuan.modules.log.dto.LogLoginDTO;
import com.jiayuan.modules.log.entity.LogLoginEntity;

import java.util.Date;
import java.util.Map;

/**
 * 登录日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
public interface LogLoginService extends BaseService<LogLoginEntity> {

    PageData<LogLoginDTO> page(Map<String, Object> params);

    void save(LogLoginEntity entity);

    /**
     * 操作日志清理
     *
     * @param date
     */
    void clearLog(Date date);
}