package com.jiayuan.common.annotation;

import java.lang.annotation.*;

/**
 * 标注导出方法
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface ExportOperation {
}
