import React, { useEffect, useState } from 'react';
import {
  Alert,
  Button,
  Form,
  Input,
  message,
  Modal,
  Radio,
  Select,
  Space,
  Typography,
} from 'antd';
import {
  createShare,
  getShare,
  getShareUsers,
  revokeShare,
  shareLink,
  updateShare,
} from '@/services/expressionShare/api';
import type { ShareInput, ShareItem, ShareUser } from '@/services/expressionShare/api';

interface Props {
  open: boolean;
  expression?: string;
  code?: string;
  onClose: () => void;
  onSaved?: () => void;
}

const ExpressionShareModal: React.FC<Props> = ({
  open,
  expression,
  code,
  onClose,
  onSaved,
}) => {
  const [form] = Form.useForm<ShareInput>();
  const [record, setRecord] = useState<ShareItem>();
  const [saving, setSaving] = useState(false);
  const [scope, setScope] = useState<'USERS' | 'HOSPITAL'>('USERS');
  const [users, setUsers] = useState<{ label: string; value: number }[]>([]);
  const [expirationChange, setExpirationChange] = useState<'KEEP' | 1 | 7 | 30>('KEEP');

  useEffect(() => {
    if (!open) return;

    form.resetFields();
    setRecord(undefined);
    setScope('USERS');
    setUsers([]);
    setExpirationChange('KEEP');
    form.setFieldsValue({
      title: expression ? expression.slice(0, 50) : '共享检索条件',
      expression: expression || '',
      scope: 'USERS',
      permission: 'READ',
      expiresInDays: 7,
      userIds: [],
    });

    if (code) {
      getShare(code)
        .then(({ code: resultCode, data, msg }) => {
          if (resultCode !== 0 || !data) {
            throw new Error(msg || '读取分享设置失败');
          }
          setRecord(data);
          setScope(data.scope);
          form.setFieldsValue({
            title: data.title,
            expression: data.expression,
            scope: data.scope,
            permission: data.permission,
            expiresInDays: undefined,
            userIds: data.userIds || [],
          });
          setUsers(
            (data.users || []).map((user: ShareUser) => ({
              value: user.userId,
              label: user.userName
                ? user.userName + ' (' + user.loginId + ')'
                : '用户 ' + user.userId,
            })),
          );
        })
        .catch((error) => message.error(error.message || '读取分享设置失败'));
    }
  }, [open, code, expression, form]);

  const searchUsers = async (keyword: string) => {
    if (keyword.trim().length < 2) return;
    try {
      const response = await getShareUsers(keyword);
      if (response.code !== 0) return;
      const selected: number[] = form.getFieldValue('userIds') || [];
      setUsers((previous) => {
        const retained = previous.filter((user) => selected.includes(user.value));
        const matched = (response.data || []).map((user: ShareUser) => ({
          value: user.userId,
          label: user.userName + ' (' + user.loginId + ')',
        }));
        return [
          ...retained,
          ...matched.filter((user) => !retained.some((item) => item.value === user.value)),
        ];
      });
    } catch {
      message.error('查询接收人员失败');
    }
  };

  const save = async () => {
    try {
      const values = await form.validateFields();
      if (values.scope === 'USERS' && !values.userIds?.length) {
        message.warning('请至少选择一位接收人员');
        return;
      }

      setSaving(true);
      const updateValues: ShareInput = {
        title: values.title,
        expression: values.expression,
        scope: values.scope,
        permission: values.permission,
        userIds: values.userIds,
        version: record?.version,
      };
      if (expirationChange !== 'KEEP') {
        updateValues.expiresInDays = expirationChange;
      }

      const response = record
        ? await updateShare(record.code, updateValues)
        : await createShare(values);

      if (response.code !== 0 || !response.data) {
        throw new Error(response.msg || '保存分享失败');
      }

      setRecord(response.data);
      setExpirationChange('KEEP');
      form.setFieldsValue({ expiresInDays: undefined });
      message.success(record ? '分享设置已更新' : '分享链接已创建');
      onSaved?.();
    } catch (error: any) {
      if (!error?.errorFields) {
        message.error(error.message || '保存分享失败');
      }
    } finally {
      setSaving(false);
    }
  };

  const copyLink = async () => {
    if (!record) return;
    try {
      await navigator.clipboard.writeText(shareLink(record.code));
      message.success('分享链接已复制');
    } catch {
      message.error('复制失败，请手动复制下方链接');
    }
  };

  const revoke = () => {
    if (!record) return;
    Modal.confirm({
      title: '确定撤销分享吗？',
      content: '撤销后，已经发送的链接会立即失效。',
      okText: '撤销分享',
      cancelText: '取消',
      onOk: async () => {
        const response = await revokeShare(record.code);
        if (response.code !== 0) {
          throw new Error(response.msg || '撤销失败');
        }
        message.success('分享已撤销');
        onSaved?.();
        onClose();
      },
    });
  };

  const canManage = !!record?.canManage && record.status === 'ACTIVE';

  return (
    <Modal
      visible={open}
      width={620}
      title={record ? '管理检索分享' : '分享检索条件'}
      onCancel={onClose}
      destroyOnClose
      footer={
        <Space>
          {canManage && (
            <Button danger onClick={revoke}>
              撤销分享
            </Button>
          )}
          <Button onClick={onClose}>关闭</Button>
          {record?.status === 'ACTIVE' && <Button onClick={copyLink}>复制链接</Button>}
          {(!record || canManage) && (
            <Button type="primary" loading={saving} onClick={save}>
              {record ? '保存设置' : '创建分享链接'}
            </Button>
          )}
        </Space>
      }
    >
      <Alert
        type="info"
        showIcon
        message="只分享检索表达式，不包含患者信息或检索结果。接收人需要登录，查询结果仍按各自的数据权限返回。"
        style={{ marginBottom: 16 }}
      />
      <Form form={form} layout="vertical">
        {record && (
          <Form.Item label="分享链接">
            <Input
              readOnly
              value={shareLink(record.code)}
              onClick={(event) => event.currentTarget.select()}
            />
          </Form.Item>
        )}
        <Form.Item
          name="title"
          label="分享名称"
          rules={[{ required: true, message: '请输入分享名称' }, { max: 120 }]}
        >
          <Input maxLength={120} disabled={!!record && !canManage} />
        </Form.Item>
        <Form.Item
          name="expression"
          label="检索表达式"
          rules={[{ required: true, message: '检索表达式不能为空' }]}
        >
          <Input.TextArea rows={3} maxLength={1200} disabled={!!record && !canManage} />
        </Form.Item>
        {(!record || canManage) && (
          <>
            <Form.Item name="scope" label="谁可以打开" rules={[{ required: true }]}>
              <Radio.Group onChange={(event) => setScope(event.target.value)}>
                <Radio value="USERS">指定人员</Radio>
                <Radio value="HOSPITAL">本院登录用户</Radio>
              </Radio.Group>
            </Form.Item>
            {scope === 'USERS' && (
              <Form.Item
                name="userIds"
                label="接收人员"
                rules={[{ required: true, message: '请选择接收人员' }]}
              >
                <Select
                  mode="multiple"
                  showSearch
                  filterOption={false}
                  onSearch={searchUsers}
                  options={users}
                  placeholder="输入至少两个字符，搜索姓名或账号"
                />
              </Form.Item>
            )}
            <Form.Item name="permission" label="允许的操作" rules={[{ required: true }]}>
              <Radio.Group>
                <Radio value="READ">查看与检索</Radio>
                <Radio value="EDIT">协作编辑表达式</Radio>
              </Radio.Group>
            </Form.Item>
            {!record ? (
              <Form.Item
                name="expiresInDays"
                label="有效期"
                rules={[{ required: true, message: '请选择有效期' }]}
              >
                <Select>
                  <Select.Option value={1}>1 天</Select.Option>
                  <Select.Option value={7}>7 天</Select.Option>
                  <Select.Option value={30}>30 天</Select.Option>
                </Select>
              </Form.Item>
            ) : (
              <>
                <Form.Item label="当前到期时间">
                  <Typography.Text strong>
                    {record.expiresAt
                      ? new Date(record.expiresAt).toLocaleString('zh-CN', { hour12: false })
                      : '未设置'}
                  </Typography.Text>
                </Form.Item>
                <Form.Item label="修改有效期">
                  <Select
                    value={expirationChange}
                    onChange={setExpirationChange}
                  >
                    <Select.Option value="KEEP">保持当前到期时间不变</Select.Option>
                    <Select.Option value={1}>从现在起重新计算 1 天</Select.Option>
                    <Select.Option value={7}>从现在起重新计算 7 天</Select.Option>
                    <Select.Option value={30}>从现在起重新计算 30 天</Select.Option>
                  </Select>
                </Form.Item>
              </>
            )}
          </>
        )}
      </Form>
      {record?.status === 'REVOKED' && (
        <Alert type="warning" showIcon message="该分享已撤销，无法再次使用。" />
      )}
    </Modal>
  );
};

export default ExpressionShareModal;
