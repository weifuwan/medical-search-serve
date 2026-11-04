package com.jiayuan.modules.searchv2.modal;

import com.jiayuan.modules.searchv2.component.QueryNode;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NodeQueryVo {
    List<String> result;
    List<QueryNode> queries;


}
