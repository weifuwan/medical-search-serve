
package com.jiayuan.modules.sys.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.jiayuan.common.service.impl.BaseServiceImpl;
import com.jiayuan.modules.sys.dao.SysRolePermissionDao;
import com.jiayuan.modules.sys.entity.SysRolePermissionEntity;
import com.jiayuan.modules.sys.service.SysRolePermissionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * 角色与菜单对应关系
 *
 * @author lijiankui
 */
@Service
public class SysRolePermissionServiceImpl extends BaseServiceImpl<SysRolePermissionDao, SysRolePermissionEntity> implements SysRolePermissionService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveOrUpdate(Long roleId, List<Long> menuIdList) {
        //先删除角色菜单关系
        deleteByRoleIds(new Long[]{roleId});

        //角色没有一个菜单权限的情况
        if (CollUtil.isEmpty(menuIdList)) {
            return;
        }

        //保存角色菜单关系
        for (Long menuId : menuIdList) {
            SysRolePermissionEntity sysRolePermissionEntity = new SysRolePermissionEntity();
            sysRolePermissionEntity.setPermissionId(menuId);
            sysRolePermissionEntity.setRoleId(roleId);
            sysRolePermissionEntity.setSysId("CBDSES");

            //保存
            insert(sysRolePermissionEntity);
        }
    }

    @Override
    public List<Long> getMenuIdList(Long roleId) {
        return baseDao.getMenuIdList(roleId);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByRoleIds(Long[] roleIds) {
        baseDao.deleteByRoleIds(roleIds);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteByMenuId(Long menuId) {
        baseDao.deleteByMenuId(menuId);
    }

}