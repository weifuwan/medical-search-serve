import { getRoleListSelect, getUserInfo, iUser, uUser } from '@/services/permissionManage/user';
import { LockOutlined, PlusOutlined } from '@ant-design/icons';
import {
  ModalForm,
  ProFormCheckbox,
  ProFormInstance,
  ProFormText,
} from '@ant-design/pro-components';
import { Button, Form, message } from 'antd';
import React, { useEffect, useRef } from 'react';

interface UserIUProps {
  isUpdate?: boolean;
  record?: PERSSIONAPI.UserListItem;
  handleFinish: () => void;
}

const UserIU: React.FC<UserIUProps> = (props) => {
  const { isUpdate = false, record, handleFinish } = props;
  const [form] = Form.useForm<PERSSIONAPI.UserListItem>();
  const formRef = useRef<ProFormInstance>();

  // 查询信息
  const handleInfo = async () => {
    const { code, data } = await getUserInfo({ id: record?.userId });
    if (code === 0) {
      data.roleIdList = data.roleList.map((item: PERSSIONAPI.RoleListItem) => item.id);
      formRef.current?.setFieldsValue(data);
    }
  };

  useEffect(() => {
    form.setFieldsValue({
      username: record?.userName,
    });
  }, [record]);

  // 新增修改
  const handleIU = async (values: PERSSIONAPI.UserListItem) => {
    values.id = isUpdate ? record?.userId : '';
    values.gender = 2;
    values.status = 1;
    const { code } = await (isUpdate ? uUser(values) : iUser(values));
    code === 0
      ? message.success('成功')
      : // message.error('失败')
        console.log('--');
    handleFinish();
  };

  return (
    <ModalForm<PERSSIONAPI.UserListItem>
      width={600}
      form={form}
      formRef={formRef}
      title={isUpdate ? '修改用户' : '新增用户'}
      trigger={
        isUpdate ? (
          <a
            onClick={() => {
              handleInfo();
            }}
          >
            修改
          </a>
        ) : (
          <Button type="primary">
            <PlusOutlined />
            新增
          </Button>
        )
      }
      autoFocusFirstInput
      modalProps={{
        destroyOnClose: true, // 会重置表单，如果是 initialValues，会重置到 initialValues 的值
        onOk: () => {},
        onCancel: () => {},
      }}
      submitTimeout={2000}
      onFinish={async (values) => {
        handleIU(values);
        return true; // 关闭模态框
      }}
    >
      <ProFormText
        name="loginId"
        label="账号"
        placeholder="请输入账号"
        rules={[
          {
            required: true,
            message: '请输入！',
          },
        ]}
      />
      <ProFormText
        name="username"
        label="名字"
        placeholder="请输入名字"
        rules={[
          {
            required: true,
            message: '请输入！',
          },
        ]}
      />

      {isUpdate ? (
        ''
      ) : (
        <ProFormText.Password
          name="password"
          label="密码"
          fieldProps={{
            prefix: <LockOutlined />,
          }}
          placeholder="请输入密码"
          rules={[
            {
              required: true,
              message: '请输入密码',
            },
          ]}
        />
      )}
      <ProFormText
        name="mobile"
        label="联系方式"
        placeholder="请输入名字"
        rules={[
          {
            required: false,
            message: '请输入！',
          },
        ]}
      />

      <ProFormText
        name="email"
        label="邮箱e-mail"
        placeholder="请输入邮箱"
        rules={[
          {
            required: false,
            message: '请输入！',
          },
        ]}
      />


      <ProFormCheckbox.Group
        name="roleIdList"
        label="角色"
        request={async () => {
          const { code, data } = await getRoleListSelect();
          if (code !== 0) return [];
          return data.map((item: any) => ({
            label: item.name,
            value: item.id,
          }));
        }}
        // rules={[
        //     {
        //         required: true,
        //         message: '请选择！',
        //     },
        // ]}
      />
    </ModalForm>
  );
};

export default UserIU;
