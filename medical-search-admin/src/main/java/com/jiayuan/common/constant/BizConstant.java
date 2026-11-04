package com.jiayuan.common.constant;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.nio.file.FileSystems;

/**
 * @Title: Constant
 * @Package: com.jiayuan.common.constant
 * @Description: 业务常量
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/14
 */
public class BizConstant {

    /**
     * 默认热门获取最新获取记录数
     */
    public final static int TOP = 20;
    /**
     * 资源映射路径 前缀
     */
    public static final String RESOURCE_PREFIX = FileSystems.getDefault().getSeparator() + "profile";

    /**
     * 字段常量
     */
    public enum Filed {
        type, amount;
    }

    /**
     * 模板使用范围
     */
    @AllArgsConstructor
    @Getter
    public enum UseScope {

        ALL(0, "全院"),
        PERSONAL(1, "个人");
        /**
         * 编码
         */
        private final Integer code;

        /**
         * 名称
         */
        private final String name;
    }

    /**
     * 检索维度
     */
    @AllArgsConstructor
    @Getter
    public enum Dimension {

        PERSON_TIMES(0, "人次"),
        PERSON(1, "人");
        /**
         * 编码
         */
        private final Integer code;

        /**
         * 名称
         */
        private final String name;
    }

    /**
     * 参数类型
     */
    @AllArgsConstructor
    @Getter
    public enum ParamType {

        SYSTEM(0, "系统参数"),
        NON_SYSTEM(1, "非系统参数");
        /**
         * 编码
         */
        private final Integer code;

        /**
         * 名称
         */
        private final String name;
    }

    /**
     * 导出类型
     */
    @AllArgsConstructor
    @Getter
    public enum ExportType {

        BASE(0, "基本导出"),
        HIGH(1, "高级导出");
        /**
         * 编码
         */
        private final Integer code;

        /**
         * 名称
         */
        private final String name;
    }


    @AllArgsConstructor
    @Getter
    public enum KeywordType {

        DEFAULT(0, "默认"),
        REGEX(1, "正则"),
        DICT(2, "字典");
        /**
         * 编码
         */
        private final Integer code;

        /**
         * 名称
         */
        private final String name;
    }
}
