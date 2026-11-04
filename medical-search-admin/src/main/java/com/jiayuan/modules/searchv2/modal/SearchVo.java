package com.jiayuan.modules.searchv2.modal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchVo {
    List<Map<String, Object>> result;

    List<Map<String, String>> columns;

    int total;

    int pageSize;

    int pageNum;

    String uniqueId;

    NodeQueryVo nodeQueryVo;


}
