package com.jiayuan.modules.sys.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

/**
 * 系统配置表
 *
 * @author lijiankui
 * @since 1.0.0 2023-11-22
 */
@Data
@TableName("sys_config")
public class SysConfigEntity {

    /**
     * ID
     */
    private Integer id;
    /**
     * 模块ID
     */
    private String moduleId;
    /**
     * 配置编码
     */
    private String configCode;
    /**
     * 配置名称
     */
    private String configName;
    /**
     * 配置说明
     */
    private String description;
    /**
     * 属性值
     */
    private String configValue;
    /**
     * 配置类型 1：文本 2：布尔值 3：数字 4：日期
     */
    private String configType;
    /**
     * 排序
     */
    private Integer sortCode;
    /**
     * 删除标志 0：否 1：是
     */
    private String deletedFlag;
    /**
     * 创建人
     */
    private String createBy;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改人
     */
    private String updateBy;
    /**
     * 修改时间
     */
    private Date updateTime;
    /**
     * 系统ID
     */
    private String sysId;
    /**
     * 界面是否展示 Y：是 N：否
     */
    private String webShow;
    /**
     * 模块名称
     */
    private String moduleName;
}