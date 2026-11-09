import React, { useRef, useState } from 'react'
import { Button, message, Space } from 'antd'
import { PlusOutlined } from '@ant-design/icons'
import {
    PageContainer,
    ProTable,
    ActionType,
    ProColumns,
} from '@ant-design/pro-components'

import { getTemplateList, dTemplate } from '@/services/searchTemplate/api'
import JYModal from "@/components/JYModal"
import IU from './components/IU'
import RemoveConfirm from '@/components/JYRemoveConfirm'

// 检索模版
const SearchTemplate: React.FC = () => {
    const actionRef = useRef<ActionType>();
    const [selectedRows, setSelectedRows] = useState<STEMPLATEAPI.TemplateListItem[]>([])
    const [templateId, setTemplateId] = useState<string | number>('')
    const [isModalOpen, setIsModalOpen] = useState(false)
    const [isUpdate, setIsUpdate] = useState(false)

    // 表格数据操作完成：新增/修改/删除...
    const handleFinish = () => {
        actionRef.current?.reloadAndRest?.();
    }

    // 删除确认
    const handleRemoveOk = (data: STEMPLATEAPI.TemplateListItem | STEMPLATEAPI.TemplateListItem[]) => {
        let list: any = null
        // 判断是否是批量删除
        if (Array.isArray(data)) {
            list = data.map(item => item.id)
        } else {
            list = [data.id]
        }
        handleRemove(list)
    }

    // 删除
    const handleRemove = async (list: STEMPLATEAPI.TemplateListItem[]) => {
        const hide = message.loading('正在删除')
        const { code } = await dTemplate(list)
        if (code === 0) {
            message.success('成功！')
            handleFinish()
        } else {
            message.error('失败！')
        }
        hide()
    }


    // 操作事件
    const actionClick = (num: number, record: STEMPLATEAPI.TemplateListItem) => {
        switch (num) {
            case 1:// 修改
                setTemplateId(record.id!)
                setIsUpdate(true)
                setIsModalOpen(true)
                break
            default:// 删除
        }
    }

    // IU 模态框回调
    const handleOk = () => {
        setIsModalOpen(false)
        handleFinish()
    }

    const handleCancel = () => {
        setIsModalOpen(false)
    }

    const columns: ProColumns<STEMPLATEAPI.TemplateListItem>[] = [
        {
            title: '序号',
            dataIndex: 'index',
            valueType: 'indexBorder',
            width: 48,
        },
        {
            title: '模版名称',
            dataIndex: 'templateName',
            ellipsis: true,
            search: {
                transform: (value) => {
                    return value.trim()
                },
            },
        },
        {
            title: '使用范围',
            dataIndex: 'useScope',
            initialValue: '1',
            valueType: 'select',
            valueEnum: {
                0: {
                    text: '全院'
                },
                1: {
                    text: '个人'
                },
            },
        },
        {
            title: '模版内容',
            dataIndex: 'expression',
            // tip: '模版内容',
            hideInSearch: true,
            ellipsis: true
        },
        {
            title: '时间',
            dataIndex: 'time',
            hideInTable: true,
            hideInSearch: true,
            initialValue: '1',
            valueType: 'select',
            valueEnum: {
                1: {
                    text: '创建时间',
                    status: '',
                },
                2: {
                    text: '最近更新时间',
                    status: '',
                }
            },
        },
        {
            title: '创建时间',
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
            title: '创建时间',
            dataIndex: 'createDate',
            hideInSearch: true
        },
        {
            title: '创建人',
            dataIndex: 'creatorName',
            hideInSearch: true
        },
        {
            title: '最近更新人',
            dataIndex: 'updaterName',
            hideInSearch: true
        },
        {
            title: '最近更新时间',
            dataIndex: 'updateDate',
            hideInSearch: true
        },
        {
            title: '操作',
            dataIndex: 'option',
            valueType: 'option',
            align: 'center',
            width: 120,
            render: (_, record) => (
                <Space size="middle">
                    <a onClick={() => (actionClick(1, record))}>修改</a>
                    <RemoveConfirm key='RemoveConfirm' handleOk={handleRemoveOk} data={record} />
                </Space>
            ),
        },
    ]

    return (
        <PageContainer fixedHeader>
            <ProTable<STEMPLATEAPI.TemplateListItem, API.PageParams>
                headerTitle="模版列表"
                actionRef={actionRef}
                rowKey="id"
                bordered
                // scroll={{ y: 500 }}
                search={{ labelWidth: 'auto' }}
                options={{ fullScreen: true }}
                request={getTemplateList}
                columns={columns}
                toolBarRender={() => [
                    <Button
                        type="primary"
                        key="insert"
                        onClick={() => {
                            setIsUpdate(false)
                            setIsModalOpen(true)
                        }}
                    >
                        <PlusOutlined /> 新增
                    </Button>,
                ]}
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
                        <RemoveConfirm key="RemoveConfirm" text='批量删除' handleOk={handleRemoveOk} data={selectedRows} />
                    )
                }}
                rowSelection={{
                    onChange: (_, list) => {
                        setSelectedRows(list);
                    },
                }}
            />

            <JYModal
                title={isUpdate ? '修改' : '新增'}
                width="1300px"
                className="search-template-modal"
                centered
                isModalOpen={isModalOpen}
                ChildNode={() => <IU isUpdate={isUpdate} handleFinish={handleOk} templateId={templateId} />}
                handleCancel={handleCancel}
                maskClosable={false}
                footer={null}
            />
        </PageContainer>
    )
}

export default SearchTemplate;
