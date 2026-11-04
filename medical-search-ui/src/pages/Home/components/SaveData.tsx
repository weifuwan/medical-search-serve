import React, { useEffect, useRef } from 'react'
import { history } from '@umijs/max'
import {
    ModalForm,
    ProFormInstance,
    ProFormText,
} from '@ant-design/pro-components'
import { Button, Form, message } from 'antd'
import { saveData } from '@/services/home/api'
import { SaveOutlined } from '@ant-design/icons';
import { getSessionVal } from '@/utils'

interface SaveDataProps {
    saveParams: HOMEAPI.SaveDataParams;
    disabled?: boolean;
}

const SaveData: React.FC<SaveDataProps> = (props) => {
    const { saveParams, disabled } = props
    const [form] = Form.useForm()
    const formRef = useRef<ProFormInstance>()

    // 数据保存
    const handleIU = async (values: HOMEAPI.SaveDataParams) => {
        const paramsData = {
            ...saveParams,
            name: values['name'],
            remark: values['remark'],
            dimension: getSessionVal('dimensionVal')
        }
        const { code } = await saveData(paramsData)
        if (code) {
            message.error('失败')

        } else {
            message.success('成功')

            history.push(
                {
                    pathname: '/saveData',
                }
            )
        }
    }

    return (
        <ModalForm
            width={600}
            form={form}
            formRef={formRef}
            title={'数据保存'}
            trigger={
                <Button type='primary' disabled={disabled}>
                    数据保存
                    <SaveOutlined />
                </Button>}
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
            <ProFormText
                name="name"
                label="数据名称"
                placeholder="请输入数据名称"
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
            />
        </ModalForm>
    )
}

export default SaveData