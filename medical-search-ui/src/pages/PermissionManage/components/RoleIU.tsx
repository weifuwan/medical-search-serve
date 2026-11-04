import { getPermissonData } from '@/utils';
import { PlusOutlined } from '@ant-design/icons';
import { ModalForm, ProFormInstance, ProFormText } from '@ant-design/pro-components';
import { Button, Form, message, Tree, TreeProps } from 'antd';
import React, { useRef, useState } from 'react';

import { getPermissionList } from '@/services/permissionManage/api';
import { getRoleInfo, iRole, uRole } from '@/services/permissionManage/role';

interface RoleIUProps {
  isUpdate?: boolean;
  record?: PERSSIONAPI.RoleListItem;
  handleFinish: () => void;
}

const RoleIU: React.FC<RoleIUProps> = (props) => {
  const { isUpdate = false, record, handleFinish } = props;
  const [form] = Form.useForm<PERSSIONAPI.RoleListItem>();
  const formRef = useRef<ProFormInstance>();

  const [treeData, setTreeData] = useState();
  // const [checkedKeys, setCheckedKeys] = useState<React.Key[]>([])

  // 查询所有权限
  const handlePermissionList = async () => {
    const { code, data } = await getPermissionList();
    if (code === 0) {
      setTreeData(getPermissonData(data));
    }
  };

  // 查询信息
  const handleInfo = async () => {
    const { code, data } = await getRoleInfo({ id: record?.id });
    if (code === 0) {
      formRef.current?.setFieldsValue(data);
      setCheckedKeys(data.menuIdList);
    }
  };

  // 新增修改
  const handleIU = async (values: PERSSIONAPI.RoleListItem) => {
    values.id = isUpdate ? record?.id : '';
    values.menuIdList = checkedKeys;
    const { code } = await (isUpdate ? uRole(values) : iRole(values));
    code === 0
      ? message.success('成功')
      : // message.error('失败')
        console.log('---');
    setCheckedKeys([]);
    handleFinish();
  };
  const [expandedKeys, setExpandedKeys] = useState<React.Key[]>(['0-0-0', '0-0-1']);
  const [checkedKeys, setCheckedKeys] = useState<React.Key[]>(['0-0-0']);
  const [selectedKeys, setSelectedKeys] = useState<React.Key[]>([]);
  const [autoExpandParent, setAutoExpandParent] = useState<boolean>(true);

  const onExpand: TreeProps['onExpand'] = (expandedKeysValue) => {
    console.log('onExpand', expandedKeysValue);
    // if not set autoExpandParent to false, if children expanded, parent can not collapse.
    // or, you can remove all expanded children keys.
    setExpandedKeys(expandedKeysValue);
    setAutoExpandParent(false);
  };

  const onCheck: TreeProps['onCheck'] = (checkedKeysValue) => {
    console.log('onCheck', checkedKeysValue);
    setCheckedKeys(checkedKeysValue as React.Key[]);
  };

  const onSelect: TreeProps['onSelect'] = (selectedKeysValue, info) => {
    console.log('onSelect', info);
    setSelectedKeys(selectedKeysValue);
  };
  return (
    <ModalForm
      width={600}
      form={form}
      formRef={formRef}
      title={isUpdate ? '修改角色' : '新增角色'}
      trigger={
        isUpdate ? (
          <a
            onClick={() => {
              handlePermissionList();
              handleInfo();
            }}
          >
            修改
          </a>
        ) : (
          <Button
            type="primary"
            onClick={() => {
              handlePermissionList();
            }}
          >
            <PlusOutlined />
            新增
          </Button>
        )
      }
      autoFocusFirstInput
      modalProps={{
        destroyOnClose: true,
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
        name="name"
        label="角色名称"
        placeholder="请输入角色名称"
        rules={[
          {
            required: true,
            message: '请输入！',
          },
        ]}
      />
      <Form.Item name="permission" label="权限">
        <Tree
          height={400}
          checkable
          onExpand={onExpand}
          expandedKeys={expandedKeys}
          autoExpandParent={autoExpandParent}
          onCheck={onCheck}
          checkedKeys={checkedKeys}
          onSelect={onSelect}
          selectedKeys={selectedKeys}
          treeData={treeData}
        />
      </Form.Item>
    </ModalForm>
  );
};

export default RoleIU;
