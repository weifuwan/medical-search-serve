import React, { useRef } from 'react'
import {
    ModalForm,
    ProFormDependency,
    ProFormInstance,
    ProFormText,
} from '@ant-design/pro-components'
import { Form, message } from 'antd'
import {
    resetPsw
} from '@/services/permissionManage/user'

interface ResetPswProps {
    record?: PERSSIONAPI.ResetPswForm;
    handleFinish: () => void;
}

const ResetPsw: React.FC<ResetPswProps> = (props) => {
    const { record, handleFinish } = props
    const [form] = Form.useForm<PERSSIONAPI.ResetPswForm>()
    const formRef = useRef<ProFormInstance>()


    // 新增修改
    const handleIU = async (values: PERSSIONAPI.ResetPswForm) => {
        values.id = record?.userId
        const { code } = await resetPsw(values)
        code === 0 ?
            message.success('成功')
            :
            message.error('失败')
        handleFinish()
    }

    return (
        <ModalForm<PERSSIONAPI.ResetPswForm>
            width={600}
            form={form}
            formRef={formRef}
            title='重置密码'
            trigger={
                <a>重置密码</a>
            }
            autoFocusFirstInput
            modalProps={{
                destroyOnClose: true,// 会重置表单，如果是 initialValues，会重置到 initialValues 的值
                onOk: () => { },
                onCancel: () => { },
            }}
            submitTimeout={2000}
            onFinish={async (values) => {
                if (values['password'] !== values['againPassword']) {
                    message.error('两次输入不一致！')
                    return
                }
                handleIU(values)
                return true // 关闭模态框
            }}
        >
            <ProFormText.Password
                name="password"
                label="新密码"
                placeholder="请输入新密码"
                rules={[
                    {
                        required: true,
                        message: '请输入！',
                    },
                ]}
            />
            <ProFormDependency name={['password']}>
                    {({ password }) => {
                        return password && (
                            <ProFormText.Password
                                name="againPassword"
                                label="确认密码"
                                rules={[
                                    {
                                        required: true,
                                        message: '请输入！',
                                    },
                                ]}
                            />
                        )
                    }}
                </ProFormDependency>
        </ModalForm>
    )
}

export default ResetPsw