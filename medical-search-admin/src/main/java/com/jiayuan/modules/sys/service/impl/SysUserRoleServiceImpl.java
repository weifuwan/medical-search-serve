
package com.jiayuan.modules.sys.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.jiayuan.common.service.impl.BaseServiceImpl;
import com.jiayuan.modules.sys.dao.SysUserRoleDao;
import com.jiayuan.modules.sys.dto.KeyValueDTO;
import com.jiayuan.modules.sys.entity.SysUserRoleEntity;
import com.jiayuan.modules.sys.service.SysUserRoleService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 角色用户关系
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Service
public class SysUserRoleServiceImpl extends BaseServiceImpl<SysUserRoleDao, SysUserRoleEntity> implements SysUserRoleService {

    @Override
    public void saveOrUpdate(Long userId, List<Long> roleList) {
        //先删除角色用户关系
        deleteByUserIds(new Long[]{userId});

        //用户没有一个角色权限的情况
        if (CollUtil.isEmpty(roleList)) {
            return;
        }

        //保存角色用户关系
        for (Long roleId : roleList) {
            SysUserRoleEntity sysUserRoleEntity = new SysUserRoleEntity();
            sysUserRoleEntity.setUserId(userId);
            sysUserRoleEntity.setRoleId(roleId);
            sysUserRoleEntity.setSysId("CBDSES");

            //保存
            insert(sysUserRoleEntity);
        }
    }

    @Override
    public void deleteByRoleIds(Long[] roleIds) {
        baseDao.deleteByRoleIds(roleIds);
    }

    @Override
    public void deleteByUserIds(Long[] userIds) {
        baseDao.deleteByUserIds(userIds);
    }

    @Override
    public List<KeyValueDTO> getRoleList(Long userId) {

        return baseDao.getRoleList(userId);
    }
}