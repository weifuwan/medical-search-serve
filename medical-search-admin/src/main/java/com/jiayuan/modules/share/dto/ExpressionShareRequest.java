package com.jiayuan.modules.share.dto;

import lombok.Data;
import java.util.List;

/** A search condition only: never contains patient records or result snapshots. */
@Data
public class ExpressionShareRequest {
    private String title;
    private String expression;
    /** USERS or HOSPITAL. Public anonymous links are intentionally unsupported. */
    private String scope;
    /** READ or EDIT. */
    private String permission;
    private Integer expiresInDays;
    private Integer version;
    private List<Long> userIds;
}
