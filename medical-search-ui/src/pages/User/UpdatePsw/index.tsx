import React from 'react'
import { history } from '@umijs/max'
import { message, Space } from 'antd'
import {
    ProForm,
    ProFormDependency,
    ProFormText,
} from '@ant-design/pro-components'
import { uPsw } from '@/services/updatePsw/api'
import styles from './index.less'



// 修改密码
const UpdatePsw: React.FC = () => {


    const loginPath = '/user/login'
    const handleUpdatePsw = async (values: UPDATEPSW.SaveForm) => {
        const { code } = await uPsw(values)
        if (code === 0) {
            message.success('修改成功,请重新登录')
            localStorage.clear()
            history.replace({
                pathname: loginPath,
            })
        }
    }

    

     
    return (

        <div className={styles.proFormCenter}>
            <ProForm<UPDATEPSW.SaveForm>
                autoFocusFirstInput
                submitter={{
                    render: (_, dom) => <div style={{ textAlign: 'right' }}><Space>{dom}</Space></div>,
                }}
                onFinish={async (values) => {
                    if (values['newPassword'] !== values['againPassword']) {
                        message.error('两次输入不一致！')
                        return
                    }
                    handleUpdatePsw(values)
                }}
            >
                <ProFormText
                    name="password"
                    label="原密码"
                    allowClear
                    rules={[
                        {
                            required: true,
                            message: '请输入！',
                        },
                    ]}
                />
                <ProFormText.Password
                    name="newPassword"
                    label="新密码"
                    allowClear
                    rules={[
                        {
                            required: true,
                            message: '请输入！',
                        },
                    ]}
                />
                <ProFormDependency name={['newPassword']} >
                    {({ newPassword }) => {
                        return newPassword && (
                            <ProFormText.Password
                                name="againPassword"
                                label="确认密码"
                                allowClear
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
            </ProForm>
        </div>
    )
}

export default UpdatePsw;