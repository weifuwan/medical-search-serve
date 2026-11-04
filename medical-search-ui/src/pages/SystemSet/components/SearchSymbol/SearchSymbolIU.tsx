import React, { useRef } from 'react'
import {
    ModalForm,
    ProFormDigit,
    ProFormInstance,
    ProFormText,
} from '@ant-design/pro-components'
import { Button, Form, message } from 'antd'
import { PlusOutlined } from '@ant-design/icons'

import {
    getSearchSymbolInfo,
    iSearchSymbol,
    uSearchSymbol,
} from '@/services/systemSet/api'

interface SearchSymbolIUProps {
    isUpdate?: boolean
    record?: SYSTEMSET.SearchSymbolListItem
    handleFinish: () => void
}

const SearchSymbolIU: React.FC<SearchSymbolIUProps> = (props) => {
    const { isUpdate = false, record, handleFinish } = props

    const [form] = Form.useForm<SYSTEMSET.SearchSymbolListItem>()
    const formRef = useRef<ProFormInstance>()

    // 查询信息
    const handleInfo = async () => {
        const { code, data } = await getSearchSymbolInfo({ id: record?.id })

        if (code === 0) {
            formRef.current?.setFieldsValue(data)
        }
    }

    // 新增 / 修改
    const handleIU = async (values: SYSTEMSET.SearchSymbolListItem) => {
        values.id = isUpdate ? record?.id : ''

        const { code } = await (isUpdate
            ? uSearchSymbol(values)
            : iSearchSymbol(values))

        if (code === 0) {
            message.success('成功')
            handleFinish()
        } else {
            message.error('失败')
        }
    }

    return (
        <ModalForm<SYSTEMSET.SearchSymbolListItem>
            width={600}
            form={form}
            formRef={formRef}
            title={isUpdate ? '修改检索符号' : '新增检索符号'}
            trigger={
                isUpdate ? (
                    <a onClick={() => handleInfo()}>修改</a>
                ) : (
                    <Button type="primary">
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
                await handleIU(values)
                return true
            }}
        >
            <ProFormText
                name="symbolValue"
                label="符号值"
                placeholder="请输入符号值，例如：1、2、3"
                rules={[
                    {
                        required: true,
                        message: '请输入符号值！',
                    },
                ]}
            />

            <ProFormText
                name="symbolLabel"
                label="展示文本"
                placeholder="请输入展示文本，例如：AND、OR、≤、≥"
                rules={[
                    {
                        required: true,
                        message: '请输入展示文本！',
                    },
                ]}
            />

            <ProFormDigit
                name="sort"
                label="排序"
                placeholder="请输入排序"
                rules={[
                    {
                        required: true,
                        message: '请输入排序！',
                    },
                ]}
            />
        </ModalForm>
    )
}

export default SearchSymbolIU