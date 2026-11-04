package com.jiayuan.modules.search.request;

import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.constant.Symbol;
import com.jiayuan.common.enums.EnumList;
import com.jiayuan.modules.template.dto.FieldDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

/**
 * @Title: SearchRequest
 * @Package: com.jiayuan.modules.search.dto
 * @Description: 检索参数
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/17
 */
@ApiModel(value = "检索参数")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SearchRequest implements Serializable, Cloneable {

    private static final long serialVersionUID = -957732227875038240L;

    @NotBlank(message = "检索表达式不能为空")
    @ApiModelProperty(value = "检索表达式")
    private String expression;

    @EnumList(value = BizConstant.Dimension.class, message = "检索维度不合法")
    @ApiModelProperty(value = "检索维度")
    private Integer dimension;

    @ApiModelProperty(value = "显示字段列表")
    private List<FieldDTO> columnList;

    @ApiModelProperty(value = "当前页码")
    private Integer page;

    @ApiModelProperty(value = "每页显示记录数")
    private Integer size;

    @ApiModelProperty(value = "排序表编码")
    private String orderTableCode;

    @ApiModelProperty(value = "排序字段编码")
    private String orderFieldCode;

    @ApiModelProperty(value = "排序方式")
    private String orderMode;

    @ApiModelProperty(value = "是否需要高亮", hidden = true)
    private Boolean highlight = false;

    @ApiModelProperty(value = "是否优化", hidden = true)
    private Boolean isOptimized = false;

    @ApiModelProperty(value = "ES BATCH SIZE", hidden = true)
    private int esBatchSize = 40;

    @ApiModelProperty(value = "is export", hidden = true)
    private boolean export = false;


    @ApiModelProperty(value = "排序字段", hidden = true)
    private FieldDTO orderField;

    @Override
    public SearchRequest clone() {
        try {
            SearchRequest clone = (SearchRequest) super.clone();
            // TODO: 复制此处的可变状态，这样此克隆就不能更改初始克隆的内部项
            return clone;
        } catch (CloneNotSupportedException e) {
            throw new AssertionError();
        }
    }
}
