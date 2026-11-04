
package com.jiayuan.modules.sys.service;


import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.BaseService;
import com.jiayuan.modules.sys.dto.SysRoleDTO;
import com.jiayuan.modules.sys.entity.SysRoleEntity;

import java.util.List;
import java.util.Map;


/**
 * 角色
 *
 * @author lijiankui
 */
public interface SysRoleService extends BaseService<SysRoleEntity> {

    PageData<SysRoleDTO> page(Map<String, Object> params);

    List<SysRoleDTO> list(Map<String, Object> params);

    SysRoleDTO get(Long id);

    void save(SysRoleDTO dto);

    void update(SysRoleDTO dto);

    void delete(Long[] ids);

}
