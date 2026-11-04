package com.jiayuan.modules.searchv2.component;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.models.auth.In;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

/**
 * Represents metadata information about a database table field.
 * Contains both technical and display attributes of a field.
 */
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
@ApiModel(description = "Metadata information about a database table field")
public class TableFieldInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "Name of the table")
    String tableName;

    @ApiModelProperty(value = "Code identifier for the table")
    String tableCode;

    @ApiModelProperty(value = "Display name of the field")
    String fieldName;

    @ApiModelProperty(value = "Technical code of the field")
    String fieldCode;

    @ApiModelProperty(value = "Data type of the field")
    String fieldType;

    @ApiModelProperty(value = "Sort of the field")
    Integer sort;

    /**
     * Checks if this field matches the given table and field codes
     *
     * @param tableCode Table code to match
     * @param fieldCode Field code to match
     * @return true if both codes match this field's attributes
     */
    public boolean matches(String tableCode, String fieldCode) {
        return this.tableCode.equals(tableCode) && this.fieldCode.equals(fieldCode);
    }
}
