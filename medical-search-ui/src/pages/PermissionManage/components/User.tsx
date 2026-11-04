import { ActionType, ProColumns, ProFormInstance, ProTable } from '@ant-design/pro-components';
import { message, Popconfirm, Space } from 'antd';
import React, { useRef, useState } from 'react';

import RemoveConfirm from '@/components/JYRemoveConfirm';
import { dUser, getUserList } from '@/services/permissionManage/user';
import ResetPsw from './ResetPsw';
import UserIU from './UserIU';

// 用户管理
const User: React.FC = (props, ref) => {
  const actionRef = useRef<ActionType>();
  const formRef = useRef<ProFormInstance>();
  const [selectedRows, setSelectedRows] = useState<PERSSIONAPI.UserListItem[]>([]);
  const [selectedRowKeys, setSelectedRowKeys] = useState<React.Key[]>([]);
  // 表格数据操作完成：新增/修改/删除...
  const handleFinish = () => {
    actionRef.current?.reloadAndRest?.();
  };

  // 删除确认
  const handleOk = (
    data: PERSSIONAPI.UserListItem | PERSSIONAPI.UserListItem[],
    type?: string = '停用',
  ) => {
    let list: any = null;
    console.log(data);
    // 判断是否是批量删除
    if (Array.isArray(data)) {
      list = data.map((item) => item.userId);
    } else {
      list = [data.userId];
    }
    handleRemove(list, type);
  };

  // 删除用户
  const handleRemove = async (list: PERSSIONAPI.UserListItem[], type?: string) => {
    const hide = message.loading('正在' + type);
    const { code } = await dUser(list);
    if (code === 0) {
      message.success('成功！');
      handleFinish();
    } else {
      message.error('失败！');
    }
    hide();
  };

  const columns: ProColumns<PERSSIONAPI.UserListItem>[] = [
    {
      title: '序号',
      dataIndex: 'index',
      valueType: 'indexBorder',
      width: 48,
    },
    {
      title: '账号',
      dataIndex: 'loginId',
      // hideInSearch: true
      search: {
        transform: (value) => {
          return value?.trim() || '';
        },
      },
    },
    {
      title: '名字',
      dataIndex: 'username',
      // hideInSearch: true
      search: {
        transform: (value) => {
          return value?.trim() || '';
        },
      },
    },
    {
      title: '联系方式',
      dataIndex: 'mobile',
      // hideInSearch: true
      search: {
        transform: (value) => {
          return value?.trim() || '';
        },
      },
    },
    {
      title: '邮箱e-mail',
      dataIndex: 'email',
      search: {
        transform: (value) => {
          return value?.trim() || '';
        },
      },
    },
    {
      title: '角色',
      dataIndex: 'roleName',
      hideInSearch: true,
      render: (_, row) => {
        return row.roleList.map((item) => item.name).join();
      },
    },
    {
      title: '创建时间',
      dataIndex: 'createDate',
      hideInSearch: true,
    },
    {
      title: '时间',
      dataIndex: 'time',
      hideInTable: true,
      valueType: 'dateTimeRange',
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
      title: '用户状态',
      dataIndex: 'userStatus',
      hideInSearch: true,
      render: (_, row) => {
        return <span>{row.userStatus === '1' ? '正常' : '停用'}</span>;
      },
    },
    {
      title: '操作',
      dataIndex: 'option',
      valueType: 'option',
      align: 'center',
      width: 280,
      render: (_, record) => (
        <Space size="middle">
          <ResetPsw key="ResetPsw" record={record} handleFinish={handleFinish}></ResetPsw>
          <UserIU key="UserU" isUpdate={true} record={record} handleFinish={handleFinish} />
          <Popconfirm
            key="delete"
            onConfirm={(e) => {
              handleOk(record, '停用');
              e?.stopPropagation();
            }}
            onCancel={(e) => {
              e?.stopPropagation();
            }}
            title={`确认停用吗?`}
          >
            <a
              onClick={(e) => {
                e?.stopPropagation();
              }}
            >
              停用
            </a>
          </Popconfirm>
          <RemoveConfirm key="RemoveConfirm" handleOk={handleOk} data={record} />
        </Space>
      ),
    },
  ];

  return (
    <>
      <ProTable<PERSSIONAPI.UserListItem, API.PageParams>
        headerTitle="用户列表"
        actionRef={actionRef}
        formRef={formRef}
        rowKey="userId"
        bordered
        // scroll={{ y: 500 }}
        search={{ labelWidth: 'auto' }}
        options={{ fullScreen: true }}
        request={getUserList}
        columns={columns}
        toolBarRender={() => [<UserIU key="UserI" handleFinish={handleFinish} />]}
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
            <RemoveConfirm
              key="RemoveConfirm"
              text="批量删除"
              handleOk={handleOk}
              data={selectedRows}
            />
          );
        }}
        rowSelection={{
          selectedRowKeys,
          onChange: (selectedRowKeys, selectedRows) => {
            setSelectedRowKeys(selectedRowKeys);
            setSelectedRows(selectedRows);
          },
        }}
      />
    </>
  );
};

export default User;
