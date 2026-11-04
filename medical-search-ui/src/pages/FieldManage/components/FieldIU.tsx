import React, { useRef } from 'react'
import {
    ModalForm,
    ProFormInstance,
    ProFormSelect,
    ProFormText,
} from '@ant-design/pro-components'
import { Button, Form, message } from 'antd'
import { PlusOutlined } from '@ant-design/icons';

import { getTableSelectList } from '@/services/fieldManage/table'
import {
    getFieldInfo,
    iField,
    uField
} from '@/services/fieldManage/field'

interface FieldIUProps {
    isUpdate?: boolean;
    tableId?: string | number;
    record?: TABLEORFIELDAPI.FieldListItem;
    handleFinish: () => void;
}

const FieldIU: React.FC<FieldIUProps> = (props) => {
    const { isUpdate = false, tableId, record, handleFinish } = props
    const [form] = Form.useForm<TABLEORFIELDAPI.FieldListItem>()
    const formRef = useRef<ProFormInstance>()

    // 查询信息
    const handleInfo = async () => {
        const { code, data } = await getFieldInfo({ id: record?.id })
        if (code === 0) {
            formRef.current?.setFieldsValue(data)
        }
    }

    // 新增修改
    const handleIU = async (values: TABLEORFIELDAPI.FieldListItem) => {
        values.id = isUpdate ? record?.id : ''
        const { code } = await (isUpdate ? uField(values) : iField(values))
        code === 0 ?
            message.success('成功')
            :
            message.error('失败')
        handleFinish()
    }

    return (
        <ModalForm
            width={600}
            form={form}
            formRef={formRef}
            title={isUpdate ? '修改' : '新增'}
            trigger={
                isUpdate ?
                    <a onClick={() => {
                        handleInfo()
                    }}>修改</a>
                    :
                    <Button type="primary">
                        <PlusOutlined />
                    </Button>
            }
            autoFocusFirstInput
            modalProps={{
                destroyOnClose: true,
                onOk: () => { },
                onCancel: () => { },
            }}
            submitTimeout={2000}
            onFinish={async (values) => {
                handleIU(values)
                return true // 关闭模态框
            }}
        >
            {/* <ProFormSelect
                name="tableId"
                label="表名"
                showSearch
                request={getTableSelectList}
                placeholder="请选择"
                initialValue={tableId}
                rules={[{ required: true, message: '表不能为空!' }]}
                fieldProps={{
                    fieldNames: {
                        label: 'tableName',
                        value: 'id'
                    }
                }}
            /> */}
            <ProFormText
                name="fieldName"
                label="字段名称"
                placeholder="请输入字段名称"
                rules={[
                    {
                        required: true,
                        message: '请输入！',
                    },
                ]}
            />
            <ProFormText
                name="remark"
                label="备注"
                placeholder="请输入备注"
                rules={[
                    {
                        // required: true,
                        message: '请输入！',
                    },
                ]}
            />
        </ModalForm>
    )
}

export default FieldIU