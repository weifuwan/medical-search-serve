import React, { useRef, useState } from 'react'
import { ProTable } from '@ant-design/pro-components'
import { message, Space } from 'antd'
import type { ActionType, ProColumns } from '@ant-design/pro-components'
import { getRecycledStationList, undo, dRecycledStation } from '@/services/saveData/recycledStation'
import RemoveConfirm from '@/components/JYRemoveConfirm'

interface RecycledStationProps {
    handleFinish: () => void
}

// 回收站
const RecycledStation: React.FC<RecycledStationProps> = (props) => {
    const { handleFinish } = props
    const actionRef = useRef<ActionType>()
    const [selectedRows, setSelectedRows] = useState<SAVEDATAAPI.RecycledStationListItem[]>([])

    // 表格数据操作完成：撤销/删除...
    const handleOk = () => {
        actionRef.current?.reloadAndRest?.();
        handleFinish()
    }

    // 撤销
    const handleUndo = async (list: SAVEDATAAPI.RecycledStationListItem[]) => {
        const hide = message.loading('正在撤销')
        const { code } = await undo(list)
        if (code === 0) {
            message.success('成功！')
            handleOk()
        } else {
            message.error('失败！')
        }
        hide()
    }

    // 撤销确认
    const handleUndoOk = (data: SAVEDATAAPI.RecycledStationListItem | SAVEDATAAPI.RecycledStationListItem[]) => {
        let list: any = null
        // 判断是否是批量删除
        if (Array.isArray(data)) {
            list = data.map(item => item.id)
        } else {
            list = [data.id]
        }
        handleUndo(list)
    }

    // 删除
    const handleRemove = async (list: SAVEDATAAPI.RecycledStationListItem[]) => {
        const hide = message.loading('正在删除')
        const { code } = await dRecycledStation(list)
        if (code === 0) {
            message.success('成功！')
            handleOk()
        } else {
            message.error('失败！')
        }
        hide()
    }

    // 删除确认
    const handleRemoveOk = (data: SAVEDATAAPI.RecycledStationListItem | SAVEDATAAPI.RecycledStationListItem[]) => {
        let list: any = null
        // 判断是否是批量删除
        if (Array.isArray(data)) {
            list = data.map(item => item.id)
        } else {
            list = [data.id]
        }
        handleRemove(list)
    }


    const columns: ProColumns<SAVEDATAAPI.RecycledStationListItem>[] = [
        {
            title: '数据名称',
            dataIndex: 'searchName',
        },
        {
            title: '数据维度',
            dataIndex: 'dimension',
            render: (_, record) => (<span>{record['dimension'] ? '人' : '人次'}</span>)
        },
        {
            title: '数量',
            dataIndex: 'amount',
        },
        {
            title: '数据检索结果',
            dataIndex: 'expression',
        },
        {
            title: '备注',
            dataIndex: 'remark',
        },
        {
            title: '删除日期',
            dataIndex: 'createDate',
        },
        {
            title: '到期日期',
            dataIndex: 'expireDate',
        },
        {
            title: '删除人',
            dataIndex: 'createUserName',
        },
        {
            title: '操作',
            width: 120,
            align: 'center',
            render: (_, record) => (
                <Space size="middle">
                    <RemoveConfirm text='撤销' key='Undo' handleOk={handleUndoOk} data={record} />
                    <RemoveConfirm key='Remove' handleOk={handleRemoveOk} data={record} />
                </Space>
            ),
        }
    ]
    return (
        <ProTable<SAVEDATAAPI.RecycledStationListItem, API.PageParams>
            actionRef={actionRef}
            rowKey="searchId"
            bordered
            search={false}
            options={false}
            request={getRecycledStationList}
            columns={columns}
            pagination={{
                pageSize: 10,
            }}
            tableAlertRender={({ selectedRowKeys, selectedRows, onCleanSelected }) => (
                <span>
                    已选 {selectedRowKeys.length} 项
                    <a style={{ marginInlineStart: 8 }} onClick={onCleanSelected}>
                        取消选择
                    </a>
                </span>
            )}
            tableAlertOptionRender={() => {
                return (
                    <Space>
                        <RemoveConfirm key="UndoConfirm" text='批量删除' handleOk={handleRemoveOk} data={selectedRows} />
                        <RemoveConfirm key="RemoveConfirm" text='批量撤销' handleOk={handleUndoOk} data={selectedRows} />
                    </Space>
                )
            }}
            rowSelection={{
                onChange: (_, list) => {
                    setSelectedRows(list);
                },
            }}
        />
    )
}

export default RecycledStation
