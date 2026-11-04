package com.jiayuan.modules.security.password;

import java.util.regex.Pattern;

/**
 * 密码工具类
 *
 * @author lijiankui
 * @since 1.0.0
 */
public class PasswordUtils {
    private static PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    /**
     * 数字
     */
    public static final String REG_NUMBER = ".*\\d+.*";
    /**
     * 小写字母
     */
    public static final String REG_UPPERCASE = ".*[A-Z]+.*";
    /**
     * 大写字母
     */
    public static final String REG_LOWERCASE = ".*[a-z]+.*";
    /**
     * 特殊符号(~!@#$%^&*()_+|<>,.?/:;'[]{}\)
     */
    public static final String REG_SYMBOL = ".*[~!@#$%^&*()_+|<>,.?/:;'\\[\\]{}\"]+.*";
    /**
     * 加密
     *
     * @param str 字符串
     * @return 返回加密字符串
     */
    public static String encode(String str) {
        return passwordEncoder.encode(str);
    }




    /**
     * 比较密码是否相等
     *
     * @param str      明文密码
     * @param password 加密后密码
     * @return true：成功    false：失败
     */
    public static boolean matches(String str, String password) {
        return passwordEncoder.matches(str, password);
    }



    /**
     * 1) 长度 8-20 位，必须包括大写字母、小写字母、数字、特殊符号中的4种
     * 2) 密码不能包含用户名
     *
     * @param password 密码
     * @param username 用户名
     * @return 结果
     */
    public static boolean checkPasswordRuleHigh(String password, String username) {
        //密码为空及长度大于8位小于30位判断
        if (password == null || password.length() < 8 || password.length() > 30) {
            return false;
        }
        int i = 0;
        if (password.matches(REG_NUMBER)) {
            i++;
        }
        if (password.matches(REG_LOWERCASE)) {
            i++;
        }
        if (password.matches(REG_UPPERCASE)) {
            i++;
        }
        if (password.matches(REG_SYMBOL)) {
            i++;
        }
        boolean contains = password.equals(username) || password.contains(username);
        //此处可以判定包含几种强密码为4
        if (i < 4 || contains) {
            return false;
        }
        return true;
    }

    /**
     * 检查登录密码是否符合要求：密码长度限制必须在8—20之间，不能是纯数字或字母
     *
     * @param password 传入的密码
     * @return 检查结果，符合要求true，不符合false
     */
    public static boolean checkPassword(String password) {
        int length = password.length();
        if (length < 8 || length > 20) {
            return false;
        }
        Pattern pattern = Pattern.compile("^[A-Za-z]+$");
        if (pattern.matcher(password).matches()) {
            return false;
        }
        pattern = Pattern.compile("^[0-9]+$");
        if (pattern.matcher(password).matches()) {
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        String encode = PasswordUtils.encode("qjcdebug");
        System.out.println("encode = " + encode);
    }
}
