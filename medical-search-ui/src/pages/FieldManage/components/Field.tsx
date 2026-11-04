import { ActionType, ProColumns, ProFormInstance, ProTable } from '@ant-design/pro-components';
import { useUpdateEffect } from 'ahooks';
import { message, Space, Switch } from 'antd';
import React, { useRef, useState } from 'react';

import RemoveConfirm from '@/components/JYRemoveConfirm';
import { dField, getFieldSelectList, switchShowFields } from '@/services/fieldManage/field';
import FieldIU from './FieldIU';

interface FieldProps {
  tableId: string | number;
  tableName: string | number;
}

// 角色管理
const Field: React.FC<FieldProps> = (props) => {
  const { tableId, tableName = '' } = props;
  const actionRef = useRef<ActionType>();
  const formRef = useRef<ProFormInstance>();
  const [loading, setLoading] = useState(false);
  const [dataSource, setDataSource] = useState<TABLEORFIELDAPI.FieldListItem[]>([]);
  const [selectedRows, setSelectedRows] = useState<TABLEORFIELDAPI.FieldListItem[]>([]);
  const [fieldName, setFieldName] = useState('');

  // 获取表格数据
  const getTableData = async () => {
    if (!tableId) return;
    const paramsData = {
      tableId,
      fieldName,
    };
    setLoading(true);
    const { code, data } = await getFieldSelectList(paramsData);
    if (code === 0) {
      setDataSource(data);
      setLoading(false);
    }
  };

  // 表格数据操作完成：新增/修改/删除...
  const handleFinish = () => {
    if (!tableId) return;
    getTableData();
  };

  // 删除
  const handleRemove = async (list: TABLEORFIELDAPI.FieldListItem[]) => {
    const hide = message.loading('正在删除');
    const { code } = await dField(list);
    if (code === 0) {
      message.success('成功！');
      actionRef.current?.reloadAndRest?.();
    } else {
      message.error('失败！');
    }
    hide();
  };

  // 删除确认
  const handleOk = (data: TABLEORFIELDAPI.FieldListItem | TABLEORFIELDAPI.FieldListItem[]) => {
    let list: any = null;
    // 判断是否是批量删除
    if (Array.isArray(data)) {
      list = data.map((item) => item.id);
    } else {
      list = [data.id];
    }
    handleRemove(list);
  };

  const columns: ProColumns<TABLEORFIELDAPI.FieldListItem>[] = [
    {
      title: '序号',
      dataIndex: 'index',
      valueType: 'indexBorder',
      width: 48,
    },
    {
      title: '字段名',
      dataIndex: 'fieldName',
    },
    {
      title: '代码',
      dataIndex: 'fieldCode',
    },
    {
      title: '备注',
      dataIndex: 'remark',
    },
    {
      title: '创建时间',
      dataIndex: 'createDate',
    },
    {
      title: '创建者',
      dataIndex: 'creatorName',
    },
    {
      title: '更新时间',
      dataIndex: 'updateDate',
    },
    {
      title: '更新者',
      dataIndex: 'updaterName',
    },
    {
      title: '是否展示',
      dataIndex: 'isShow',
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
                    tableCode: record?.tableCode,
                    fieldCode: record?.fieldCode,
                  };
                  setLoading(true);
                  const { code, data } = await switchShowFields(paramsData);
                  if (code === 0) {
                    handleFinish();
                    setLoading(false);
                  } else {
                    setLoading(false);
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
      width: 120,
      render: (_, record) => (
        <Space size="middle">
          <FieldIU key="FieldU" isUpdate={true} record={record} handleFinish={handleFinish} />
          {/* <RemoveConfirm key='RemoveConfirm' handleOk={handleOk} data={record} /> */}
        </Space>
      ),
    },
  ];

  useUpdateEffect(() => {
    actionRef.current?.reset?.();
    setFieldName('');
    getTableData();
  }, [tableId]);

  useUpdateEffect(() => {
    getTableData();
  }, [fieldName]);

  return (
    <>
      <ProTable<TABLEORFIELDAPI.FieldListItem, API.PageParams>
        style={{ flex: 1, width: 0 }}
        headerTitle={tableName + (tableName ? '：' : '') + '字段列表'}
        actionRef={actionRef}
        formRef={formRef}
        rowKey="id"
        bordered
        scroll={{ y: 656 }}
        search={false}
        options={{
          search: {
            placeholder: '请输入字段名',
            onSearch(keyword) {
              setFieldName(keyword.trim());
              return true;
            },
          },
          density: false,
          reload: false,
          setting: false,
        }}
        loading={loading}
        // request={getFieldList}
        columns={columns}
        dataSource={dataSource}
        // toolBarRender={() => [<FieldIU key="FieldI" tableId={tableId} handleFinish={handleFinish} />]}
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
        // rowSelection={{
        //     onChange: (_, list) => {
        //         setSelectedRows(list);
        //     },
        // }}
        pagination={false}
      />
    </>
  );
};

export default Field;
