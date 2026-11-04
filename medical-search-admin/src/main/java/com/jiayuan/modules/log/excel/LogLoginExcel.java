
package com.jiayuan.modules.log.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
import lombok.Data;

/**
 * 登录日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Data
public class LogLoginExcel {
    @Excel(name = "主键id")
    private Integer id;
    @Excel(name = "用户名称")
    private String username;
    @Excel(name = "登录id即 sys_user表内的登录用户id字段")
    private Integer loginId;
    @Excel(name = "用户id")
    private Integer userId;
    @Excel(name = "系统id")
    private Integer sysId;
    @Excel(name = "登录ip地址")
    private String ip;

}
