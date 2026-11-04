import React, { useRef, useState } from 'react'
import { message, Space } from 'antd'
import {
  ProTable,
  ActionType,
  ProColumns,
  ProFormInstance,
} from '@ant-design/pro-components'

import { getRoleList, dRole } from '@/services/permissionManage/role'
import RoleIU from './RoleIU'
import RemoveConfirm from '@/components/JYRemoveConfirm'

// 角色管理
const Role: React.FC = () => {
  const actionRef = useRef<ActionType>()
  const formRef = useRef<ProFormInstance>()
  const [selectedRows, setSelectedRows] = useState<PERSSIONAPI.RoleListItem[]>([])

  // 表格数据操作完成：新增/修改/删除...
  const handleFinish = () => {
    actionRef.current?.reloadAndRest?.();
  }

  // 删除确认
  const handleOk = (data: PERSSIONAPI.RoleListItem | PERSSIONAPI.RoleListItem[]) => {
    let list: any = null
    // 判断是否是批量删除
    if (Array.isArray(data)) {
      list = data.map(item => item.id)
    } else {
      list = [data.id]
    }
    handleRemove(list)
  }

  // 删除角色
  const handleRemove = async (list: PERSSIONAPI.RoleListItem[]) => {
    const hide = message.loading('正在删除')
    const { code } = await dRole(list)
    if (code === 0) {
      message.success('成功！')
      handleFinish()
    } else {
      message.error('失败！')
    }
    hide()
  }


  const columns: ProColumns<PERSSIONAPI.RoleListItem>[] = [
    {
      title: '序号',
      dataIndex: 'index',
      valueType: 'indexBorder',
      width: 48,
    },
    {
      title: '角色名称',
      dataIndex: 'name',
      hideInTable: true
    },
    {
      title: '角色名称',
      dataIndex: 'name',
      hideInSearch: true
    },
    {
      title: '创建时间',
      dataIndex: 'createDate',
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
          <RoleIU isUpdate={true} record={record} handleFinish={handleFinish} />
          <RemoveConfirm key='RemoveConfirm' handleOk={handleOk} data={record} />
        </Space>
      ),
    },
  ]

  return (
    <>
      <ProTable<PERSSIONAPI.RoleListItem, API.PageParams>
        headerTitle="角色列表"
        actionRef={actionRef}
        formRef={formRef}
        rowKey="id"
        bordered
        // scroll={{ y: 500 }}
        search={{ labelWidth: 'auto' }}
        options={{ fullScreen: true }}
        request={getRoleList}
        columns={columns}
        toolBarRender={() => [<RoleIU key="RoleI" handleFinish={handleFinish} />]}
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
            <RemoveConfirm key="RemoveConfirm" text='批量删除' handleOk={handleOk} data={selectedRows} />
          )
        }}
        rowSelection={{
          onChange: (_, list) => {
            setSelectedRows(list);
          },
        }}
      />
    </>
  )
}

export default Role;
