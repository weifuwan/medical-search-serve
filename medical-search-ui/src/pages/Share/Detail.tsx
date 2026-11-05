import React, { useEffect, useState } from 'react';
import { history, useDispatch, useParams } from '@umijs/max';
import {
  Alert,
  Button,
  Card,
  Input,
  message,
  Result,
  Space,
  Spin,
  Tag,
  Typography,
} from 'antd';
import { ShareAltOutlined, StarOutlined } from '@ant-design/icons';
import { setSessionVal } from '@/utils';
import ExpressionShareModal from '@/components/ExpressionShareModal';
import {
  copyShareToFavorite,
  getShare,
  updateShare,
} from '@/services/expressionShare/api';
import type { ShareInput, ShareItem } from '@/services/expressionShare/api';

const SharedExpression: React.FC = () => {
  const { code } = useParams<{ code: string }>();
  const dispatch = useDispatch();
  const [record, setRecord] = useState<ShareItem>();
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [editing, setEditing] = useState(false);
  const [title, setTitle] = useState('');
  const [expression, setExpression] = useState('');
  const [manageOpen, setManageOpen] = useState(false);

  const refresh = async () => {
    setLoading(true);
    try {
      const response = await getShare(code!);
      if (response.code !== 0 || !response.data) {
        throw new Error(response.msg || '分享不可访问');
      }
      setRecord(response.data);
      setTitle(response.data.title);
      setExpression(response.data.expression);
      setError('');
    } catch {
      setError('链接已过期、被撤销，或者当前账号没有访问权限');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (code) refresh();
  }, [code]);

  const search = () => {
    if (!record) return;
    dispatch({ type: 'searchModel/reset' });
    setSessionVal('searchVal', record.expression);
    setSessionVal('dimensionVal', 0);
    history.push('/home/searchList');
  };

  const save = async () => {
    if (!record) return;
    const input: ShareInput = {
      title,
      expression,
      version: record.version,
    };
    if (record.canManage) {
      input.scope = record.scope;
      input.permission = record.permission;
      input.userIds = record.userIds || [];
    }
    try {
      const response = await updateShare(record.code, input);
      if (response.code !== 0) {
        throw new Error(response.msg || '保存失败');
      }
      message.success('检索表达式已更新');
      setEditing(false);
      await refresh();
    } catch (error: any) {
      message.error(error.message || '保存失败，可能有其他协作者更新了内容，请刷新重试');
    }
  };

  const favorite = async () => {
    if (!record) return;
    try {
      const response = await copyShareToFavorite(record.code);
      if (response.code !== 0) {
        throw new Error(response.msg || '收藏失败');
      }
      message.success('已保存到我的常用检索');
    } catch {
      message.error('收藏失败');
    }
  };

  if (loading) {
    return <div style={{ padding: 72, textAlign: 'center' }}><Spin /></div>;
  }

  if (error || !record) {
    return (
      <Result
        status="403"
        title="无法访问分享"
        subTitle={error}
        extra={<Button onClick={() => history.push('/home/index')}>返回首页</Button>}
      />
    );
  }

  return (
    <div style={{ maxWidth: 850, margin: '36px auto', padding: '0 24px' }}>
      <Card
        title={<Space><ShareAltOutlined />共享检索条件</Space>}
        extra={
          <Tag color={record.status === 'ACTIVE' ? 'green' : 'default'}>
            {record.canManage ? '创建人' : record.canEdit ? '协作编辑' : '查看与检索'}
          </Tag>
        }
      >
        <Alert
          type="info"
          showIcon
          message="这里共享的是检索条件，不包含患者记录。检索结果会按照当前登录人的数据权限重新查询。"
          style={{ marginBottom: 24 }}
        />
        <Typography.Text type="secondary">检索名称</Typography.Text>
        {editing ? (
          <Input value={title} maxLength={120} onChange={(event) => setTitle(event.target.value)} />
        ) : (
          <Typography.Title level={4}>{record.title}</Typography.Title>
        )}
        <div style={{ margin: '16px 0 8px' }}>
          <Typography.Text type="secondary">检索表达式</Typography.Text>
        </div>
        {editing ? (
          <Input.TextArea
            rows={4}
            value={expression}
            onChange={(event) => setExpression(event.target.value)}
          />
        ) : (
          <div
            style={{
              background: '#f6f9f9',
              borderRadius: 8,
              padding: 16,
              wordBreak: 'break-all',
            }}
          >
            {record.expression}
          </div>
        )}
        <div style={{ color: '#888', margin: '16px 0' }}>
          有效期至 {record.expiresAt ? new Date(record.expiresAt).toLocaleString() : '—'}
        </div>
        <Space wrap>
          <Button type="primary" disabled={editing} onClick={search}>
            使用此条件检索
          </Button>
          <Button icon={<StarOutlined />} onClick={favorite}>
            保存到我的常用检索
          </Button>
          {record.canEdit && record.status === 'ACTIVE' && !editing && (
            <Button onClick={() => setEditing(true)}>编辑表达式</Button>
          )}
          {editing && <Button type="primary" onClick={save}>保存修改</Button>}
          {editing && (
            <Button
              onClick={() => {
                setEditing(false);
                setTitle(record.title);
                setExpression(record.expression);
              }}
            >
              取消
            </Button>
          )}
          {record.canManage && (
            <Button onClick={() => setManageOpen(true)}>管理分享权限</Button>
          )}
        </Space>
      </Card>
      <ExpressionShareModal
        open={manageOpen}
        code={record.code}
        onClose={() => setManageOpen(false)}
        onSaved={refresh}
      />
    </div>
  );
};

export default SharedExpression;
