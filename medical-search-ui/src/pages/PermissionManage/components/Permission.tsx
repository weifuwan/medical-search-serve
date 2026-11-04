import React, { useState } from 'react'
import RcResizeObserver from 'rc-resize-observer'
import { ProCard } from '@ant-design/pro-components';
import { Tree } from 'antd';
import type { DataNode } from 'antd/es/tree';

const treeDataPeople: DataNode[] = [
    {
        title: '全部',
        key: '1',
        children: [
            {
                title: '张三',
                key: '1-1',
            },
            {
                title: '李四',
                key: '1-2',
            },
            {
                title: '王二',
                key: '1-3',
            },
        ],
    },
]
const treeDataPermission: DataNode[] = [
    {
        title: '数据保存',
        key: '1',
        children: [
            { title: '回收站', key: '1-1', },
            { title: '导出记录', key: '1-2', },
            { title: '检索列表', key: '1-3', },
        ],
    },
    {
        title: '检索模版',
        key: '2',
        children: [
            { title: '新增', key: '2-1' },
            { title: '查看', key: '2-2' },
            { title: '修改', key: '3-3' },
        ],
    },
    {
        title: '统计管理',
        key: '3',
    },
]
const Permission: React.FC = () => {
    const [responsive, setResponsive] = useState(false);
    const [checkedKeys, setCheckedKeys] = useState<React.Key[]>([])
    const [selectedKeys, setSelectedKeys] = useState<React.Key[]>([])

    const onCheck = (checkedKeysValue: any) => {
        console.log('onCheck', checkedKeysValue)
        setCheckedKeys(checkedKeysValue)
    }

    const onSelect = (selectedKeysValue: React.Key[], info: any) => {
        console.log('onSelect', info)
        setSelectedKeys(selectedKeysValue)
    }
    return (
        <RcResizeObserver
            key="resize-observer"
            onResize={(offset) => {
                setResponsive(offset.width < 596);
            }}
        >
            <ProCard
                split={responsive ? 'horizontal' : 'vertical'}
            >
                <ProCard colSpan="20%">
                    <Tree
                        checkable
                        defaultExpandAll
                        onCheck={onCheck}
                        checkedKeys={checkedKeys}
                        onSelect={onSelect}
                        selectedKeys={selectedKeys}
                        treeData={treeDataPeople}
                    />
                </ProCard>
                <ProCard >
                    <Tree
                        checkable
                        defaultExpandAll
                        onCheck={onCheck}
                        checkedKeys={checkedKeys}
                        onSelect={onSelect}
                        selectedKeys={selectedKeys}
                        treeData={treeDataPermission}
                    />
                </ProCard>
            </ProCard>
        </RcResizeObserver>
    )
}

export default Permission;