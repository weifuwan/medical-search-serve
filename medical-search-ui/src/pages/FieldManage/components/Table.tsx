import { ActionType, ProColumns, ProFormInstance, ProTable } from '@ant-design/pro-components';
import { message, Space, Switch } from 'antd';
import React, { useEffect, useRef, useState } from 'react';

import {
  dTable,
  getPageClassify,
  getTableList,
  getTableSelectList,
  switchShowTable,
} from '@/services/fieldManage/table';
import '../index.less';
import statys from '../index.less';
import TableIU from './TableIU';

interface TableProps {
  handleSelectTable: (tableId: string | number, tableName: string) => void;
}

// 表管理
const Table: React.FC<TableProps> = (props) => {
  const { handleSelectTable } = props;
  const actionRef = useRef<ActionType>();
  const formRef = useRef<ProFormInstance>();
  const [selectedRows, setSelectedRows] = useState<TABLEORFIELDAPI.TableListItem[]>([]);
  const [tableList, setTableList] = useState([]);
  const [tableId, setTableId] = useState<string | number>('');

  // 获取下拉 表数据
  const getTableSelectListData = async (classifyId: string) => {
    const paramsData = {
      classifyId,
    };
    const data = await getTableSelectList(paramsData);
    setTableList(
      data.map((item: { tableName: string }) => ({
        label: item.tableName,
        value: item.tableName,
      })),
    );
  };

  // 表格数据操作完成：新增/修改/删除...
  const handleFinish = () => {
    actionRef.current?.reload?.();
  };

  // 删除
  const handleRemove = async (list: TABLEORFIELDAPI.TableListItem[]) => {
    const hide = message.loading('正在删除');
    const { code } = await dTable(list);
    if (code === 0) {
      message.success('成功！');
      handleFinish();
    } else {
      message.error('失败！');
    }
    hide();
  };
  // 删除确认
  const handleOk = (data: TABLEORFIELDAPI.TableListItem | TABLEORFIELDAPI.TableListItem[]) => {
    let list: any = null;
    // 判断是否是批量删除
    if (Array.isArray(data)) {
      list = data.map((item) => item.id);
    } else {
      list = [data.id];
    }
    handleRemove(list);
  };

  const columns: ProColumns<TABLEORFIELDAPI.TableListItem>[] = [
    {
      title: <span style={{ padding: '0 4px' }}>表 分 类</span>,
      dataIndex: 'classifyId',
      valueType: 'select',
      hideInTable: true,
      fieldProps: {
        showSearch: true,
        className: statys.select,
        onChange: (val: string) => {
          getTableSelectListData(val);
        },
      },
      request: async () => {
        const params = {
          page: 1,
          limit: 50,
        };
        const { code, data } = await getPageClassify(params);
        if (!code) {
          return data.list.map((item: { name: string; id: string }) => ({
            label: item.name,
            value: item.id,
          }));
        }
      },
    },
    {
      title: '表名',
      dataIndex: 'tableName',
      valueType: 'select',
      fieldProps: {
        showSearch: true,
        className: statys.select,
        options: tableList,
      },
    },
    {
      title: '是否展示',
      dataIndex: 'isShow',
      width: 80,
      hideInSearch: true,
      render: (_, record) => {
        return (
          <>
            <span>
              <Switch
                checkedChildren="展示"
                unCheckedChildren="隐藏"
                checked={record?.isShow}
                onChange={async (value) => {
                  const paramsData = {
                    isShow: value,
                    tableId: record.id,
                  };
                  const { code } = await switchShowTable(paramsData);
                  if (code === 0) {
                    message.success('成功');
                    handleFinish();
                  }
                }}
              />
            </span>
          </>
        );
      },
    },
    {
      title: '操作',
      dataIndex: 'option',
      valueType: 'option',
      align: 'center',
      width: 80,
      render: (_, record) => (
        <Space size="middle">
          <TableIU key="TableU" isUpdate={true} record={record} handleFinish={handleFinish} />
          {/* <RemoveConfirm key='RemoveConfirm' handleOk={handleOk} data={record} /> */}
        </Space>
      ),
    },
  ];

  useEffect(() => {
    getTableSelectListData('');
  }, []);

  return (
    <div style={{ border: '1px solid rgb(239, 242, 246)' }}>
      <ProTable<TABLEORFIELDAPI.TableListItem, TABLEORFIELDAPI.PageParams>
        style={{ width: 480 }}
        headerTitle="表列表"
        actionRef={actionRef}
        formRef={formRef}
        rowKey="id"
        // bordered
        scroll={{ y: 600 }}
        // search={false}
        search={{
          filterType: 'light',
        }}
        options={false}
        onLoad={(data) => {
          if (!tableId && data?.length) {
            setTableId(data[0]?.id!);
            handleSelectTable(data[0]?.id!, data[0]?.tableName);
          }
        }}
        pagination={{
          defaultPageSize: 10,
          showSizeChanger: true,
          pageSizeOptions: [10, 20, 50, 100],
        }}
        request={getTableList}
        columns={columns}
        rowClassName={(record) => {
          return record.id == tableId ? statys.clickTableRowCla : '';
        }}
        onRow={(record) => {
          return {
            onClick: () => {
              if (!record.id) return;
              setTableId(record.id);
              handleSelectTable(record.id, record.tableName);
            },
          };
        }}
      />
    </div>
  );
};

export default Table;
