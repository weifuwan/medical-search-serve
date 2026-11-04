import React, { useRef } from 'react'
import {
    ModalForm,
    ProFormInstance,
    ProFormSelect,
    ProFormText,
} from '@ant-design/pro-components'
import { Button, Form, message } from 'antd'
import { PlusOutlined } from '@ant-design/icons';
import {
    getPageClassify,
    getTableInfo,
    iTable,
    uTable
} from '@/services/fieldManage/table'

interface TableIUProps {
    isUpdate?: boolean;
    classifyId?: string;
    record?: TABLEORFIELDAPI.TableListItem;
    handleFinish: () => void;
}

const TableIU: React.FC<TableIUProps> = (props) => {
    const { isUpdate = false, classifyId, record, handleFinish } = props
    const [form] = Form.useForm<TABLEORFIELDAPI.TableListItem>()
    const formRef = useRef<ProFormInstance>()

    // 查询信息
    const handleInfo = async () => {
        const { code, data } = await getTableInfo({ id: record?.id })
        if (code === 0) {
            formRef.current?.setFieldsValue(data)
        }
    }

    // 新增修改
    const handleIU = async (values: TABLEORFIELDAPI.TableListItem) => {
        values.id = isUpdate ? record?.id : ''
        const { code } = await (isUpdate ? uTable(values) : iTable(values))
        code === 0 ?
            message.success('成功')
            :
            message.error('失败')
        handleFinish()
    }

    return (
        <ModalForm<TABLEORFIELDAPI.TableListItem>
            width={600}
            form={form}
            formRef={formRef}
            title={isUpdate ? '修改' : '新增'}
            trigger={
                isUpdate ?
                    <a onClick={(e) => {
                        handleInfo()
                        e.stopPropagation()
                    }}>修改</a>
                    :
                    <Button type="primary">
                        <PlusOutlined />
                    </Button>
            }
            autoFocusFirstInput
            modalProps={{
                destroyOnClose: true,// 会重置表单，如果是 initialValues，会重置到 initialValues 的值
                onOk: (e) => { e.stopPropagation() },
                onCancel: (e) => { e.stopPropagation() },
            }}
            submitTimeout={2000}
            onFinish={async (values) => {
                handleIU(values)
                return true // 关闭模态框
            }}
        >
            <ProFormSelect
                name="classifyId"
                label="分类"
                showSearch
                request={async () => {
                    const { code, data } = await getPageClassify({ page: 1, limit: 50 })
                    if (!code) {
                        return data.list.map((item: { name: string, id: string }) => ({
                            label: item.name,
                            value: item.id
                        }))
                    }
                }}
                placeholder="请选择"
                initialValue={classifyId}
                rules={[{ required: true, message: '分类不能为空!' }]}
            />
            <ProFormText
                name="tableName"
                label="表名"
                placeholder="请输入表名"
                rules={[
                    {
                        required: true,
                        message: '请输入！',
                    },
                ]}
            />
            {/* <ProFormText
                name="tableCode"
                label="代码"
                placeholder="请输入代码"
                rules={[
                    {
                        required: true,
                        message: '请输入！',
                    },
                ]}
            /> */}
        </ModalForm>
    )
}

export default TableIU