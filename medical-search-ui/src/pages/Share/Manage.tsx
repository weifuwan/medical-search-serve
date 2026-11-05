import React, { useCallback, useEffect, useState } from 'react';
import { history, useDispatch } from '@umijs/max';
import {
  Button,
  Card,
  Drawer,
  message,
  Popconfirm,
  Space,
  Table,
  Tabs,
  Tag,
  Tooltip,
  Typography,
} from 'antd';
import { ShareAltOutlined } from '@ant-design/icons';
import { setSessionVal } from '@/utils';
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
} from '@/services/expressionShare/api';

type ActiveTab = 'mine' | 'received' | 'favorites';

const ShareManage: React.FC = () => {
  const dispatch = useDispatch();
  const [tab, setTab] = useState<ActiveTab>('mine');
  const [shares, setShares] = useState<ShareItem[]>([]);
  const [favorites, setFavorites] = useState<FavoriteItem[]>([]);
  const [loading, setLoading] = useState(false);
  const [modalCode, setModalCode] = useState<string>();
  const [logs, setLogs] = useState<ShareLog[]>([]);
  const [logsVisible, setLogsVisible] = useState(false);

  const refresh = useCallback(async (active: ActiveTab = tab) => {
    setLoading(true);
    try {
      if (active === 'favorites') {
        const response = await getFavorites();
        if (response.code !== 0) throw new Error(response.msg || '加载收藏失败');
        setFavorites(response.data || []);
      } else {
        const response = active === 'mine' ? await getMyShares() : await getReceivedShares();
        if (response.code !== 0) throw new Error(response.msg || '加载分享失败');
        setShares(response.data || []);
      }
    } catch (error: any) {
      message.error(error.message || '加载失败');
    } finally {
      setLoading(false);
    }
  }, [tab]);

  useEffect(() => {
    refresh(tab);
  }, [tab, refresh]);

  const openShare = (item: ShareItem) => history.push('/share/' + item.code);

  const search = (expression: string) => {
    dispatch({ type: 'searchModel/reset' });
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
      refresh();
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
      refresh('favorites');
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
    { title: '名称', dataIndex: 'title' },
    { title: '检索表达式', dataIndex: 'expression', ellipsis: true },
    {
      title: '收藏时间',
      dataIndex: 'createdAt',
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

  return (
    <Card
      style={{ margin: 24 }}
      title={<Space><ShareAltOutlined />检索条件分享管理</Space>}
    >
      <Tabs
        activeKey={tab}
        onChange={(key) => setTab(key as ActiveTab)}
        tabBarExtraContent={<Button onClick={() => refresh()}>刷新</Button>}
      >
        <Tabs.TabPane tab="我创建的" key="mine" />
        <Tabs.TabPane tab="分享给我的" key="received" />
        <Tabs.TabPane tab="我的常用检索" key="favorites" />
      </Tabs>
      {tab === 'favorites' ? (
        <Table
          rowKey="id"
          loading={loading}
          dataSource={favorites}
          columns={favoriteColumns}
          pagination={{ pageSize: 10 }}
        />
      ) : (
        <Table
          rowKey="id"
          loading={loading}
          dataSource={shares}
          columns={shareColumns}
          pagination={{ pageSize: 10 }}
        />
      )}
      <ExpressionShareModal
        open={!!modalCode}
        code={modalCode}
        onClose={() => setModalCode(undefined)}
        onSaved={() => refresh('mine')}
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
