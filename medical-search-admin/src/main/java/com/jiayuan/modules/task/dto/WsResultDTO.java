package com.jiayuan.modules.task.dto;

import lombok.Data;

import java.util.List;

/**
 * @Title: com.jiayuan.modules.task.dto
 * @Package: WsResultDTO
 * @Description: ws返回结果
 * @Author: 李建奎
 * @Date: 创建时间 2024/9/10
 */
@Data
public class WsResultDTO<T> {
    private String result;
    private Integer total;
    private List<T> data;
    private Integer totalPage;
    private Integer pageNo;
    private String typeCode;
}
