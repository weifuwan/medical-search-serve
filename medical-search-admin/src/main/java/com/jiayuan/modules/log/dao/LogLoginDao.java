
package com.jiayuan.modules.log.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.log.entity.LogLoginEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

/**
 * 登录日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Mapper
public interface LogLoginDao extends BaseDao<LogLoginEntity> {

    /**
     * 操作日志清理
     *
     * @param date
     */
    void clearLog(@Param(value = "date") Date date);
}
