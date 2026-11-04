
package com.jiayuan.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 菜单管理
 *
 * @author lijiankui
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_permission")
public class SysPermissionEntity {
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
     * 权限ID
     */
    @TableId("PERMISSION_ID")
    private Long permissionId;

    /**
     * 权限名称
     */
    @TableField("PERMISSION_NAME")
    private String permissionName;

    /**
     * 系统ID
     */
    @TableField("SYS_ID")
    private String sysId;

    /**
     * 权限描述
     */
    @TableField("DESCRIPTION")
    private String description;

    /**
     * 父权限ID
     */
    @TableField("PARENT_ID")
    private Long parentId;

}