
package com.jiayuan.modules.log.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.log.entity.SysLogErrorEntity;
import org.apache.ibatis.annotations.Mapper;

/**
 * 异常日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Mapper
public interface SysLogErrorDao extends BaseDao<SysLogErrorEntity> {

}
