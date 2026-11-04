
package com.jiayuan.modules.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.impl.BaseServiceImpl;
import com.jiayuan.modules.sys.dao.SysRoleDao;
import com.jiayuan.modules.sys.dto.SysRoleDTO;
import com.jiayuan.modules.sys.entity.SysRoleEntity;
import com.jiayuan.modules.sys.service.SysRolePermissionService;
import com.jiayuan.modules.sys.service.SysRoleService;
import com.jiayuan.modules.sys.service.SysUserRoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 角色
 *
 * @author lijiankui
 */
@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRoleDao, SysRoleEntity> implements SysRoleService {
    @Autowired
    private SysRolePermissionService sysRolePermissionService;
    @Autowired
    private SysUserRoleService sysUserRoleService;


    @Override
    public PageData<SysRoleDTO> page(Map<String, Object> params) {
        IPage<SysRoleEntity> page = baseDao.selectPage(
                getPage(params, "ROLE_ID", false),
                getWrapper(params).eq("SYS_ID", "CBDSES")
        );

        List<SysRoleDTO> dtoList = page.getRecords().stream()
                .map(entity -> {
                    SysRoleDTO dto = new SysRoleDTO();
                    dto.setId(entity.getRoleId());
                    dto.setName(entity.getRoleName());
                    dto.setCreateDate(entity.getOperationTime());
                    return dto;
                })
                .collect(Collectors.toList());

        PageData<SysRoleDTO> pageData = new PageData<>();
        pageData.setList(dtoList);
        pageData.setTotal((int) page.getTotal());

        return pageData;
//        return getPageData(page, SysRoleDTO.class);
    }

    @Override
    public List<SysRoleDTO> list(Map<String, Object> params) {
        List<SysRoleEntity> entityList = baseDao.selectList(getWrapper(params).eq("SYS_ID", "CBDSES"));

        List<SysRoleDTO> sysRoleDTOS = entityList.stream().map(entity -> {
            SysRoleDTO sysRoleDTO = new SysRoleDTO();
            sysRoleDTO.setId(entity.getRoleId());
            sysRoleDTO.setName(entity.getRoleName());
            sysRoleDTO.setCreateDate(entity.getOperationTime());

            return sysRoleDTO;
        }).collect(Collectors.toList());

        return sysRoleDTOS;

//        return ConvertUtils.sourceToTarget(entityList, SysRoleDTO.class);
    }

    private QueryWrapper<SysRoleEntity> getWrapper(Map<String, Object> params) {
        String name = (String) params.get("name");

        QueryWrapper<SysRoleEntity> wrapper = new QueryWrapper<>();
        wrapper.like(StringUtils.isNotBlank(name), "role_name", name);

        return wrapper;
    }

    @Override
    public SysRoleDTO get(Long id) {
        SysRoleEntity entity = baseDao.selectById(id);
        SysRoleDTO sysRoleDTO = new SysRoleDTO();
        sysRoleDTO.setId(entity.getRoleId());
        sysRoleDTO.setName(entity.getRoleName());

        return sysRoleDTO;
//        return ConvertUtils.sourceToTarget(entity, SysRoleDTO.class);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(SysRoleDTO dto) {
//        SysRoleEntity entity = ConvertUtils.sourceToTarget(dto, SysRoleEntity.class);
        // 检查角色名是否已存在
        SysRoleEntity existing = baseDao.selectOne(new QueryWrapper<SysRoleEntity>()
                .eq("role_name", dto.getName()).eq("sys_id", "CBDSES"));
        if (existing != null) {
            throw new BizException("角色名已存在，请更换角色名");
        }


        SysRoleEntity entity = new SysRoleEntity();
        entity.setRoleName(dto.getName());
        entity.setRoleId(IdWorker.getId());
        entity.setOperationTime(new Date());
        entity.setSysId("CBDSES");

        //保存角色
        insert(entity);

        //保存角色菜单关系
        sysRolePermissionService.saveOrUpdate(entity.getRoleId(), dto.getMenuIdList());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void update(SysRoleDTO dto) {

        SysRoleEntity entity = new SysRoleEntity();
        entity.setRoleId(dto.getId());
        entity.setRoleName(dto.getName());
        entity.setOperationTime(new Date());

//        SysRoleEntity entity = ConvertUtils.sourceToTarget(dto, SysRoleEntity.class);

        //更新角色
        updateById(entity);

        //更新角色菜单关系
        sysRolePermissionService.saveOrUpdate(entity.getRoleId(), dto.getMenuIdList());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void delete(Long[] ids) {
        //删除角色
        baseDao.deleteBatchIds(Arrays.asList(ids));

        //删除角色用户关系
        sysUserRoleService.deleteByRoleIds(ids);

        //删除角色菜单关系
        sysRolePermissionService.deleteByRoleIds(ids);
    }

}