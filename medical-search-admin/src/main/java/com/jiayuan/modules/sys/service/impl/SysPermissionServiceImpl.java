
package com.jiayuan.modules.sys.service.impl;

import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.enums.ErrorCode;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.service.impl.BaseServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.utils.TreeUtils;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.sys.dao.SysPermissionDao;
import com.jiayuan.modules.sys.dto.SysPermissionDTO;
import com.jiayuan.modules.sys.entity.SysPermissionEntity;
import com.jiayuan.modules.sys.enums.SuperAdminEnum;
import com.jiayuan.modules.sys.service.SysPermissionService;
import com.jiayuan.modules.sys.service.SysRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class SysPermissionServiceImpl extends BaseServiceImpl<SysPermissionDao, SysPermissionEntity> implements SysPermissionService {
    @Autowired
    private SysRolePermissionService sysRolePermissionService;

    @Override
    public SysPermissionDTO get(Long id) {
        SysPermissionEntity entity = baseDao.getById(id);

        SysPermissionDTO dto = ConvertUtils.sourceToTarget(entity, SysPermissionDTO.class);

        return dto;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(SysPermissionDTO dto) {
        SysPermissionEntity entity = ConvertUtils.sourceToTarget(dto, SysPermissionEntity.class);

        //保存菜单
        insert(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(SysPermissionDTO dto) {
        SysPermissionEntity entity = ConvertUtils.sourceToTarget(dto, SysPermissionEntity.class);

        //上级菜单不能为自身
        if (entity.getPermissionId().equals(entity.getPermissionId())) {
            throw new BizException(ErrorCode.SUPERIOR_MENU_ERROR.getCode());
        }

        //更新菜单
        updateById(entity);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long id) {
        //删除菜单
        deleteById(id);

        //删除角色菜单关系
        sysRolePermissionService.deleteByMenuId(id);
    }

    @Override
    public List<SysPermissionDTO> getAllMenuList(Integer menuType) {
        List<SysPermissionEntity> menuList = baseDao.getMenuList(menuType);

        List<SysPermissionDTO> dtoList = ConvertUtils.sourceToTarget(menuList, SysPermissionDTO.class);

        return TreeUtils.build(dtoList, Constant.MENU_ROOT);
    }

    @Override
    public List<SysPermissionDTO> getUserMenuList(UserDetail user, Integer menuType) {
        List<SysPermissionEntity> menuList;

        //系统管理员，拥有最高权限
        if (Objects.nonNull(user.getSuperAdmin()) && user.getSuperAdmin() == SuperAdminEnum.YES.value()) {
            menuList = baseDao.getMenuList(menuType);
        } else {
            menuList = baseDao.getUserMenuList(user.getUserId(), menuType);
        }
        menuList.removeIf(Objects::isNull);

        // 过滤
        List<SysPermissionEntity> filterd = menuList.stream()
                .filter(item -> item.getDescription() != null).collect(Collectors.toList());

//        List<SysPermissionDTO> dtoList = ConvertUtils.sourceToTarget(menuList, SysPermissionDTO.class);
        List<SysPermissionDTO> dtoList = filterd.stream().map(item -> {
            SysPermissionDTO sysPermissionDTO = new SysPermissionDTO();
            sysPermissionDTO.setId(item.getPermissionId());
            sysPermissionDTO.setName(item.getPermissionName());
            String[] parts = item.getDescription().split("\\|", -1);

            // 提取各部分
            String url = parts.length > 0 ? parts[0] : "";
            String permissions = parts.length > 1 ? parts[1] : "";
            String icon = parts.length > 2 ? parts[2] : "";
            String sort = parts.length > 3 ? parts[3] : "";

            sysPermissionDTO.setUrl(url);
            sysPermissionDTO.setPermissions(permissions);
            sysPermissionDTO.setIcon(icon);
            sysPermissionDTO.setSort(Integer.valueOf(sort));

            sysPermissionDTO.setPid(item.getParentId());

//            System.out.println(sysPermissionDTO);
            return sysPermissionDTO;
        }).sorted(Comparator.comparingInt(SysPermissionDTO::getSort)).collect(Collectors.toList());

        return TreeUtils.build(dtoList, Constant.MENU_ROOT);
    }

    @Override
    public List<SysPermissionDTO> getListPid(Long pid) {
        List<SysPermissionEntity> menuList = baseDao.getListPid(pid);

        return ConvertUtils.sourceToTarget(menuList, SysPermissionDTO.class);
    }

}