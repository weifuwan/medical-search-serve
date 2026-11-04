import { DownOutlined, ExclamationCircleFilled, QuestionCircleOutlined } from '@ant-design/icons';
import { history, useDispatch, useModel } from '@umijs/max';
import { Button, Dropdown, message, Modal, notification, Space } from 'antd';
import React, { useEffect, useRef, useState } from 'react';

import { ActionType, PageContainer, ProColumns, ProTable } from '@ant-design/pro-components';

import JYModal from '@/components/JYModal';
import RemoveConfirm from '@/components/JYRemoveConfirm';
import {
  basicExport,
  dSaveData,
  getSaveDataList,
  seniorExport,
  udSaveData,
} from '@/services/saveData/api';
import { setSessionVal } from '@/utils';
import RecycledStation from './components/RecycledStation';

import { createContext } from 'react';
import ExportAdvanced from './components/ExportAdvanced';

const ReachableContext = createContext<string | null>(null);
const UnreachableContext = createContext<string | null>(null);

const config = {
  title: 'Use Hook!',
  content: (
    <>
      <ReachableContext.Consumer>{(name) => `Reachable: ${name}!`}</ReachableContext.Consumer>
      <br />
      <UnreachableContext.Consumer>{(name) => `Unreachable: ${name}!`}</UnreachableContext.Consumer>
    </>
  ),
};

const SaveData: React.FC = () => {
  const actionRef = useRef<ActionType>();
  const { confirm } = Modal;
  const { initialState } = useModel('@@initialState');
  const [selectedRows, setSelectedRows] = useState<SAVEDATAAPI.SaveDataListItem[]>([]);
  const [dataItemId, setDataItemId] = useState<string | number>('');
  const [fileName, setFileName] = useState('');
  const [isHasRecycledPermission, setIsHasRecycledPermission] = useState(false);
  const [isHasExportPermission, setIsHasExportPermission] = useState(false);
  const [isModalOpenRecycled, setIsModalOpenRecycled] = useState(false); // 回收站
  const [isModalOpenExport, setIsModalOpenExport] = useState(false); // 高级导出

  const dispatch = useDispatch();

  const fetchPermission = async () => {
    if (!initialState) {
      return;
    }
    const { permissionList } = initialState;
    const fatherP = permissionList?.filter((item) => item.url == '/saveData')[0];
    const recycledP = fatherP['children'].filter(
      (child: any) => child.url == 'export/exportrecyclebin',
    );
    const exportP = fatherP['children'].filter((child: any) => child.url == 'export/exportrecord');
    setIsHasRecycledPermission(recycledP.length > 0);
    setIsHasExportPermission(exportP.length > 0);
  };

  // 表格数据操作完成：新增/修改/删除...
  const handleFinish = () => {
    actionRef.current?.reloadAndRest?.();
  };

  // 删除确认
  const handleRemoveOk = (data: SAVEDATAAPI.SaveDataListItem | SAVEDATAAPI.SaveDataListItem[]) => {
    let list: any = null;
    // 判断是否是批量删除
    if (Array.isArray(data)) {
      list = data.map((item) => item.id);
    } else {
      list = [data.id];
    }
    handleRemove(list);
  };

  // 删除
  const handleRemove = async (list: SAVEDATAAPI.SaveDataListItem[]) => {
    const hide = message.loading('正在删除');
    const { code } = await dSaveData(list);
    if (code === 0) {
      message.success('成功！');
      handleFinish();
    } else {
      message.error('失败！');
    }
    hide();
  };

  // 升级/降级
  const handleUDSaveData = async (id: string | number, dimension: number) => {
    const paramsData: SAVEDATAAPI.SaveDataUD = {
      id,
      dimension,
    };
    const { code } = await udSaveData(paramsData);
    if (code === 0) {
      message.success('成功！');
      handleFinish();
    } else {
      message.error('失败！');
    }
    Modal.destroyAll();
  };

  // 打开通知
  const key = 'importNoticeKey';
  const openNotification = (record: SAVEDATAAPI.SaveDataListItem) => {
    let minute = '';
    if (record.amount <= 5000) {
      minute = '1';
    } else if (record.amount > 5000 && record.amount < 10000) {
      minute = '2';
    } else {
      minute = '3~5';
    }
    const args = {
      key,
      message: '导出提示',
      description: '导出预计耗时' + minute + '分钟，前往导出记录中查看并下载',
      duration: 0,
    };
    notification.info(args);
  };

  // 基本导出
  const handleBasicExport = async (record: SAVEDATAAPI.SaveDataListItem) => {
    const paramsData = {
      id: record.id,
    };
    const { code } = await basicExport(paramsData);
    if (code === 0) {
      openNotification(record);
      message.success('成功');
    }
    // if (res.headers['content-type'] == 'application/json' || res.data.code === 500) {
    //     message.error(res.data.msg)
    //     return
    // }
    // exportFun(res, () => {
    //     notification.close(key)
    //     message.success('成功')
    // })
  };

  const handleSeniorExport = async (record: SAVEDATAAPI.SaveDataListItem) => {
    const paramsData = {
      id: record.id,
      fieldDTOList: [],
    };
    const { code } = await seniorExport(paramsData);
    if (code === 0) {
      openNotification(record);
      message.success('成功');
    }
    // if (res.headers['content-type'] == 'application/json' || res.data.code === 500) {
    //     message.error(res.data.msg)
    //     return
    // }
    // exportFun(res, () => {
    //     notification.close(key)
    //     message.success('成功')
    // })
  };

  const showConfirm = (call: any) => {
    confirm({
      title: '确认导出?',
      icon: <ExclamationCircleFilled />,
      content: '',
      onOk() {
        call();
      },
      onCancel() {},
    });
  };

  // 操作事件
  const actionClick = (num: number, record: SAVEDATAAPI.SaveDataListItem) => {
    switch (num) {
      case 1: // 查看
        setSessionVal('searchVal', record.expression);
        setSessionVal('dimensionVal', record.dimension);
        dispatch({
          type: 'searchModel/update',
          payload: { showUpdate: true, dimension: record.dimension },
        });
        history.push({
          pathname: '/home/searchList',
          search: `?searchParams=${record.expression}`,
        });
        break;
      case 2: // 升级、降级
        confirm({
          title: (record.dimension ? '降级' : '升级') + '确认',
          icon: <QuestionCircleOutlined />,
          content: '确认' + (record.dimension ? '降级吗？' : '升级吗？'),
          okText: '确认',
          cancelText: '取消',
          onOk: () => handleUDSaveData(record.id, record.dimension ? 0 : 1),
        });

        break;
      case 3: // 基本导出
        if (record.amount > 5000) {
          confirm({
            title: '导出确认',
            icon: <QuestionCircleOutlined />,
            content: '只导出基础数据，数据量超过 5000，是否确认要导出？',
            okText: '确认',
            cancelText: '取消',
            onOk: () => handleBasicExport(record),
          });
        } else {
          confirm({
            title: '导出确认',
            icon: <QuestionCircleOutlined />,
            content: '只导出基础数据！',
            okText: '确认',
            cancelText: '取消',
            onOk: () => handleBasicExport(record),
          });
        }

        break;
      default: // 高级导出
        if (record.amount > 5000) {
          confirm({
            title: '导出确认',
            icon: <QuestionCircleOutlined />,
            content: '将导出全部表数据，数据量超过 5000，是否确认要导出？',
            okText: '确认',
            cancelText: '取消',
            onOk: () => handleSeniorExport(record),
          });
        } else {
          confirm({
            title: '导出确认',
            icon: <QuestionCircleOutlined />,
            content: '将导出全部表数据！',
            okText: '确认',
            cancelText: '取消',
            onOk: () => handleSeniorExport(record),
          });
        }
    }
  };

  // 回收站模态框回调
  const handleCancelRecycled = () => {
    setIsModalOpenRecycled(false);
  };
  // 高级导出模态框回调
  const handleCancelExport = () => {
    setIsModalOpenExport(false);
  };

  const getItems = (record: SAVEDATAAPI.SaveDataListItem) => {
    return [
      { key: 1, label: '查看' },
      // { key: 2, label: record.dimension ? '降级' : '升级' },
      { key: 3, label: '基本导出' },
      { key: 4, label: '高级导出' },
    ];
  };
  const columns: ProColumns<SAVEDATAAPI.SaveDataListItem>[] = [
    {
      title: '序号',
      dataIndex: 'index',
      valueType: 'indexBorder',
      width: 48,
    },
    {
      title: '数据名称',
      dataIndex: 'name',
      ellipsis: true,
    },
    // {
    //     title: '数据维度',
    //     dataIndex: 'dimension',
    //     hideInSearch: true,
    //     render: (_, record) => (<span>{record['dimension'] ? '人' : '人次'}</span>)
    // },
    {
      title: '人数',
      dataIndex: 'amount',
      hideInSearch: true,
    },
    {
      title: '数据检索结果',
      dataIndex: 'expression',
      hideInSearch: true,
      ellipsis: true,
    },
    {
      title: '备注',
      dataIndex: 'remark',
      hideInSearch: true,
    },
    {
      title: '更新时间',
      dataIndex: 'updateDate',
      hideInSearch: true,
    },
    {
      title: '时间',
      dataIndex: 'time',
      hideInTable: true,
      valueType: 'dateRange',
      search: {
        transform: (value) => {
          return {
            startTime: value[0],
            endTime: value[1],
          };
        },
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
          <RemoveConfirm key="RemoveConfirm" handleOk={handleRemoveOk} data={record} />
          <Dropdown
            menu={{
              items: getItems(record),
              onClick: (e) => actionClick(parseInt(e.key), record),
            }}
          >
            <a>
              更多
              <DownOutlined />
            </a>
          </Dropdown>
        </Space>
      ),
    },
  ];

  useEffect(() => {
    fetchPermission();
  }, []);

  const [modal, contextHolder] = Modal.useModal();

  return (
    <PageContainer breadcrumb={{}} fixedHeader>
      <ProTable<SAVEDATAAPI.SaveDataListItem, API.PageParams>
        headerTitle="数据保存列表"
        actionRef={actionRef}
        rowKey="id"
        bordered
        // scroll={{ y: 500 }}
        search={{ labelWidth: 'auto' }}
        options={{ fullScreen: true }}
        request={getSaveDataList}
        columns={columns}
        toolBarRender={() => [
          <Button
            key="recycled"
            title={!isHasRecycledPermission ? '暂无权限' : ''}
            disabled={!isHasRecycledPermission}
            onClick={() => {
              setIsModalOpenRecycled(true);
            }}
          >
            回收站
          </Button>,
          <Button
            key="exportRecord"
            title={!isHasExportPermission ? '暂无权限' : ''}
            disabled={!isHasExportPermission}
            onClick={() => {
              history.push('/saveData/exportRecord');
            }}
          >
            导出记录
          </Button>,
          // <Button
          //   type="primary"
          //   key="insert"
          //   onClick={() => {
          //     dispatch({ type: "searchModel/update", payload: { showUpdate: false } })
          //     history.push('/home/searchList')
          //   }}
          // >
          //   <PlusOutlined /> 新增
          // </Button>,
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
            <RemoveConfirm
              key="RemoveConfirm"
              text="批量删除"
              handleOk={handleRemoveOk}
              data={selectedRows}
            />
          );
        }}
        rowSelection={{
          onChange: (_, list) => {
            setSelectedRows(list);
          },
        }}
      />

      <JYModal
        title="回收站(保存)"
        width="80%"
        isModalOpen={isModalOpenRecycled}
        ChildNode={() => <RecycledStation handleFinish={handleFinish} />}
        handleCancel={handleCancelRecycled}
        footer={null}
        maskClosable={false}
      />

      {/* <JYModal
        title="高级导出"
        width="500px"
        footer={null}
        maskClosable={false}
        isModalOpen={isModalOpenExport}
        centered={true}
        handleCancel={handleCancelExport}
        ChildNode={() => (
          <div
            onClick={() => {
              handleCancelExport();
            }}
          >
            <Button>导出</Button>
          </div>
        )}
      /> */}
    </PageContainer>
  );
};

export default SaveData;
