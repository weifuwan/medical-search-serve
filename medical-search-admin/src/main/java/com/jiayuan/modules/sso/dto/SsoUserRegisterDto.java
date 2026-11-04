package com.jiayuan.modules.sso.dto;

import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * @Title: com.jiayuan.modules.sso.dto
 * @Package: SsoUserRegisterDto
 * @Description: 单点登录用户注册Dto
 * @Author: 李建奎
 * @Date: 创建时间 2024/8/22
 */
@Data
@Builder
public class SsoUserRegisterDto implements Serializable {


    private static final long serialVersionUID = 7203881023967428029L;

/**
 *     {
 *         "userId":"用户工号", 必填
 *         "userName":"姓名", 必填
 *         "certificate":"凭证", 必填
 *         "deleteFlag":"删除标志(0未删 1删除)",
 *             "groupCode":"集团编码",
 *             "orgCode":"组织编码",
 *             "remark":"备注",
 *             "systemId":"系统编码", 必填
 *         "type":"类型 NEW新增；UPDATE更新", 必填
 *         "gender":"性别-M(男)F(女)",
 *             "idCard":"身份证"
 *     }
 */

    /**
     * 用户工号,必填
     */
    private String userId;

    /**
     * 姓名,必填
     */
    private String userName;

    /**
     * 凭证,必填
     */
    private String certificate;

    /**
     * 删除标志(0未删 1删除)
     */
    private String deleteFlag;

    /**
     * 集团编码
     */
    private String groupCode;

    /**
     * 组织编码
     */
    private String orgCode;

    /**
     * 备注
     */
    private String remark;

    /**
     * 系统编码,必填
     */
    private String systemId;

    /**
     * 类型 NEW新增；UPDATE更新,必填
     */
    private String type;

    /**
     * 性别-M(男)F(女)
     */
    private String gender;

    /**
     * 身份证
     */
    private String idCard;


}
