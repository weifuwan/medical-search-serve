
package com.jiayuan.modules.sys.dao;

import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.sys.dto.KeyValueDTO;
import com.jiayuan.modules.sys.entity.SysUserRoleEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 角色用户关系
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Mapper
public interface SysUserRoleDao extends BaseDao<SysUserRoleEntity> {

    /**
     * 根据角色ids，删除角色用户关系
     *
     * @param roleIds 角色ids
     */
    void deleteByRoleIds(Long[] roleIds);

    /**
     * 根据用户id，删除角色用户关系
     *
     * @param userIds 用户ids
     */
    void deleteByUserIds(Long[] userIds);

    /**
     * 角色ID列表
     *
     * @param userId 用户ID
     * @return
     */
    List<KeyValueDTO> getRoleList(Long userId);
}