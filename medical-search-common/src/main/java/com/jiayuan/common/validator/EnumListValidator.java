package com.jiayuan.common.validator;

import com.jiayuan.common.enums.EnumList;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * @Title: EnumListValidator
 * @Package: com.jiayuan.common.validator
 * @Description: 枚举类型校验器
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/17
 */
public class EnumListValidator implements ConstraintValidator<EnumList, Object> {

    /**
     * 枚举的值
     */
    private final List<Object> values = new ArrayList();

    @Override
    public boolean isValid(Object s, ConstraintValidatorContext constraintValidatorContext) {
        return null == s || values.contains(s);
    }

    @Override
    public void initialize(EnumList constraintAnnotation) {
        Class<?> enumClazz = constraintAnnotation.value();
        Object[] enumConstants = enumClazz.getEnumConstants();
        if (null == enumConstants) {
            return;
        }
        Method method;
        try {
            method = enumClazz.getMethod(constraintAnnotation.method());
        } catch (Exception e) {
            throw new RuntimeException("枚举未找到方法" + constraintAnnotation.method(), e);
        }
        if (null == method) {
            throw new RuntimeException("枚举未找到方法" + constraintAnnotation.method());
        }

        method.setAccessible(true);
        try {
            for (Object enumConstant : enumConstants) {
                values.add(method.invoke(enumConstant));
            }
        } catch (Exception e) {
            throw new RuntimeException("获取枚举值失败", e);
        }
    }
}
