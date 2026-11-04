import React, { useRef, useState } from 'react'
import { message, Space } from 'antd'
import {
    PageContainer,
    ProTable,
} from '@ant-design/pro-components'
import type { ActionType, ProColumns } from '@ant-design/pro-components'
import { getExportRecordList, againExport, downLoadRecord } from '@/services/saveData/exportRecord'
import { exportFun } from '@/utils'
import JYModal from '@/components/JYModal'
import Look from './Look'


const ExportRecord: React.FC = () => {
    const actionRef = useRef<ActionType>()
    const [isModalOpen, setisModalOpen] = useState(false)
    const [exportRecordId, setExportRecordId] = useState<string | number>('')

    // 再次导出
    const handleAgainExport = async (record: SAVEDATAAPI.ExportRecordListItem) => {
        const paramsData = {
            id: record.id,
        }
        const res = await againExport(paramsData)
        if (res.headers['content-type'] == 'applocation/json') {
            message.error('导出失败')
            return
        }
        exportFun(res, () => {
            message.success('成功')
        })
    }

    // 操作事件
    const actionClick = async (num: number, record: SAVEDATAAPI.ExportRecordListItem) => {
        switch (num) {
            case 1:// 再次导出
                handleAgainExport(record)
                break
            case 2:// 查看
                setExportRecordId(record.id)
                setisModalOpen(true)
                break
            default:// 下载
                const paramsData = {
                    exportId: record.id,
                }
                const res = await downLoadRecord(paramsData)
                if (res.headers['content-type'] == 'application/json') {
                    message.error('下载失败')
                    return
                }
                exportFun(res, () => {
                    message.success('成功')
                })
                break
        }
    }

    const handleCancel = () => {
        setisModalOpen(false)
    }


    const statusList = ['', '进行中', '成功', '失败']
    const columns: ProColumns<SAVEDATAAPI.ExportRecordListItem>[] = [
        {
            title: '导出数据名称',
            dataIndex: 'searchName',
            width: 140
        },
        // {
        //     title: '数据维度',
        //     dataIndex: 'dimension',
        //     hideInSearch: true,
        //     width: 100,
        //     render: (_, record) => (<span>{record['dimension'] ? '人' : '人次'}</span>)
        // },
        {
            title: '导出状态',
            dataIndex: 'status',
            hideInSearch: true,
            width: 140,
            render: (_, record) => (<span>{statusList[record['status'] ? record['status'] : 0]}</span>)
        },

        {
            title: '导出类型',
            dataIndex: 'exportType',
            hideInSearch: true,
            width: 100,
            render: (_, record) => (<span>{record?.exportType === 0 ? "基本导出" : "高级导出"}</span>)
        },
        {
            title: '数量',
            dataIndex: 'amount',
            hideInSearch: true,
            width: 100,
        },

        {
            title: '导出人',
            dataIndex: 'createUserName',
            width: 100,
        },
        {
            title: '开始时间',
            dataIndex: 'startDate',
            hideInSearch: true,
            width: 140,
        },
        {
            title: '结束时间',
            dataIndex: 'endDate',
            hideInSearch: true,
            width: 140,
        },
        {
            title: '导出字段数',
            dataIndex: 'fieldAmount',
            hideInSearch: true,
            width: 100,
        },
        {
            title: '数据检索结果',
            dataIndex: 'expression',
            hideInSearch: true
        },
        {
            title: '备注',
            dataIndex: 'remark',
            hideInSearch: true,
            width: 100,
        },
        {
            title: '时间',
            dataIndex: 'time',
            hideInTable: true,
            valueType: 'dateRange',
            search: {
                transform: (value) => {
                    return {
                        startDate: value[0],
                        endDate: value[1],
                    };
                },
            },
        },
        {
            title: '操作',
            dataIndex: 'option',
            valueType: 'option',
            align: 'center',
            width: 100,
            render: (_, record) => (
                <Space size="middle">
                    {/* <a onClick={() => actionClick(1, record)}>再次导出</a> */}
                    {/* <a onClick={() => actionClick(2, record)}>查看</a> */}
                    {(record.status == 2 && record.fieldAmount > 0) &&
                        <a onClick={() => actionClick(3, record)}>下载</a>
                    }
                </Space>
            ),
        }
    ]
    return (
        <PageContainer
            fixedHeader
            header={{
                onBack() {
                    history.back()
                },
                breadcrumb: {}
            }}>
            <ProTable<SAVEDATAAPI.ExportRecordListItem, API.PageParams>
                headerTitle='导出记录列表'
                actionRef={actionRef}
                rowKey="id"
                bordered
                search={{ labelWidth: 'auto' }}
                options={{ fullScreen: true }}
                request={getExportRecordList}
                columns={columns}
            />
            <JYModal
                title=""
                width="80%"
                isModalOpen={isModalOpen}
                ChildNode={() => <Look id={exportRecordId} />}
                handleCancel={handleCancel}
                footer={null}
                maskClosable={false}
            />
        </PageContainer>
    )
}

export default ExportRecord
