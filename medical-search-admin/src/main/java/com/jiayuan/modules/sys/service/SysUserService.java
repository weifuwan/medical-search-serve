
package com.jiayuan.modules.sys.service;

import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.BaseService;
import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.sys.dto.PasswordDTO;
import com.jiayuan.modules.sys.dto.SysUserDTO;
import com.jiayuan.modules.sys.dto.SysUserRoleDTO;
import com.jiayuan.modules.sys.entity.SysUserEntity;
import com.jiayuan.modules.task.dto.Person;

import java.util.List;
import java.util.Map;


/**
 * 系统用户
 *
 * @author lijiankui
 */
public interface SysUserService extends BaseService<SysUserEntity> {

    /**
     * 用户分页
     *
     * @param params
     * @return
     */
    PageData<SysUserDTO> pageOfUser(Map<String, Object> params);

    List<SysUserDTO> list(Map<String, Object> params);

    SysUserDTO get(Long id);

    SysUserDTO getByUsername(String username);

    SysUserDTO getByUserId(String username);

    void save(SysUserRoleDTO dto);

    void update(SysUserRoleDTO dto);

    void delete(Long[] ids);

    /**
     * 修改密码
     *
     * @param id          用户ID
     * @param newPassword 新密码
     */
    void updatePassword(Long id, String newPassword);


    /**
     * 获取指定用户
     *
     * @param id
     * @return
     */
    SysUserEntity getUserById(Long id);


    /**
     * 获取用户列表
     *
     * @param userIds
     * @return
     */
    List<SysUserEntity> list(List<Long> userIds);

    /**
     * 修改密码
     *
     * @param passwordDTO
     * @return
     */
    Result updatePassword(PasswordDTO passwordDTO);

    /**
     * 同步账号
     *
     * @param data
     */
    void syncSysUser(List<Person> data);


    /**
     * 逻辑删除（账号暂停）
     *
     * @param ids
     */
    void deletedSysUserLogicallyBatchIds(Long[] ids);
}
