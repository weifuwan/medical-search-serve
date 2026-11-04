
package com.jiayuan.modules.sys.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.sys.entity.SysUserEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

/**
 * @Title: SysUserDao
 * @Package: com.jiayuan.modules.sys.dao
 * @Description: 系统用户
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-25
 */
@Mapper
public interface SysUserDao extends BaseDao<SysUserEntity> {

    /**
     * 用户批量更新
     *
     * @param list
     */
    void batchInsertSysUser(@Param(value = "list") List<SysUserEntity> list);

    Set<String> findExistingEmploymentIds(List<String> employmentIds);
}