
package com.jiayuan.common.constant;

/**
 * @Title: Constant
 * @Package: com.jiayuan.common.constant
 * @Description: 常量
 * @Author: 李建奎
 * @Date: 创建时间 2022-12-07
 */
public interface Constant {
    /**
     * 成功
     */
    int SUCCESS = 1;
    /**
     * 失败
     */
    int FAIL = 0;
    /**
     * 菜单根节点标识
     */
    Long MENU_ROOT = 0L;
    /**
     * 升序
     */
    String ASC = "asc";
    /**
     * 降序
     */
    String DESC = "desc";
    /**
     * 创建时间字段名
     */
    String CREATE_DATE = "create_date";

    /**
     * 当前页码
     */
    String PAGE = "page";
    /**
     * 每页显示记录数
     */
    String LIMIT = "limit";
    /**
     * 排序字段
     */
    String ORDER_FIELD = "orderField";
    /**
     * 排序方式
     */
    String ORDER = "order";
    /**
     * token header
     */
    String TOKEN_HEADER = "token";

    /**
     * is_deleted
     */
    String IS_DELETED = "is_deleted";

    /**
     * id
     */
    String ID = "id";

    /**
     * 开始时间
     */
    String START_DATE = "startDate";

    /**
     * 结束时间
     */
    String END_DATE = "endDate";
}