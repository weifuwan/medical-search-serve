package com.jiayuan.common.enums;

import com.jiayuan.common.validator.EnumListValidator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

/**
 * @Title: EnumList
 * @Package: com.jiayuan.common.enums
 * @Description: 枚举列表校验注解
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/17
 */

@Target({ElementType.FIELD, ElementType.METHOD, ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {EnumListValidator.class})
@Documented
public @interface EnumList {
    /**
     * 枚举的类型
     */
    Class<?> value();

    /**
     * 错误消息
     *
     * @return
     */
    String message();

    /**
     * 获取枚举值的方法
     */
    String method() default "getCode";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
