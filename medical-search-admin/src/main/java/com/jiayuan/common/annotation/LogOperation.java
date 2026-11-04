
package com.jiayuan.common.annotation;

import java.lang.annotation.*;

/**
 * 操作日志注解
 *
 * @author lijiankui
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface LogOperation {

    String value() default "";
}
