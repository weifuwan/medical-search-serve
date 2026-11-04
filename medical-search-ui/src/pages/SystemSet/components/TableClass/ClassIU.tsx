import React, { useRef } from 'react'
import {
    ModalForm,
    ProFormDigit,
    ProFormInstance,
    ProFormText,
} from '@ant-design/pro-components'
import { Button, Form, message } from 'antd'
import { PlusOutlined } from '@ant-design/icons';
import {
    getClassifyInfo,
    iClassify,
    uClassify
} from '@/services/systemSet/api'

interface UserIUProps {
    isUpdate?: boolean;
    record?: SYSTEMSET.ClassifyListItem;
    handleFinish: () => void;
}

const ClassIU: React.FC<UserIUProps> = (props) => {
    const { isUpdate = false, record, handleFinish } = props
    const [form] = Form.useForm<SYSTEMSET.ClassifyListItem>()
    const formRef = useRef<ProFormInstance>()

    // 查询信息
    const handleInfo = async () => {
        const { code, data } = await getClassifyInfo({ id: record?.id })
        if (code === 0) {
            formRef.current?.setFieldsValue(data)
        }
    }

    // 新增修改
    const handleIU = async (values: SYSTEMSET.ClassifyListItem) => {
        values.id = isUpdate ? record?.id : ''
        const { code } = await (isUpdate ? uClassify(values) : iClassify(values))
        code === 0 ?
            message.success('成功')
            :
            message.error('失败')
        handleFinish()
    }

    return (
        <ModalForm<SYSTEMSET.ClassifyListItem>
            width={600}
            form={form}
            formRef={formRef}
            title={isUpdate ? '修改' : '新增'}
            trigger={
                isUpdate ?
                    <a onClick={() => { handleInfo() }}>修改</a>
                    :
                    <Button type="primary">
                        <PlusOutlined />
                        新增
                    </Button>
            }
            autoFocusFirstInput
            modalProps={{
                destroyOnClose: true,// 会重置表单，如果是 initialValues，会重置到 initialValues 的值
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
                label="名称"
                placeholder="请输入名称"
                rules={[
                    {
                        required: true,
                        message: '请输入！',
                    },
                ]}
            />
            <ProFormDigit
                name="sort"
                label="排序"
                placeholder="请输入序号"
                rules={[
                    {
                        required: true,
                        message: '请输入！',
                    },
                ]}
            />
        </ModalForm>
    )
}

export default ClassIU