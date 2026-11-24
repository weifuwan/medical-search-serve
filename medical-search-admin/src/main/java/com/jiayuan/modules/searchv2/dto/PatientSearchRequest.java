package com.jiayuan.modules.searchv2.dto;

import com.jiayuan.modules.search.request.SearchSortDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

/** Request shared by patient count and patient list endpoints. */
@Data
@ApiModel("患者范围检索请求")
public class PatientSearchRequest implements Serializable {

    private static final long serialVersionUID = 1L;

    @NotBlank(message = "检索表达式不能为空")
    @ApiModelProperty(value = "检索表达式；纯关键词自动走 KEYWORD 模式", required = true, example = "糖尿病")
    private String expression;

    @ApiModelProperty(value = "仅针对 ms_visit_record 的筛选条件")
    private List<PatientFilterDTO> filters;

    @ApiModelProperty(value = "返回字段编码；为空时使用就诊主表已配置的展示字段")
    private List<String> fieldCodes;

    @ApiModelProperty(value = "排序规则，最多 5 个字段")
    private List<SearchSortDTO> sorts;

    @ApiModelProperty(value = "页码，从 1 开始")
    private Integer pageNum = 1;

    @ApiModelProperty(value = "每页数量，最大 200")
    private Integer pageSize = 10;
}
