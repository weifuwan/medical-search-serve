import { ActionType, ProColumns, ProFormInstance, ProTable } from '@ant-design/pro-components';
import { message, Space } from 'antd';
import React, { useRef } from 'react';

import { dSearchSymbol, getSearchSymbolList } from '@/services/systemSet/api';

import RemoveConfirm from '@/components/JYRemoveConfirm';
import SearchSymbolIU from './SearchSymbolIU';

// 检索符号管理
const SearchSymbol: React.FC = () => {
  const actionRef = useRef<ActionType>();
  const formRef = useRef<ProFormInstance>();

  // 表格数据操作完成：新增/修改/删除...
  const handleFinish = () => {
    actionRef.current?.reloadAndRest?.();
  };

  // 删除确认
  const handleOk = (data: SYSTEMSET.SearchSymbolListItem | SYSTEMSET.SearchSymbolListItem[]) => {
    let list: any = null;

    // 判断是否是批量删除
    if (Array.isArray(data)) {
      list = data.map((item) => item.id);
    } else {
      list = [data.id];
    }

    handleRemove(list);
  };

  // 删除检索符号
  const handleRemove = async (list: any[]) => {
    const hide = message.loading('正在删除');

    const { code } = await dSearchSymbol(list);

    if (code === 0) {
      message.success('成功！');
      handleFinish();
    } else {
      message.error('失败！');
    }

    hide();
  };

  const columns: ProColumns<SYSTEMSET.SearchSymbolListItem>[] = [
    {
      title: '序号',
      dataIndex: 'index',
      valueType: 'indexBorder',
      width: 48,
    },
    {
      title: '符号值',
      dataIndex: 'symbolValue',
      search: {
        transform: (value) => {
          return value?.trim?.();
        },
      },
    },
    {
      title: '展示文本',
      dataIndex: 'symbolLabel',
      search: {
        transform: (value) => {
          return value?.trim?.();
        },
      },
    },
    {
      title: '排序',
      dataIndex: 'sort',
      width: 90,
      search: false,
    },
    {
      title: '创建时间',
      dataIndex: 'createDate',
      search: false,
    },
    {
      title: '操作',
      dataIndex: 'option',
      valueType: 'option',
      align: 'center',
      width: 150,
      render: (_, record) => (
        <>
          {!record.isDeleted ? (
            <Space size="middle">
              <SearchSymbolIU
                key="SearchSymbolU"
                isUpdate={true}
                record={record}
                handleFinish={handleFinish}
              />
              <RemoveConfirm key="RemoveConfirm" handleOk={handleOk} data={record} />
            </Space>
          ) : null}
        </>
      ),
    },
  ];

  return (
    <ProTable<SYSTEMSET.SearchSymbolListItem, API.PageParams>
      headerTitle="检索符号列表"
      actionRef={actionRef}
      formRef={formRef}
      rowKey="id"
      bordered
      scroll={{
        x: 900,
        y: 520,
      }}
      search={false}
      request={getSearchSymbolList}
      columns={columns}
      toolBarRender={() => [<SearchSymbolIU key="SearchSymbolI" handleFinish={handleFinish} />]}
    />
  );
};

export default SearchSymbol;
