
package com.jiayuan.common.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 公共字段，自动填充值
 *
 * @author lijiankui
 */
@Component
public class FieldMetaObjectHandler implements MetaObjectHandler {
    private final static String CREATE_DATE = "createDate";
    private final static String CREATOR = "creator";
    private final static String UPDATE_DATE = "updateDate";
    private final static String UPDATER = "updater";

    private final static String IS_DELETED = "isDeleted";
    private final static String CREATOR_NAME = "creatorName";
    private final static String UPDATER_NAME = "updaterName";

    @Override
    public void insertFill(MetaObject metaObject) {
        UserDetail user = SecurityUser.getUser();
        Date date = new Date();

        //创建者
        strictInsertFill(metaObject, CREATOR, Long.class, user.getUserId());
        //创建时间
        strictInsertFill(metaObject, CREATE_DATE, Date.class, date);
        //更新者
        strictInsertFill(metaObject, UPDATER, Long.class, user.getUserId());
        //更新时间
        strictInsertFill(metaObject, UPDATE_DATE, Date.class, date);
        //创建人姓名
        strictInsertFill(metaObject, CREATOR_NAME, String.class, user.getUserName());
        //更新人姓名
        strictInsertFill(metaObject, UPDATER_NAME, String.class, user.getUserName());
        //逻辑删除标志
        strictInsertFill(metaObject, IS_DELETED, Integer.class, BooleanEnum.FALSE.getCode());
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        final UserDetail user = SecurityUser.getUser();
        //更新者
        strictUpdateFill(metaObject, UPDATER, Long.class, user.getUserId());
        //更新时间
        strictUpdateFill(metaObject, UPDATE_DATE, Date.class, new Date());
        //更新人姓名
        strictInsertFill(metaObject, UPDATER_NAME, String.class, user.getUserName());
    }


}