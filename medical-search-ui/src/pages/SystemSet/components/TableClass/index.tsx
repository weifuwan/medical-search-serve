import React, { useRef, useState } from 'react'
import { message, Space } from 'antd'
import {
    ProTable,
    ActionType,
    ProColumns,
    ProFormInstance,
} from '@ant-design/pro-components'

import { getClassifyList, dClassify } from '@/services/systemSet/api'
import ClassIU from './ClassIU'
import RemoveConfirm from '@/components/JYRemoveConfirm'

// 分类管理
const User: React.FC = (props, ref) => {
    const actionRef = useRef<ActionType>()
    const formRef = useRef<ProFormInstance>()

    // 表格数据操作完成：新增/修改/删除...
    const handleFinish = () => {
        actionRef.current?.reloadAndRest?.();
    }

    // 删除确认
    const handleOk = (data: SYSTEMSET.ClassifyListItem | SYSTEMSET.ClassifyListItem[]) => {
        let list: any = null
        // 判断是否是批量删除
        if (Array.isArray(data)) {
            list = data.map(item => item.id)
        } else {
            list = [data.id]
        }
        handleRemove(list)
    }

    // 删除分类
    const handleRemove = async (list: SYSTEMSET.ClassifyListItem[]) => {
        const hide = message.loading('正在删除')
        const { code } = await dClassify(list)
        if (code === 0) {
            message.success('成功！')
            handleFinish()
        } else {
            message.error('失败！')
        }
        hide()
    }

    const columns: ProColumns<SYSTEMSET.ClassifyListItem>[] = [
        {
            title: '序号',
            dataIndex: 'index',
            valueType: 'indexBorder',
            width: 48,
        },
        {
            title: '名称',
            dataIndex: 'name',
            search: {
                transform: (value) => {
                    return value.trim()
                },
            },
        },
        {
            title: '创建时间',
            dataIndex: 'createDate',
        },
        {
            title: '最后更新时间',
            dataIndex: 'updateDate',
        },
        {
            title: '操作',
            dataIndex: 'option',
            valueType: 'option',
            align: 'center',
            width: 150,
            render: (_, record) => (
              <>
                {!record.isDeleted ? 
                  <Space size="middle">
                    <ClassIU key='ClassU' isUpdate={true} record={record} handleFinish={handleFinish} />
                    <RemoveConfirm key='RemoveConfirm' handleOk={handleOk} data={record} />
                    </Space>
                  :
                  null
                }
              </>
            ),
        },
    ]

    return (
        <>
            <ProTable<SYSTEMSET.ClassifyListItem, API.PageParams>
                headerTitle="分类列表"
                actionRef={actionRef}
                formRef={formRef}
                rowKey="id"
                bordered
                // scroll={{ y: 500 }}
                search={false}
                request={getClassifyList}
                columns={columns}
                toolBarRender={() => [<ClassIU key="UserI" handleFinish={handleFinish} />]}
            />
        </>
    )
}

export default User;
