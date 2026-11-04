package com.jiayuan.common.constant;

import com.jiayuan.common.enums.BaseEnum;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.regex.Pattern;
import java.util.stream.Stream;

/**
 * @Title: Symbol
 * @Package: com.jiayuan.common.constant
 * @Description: 符号常量
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/14
 */
public class Symbol {


    @AllArgsConstructor
    @Getter
    public enum DataTypeEnum {

        TEXT("text", "文本类型"),
        DATETIME("datetime", "日期类型"),
        LONG("long", "long类型");

        /**
         * 编码
         */
        private final String code;

        /**
         * 名称
         */
        private final String name;
    }

    /**
     * 关系符号
     */
    @AllArgsConstructor
    @Getter
    public enum RelationalEnum implements BaseEnum<RelationalEnum, Integer> {
        EQ(0, "=", "^[\"].*|.*[\"]$", "等于"),
        NE(1, "!=", "", "不等于"),
        GT(2, ">", "", "大于"),
        GE(3, ">=", "", "大于等于"),
        LT(4, "<", "", "小于"),
        LE(5, "<=", "", "小于等于"),
        PREFIX(6, "PREFIX", "", "前缀"),
        IS_NOT_NULL(7, "IS NOT NULL", "非空", "非空"),
        LIKE(10, "LIKE", "^[*].*|.*[*]$", "包含"),
        BETWEEN(11, "BETWEEN", "", "介于"),
        NOT_CONTAIN(12, "<>", "", "不包含");

        /**
         * 编码
         */
        private final Integer code;

        /**
         * 名称
         */
        private final String name;

        /**
         * 正则
         */
        private final String regex;

        /**
         * 描述
         */
        private final String desc;

        public static RelationalEnum getByRegex(String value) {
            return Stream.of(values())
                    .filter(enumValue ->!enumValue.getRegex().isEmpty() && Pattern.matches(enumValue.getRegex(), value))
                    .findFirst()
                    .orElseGet(() -> Stream.of(values())
                            .filter(enumValue -> enumValue.getName().equals(value))
                            .findFirst()
                            .orElse(null));
        }

    }

    /**
     * 逻辑符号
     */
    @AllArgsConstructor
    @Getter
    public enum LogicEnum implements BaseEnum<LogicEnum, Integer> {
        AND(0, "AND", "并且"),
        OR(1, "OR", "或者");

        /**
         * 编码
         */
        private final Integer code;

        /**
         * 名称
         */
        private final String name;

        /**
         * 描述
         */
        private final String desc;
    }

    @AllArgsConstructor
    @Getter
    public enum Type {
        /**
         * 数据前缀
         */
        DATA_PREFIX("(.*)\\[(.*)\\.(.*)\\]"),
        /**
         * 数据后缀
         */
        DATA_SUFFIX("\\[(.*)\\.(.*)\\](>=|<=|<>|!=|>|<|=|BETWEEN)(.*)"),
        /**
         * 逻辑
         */
        LOGIC("\\(|\\)|and|AND|or|OR"),
        /**
         * 不确定的表达式 年龄>8 这种
         */
        NOT_SURE_EX("([^\\[\\]]+)(>=|<=|<>|!=|>|<|=)(.*)"),

//        /**
//         * 单纯就数据 男、上呼吸道感染、胃炎，不能包含符号
//         */
//        DATA_SINGLE("[\\u4E00-\\u9FA5]+");
//
//
//        // 匹配中文和英文字母
//        DATA_SINGLE("[\\u4E00-\\u9FA5a-zA-Z]+");

        // 或者更宽泛的，匹配中文、英文、数字
        DATA_SINGLE("[\\u4E00-\\u9FA5a-zA-Z0-9]+");

        /**
         * 正则
         */
        private String regex;
    }
}
