
package com.jiayuan.modules.sys.service;

import com.jiayuan.common.service.BaseService;
import com.jiayuan.modules.sys.dto.KeyValueDTO;
import com.jiayuan.modules.sys.entity.SysUserRoleEntity;

import java.util.List;

/**
 * 角色用户关系
 *
 * @author lijiankui
 * @since 1.0.0
 */
public interface SysUserRoleService extends BaseService<SysUserRoleEntity> {

    /**
     * 保存或修改
     *
     * @param userId   用户ID
     * @param roleList 角色ID列表
     */
    void saveOrUpdate(Long userId, List<Long> roleList);

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
     */
    List<KeyValueDTO> getRoleList(Long userId);
}