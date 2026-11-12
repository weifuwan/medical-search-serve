import React, { useCallback, useEffect, useRef, useState } from 'react';
import { history, useDispatch } from '@umijs/max';
import {
  Button,
  Card,
  Drawer,
  Input,
  message,
  Popconfirm,
  Select,
  Space,
  Table,
  Tabs,
  Tag,
  Tooltip,
  Typography,
} from 'antd';
import { ShareAltOutlined } from '@ant-design/icons';
import { setSessionVal } from '@/utils';
import { clearActiveSearchTemplate } from '@/services/searchTemplate/searchConfig';
import ExpressionShareModal from '@/components/ExpressionShareModal';
import {
  deleteFavorite,
  getFavorites,
  getMyShares,
  getReceivedShares,
  getShareUsage,
  revokeShare,
  shareLink,
} from '@/services/expressionShare/api';
import type {
  FavoriteItem,
  ShareItem,
  ShareLog,
  SharePageQuery,
} from '@/services/expressionShare/api';

type ActiveTab = 'mine' | 'received' | 'favorites';
type QueryState = Record<ActiveTab, SharePageQuery>;

const createDefaultQueries = (): QueryState => ({
  mine: {
    pageNum: 1,
    pageSize: 10,
    keyword: '',
    sortField: 'updatedAt',
    sortOrder: 'DESC',
    status: 'ALL',
    scope: 'ALL',
    permission: 'ALL',
  },
  received: {
    pageNum: 1,
    pageSize: 10,
    keyword: '',
    sortField: 'updatedAt',
    sortOrder: 'DESC',
    scope: 'ALL',
    permission: 'ALL',
  },
  favorites: {
    pageNum: 1,
    pageSize: 10,
    keyword: '',
    sortField: 'createdAt',
    sortOrder: 'DESC',
    source: 'ALL',
  },
});

const ShareManage: React.FC = () => {
  const dispatch = useDispatch();
  const [tab, setTab] = useState<ActiveTab>('mine');
  const [queries, setQueries] = useState<QueryState>(createDefaultQueries);
  const [searchInputs, setSearchInputs] = useState<Record<ActiveTab, string>>({
    mine: '',
    received: '',
    favorites: '',
  });
  const [shares, setShares] = useState<ShareItem[]>([]);
  const [favorites, setFavorites] = useState<FavoriteItem[]>([]);
  const [totals, setTotals] = useState<Record<ActiveTab, number>>({
    mine: 0,
    received: 0,
    favorites: 0,
  });
  const [loading, setLoading] = useState(false);
  const [modalCode, setModalCode] = useState<string>();
  const [logs, setLogs] = useState<ShareLog[]>([]);
  const [logsVisible, setLogsVisible] = useState(false);
  const requestIdRef = useRef(0);

  const activeQuery = queries[tab];

  const refresh = useCallback(async (active: ActiveTab, params: SharePageQuery) => {
    const requestId = ++requestIdRef.current;
    setLoading(true);
    try {
      const response = active === 'mine'
        ? await getMyShares(params)
        : active === 'received'
          ? await getReceivedShares(params)
          : await getFavorites(params);

      if (requestId !== requestIdRef.current) return;
      if (response.code !== 0) {
        throw new Error(response.msg || '加载失败');
      }

      const page = response.data;
      setTotals((current) => ({ ...current, [active]: page.total || 0 }));

      if (page.records.length === 0 && page.total > 0 && params.pageNum > 1) {
        const lastPage = Math.max(1, Math.ceil(page.total / params.pageSize));
        if (lastPage < params.pageNum) {
          setQueries((current) => ({
            ...current,
            [active]: { ...current[active], pageNum: lastPage },
          }));
          return;
        }
      }

      if (active === 'favorites') {
        setFavorites(page.records as FavoriteItem[]);
      } else {
        setShares(page.records as ShareItem[]);
      }
    } catch (error: any) {
      if (requestId === requestIdRef.current) {
        message.error(error.message || '加载失败');
      }
    } finally {
      if (requestId === requestIdRef.current) {
        setLoading(false);
      }
    }
  }, []);

  useEffect(() => {
    refresh(tab, activeQuery);
  }, [tab, activeQuery, refresh]);

  const updateQuery = (active: ActiveTab, patch: Partial<SharePageQuery>) => {
    setQueries((current) => ({
      ...current,
      [active]: {
        ...current[active],
        ...patch,
        pageNum: 1,
      },
    }));
  };

  const handleSearch = () => {
    updateQuery(tab, { keyword: searchInputs[tab].trim() });
  };

  const handleSortChange = (value: string) => {
    const [sortField, sortOrder] = value.split(':');
    updateQuery(tab, {
      sortField,
      sortOrder: sortOrder as 'ASC' | 'DESC',
    });
  };

  const handleTableChange = (pagination: any) => {
    setQueries((current) => ({
      ...current,
      [tab]: {
        ...current[tab],
        pageNum: pagination.current || 1,
        pageSize: pagination.pageSize || current[tab].pageSize,
      },
    }));
  };

  const openShare = (item: ShareItem) => history.push('/share/' + item.code);

  const search = (expression: string) => {
    dispatch({ type: 'searchModel/reset' });
    clearActiveSearchTemplate();
    setSessionVal('searchVal', expression);
    setSessionVal('dimensionVal', 0);
    history.push('/home/searchList');
  };

  const copyLink = async (item: ShareItem) => {
    try {
      await navigator.clipboard.writeText(shareLink(item.code));
      message.success('分享链接已复制');
    } catch {
      message.error('复制失败');
    }
  };

  const revoke = async (item: ShareItem) => {
    try {
      const response = await revokeShare(item.code);
      if (response.code !== 0) throw new Error(response.msg || '撤销失败');
      message.success('分享已撤销');
      refresh('mine', queries.mine);
    } catch (error: any) {
      message.error(error.message || '撤销失败');
    }
  };

  const showUsage = async (item: ShareItem) => {
    try {
      const response = await getShareUsage(item.code);
      if (response.code !== 0) throw new Error(response.msg || '读取访问记录失败');
      setLogs(response.data || []);
      setLogsVisible(true);
    } catch (error: any) {
      message.error(error.message || '读取访问记录失败');
    }
  };

  const removeFavorite = async (id: string) => {
    try {
      const response = await deleteFavorite(id);
      if (response.code !== 0) throw new Error(response.msg || '取消收藏失败');
      message.success('已取消收藏');
      refresh('favorites', queries.favorites);
    } catch (error: any) {
      message.error(error.message || '取消收藏失败');
    }
  };

  const shareColumns = [
    {
      title: '名称',
      dataIndex: 'title',
      ellipsis: true,
      render: (value: string, item: ShareItem) => <a onClick={() => openShare(item)}>{value}</a>,
    },
    {
      title: '检索表达式',
      dataIndex: 'expression',
      ellipsis: true,
      render: (value: string) => (
        <Tooltip title={value}>
          <Typography.Text ellipsis style={{ maxWidth: 260 }}>{value}</Typography.Text>
        </Tooltip>
      ),
    },
    {
      title: '范围',
      dataIndex: 'scope',
      width: 100,
      render: (value: string) => value === 'HOSPITAL' ? '本院' : '指定人员',
    },
    {
      title: '权限',
      dataIndex: 'permission',
      width: 110,
      render: (value: string) => value === 'EDIT' ? '协作编辑' : '查看检索',
    },
    {
      title: '状态',
      dataIndex: 'status',
      width: 100,
      render: (_: any, item: ShareItem) => {
        if (item.status === 'REVOKED') return <Tag>已撤销</Tag>;
        if (new Date(item.expiresAt).getTime() <= Date.now()) return <Tag>已过期</Tag>;
        return <Tag color="green">有效</Tag>;
      },
    },
    {
      title: '操作',
      dataIndex: 'actions',
      width: 280,
      render: (_: any, item: ShareItem) => {
        const active = item.status === 'ACTIVE' && new Date(item.expiresAt).getTime() > Date.now();
        return (
          <Space size="small">
            <a onClick={() => openShare(item)}>打开</a>
            {active && <a onClick={() => copyLink(item)}>复制链接</a>}
            {item.canManage && item.status === 'ACTIVE' && (
              <a onClick={() => setModalCode(item.code)}>管理</a>
            )}
            {item.canManage && <a onClick={() => showUsage(item)}>记录</a>}
            {item.canManage && item.status === 'ACTIVE' && (
              <Popconfirm
                title="撤销后链接立即失效，确定撤销？"
                onConfirm={() => revoke(item)}
              >
                <a style={{ color: '#cf1322' }}>撤销</a>
              </Popconfirm>
            )}
          </Space>
        );
      },
    },
  ];

  const favoriteColumns = [
    { title: '名称', dataIndex: 'title', ellipsis: true },
    { title: '检索表达式', dataIndex: 'expression', ellipsis: true },
    {
      title: '来源',
      dataIndex: 'originShareId',
      width: 110,
      render: (value?: string) => value ? <Tag color="blue">分享收藏</Tag> : <Tag>自主收藏</Tag>,
    },
    {
      title: '收藏时间',
      dataIndex: 'createdAt',
      width: 180,
      render: (value: string) => value ? new Date(value).toLocaleString() : '',
    },
    {
      title: '操作',
      render: (_: any, item: FavoriteItem) => (
        <Space>
          <a onClick={() => search(item.expression)}>检索</a>
          <Popconfirm title="确定取消收藏？" onConfirm={() => removeFavorite(item.id)}>
            <a>取消收藏</a>
          </Popconfirm>
        </Space>
      ),
    },
  ];

  const sortOptions = tab === 'mine'
    ? [
        { value: 'updatedAt:DESC', label: '最近更新' },
        { value: 'createdAt:DESC', label: '最新创建' },
        { value: 'expiresAt:ASC', label: '即将到期' },
        { value: 'title:ASC', label: '名称升序' },
      ]
    : tab === 'received'
      ? [
          { value: 'updatedAt:DESC', label: '最近更新' },
          { value: 'createdAt:DESC', label: '最新创建' },
          { value: 'title:ASC', label: '名称升序' },
        ]
      : [
          { value: 'createdAt:DESC', label: '最近收藏' },
          { value: 'createdAt:ASC', label: '最早收藏' },
          { value: 'title:ASC', label: '名称升序' },
          { value: 'title:DESC', label: '名称降序' },
        ];

  const pagination = {
    current: activeQuery.pageNum,
    pageSize: activeQuery.pageSize,
    total: totals[tab],
    showSizeChanger: true,
    pageSizeOptions: ['10', '20', '50', '100'],
    showTotal: (total: number) => '共 ' + total + ' 条',
  };

  return (
    <Card
      style={{ margin: 24 }}
      title={<Space><ShareAltOutlined />检索条件分享管理</Space>}
    >
      <Tabs
        activeKey={tab}
        onChange={(key) => setTab(key as ActiveTab)}
        tabBarExtraContent={<Button onClick={() => refresh(tab, activeQuery)}>刷新</Button>}
      >
        <Tabs.TabPane tab="我创建的" key="mine" />
        <Tabs.TabPane tab="分享给我的" key="received" />
        <Tabs.TabPane tab="我的常用检索" key="favorites" />
      </Tabs>

      <div style={{ display: 'flex', justifyContent: 'space-between', gap: 12, flexWrap: 'wrap', marginBottom: 16 }}>
        <Space size="middle" wrap>
          <Input.Search
            allowClear
            value={searchInputs[tab]}
            placeholder="搜索名称或检索表达式"
            style={{ width: 280 }}
            enterButton="搜索"
            onChange={(event) => setSearchInputs((current) => ({
              ...current,
              [tab]: event.target.value,
            }))}
            onSearch={handleSearch}
          />

          {tab === 'mine' && (
            <>
              <Select
                value={activeQuery.status || 'ALL'}
                style={{ width: 120 }}
                onChange={(value) => updateQuery(tab, { status: value })}
                options={[
                  { value: 'ALL', label: '全部状态' },
                  { value: 'ACTIVE', label: '有效' },
                  { value: 'EXPIRED', label: '已过期' },
                  { value: 'REVOKED', label: '已撤销' },
                ]}
              />
              <Select
                value={activeQuery.scope || 'ALL'}
                style={{ width: 120 }}
                onChange={(value) => updateQuery(tab, { scope: value })}
                options={[
                  { value: 'ALL', label: '全部范围' },
                  { value: 'HOSPITAL', label: '本院' },
                  { value: 'USERS', label: '指定人员' },
                ]}
              />
              <Select
                value={activeQuery.permission || 'ALL'}
                style={{ width: 130 }}
                onChange={(value) => updateQuery(tab, { permission: value })}
                options={[
                  { value: 'ALL', label: '全部权限' },
                  { value: 'READ', label: '查看检索' },
                  { value: 'EDIT', label: '协作编辑' },
                ]}
              />
            </>
          )}

          {tab === 'received' && (
            <>
              <Select
                value={activeQuery.scope || 'ALL'}
                style={{ width: 120 }}
                onChange={(value) => updateQuery(tab, { scope: value })}
                options={[
                  { value: 'ALL', label: '全部范围' },
                  { value: 'HOSPITAL', label: '本院' },
                  { value: 'USERS', label: '指定人员' },
                ]}
              />
              <Select
                value={activeQuery.permission || 'ALL'}
                style={{ width: 130 }}
                onChange={(value) => updateQuery(tab, { permission: value })}
                options={[
                  { value: 'ALL', label: '全部权限' },
                  { value: 'READ', label: '查看检索' },
                  { value: 'EDIT', label: '协作编辑' },
                ]}
              />
            </>
          )}

          {tab === 'favorites' && (
            <Select
              value={activeQuery.source || 'ALL'}
              style={{ width: 130 }}
              onChange={(value) => updateQuery(tab, { source: value })}
              options={[
                { value: 'ALL', label: '全部来源' },
                { value: 'SELF', label: '自主收藏' },
                { value: 'SHARED', label: '分享收藏' },
              ]}
            />
          )}
        </Space>

        <Select
          value={activeQuery.sortField + ':' + activeQuery.sortOrder}
          style={{ width: 140 }}
          onChange={handleSortChange}
          options={sortOptions}
        />
      </div>

      {tab === 'favorites' ? (
        <Table<FavoriteItem>
          rowKey="id"
          loading={loading}
          dataSource={favorites}
          columns={favoriteColumns}
          pagination={pagination}
          onChange={handleTableChange}
        />
      ) : (
        <Table<ShareItem>
          rowKey="id"
          loading={loading}
          dataSource={shares}
          columns={shareColumns}
          pagination={pagination}
          onChange={handleTableChange}
        />
      )}

      <ExpressionShareModal
        open={!!modalCode}
        code={modalCode}
        onClose={() => setModalCode(undefined)}
        onSaved={() => refresh('mine', queries.mine)}
      />

      <Drawer
        visible={logsVisible}
        onClose={() => setLogsVisible(false)}
        title="最近访问记录"
        width={540}
      >
        <Table
          rowKey={(_, index) => String(index)}
          dataSource={logs}
          pagination={{ pageSize: 10 }}
          columns={[
            { title: '用户', dataIndex: 'userName', render: (name: string, item: ShareLog) => name || item.userId },
            { title: '操作', dataIndex: 'action' },
            {
              title: '时间',
              dataIndex: 'createdAt',
              render: (value: string) => value ? new Date(value).toLocaleString() : '',
            },
          ]}
        />
      </Drawer>
    </Card>
  );
};

export default ShareManage;
