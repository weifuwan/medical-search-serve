
package com.jiayuan.modules.log.service;

import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.BaseService;
import com.jiayuan.modules.log.dto.SysLogOperationDTO;
import com.jiayuan.modules.log.entity.SysLogOperationEntity;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 操作日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
public interface SysLogOperationService extends BaseService<SysLogOperationEntity> {

    PageData<SysLogOperationDTO> page(Map<String, Object> params);

    List<SysLogOperationDTO> list(Map<String, Object> params);

    void save(SysLogOperationEntity entity);

    /**
     * 操作日志清理
     *
     * @param date
     */
    void clearLog(Date date);
}