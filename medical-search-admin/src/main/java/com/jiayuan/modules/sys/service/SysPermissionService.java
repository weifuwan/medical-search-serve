
package com.jiayuan.modules.sys.service;

import com.jiayuan.common.service.BaseService;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sys.dto.SysPermissionDTO;
import com.jiayuan.modules.sys.entity.SysPermissionEntity;

import java.util.List;


/**
 * 菜单管理
 *
 * @author lijiankui
 */
public interface SysPermissionService extends BaseService<SysPermissionEntity> {

    SysPermissionDTO get(Long id);

    void save(SysPermissionDTO dto);

    void update(SysPermissionDTO dto);

    void delete(Long id);

    /**
     * 菜单列表
     *
     * @param menuType 菜单类型
     */
    List<SysPermissionDTO> getAllMenuList(Integer menuType);

    /**
     * 用户菜单列表
     *
     * @param user     用户
     * @param menuType 菜单类型
     */
    List<SysPermissionDTO> getUserMenuList(UserDetail user, Integer menuType);

    /**
     * 根据父菜单，查询子菜单
     *
     * @param pid 父菜单ID
     */
    List<SysPermissionDTO> getListPid(Long pid);
}
