package com.jiayuan.common.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Title: com.jiayuan.common.enums
 * @Package: MetaCommentType
 * @Description: 导出状态(1导出进行中 ， 2成功 ， 3失败)
 * @Author: 李建奎
 * @Date: 创建时间 2024/8/15
 */
@Getter
@AllArgsConstructor
public enum ExportStatus {

    EXPORTING(1, "导出进行中"),
    SUCCESS(2, "成功"),
    FAIL(3, "失败");

    /**
     * 编码
     */
    @EnumValue
    private final Integer code;

    /**
     * 名称
     */
    @JsonValue
    private final String name;

    /**
     * 获取编码
     *
     * @return
     */
    public Integer code() {
        return code;
    }

    /**
     * 根据code 获取枚举
     *
     * @param code
     * @return
     */
    public static ExportStatus getByCode(Integer code) {
        for (ExportStatus status : ExportStatus.values()) {
            if (status.code.equals(code)) {
                return status;
            }
        }
        return null;
    }
}
