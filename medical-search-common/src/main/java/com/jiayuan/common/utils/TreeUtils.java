
package com.jiayuan.common.utils;

import cn.hutool.core.collection.CollectionUtil;
import com.jiayuan.common.validator.AssertUtils;

import java.util.*;

/**
 * @Title: TreeUtils
 * @Package: com.jiayuan.common.utils
 * @Description: 树形结构工具类
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-04
 */
public class TreeUtils {

    /**
     * 根据pid，构建树节点
     */
    public static <T extends TreeNode> List<T> build(List<T> treeNodes, Long pid) {
        //pid不能为空
        AssertUtils.isNull(pid, "pid");

        List<T> treeList = new ArrayList<>();
        if (CollectionUtil.isNotEmpty(treeNodes)) {
            treeNodes.removeIf(Objects::isNull);
            for (T treeNode : treeNodes) {
                if (pid.equals(treeNode.getPid())) {
                    treeList.add(findChildren(treeNodes, treeNode));
                }
            }
        }


        return treeList;
    }

    /**
     * 查找子节点
     */
    private static <T extends TreeNode> T findChildren(List<T> treeNodes, T rootNode) {
        for (T treeNode : treeNodes) {
            if (rootNode.getId().equals(treeNode.getPid())) {
                rootNode.getChildren().add(findChildren(treeNodes, treeNode));
            }
        }
        return rootNode;
    }

    /**
     * 构建树节点
     */
    public static <T extends TreeNode> List<T> build(List<T> treeNodes) {
        List<T> result = new ArrayList<>();

        //list转map
        Map<Long, T> nodeMap = new LinkedHashMap<>(treeNodes.size());
        for (T treeNode : treeNodes) {
            nodeMap.put(treeNode.getId(), treeNode);
        }

        for (T node : nodeMap.values()) {
            T parent = nodeMap.get(node.getPid());
            if (parent != null && !(node.getId().equals(parent.getId()))) {
                parent.getChildren().add(node);
                continue;
            }

            result.add(node);
        }

        return result;
    }

}