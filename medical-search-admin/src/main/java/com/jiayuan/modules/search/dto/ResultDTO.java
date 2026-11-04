package com.jiayuan.modules.search.dto;

import com.jiayuan.common.page.PageData;
import com.jiayuan.modules.template.dto.FieldDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Title: ResultVO
 * @Package: com.jiayuan.modules.search.vo
 * @Description: 检索返回结果
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/1
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ApiModel("检索结果")
public class ResultDTO {

    @ApiModelProperty(value = "表头集合")
    private List<FieldDTO> columnList;

    @ApiModelProperty(value = "分页数据")
    private PageData pageData;
}
