import { useLocation, useModel, useSelector } from '@umijs/max';
import { Button, Card, Col, message, Pagination, Radio, Row, Table, Tag, Tooltip } from 'antd';
import React, { useEffect, useState } from 'react';

import type { IndexModelState } from '@/models/searchModel';
import { PageContainer } from '@ant-design/pro-components';
import type { ColumnsType } from 'antd/lib/table';
import './index.less';
import SearchInput from './SearchInput';

import { findListByBatchType, getSearchListV2, queryEmr } from '@/services/home/api';
import { CloseOutlined, ShareAltOutlined } from '@ant-design/icons';
import SaveData from './SaveData';
import ExpressionShareModal from '@/components/ExpressionShareModal';
import { getSessionVal } from '@/utils';
import { clearActiveSearchTemplate, getActiveSearchTemplate } from '@/services/searchTemplate/searchConfig';
import type { ActiveSearchTemplate } from '@/services/searchTemplate/searchConfig';

interface DataType {
  empiID: string;
  attendanceID: string;
  attendanceNumber: number;
  name: string;
  sex: string;
  age: number;
  attendanceType: string;
  diagnoseOutpatientService: string;
  diagnoseInHospital: string;
  diagnoseDepartments: string;
  beHospitalizedDepartments: string;
  doctor: string;
  attendanceTime: string;
}

type CurrentUser = {
  loginId: string;
};

// 检索结果列表
const SearchList: React.FC = () => {
  const { initialState } = useModel('@@initialState');
  const { currentUser } = initialState!;
  const { loginId } = currentUser as CurrentUser;
  const location = useLocation();
  // const searchParams = ;
  const [searchParams, setSearchParams] = useState(
    new URLSearchParams(location.search).get('searchParams') || getSessionVal('searchVal') || '',
  );
  const [shareOpen, setShareOpen] = useState(false);
  const [activeTemplate, setActiveTemplate] = useState<ActiveSearchTemplate | null>(
    () => getActiveSearchTemplate(
      new URLSearchParams(location.search).get('searchParams') || getSessionVal('searchVal') || '',
    ),
  );
  const showUpdate = useSelector(
    (state: { searchModel: IndexModelState }) => state.searchModel.showUpdate,
  );
  const defaultDimension = useSelector(
    (state: { searchModel: IndexModelState }) => state.searchModel.dimension,
  );
  const [dimension, setDimension] = useState(activeTemplate?.config.dimension ?? defaultDimension); // 维度 0：人次  1： 人
  const [loading, setLoading] = useState(false); // 表格加载状态
  const [isShow360View, setIsShow360View] = useState(false);
  const [patientId, setPatientId] = useState('');
  // const [dictList, setDictList] = useState<any>()// 字典数据列表
  const [tableColumns, setTableColumns] = useState<ColumnsType<DataType>>([]); // 表格表头
  const [tableData, setTableData] = useState([]); // 表格数据
  const [tableIndex, setTableIndex] = useState(0); // 当前点击表格索引
  const [expandedRowKeys, setExpandedRowKeys] = useState<(string | number)[]>([]); // 当前展开的表格
  const [saveDataList, setSaveDataList] = useState<any>(); // 保存原始获取到的数据
  //   const [page, setPage] = useState(1);
  //   const [size, setSize] = useState(10);
  const [orderTableCode, setOrderTableCode] = useState(activeTemplate?.config.sort?.tableCode || '');
  const [orderFieldCode, setOrderFieldCode] = useState(activeTemplate?.config.sort?.fieldCode || '');
  const [orderMode, setOrderMode] = useState(activeTemplate?.config.sort?.mode || 'asc'); // 排序方式
  const [pagination, setPagination] = useState({
    current: 1,
    pageSize: activeTemplate?.config.pageSize || 10,
    total: 0,
  });
  const [viewMode, setViewMode] = useState<'TABLE' | 'CARD'>(
    activeTemplate?.config.viewMode || 'TABLE',
  );

  const [searchResults, setSearchResults] = useState([]);
  const [baseColumn, setBaseColunmns] = useState([]);

  const cardIdentityFields = new Set(['patient_name', 'patient_id', 'visit_no']);

  const getCardColumns = () =>
    (baseColumn as any[]).filter(
      (col) => col.dataIndex && col.dataIndex !== 'action' && !cardIdentityFields.has(col.dataIndex),
    );

  const [saveParams, setSaveParams] = useState<HOMEAPI.SaveDataParams>({
    // 保存当前检索参数
    amount: 0,
    dimension,
    expression: searchParams,
    orderTableCode,
    orderFieldCode,
    orderMode,
  });

  let dictList: any = null;

  const defaultColumns: ColumnsType<DataType> = [
    {
      title: '序号',
      dataIndex: 'tableId',
      width: 100,
      fixed: 'left',
    },
  ];

  const defaultActionColumns: ColumnsType<DataType> = [
    {
      title: '操作',
      dataIndex: 'action',
      fixed: 'right',
      width: 100,
      render: (_, record) => <a onClick={() => actionClick(1, record)}>查看</a>,
    },
  ];

  // 获取字典列表
  const getDictList = async () => {
    const { code, data } = await findListByBatchType([]);

    if (!code) {
      // setDictList(data)
      dictList = data;
    }
  };

  // 获取搜索列表
  const getSearchData = async (
    expression: string,
    dimension: number,
    current: number,
    pageSize: number,
  ) => {
    // if (!dictList) {
    //   getDictList();
    // }
    const paramsData = {
      dimension: dimension, // 人次：0  人：1
      expression: expression,
      templateId: activeTemplate?.id,
      page: current,
      size: pageSize,
      orderTableCode,
      orderFieldCode,
      orderMode,
    };
    console.log(paramsData);
    setLoading(true);
    setSaveParams((previous) => ({
      ...previous,
      amount: 0,
      dimension,
      expression,
      orderTableCode,
      orderFieldCode,
      orderMode,
    }));
    setTableIndex(0);
    setSaveDataList([]);
    setTableData([]);
    setExpandedRowKeys([]);
    const { code, data } = await getSearchListV2(paramsData);
    if (!code) {
      // 表头
      if (data?.result != null) {
        setSearchResults(data?.result);
        const bkColums = data?.columns || [];

        const fms = bkColums.map((col: any) => ({
          ...col,
          render: (text) => (
            <Tooltip placement="topLeft" title={text}>
              {text}
            </Tooltip>
          ),
          // 设置每一列的样式，使得内容不换行
          onCell: () => ({
            style: {
              whiteSpace: 'nowrap', // 禁用换行
              overflow: 'hidden', // 超出部分隐藏
              textOverflow: 'ellipsis', // 超出部分显示省略号
            },
          }),
        }));

        fms?.push({
          title: '操作',
          dataIndex: 'action',
          fixed: 'right',
          width: 100,
          render: (_, record) => <a onClick={() => actionClick(1, record)}>查看</a>,
        });
        setBaseColunmns(fms);

        setPagination({
          current: data?.pageNum,
          pageSize: data?.pageSize,
          total: data?.total,
        });
        setSaveParams((previous) => ({
          ...previous,
          amount: data?.total || 0,
          dimension,
          expression,
          orderTableCode,
          orderFieldCode,
          orderMode,
        }));
        setLoading(false);
      } else {
        setLoading(false);
        setSearchResults([]);
        setPagination({
          current: 0,
          pageSize,
          total: 0,
        });
        message.warn('没有查询到数据！');
      }
    }
    setLoading(false);
  };

  // 操作事件
  const actionClick = (num: number, record: any) => {
    switch (num) {
      case 1: // 查看
        setPatientId(record?.patient_id);

        const paramsData = {
          domainId: record?.visit_type,
          patientId: record?.patient_id,
          visitNo: record?.visit_no,
        };

        queryEmr(paramsData);
        setIsShow360View(true);
        break;
      default: // 关闭查看
        setIsShow360View(false);
    }
  };

  // 渲染动态子表
  const renderDynamicTables = (subTables) => {
    // Check if both columns and data exist and have content

    return subTables.map((subTable) => {
      const shouldRenderTable = subTable?.columns?.length > 0 && subTable?.data?.length > 0;
      
      if (!shouldRenderTable) {
        return <></>; // Return null to render nothing
      }
      return (
        <div key={subTable.key} style={{ marginBottom: '20px', padding: '8px 20px 0px 20px' }}>
          <div
            style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              marginBottom: 12,
            }}
          >
            <div
              style={{
                borderLeft: '3px solid #5664ff',
                paddingLeft: 8,
                fontSize: 14,
                lineHeight: 1,
              }}
            >
              {subTable.tableName}
            </div>
          </div>
          <Table
            //   columns={subTable.columns}
            className="jykj-custom-table-header"
            columns={
              subTable?.columns.map((col: any) => ({
                ...col,
                // 设置每一列的样式，使得内容不换行
                onCell: () => ({
                  style: {
                    whiteSpace: 'nowrap', // 禁用换行
                    overflow: 'hidden', // 超出部分隐藏
                    textOverflow: 'ellipsis', // 超出部分显示省略号
                  },
                }),
                render: (text) => (
                  <Tooltip placement="topLeft" title={text}>
                    <span
                    // style={{
                    //   whiteSpace: 'nowrap', // 禁用换行
                    //   overflow: 'hidden', // 超出部分隐藏
                    //   textOverflow: 'ellipsis', // 超出部分显示省略号
                    // }}
                    >
                      {text}
                    </span>
                  </Tooltip>
                ),
                sorter: (a, b) => {
                  // 动态获取字段名
                  const field = col.dataIndex;

                  const valueA = a[field];
                  const valueB = b[field];

                  if (col.column_type === 'number') {
                    return valueA - valueB;
                  }
                  if (col.column_type === 'text') {
                    if (valueA === undefined || valueA === null) {
                      return 1;
                    }
                    if (valueB === undefined || valueB === null) {
                      return 1;
                    }
                    return valueA.localeCompare(valueB);
                  }

                  if (col.column_type === 'date') {
                    // 将时间字符串转换为 Date 对象
                    const dateA = new Date(valueA);
                    const dateB = new Date(valueB);

                    // 检查是否是有效日期
                    if (isNaN(dateA.getTime()) || isNaN(dateB.getTime())) {
                      return 1;
                    }

                    // 比较时间
                    if (dateA < dateB) return -1;
                    if (dateA > dateB) return 1;
                  }
                  return 0;
                },
              })) || []
            }
            dataSource={subTable?.data}
            pagination={false}
            size="small"
            bordered
            scroll={{
              x: baseColumn.length > 5 ? 1200 : false, // 如果列数超过5列，则启用X轴滚动
              y: 500, // 设置Y轴滚动的最大高度（根据需要调整）
            }}
            //   title={() => `子表 - ${subTable.key}`}
          />
        </div>
      );
    });
  };

  // 展开行的渲染内容
  const expandedRowRender = (record) => {
    return <div>{renderDynamicTables(record?.jykj_subTables)}</div>;
  };

  const handleTemplateSelect = (template: ActiveSearchTemplate | null) => {
    setActiveTemplate(template);
    setViewMode(template?.config.viewMode || 'TABLE');
    setDimension(template?.config.dimension ?? 0);
    setOrderTableCode(template?.config.sort?.tableCode || '');
    setOrderFieldCode(template?.config.sort?.fieldCode || '');
    setOrderMode(template?.config.sort?.mode || 'asc');
    setPagination((current) => ({
      ...current,
      current: 1,
      pageSize: template?.config.pageSize || 10,
    }));
  };

  // 搜索词改变回调
  const handleSearchVal = (val: string, dimension: number) => {
    const params = {
      ...saveParams,
      expression: val,
      dimension: dimension,
    };

    setSearchParams(val);
    setDimension(dimension);
    setSaveParams(params);
    getSearchData(val, dimension, 1, pagination.pageSize);
  };

  const handleSearch = ({ pageNum = 1, pageSize = 10 }) => {
    if (searchParams.trim()) {
      setLoading(true); // 触发搜索状态
      getSearchData(searchParams, dimension, pageNum, pageSize);
    }
  };

  // 当页码或每页条数变化时触发
  const handleTableChange = (pagination: any) => {
    const { current, pageSize } = pagination;
    handleSearch({
      pageNum: current,
      pageSize: pageSize,
    }); // 请求数据
  };

  useEffect(() => {
    getSearchData(saveParams.expression, dimension, pagination.current, pagination.pageSize);
  }, []);

  // useEffect(() => {
  //   getSearchData(saveParams.expression, dimension, pagination.current, pagination.pageSize);
  // }, [pagination.current, pagination.pageSize]);

  // useUpdateEffect(() => {
  //     getSearchData(saveParams.expression, dimension, page)
  // }, [orderTableCode, orderFieldCode, orderMode])

  return (
    <PageContainer
      fixedHeader
      header={{
        onBack() {
          history.back();
        },
        breadcrumb: {},
      }}
    >
      <SearchInput
        size="small"
        isShowUpdateBtn={showUpdate}
        defaultSearchVal={searchParams}
        handleSearchVal={handleSearchVal}
        onTemplateSelect={handleTemplateSelect}
      />

      <div className="flx-justify-end" style={{ marginBottom: 12 }}>
        {activeTemplate && (
          <>
            <Tag color="blue">已应用模板参数</Tag>
            <Button
              type="link"
              size="small"
              onClick={() => {
                clearActiveSearchTemplate();
                handleTemplateSelect(null);
              }}
            >
              重置模板参数
            </Button>
          </>
        )}
        <Radio.Group
          style={{ marginRight: 12 }}
          size="small"
          optionType="button"
          buttonStyle="solid"
          value={viewMode}
          onChange={(event) => setViewMode(event.target.value)}
        >
          <Radio.Button value="TABLE">表格</Radio.Button>
          <Radio.Button value="CARD">卡片</Radio.Button>
        </Radio.Group>
        <Button
          style={{ marginRight: 12 }}
          icon={<ShareAltOutlined />}
          disabled={!searchParams.trim()}
          onClick={() => setShareOpen(true)}
        >
          分享检索
        </Button>
        <Tooltip title={activeTemplate?.config.scopeExpression
          ? '附加范围条件的检索暂不支持直接导出' : ''}>
          <span>
            <SaveData
              saveParams={saveParams}
              disabled={loading || !!activeTemplate?.config.scopeExpression}
            />
          </span>
        </Tooltip>
      </div>

      <div>
        {viewMode === 'CARD' ? (
          <>
            <Row gutter={[12, 12]}>
              {(searchResults as any[]).map((row, index) => {
                const identity = [row.patient_id, row.visit_no].filter(Boolean);
                const cardColumns = getCardColumns();

                return (
                  <Col key={row.key ?? index} xs={24} md={12} lg={8}>
                    <Card
                      size="small"
                      className="search-result-card"
                      title={
                        <div className="search-result-card-title">
                          {row.patient_name || row.visit_no || '就诊记录'}
                        </div>
                      }
                      extra={<a onClick={() => actionClick(1, row)}>查看</a>}
                    >
                      {identity.length > 0 && (
                        <div className="search-result-card-identity">
                          {identity.map((value, identityIndex) => (
                            <React.Fragment key={value}>
                              {identityIndex > 0 && <span className="search-result-card-dot">·</span>}
                              <span>{value}</span>
                            </React.Fragment>
                          ))}
                        </div>
                      )}

                      <div className="search-result-card-grid">
                        {cardColumns.map((col) => {
                          const value = row[col.dataIndex];
                          return (
                            <div className="search-result-card-field" key={col.dataIndex}>
                              <span className="search-result-card-label">{col.title}</span>
                              <Tooltip title={value == null || value === '' ? '—' : String(value)}>
                                <span className="search-result-card-value">
                                  {value == null || value === '' ? '—' : String(value)}
                                </span>
                              </Tooltip>
                            </div>
                          );
                        })}
                      </div>
                    </Card>
                  </Col>
                );
              })}
            </Row>
            <Pagination
              style={{ marginTop: 18, textAlign: 'right' }}
              current={pagination.current}
              pageSize={pagination.pageSize}
              total={pagination.total}
              showSizeChanger
              onChange={(page, size) => handleSearch({ pageNum: page, pageSize: size })}
              showTotal={(total) => `共 ${total} 条`}
            />
          </>
        ) : (
          <Table
          className="jykj-custom-table-header"
          // columns={baseColumn}
          columns={baseColumn}
          dataSource={searchResults}
          bordered
          loading={loading}
          expandable={{
            expandedRowRender: expandedRowRender,
            rowExpandable: (record) => true, // 所有行都可以展开
          }}
          onChange={handleTableChange} // 触发分页变化
          pagination={{
            current: pagination.current,
            pageSize: pagination.pageSize,
            total: pagination.total,
            showSizeChanger: true,
            showTotal: (total) => `共 ${total} 条`,
          }}
          scroll={{
            x: baseColumn.length > 5 ? 1200 : false, // 如果列数超过5列，则启用X轴滚动
            y: 550, // 设置Y轴滚动的最大高度（根据需要调整）
          }}
          // pagination={false}
          style={{ marginTop: '20px' }}
        />
        )}
      </div>
      {isShow360View ? (
        <iframe
          src={`http://10.10.102.41:8888/index.html#/query?patientId=${patientId}&organizationCode=001&userId=${loginId}&systemQuery=CDR`}
          style={{
            position: 'absolute',
            left: 0,
            top: 0,
            width: '100%',
            height: '100%',
            zIndex: 99999,
            backgroundColor: 'white',
          }}
        ></iframe>
      ) : (
        <></>
      )}
      {isShow360View ? (
        <Button
          style={{ position: 'absolute', right: 24, top: 24, zIndex: 99999 }}
          type="primary"
          shape="circle"
          icon={<CloseOutlined />}
          onClick={() => actionClick(2, '')}
        />
      ) : (
        <></>
      )}

      {/* {
                dimension ?
                    <Table
                        bordered
                        rowKey="tableId"
                        columns={tableColumns}
                        dataSource={tableData}
                        rowClassName={(record, index) => tableIndex === index ? styles.searchListSelectTable : ''}
                        expandable={{ expandedRowRender, expandedRowKeys, onExpand, expandRowByClick: true }}
                        loading={loading}
                        // scroll={{ y: 500 }}
                        scroll={{ x: '100%' }}
                        pagination={{
                            current: page,
                            pageSize: size,
                            total: tableTotal,
                            showSizeChanger: true,
                            showQuickJumper: true,
                            showTotal: (total) => `共 ${total} 条`,
                        }}
                        onChange={pageChange}
                    />
                    :
                    <Table
                        bordered
                        rowKey="tableId"
                        dataSource={tableData}
                        columns={tableColumns}
                        loading={loading}
                        // scroll={{ y: 500 }}
                        scroll={{ x: '100%' }}
                        pagination={{
                            current: page,
                            pageSize: size,
                            total: tableTotal,
                            showSizeChanger: true,
                            showQuickJumper: true,
                            showTotal: (total) => `共 ${total} 条`,
                        }}
                        onChange={pageChange}
                    />
            }
            {
                isShow360View ?
                    <iframe src={`http://10.10.102.41:8888/index.html#/query?patientId=${patientId}&organizationCode=001&userId=${username}&systemQuery=CDR`}
                        style={{ position: "absolute", left: 0, top: 0, width: '100%', height: '100%', zIndex: 99999, backgroundColor: 'white' }}>
                    </iframe>
                    :
                    <></>
            }
            {
                isShow360View ?
                    <Button style={{ position: "absolute", right: 24, top: 24, zIndex: 99999 }}
                        type="primary" shape="circle" icon={<CloseOutlined />} onClick={() => (actionClick(2, ''))} />
                    :
                    <></>
            } */}
      <ExpressionShareModal
        open={shareOpen}
        expression={searchParams}
        onClose={() => setShareOpen(false)}
      />
    </PageContainer>
  );
};

export default SearchList;
