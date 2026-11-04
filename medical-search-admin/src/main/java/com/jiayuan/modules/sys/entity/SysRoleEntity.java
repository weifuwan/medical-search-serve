
package com.jiayuan.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 角色
 *
 * @author lijiankui
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_role")
public class SysRoleEntity {
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
     * 角色ID
     */
    @TableId("ROLE_ID")
    private Long roleId;

    /**
     * 角色名称
     */
    @TableField("ROLE_NAME")
    private String roleName;

    /**
     * 系统ID
     */
    @TableField("SYS_ID")
    private String sysId;

    /**
     * 描述
     */
    @TableField("DESCRIPTION")
    private String description;

    /**
     * 角色编码
     */
    @TableField("ROLE_CODE")
    private String roleCode;

    /**
     * 删除标志 0否 1是
     */
    @TableField("DELETE_FLAG")
    private String deleteFlag = "0";

    /**
     * 操作时间
     */
    @TableField(value = "OPERATION_TIME", fill = FieldFill.INSERT_UPDATE)
    private Date operationTime;
}
