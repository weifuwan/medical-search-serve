package com.jiayuan.modules.template.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class TableFieldCodePair {
    private String tableCode;
    private String fieldCode;

    public static TableFieldCodePair of(String tableCode, String fieldCode) {
        TableFieldCodePair pair = new TableFieldCodePair();
        pair.setTableCode(tableCode);
        pair.setFieldCode(fieldCode);
        return pair;
    }
}
