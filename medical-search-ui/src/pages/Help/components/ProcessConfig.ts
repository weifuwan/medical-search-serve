/**
 * @author 何平
 * @time 2022-11-29
 * @functiion 流程图配置
 */
import Settings from '../../../../config/defaultSettings'

// 主题色配置
const colorPrimary = Settings.colorPrimary

// 节点边配置
const groups = {
    top: {
        position: { name: 'top' },
        attrs: {
            circle: {
                style: { visibility: 'hidden' },
            },
        },
        zIndex: 10,
    },
    right: {
        position: { name: 'right' },
        attrs: {
            circle: {
                style: { visibility: 'hidden' },
            },
        },
        zIndex: 10,
    },
    bottom: {
        position: { name: 'bottom' },
        attrs: {
            circle: {
                style: { visibility: 'hidden' },
            },
        },
        zIndex: 10,
    },
    left: {
        position: { name: 'left' },
        attrs: {
            circle: {
                style: { visibility: 'hidden' },
            },
        },
        zIndex: 10,
    },
}

// 连接线配置
const attrs = [
    // 带箭头实线
    {
        line: {
            stroke: colorPrimary,// 线颜色
            targetMarker: { name: 'block', width: 12, height: 8 },// 箭头大小
            // strokeDasharray: '5 5',// 虚线
            // strokeWidth: 1,// 线粗
        },
    },
    // 无箭头虚线
    {
        line: {
            stroke: colorPrimary,
            targetMarker: { name: 'block', width: 1, height: 1 },
            strokeDasharray: '5 5',
            // strokeWidth: 1,
        },
    },
    // 带箭头虚线
    {
        line: {
            stroke: colorPrimary,
            targetMarker: { name: 'block', width: 12, height: 8 },
            strokeDasharray: '5 5',
            // strokeWidth: 1,
        },
    },
]

const DATA = {
    // 节点配置
    nodes: [
        // 1.开始检索
        {
            id: '1',
            parentId: '',
            renderKey: 'Terminal',
            name: 'start',
            label: '开始检索',
            width: 100,
            height: 50,
            ports: {
                items: [
                    { group: 'top', id: 'start-top' },
                    { group: 'right', id: 'start-right' },
                    { group: 'bottom', id: 'start-bottom' },
                    { group: 'left', id: 'start-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 40,
            y: 30,
            zIndex: 10,
            stroke: colorPrimary,
            // fill: colorPrimary
        },
        // 2.录入检索内容
        {
            id: '2',
            parentId: '',
            renderKey: 'Process',
            name: 'entry',
            label: '录入检索内容',
            width: 100,
            height: 50,
            ports: {
                items: [
                    { group: 'top', id: 'entry-top' },
                    { group: 'right', id: 'entry-right' },
                    { group: 'bottom', id: 'entry-bottom' },
                    { group: 'left', id: 'entry-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 240,
            y: 30,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 2-1 录入检索内容-手动录入
        {
            id: '2-1',
            parentId: '',
            renderKey: 'Process',
            name: 'entry-hand',
            label: '手动录入',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'entry-hand-top' },
                    { group: 'right', id: 'entry-hand-right' },
                    { group: 'bottom', id: 'entry-hand-bottom' },
                    { group: 'left', id: 'entry-hand-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 250,
            y: 150,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 2-2 录入检索内容-模版录入
        {
            id: '2-2',
            parentId: '',
            renderKey: 'Process',
            name: 'entry-template',
            label: '模版录入',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'entry-template-top' },
                    { group: 'right', id: 'entry-template-right' },
                    { group: 'bottom', id: 'entry-template-bottom' },
                    { group: 'left', id: 'entry-template-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 250,
            y: 250,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 2-3 录入检索内容-高级检索
        {
            id: '2-3',
            parentId: '',
            renderKey: 'Process',
            name: 'hight-search',
            label: '高级检索',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'hight-search-top' },
                    { group: 'right', id: 'hight-search-right' },
                    { group: 'bottom', id: 'hight-search-bottom' },
                    { group: 'left', id: 'hight-search-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 250,
            y: 360,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 2-4 录入检索内容-精准匹配
        {
            id: '2-4',
            parentId: '',
            renderKey: 'Process',
            name: 'accurate',
            label: '精准匹配',
            width: 100,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'accurate-top' },
                    { group: 'right', id: 'accurate-right' },
                    { group: 'bottom', id: 'accurate-bottom' },
                    { group: 'left', id: 'accurate-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 90,
            y: 220,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 2-5 录入检索内容-模糊匹配
        {
            id: '2-5',
            parentId: '',
            renderKey: 'Process',
            name: 'fuzzy',
            label: '模糊匹配',
            width: 100,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'fuzzy-top' },
                    { group: 'right', id: 'fuzzy-right' },
                    { group: 'bottom', id: 'fuzzy-bottom' },
                    { group: 'left', id: 'fuzzy-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 90,
            y: 300,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 3.显示检索内容
        {
            id: '3',
            parentId: '',
            renderKey: 'Process',
            name: 'show',
            label: '显示检索内容',
            width: 100,
            height: 50,
            ports: {
                items: [
                    { group: 'top', id: 'show-top' },
                    { group: 'right', id: 'show-right' },
                    { group: 'bottom', id: 'show-bottom' },
                    { group: 'left', id: 'show-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 430,
            y: 30,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 3-1 显示检索内容-保存数据
        {
            id: '3-1',
            parentId: '',
            renderKey: 'Process',
            name: 'save-data',
            label: '保存数据',
            width: 120,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'save-data-top' },
                    { group: 'right', id: 'save-data-right' },
                    { group: 'bottom', id: 'save-data-bottom' },
                    { group: 'left', id: 'save-data-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 420,
            y: 150,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 3-2 显示检索内容-检索模版保存
        {
            id: '3-2',
            parentId: '',
            renderKey: 'Process',
            name: 'save-template',
            label: '检索模版保存',
            width: 120,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'save-template-top' },
                    { group: 'right', id: 'save-template-right' },
                    { group: 'bottom', id: 'save-template-bottom' },
                    { group: 'left', id: 'save-template-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 420,
            y: 250,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 3-3 显示检索内容-列表显示排列顺序
        {
            id: '3-3',
            parentId: '3',
            renderKey: 'Process',
            name: 'list-sort',
            label: '列表显示排列顺序',
            width: 120,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'list-sort-top' },
                    { group: 'right', id: 'list-sort-right' },
                    { group: 'bottom', id: 'list-sort-bottom' },
                    { group: 'left', id: 'list-sort-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 420,
            y: 360,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 3-4 显示检索内容-列表字段显示或隐藏
        {
            id: '3-4',
            parentId: '',
            renderKey: 'Process',
            name: 'field-sh',
            label: '列表字段显示或隐藏',
            width: 120,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'field-sh-top' },
                    { group: 'right', id: 'field-sh-right' },
                    { group: 'bottom', id: 'field-sh-bottom' },
                    { group: 'left', id: 'field-sh-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 420,
            y: 460,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 3-5 显示检索内容-重新检索
        {
            id: '3-5',
            parentId: '',
            renderKey: 'Process',
            name: 'reset-search',
            label: '重新检索',
            width: 120,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'reset-search-top' },
                    { group: 'right', id: 'reset-search-right' },
                    { group: 'bottom', id: 'reset-search-bottom' },
                    { group: 'left', id: 'reset-search-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 420,
            y: 560,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 3-6 显示检索内容-数据名称
        {
            id: '3-6',
            parentId: '',
            renderKey: 'Process',
            name: 'data-name',
            label: '数据名称',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'data-name-top' },
                    { group: 'right', id: 'data-name-right' },
                    { group: 'bottom', id: 'data-name-bottom' },
                    { group: 'left', id: 'data-name-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 610,
            y: 150,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 3-7 显示检索内容-模版名称
        {
            id: '3-7',
            parentId: '',
            renderKey: 'Process',
            name: 'template-name',
            label: '模版名称',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'template-name-top' },
                    { group: 'right', id: 'template-name-right' },
                    { group: 'bottom', id: 'template-name-bottom' },
                    { group: 'left', id: 'template-name-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 610,
            y: 250,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4.数据保存
        {
            id: '4',
            parentId: '',
            renderKey: 'Process',
            name: 'save',
            label: '数据保存',
            width: 100,
            height: 50,
            ports: {
                items: [
                    { group: 'top', id: 'save-top' },
                    { group: 'right', id: 'save-right' },
                    { group: 'bottom', id: 'save-bottom' },
                    { group: 'left', id: 'save-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 720,
            y: 30,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-1 数据保存-基本导出
        {
            id: '4-1',
            parentId: '',
            renderKey: 'Process',
            name: 'export-basic',
            label: '基本导出',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'export-basic-top' },
                    { group: 'right', id: 'export-basic-right' },
                    { group: 'bottom', id: 'export-basic-bottom' },
                    { group: 'left', id: 'export-basic-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 730,
            y: 150,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-2 数据保存-高级导出
        {
            id: '4-2',
            parentId: '',
            renderKey: 'Process',
            name: 'export-hight',
            label: '高级导出',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'export-hight-top' },
                    { group: 'right', id: 'export-hight-right' },
                    { group: 'bottom', id: 'export-hight-bottom' },
                    { group: 'left', id: 'export-hight-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 730,
            y: 250,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-3 数据保存-维度升级
        {
            id: '4-3',
            parentId: '3',
            renderKey: 'Process',
            name: 'veidoo-upgrade',
            label: '维度升级',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'veidoo-upgrade-top' },
                    { group: 'right', id: 'veidoo-upgrade-right' },
                    { group: 'bottom', id: 'veidoo-upgradet-bottom' },
                    { group: 'left', id: 'veidoo-upgrade-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 730,
            y: 360,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-4 数据保存-回收站
        {
            id: '4-4',
            parentId: '',
            renderKey: 'Process',
            name: 'recycled-station',
            label: '回收站',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'recycled-station-top' },
                    { group: 'right', id: 'recycled-station-right' },
                    { group: 'bottom', id: 'recycled-station-bottom' },
                    { group: 'left', id: 'recycled-station-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 730,
            y: 460,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-5 数据保存-查看
        {
            id: '4-5',
            parentId: '',
            renderKey: 'Process',
            name: 'look',
            label: '查看',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'look-top' },
                    { group: 'right', id: 'look-right' },
                    { group: 'bottom', id: 'look-bottom' },
                    { group: 'left', id: 'look-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 730,
            y: 560,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-6 数据保存-导出记录
        {
            id: '4-6',
            parentId: '',
            renderKey: 'Process',
            name: 'export-record',
            label: '导出记录',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'export-record-top' },
                    { group: 'right', id: 'export-record-right' },
                    { group: 'bottom', id: 'export-record-bottom' },
                    { group: 'left', id: 'export-record-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 730,
            y: 660,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-7 数据保存-基本字段
        {
            id: '4-7',
            parentId: '',
            renderKey: 'Process',
            name: 'field-basic',
            label: '基本字段',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'field-basic-top' },
                    { group: 'right', id: 'field-basic-right' },
                    { group: 'bottom', id: 'field-basic-bottom' },
                    { group: 'left', id: 'field-basic-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 880,
            y: 150,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-8 数据保存-可选字段
        {
            id: '4-8',
            parentId: '',
            renderKey: 'Process',
            name: 'field-optional',
            label: '可选字段',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'field-optional-top' },
                    { group: 'right', id: 'field-optional-right' },
                    { group: 'bottom', id: 'field-optional-bottom' },
                    { group: 'left', id: 'field-optional-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 880,
            y: 250,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-9 数据保存-人和人次
        {
            id: '4-9',
            parentId: '',
            renderKey: 'Process',
            name: 'people',
            label: '人和人次',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'people-top' },
                    { group: 'right', id: 'people-right' },
                    { group: 'bottom', id: 'people-bottom' },
                    { group: 'left', id: 'people-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 880,
            y: 360,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-10 数据保存-撤回、删除
        {
            id: '4-10',
            parentId: '',
            renderKey: 'Process',
            name: 'recall-delete',
            label: '撤回/删除',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'recall-delete-top' },
                    { group: 'right', id: 'recall-delete-right' },
                    { group: 'bottom', id: 'recall-delete-bottom' },
                    { group: 'left', id: 'recall-delete-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 880,
            y: 460,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 4-11 数据保存-数据修改
        {
            id: '4-11',
            parentId: '',
            renderKey: 'Process',
            name: 'data-change',
            label: '数据修改',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'data-change-top' },
                    { group: 'right', id: 'data-change-right' },
                    { group: 'bottom', id: 'data-change-bottom' },
                    { group: 'left', id: 'data-change-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 880,
            y: 560,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 5.数据修改
        {
            id: '5',
            parentId: '',
            renderKey: 'Process',
            name: 'change',
            label: '数据修改',
            width: 100,
            height: 50,
            ports: {
                items: [
                    { group: 'top', id: 'change-top' },
                    { group: 'right', id: 'change-right' },
                    { group: 'bottom', id: 'change-bottom' },
                    { group: 'left', id: 'change-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 1010,
            y: 30,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 5-1 数据修改-新增
        {
            id: '5-1',
            parentId: '',
            renderKey: 'Process',
            name: 'insert',
            label: '新增',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'insert-top' },
                    { group: 'right', id: 'insert-right' },
                    { group: 'bottom', id: 'insert-bottom' },
                    { group: 'left', id: 'insert-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 1020,
            y: 150,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 5-2 数据修改-修改
        {
            id: '5-2',
            parentId: '',
            renderKey: 'Process',
            name: 'update',
            label: '修改',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'update-top' },
                    { group: 'right', id: 'update-right' },
                    { group: 'bottom', id: 'update-bottom' },
                    { group: 'left', id: 'update-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 1020,
            y: 250,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 5-3 数据修改-删除
        {
            id: '5-3',
            parentId: '3',
            renderKey: 'Process',
            name: 'delete',
            label: '删除',
            width: 80,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'delete-top' },
                    { group: 'right', id: 'delete-right' },
                    { group: 'bottom', id: 'delete-bottom' },
                    { group: 'left', id: 'delete-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 1020,
            y: 360,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 5-4 数据修改-回到检索列表
        {
            id: '5-4',
            parentId: '',
            renderKey: 'Process',
            name: 'back-search',
            label: '回到检索列表',
            width: 100,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'back-search-top' },
                    { group: 'right', id: 'back-search-right' },
                    { group: 'bottom', id: 'back-search-bottom' },
                    { group: 'left', id: 'back-search-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 1170,
            y: 150,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 5-5 数据修改-数据查看列表
        {
            id: '5-5',
            parentId: '',
            renderKey: 'Process',
            name: 'data-look',
            label: '数据查看列表',
            width: 100,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'data-look-top' },
                    { group: 'right', id: 'data-look-right' },
                    { group: 'bottom', id: 'data-look-bottom' },
                    { group: 'left', id: 'data-look-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 1170,
            y: 250,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 5-6 数据修改-数据列表
        {
            id: '5-6',
            parentId: '',
            renderKey: 'Process',
            name: 'data-list',
            label: '数据列表',
            width: 100,
            height: 40,
            ports: {
                items: [
                    { group: 'top', id: 'data-list-top' },
                    { group: 'right', id: 'edata-list-right' },
                    { group: 'bottom', id: 'data-list-bottom' },
                    { group: 'left', id: 'data-list-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 1170,
            y: 360,
            zIndex: 10,
            stroke: colorPrimary,
        },
        // 6.结束
        {
            id: '6',
            parentId: '',
            renderKey: 'Terminal',
            name: 'end',
            label: '结束',
            width: 100,
            height: 50,
            ports: {
                items: [
                    { group: 'top', id: 'end-top' },
                    { group: 'right', id: 'end-right' },
                    { group: 'bottom', id: 'end-bottom' },
                    { group: 'left', id: 'end-left' },
                ],
                groups: groups
            },
            isLeaf: true,
            x: 1220,
            y: 30,
            zIndex: 10,
            stroke: colorPrimary,
            // fill: colorPrimary
        },
    ],
    // 连接线配置
    edges: [
        // 开始检索->录入检索内容 1 -> 2
        {
            id: '[object Object]:start-right-[object Object]:entry-left',
            sourcePortId: 'start-right',
            targetPortId: 'entry-left',
            source: { cell: '1', port: 'start-right' },
            target: { cell: '2', port: 'entry-left' },
            zIndex: 1,
            attrs: attrs[0]
        },
        // 录入检索内容->显示检索内容 2 -> 3
        {
            id: '[object Object]:entry-right-[object Object]:show-left',
            sourcePortId: 'entry-right',
            targetPortId: 'show-left',
            source: { cell: '2', port: 'entry-right' },
            target: { cell: '3', port: 'show-top' },
            zIndex: 1,
            attrs: attrs[0]
        },
        // 录入检索内容->手动录入 2 -> 2-1
        {
            id: '[object Object]:entry-bottopm-[object Object]:entry-hand-top',
            sourcePortId: 'entry-bottopm',
            targetPortId: 'entry-hand-top',
            source: { cell: '2', port: 'entry-bottopm' },
            target: { cell: '2-1', port: 'entry-hand-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 手动录入->模版录入 2-1 -> 2-2
        {
            id: '[object Object]:entry-hand-bottopm-[object Object]:entry-template-top',
            sourcePortId: 'entry-hand-bottopm',
            targetPortId: 'entry-template-top',
            source: { cell: '2-1', port: 'entry-hand-bottopm' },
            target: { cell: '2-2', port: 'entry-template-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 手动录入->模版录入(折线) 2-1 -> 2-2
        {
            id: '[object Object]:entry-hand-left-[object Object]:entry-template-left',
            sourcePortId: 'entry-hand-left',
            targetPortId: 'entry-template-left',
            source: { cell: '2-1', port: 'entry-hand-left' },
            target: { cell: '2-2', port: 'entry-template-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 精准匹配->手动录入 2-4 -> 2-1
        {
            id: '[object Object]:accurate-right-[object Object]:entry-hand-left',
            sourcePortId: 'accurate-right',
            targetPortId: 'entry-hand-left',
            source: { cell: '2-4', port: 'accurate-right' },
            target: { cell: '2-1', port: 'entry-hand-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 模版录入->高级检索 2-2 -> 2-3
        {
            id: '[object Object]:entry-template-bottopm-[object Object]:hight-search-top',
            sourcePortId: 'entry-template-bottopm',
            targetPortId: 'hight-search-top',
            source: { cell: '2-2', port: 'entry-template-bottopm' },
            target: { cell: '2-3', port: 'hight-search-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 模版录入->高级检索(折线) 2-2 -> 2-3
        {
            id: '[object Object]:entry-template-left-[object Object]:hight-search-left',
            sourcePortId: 'entry-template-left',
            targetPortId: 'hight-search-left',
            source: { cell: '2-2', port: 'entry-template-left' },
            target: { cell: '2-3', port: 'hight-search-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 模糊匹配->高级检索 2-5 -> 2-3
        {
            id: '[object Object]:fuzzy-right-[object Object]:hight-search-left',
            sourcePortId: 'fuzzy-right',
            targetPortId: 'hight-search-left',
            source: { cell: '2-5', port: 'fuzzy-right' },
            target: { cell: '2-3', port: 'hight-search-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 显示检索内容->数据保存 3 -> 4
        {
            id: '[object Object]:show-right-[object Object]:save-left',
            sourcePortId: 'show-right',
            targetPortId: 'save-left',
            source: { cell: '3', port: 'show-right' },
            target: { cell: '4', port: 'save-left' },
            zIndex: 1,
            attrs: attrs[0]
        },
        // 显示检索内容->保存数据 3 -> 3-1
        {
            id: '[object Object]:show-bottopm-[object Object]:save-data-top',
            sourcePortId: 'show-bottopm',
            targetPortId: 'save-data-top',
            source: { cell: '3', port: 'show-bottopm' },
            target: { cell: '3-1', port: 'save-data-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 保存数据->数据名称 3-1 -> 3-6
        {
            id: '[object Object]:save-data-right-[object Object]:data-name-left',
            sourcePortId: 'save-data-right',
            targetPortId: 'data-name-left',
            source: { cell: '3-1', port: 'save-data-right' },
            target: { cell: '3-6', port: 'data-name-left' },
            zIndex: 1,
            attrs: attrs[2]
        },
        // 保存数据->检索模版保存 3-1 -> 3-2
        {
            id: '[object Object]:save-bottopm-[object Object]:save-template-top',
            sourcePortId: 'save-bottopm',
            targetPortId: 'save-template-top',
            source: { cell: '3-1', port: 'save-bottopm' },
            target: { cell: '3-2', port: 'save-template-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 检索模版保存->列表显示排列顺序 3-2 -> 3-3
        {
            id: '[object Object]:save-template-bottom-[object Object]:list-sort-top',
            sourcePortId: 'save-template-bottom',
            targetPortId: 'list-sort-top',
            source: { cell: '3-2', port: 'save-template-bottom' },
            target: { cell: '3-3', port: 'list-sort-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 检索模版保存->模版名称 3-2 -> 3-7
        {
            id: '[object Object]:save-template-right-[object Object]:template-name-left',
            sourcePortId: 'save-template-right',
            targetPortId: 'template-name-left',
            source: { cell: '3-2', port: 'save-template-right' },
            target: { cell: '3-7', port: 'template-name-left' },
            zIndex: 1,
            attrs: attrs[2]
        },
        // 列表显示排列顺序->列表字段显示或隐藏 3-3 -> 3-4
        {
            id: '[object Object]:list-sort-bottopm-[object Object]:field-sh-top',
            sourcePortId: 'show-bottopm',
            targetPortId: 'field-sh-top',
            source: { cell: '3-3', port: 'show-bottopm' },
            target: { cell: '3-4', port: 'field-sh-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 列表字段显示或隐藏->重新检索 3-4 -> 3-5
        {
            id: '[object Object]:field-sh-bottopm-[object Object]:reset-search-top',
            sourcePortId: 'field-sh-bottopm',
            targetPortId: 'reset-search-top',
            source: { cell: '3-4', port: 'field-sh-bottopm' },
            target: { cell: '3-5', port: 'reset-search-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 数据保存->数据修改 4 -> 5
        {
            id: '[object Object]:save-right-[object Object]:change-left',
            sourcePortId: 'save-right',
            targetPortId: 'change-left',
            source: { cell: '4', port: 'save-right' },
            target: { cell: '5', port: 'change-left' },
            zIndex: 1,
            attrs: attrs[0]
        },
        // 数据保存->基本导出 4 -> 4-1
        {
            id: '[object Object]:save-bottopm-[object Object]:export-basic-top',
            sourcePortId: 'save-bottopm',
            targetPortId: 'export-basic-top',
            source: { cell: '4', port: 'save-bottopm' },
            target: { cell: '4-1', port: 'export-basic-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 基本导出->高级导出 4-1 -> 4-2
        {
            id: '[object Object]:export-basic-bottopm-[object Object]:export-hight-top',
            sourcePortId: 'export-basic-bottopm',
            targetPortId: 'export-hight-top',
            source: { cell: '4-1', port: 'export-basic-bottopm' },
            target: { cell: '4-2', port: 'export-hight-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 基本导出->基本字段 4-1 -> 4-7
        {
            id: '[object Object]:export-basic-right-[object Object]:field-hight-left',
            sourcePortId: 'export-basice-right',
            targetPortId: 'field-hight-left',
            source: { cell: '4-1', port: 'export-basic-right' },
            target: { cell: '4-7', port: 'field-hight-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 高级导出->维度升级 4-2 -> 4-3
        {
            id: '[object Object]:export-hight-bottom-[object Object]:veidoo-upgrade-top',
            sourcePortId: 'export-hight-bottom',
            targetPortId: 'veidoo-upgrade-top',
            source: { cell: '4-2', port: 'export-hight-bottom' },
            target: { cell: '4-3', port: 'veidoo-upgrade-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 高级导出->可选字段 4-2 -> 4-8
        {
            id: '[object Object]:export-hight-right-[object Object]:field-optional-left',
            sourcePortId: 'export-hight-right',
            targetPortId: 'ield-optional-left',
            source: { cell: '4-2', port: 'export-hight-right' },
            target: { cell: '4-8', port: 'ield-optional-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 维度升级->回收站 4-3 -> 4-4
        {
            id: '[object Object]:veidoo-upgrade-bottopm-[object Object]:recycled-station-top',
            sourcePortId: 'veidoo-upgrade-bottopm',
            targetPortId: 'recycled-station-top',
            source: { cell: '4-3', port: 'veidoo-upgrade-bottopm' },
            target: { cell: '4-4', port: 'recycled-station-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 维度升级->人和人次 4-3 -> 4-9
        {
            id: '[object Object]:veidoo-upgradet-right-[object Object]:people-left',
            sourcePortId: 'veidoo-upgrade-right',
            targetPortId: 'people-left',
            source: { cell: '4-3', port: 'veidoo-upgrade-right' },
            target: { cell: '4-9', port: 'people-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 回收站->查看 4-4 -> 4-5
        {
            id: '[object Object]:recycled-station-bottopm-[object Object]:look-top',
            sourcePortId: 'recycled-station-bottopm',
            targetPortId: 'look-top',
            source: { cell: '4-4', port: 'recycled-station-bottopm' },
            target: { cell: '4-5', port: 'look-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 回收站->撤回/删除 4-4 -> 4-10
        {
            id: '[object Object]:recycled-station-right-[object Object]:recall-delete-left',
            sourcePortId: 'recycled-station-right',
            targetPortId: 'recall-delete-left',
            source: { cell: '4-4', port: 'recycled-station-right' },
            target: { cell: '4-10', port: 'recall-delete-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 查看->导出记录 4-5 -> 4-6
        {
            id: '[object Object]:look-bottopm-[object Object]:export-record-top',
            sourcePortId: 'look-bottopm',
            targetPortId: 'export-record-top',
            source: { cell: '4-5', port: 'look-bottopm' },
            target: { cell: '4-6', port: 'export-record-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 查看->数据修改 4-5 -> 4-11
        {
            id: '[object Object]:look-right-[object Object]:data-change-left',
            sourcePortId: 'look-right',
            targetPortId: 'data-change-left',
            source: { cell: '4-5', port: 'look-right' },
            target: { cell: '4-11', port: 'data-change-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 数据修改->5.数据修改 4-11 -> 5
        {
            id: '[object Object]:data-change-right-[object Object]:change-left',
            sourcePortId: 'data-change-right',
            targetPortId: 'change-left',
            source: { cell: '4-11', port: 'data-change-right' },
            target: { cell: '5', port: 'change-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 数据修改->结束 5 -> 6
        {
            id: '[object Object]:change-right-[object Object]:end-left',
            sourcePortId: 'change-right',
            targetPortId: 'end-left',
            source: { cell: '5', port: 'change-right' },
            target: { cell: '6', port: 'end-left' },
            zIndex: 1,
            attrs: attrs[0]
        },
        // 数据修改->新增 5 -> 5-1
        {
            id: '[object Object]:data-change-bottopm-[object Object]:insert-top',
            sourcePortId: 'data-change-bottopm',
            targetPortId: 'insert-top',
            source: { cell: '5', port: 'data-change-bottopm' },
            target: { cell: '5-1', port: 'insert-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 新增->修改 5-1 -> 5-2
        {
            id: '[object Object]:insert-bottopm-[object Object]:update-top',
            sourcePortId: 'insert-bottopm',
            targetPortId: 'update-top',
            source: { cell: '5-1', port: 'insert-bottopm' },
            target: { cell: '5-2', port: 'update-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 新增->回到检索列表 5-1 -> 5-4
        {
            id: '[object Object]:insert-right-[object Object]:back-search-left',
            sourcePortId: 'insert-right',
            targetPortId: 'back-search-left',
            source: { cell: '5-1', port: 'insert-right' },
            target: { cell: '5-4', port: 'back-search-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 修改->删除 5-2 -> 5-3
        {
            id: '[object Object]:update-bottopm-[object Object]:delete-top',
            sourcePortId: 'update-bottopm',
            targetPortId: 'delete-top',
            source: { cell: '5-2', port: 'update-bottopm' },
            target: { cell: '5-3', port: 'delete-top' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 修改->数据查看列表 5-2 -> 5-5
        {
            id: '[object Object]:update-right-[object Object]:data-look-left',
            sourcePortId: 'update-right',
            targetPortId: 'data-look-left',
            source: { cell: '5-2', port: 'update-right' },
            target: { cell: '5-5', port: 'data-look-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
        // 删除->数据列表 5-3 -> 5-6
        {
            id: '[object Object]:delete-right-[object Object]:data-list-left',
            sourcePortId: 'delete-right',
            targetPortId: 'data-list-left',
            source: { cell: '5-3', port: 'delete-right' },
            target: { cell: '5-6', port: 'data-list-left' },
            zIndex: 1,
            attrs: attrs[1]
        },
    ]
}


export default DATA