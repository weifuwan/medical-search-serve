
package com.jiayuan.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 角色菜单关系
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_role_permission")
public class SysRolePermissionEntity {
    private static final long serialVersionUID = 1L;
    /**
     * 集团编码
     */
    @TableField("GROUP_CODE")
    private String groupCode;

    /**
     * 组织编码
     */
    @TableField("ORGANIZATION_CODE")
    private String organizationCode;

    /**
     * 权限角色ID
     */
    @TableId("ROLE_PERMISSION_ID")
    private Long rolePermissionId;

    /**
     * 权限ID
     */
    @TableField("PERMISSION_ID")
    private Long permissionId;

    /**
     * 角色ID
     */
    @TableField("ROLE_ID")
    private Long roleId;

    /**
     * 系统ID
     */
    @TableField("SYS_ID")
    private String sysId;

}
