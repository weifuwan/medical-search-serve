
package com.jiayuan.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

/**
 * 角色用户关系
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("sys_user_role")
public class SysUserRoleEntity {
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
     * 用户角色ID
     */
    @TableId("USER_ROLE_ID")
    private Long userRoleId;

    /**
     * 用户ID
     */
    @TableField("USER_ID")
    private Long userId;

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

    /**
     * 操作时间
     */
    @TableField("OPERATION_TIME")
    private Date operationTime;

}
