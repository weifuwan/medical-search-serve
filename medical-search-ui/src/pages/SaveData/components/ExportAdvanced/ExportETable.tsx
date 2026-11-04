import React, { useEffect, useRef, useImperativeHandle, forwardRef, useState } from 'react';
import {
    ActionType,
    EditableFormInstance,
    EditableProTable,
    ProColumns,
    ProForm,
    ProFormInstance
} from '@ant-design/pro-components';

import RemoveConfirm from '@/components/JYRemoveConfirm';
import JYModal from '@/components/JYModal';
import SelectFieldContent, { RecordType } from '../SelectFieldContent';
import { Input } from 'antd';

export type DataSourceType = {
    fieldId: React.Key;
    tableName?: string;
    fieldName?: string;
    fieldContentDTOList?: RecordType[];
}
interface tableProps {
    ref?: any;
    eTableData: DataSourceType[];
    editableKeys: React.Key[];
    handleChange: (data: DataSourceType[]) => void
}

const FieldContent: React.FC<{
    value?: RecordType[];
    key?: React.Key;
    onChange?: (
        value: RecordType[] | string,
    ) => void;
    handleChange: () => void
}> = ({ value, key, onChange, handleChange }) => {
    const childRef = useRef()
    const [isModalOpen, setIsModalOpen] = useState(false)
    const handleCancel = () => {
        setIsModalOpen(false)
    }
    const handleOk = () => {
        const cRef: any = childRef?.current
        const data = cRef['selectData']
        onChange?.(data)
        handleChange()
        setIsModalOpen(false)
    }
    const inputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        onChange?.(e.target.value)
        handleChange()
    }
    return (
        <>
            <Input key={key} style={{ width: '70%', marginRight: 12 }}
                value={Array.isArray(value) ?
                    value?.map((item: RecordType) => item.title).join('、')
                    :
                    value
                }
                onChange={inputChange} />
            {/* <a onClick={() => setIsModalOpen(true)}>选择</a> */}
            {/* <div className="mle">{value?.map((item: RecordType) => item.title).join('、')}</div> */}
            <JYModal
                key={key}
                title="选择字段内容"
                width="60%"
                isModalOpen={isModalOpen}
                ChildNode={() => <SelectFieldContent ref={childRef} defaultTargetData={Array.isArray(value) ? value : []} />}
                handleCancel={handleCancel}
                handleOk={handleOk}
                maskClosable={false}
            />
        </>
    )
}

const ExportETable: React.FC<tableProps> = forwardRef((props, ref) => {
    const { eTableData, editableKeys, handleChange } = props
    const [selectList, setSelectList] = useState<React.Key[]>([])
    const formRef = useRef<ProFormInstance<any>>()
    const actionRef = useRef<ActionType>()
    const editorFormRef = useRef<EditableFormInstance<DataSourceType>>()

    const columns: ProColumns<DataSourceType>[] = [
        {
            title: '表名',
            dataIndex: 'tableName',
            tooltip: '只读，表名',
            width: '20%',
            readonly: true
        },
        {
            title: '字段名称',
            dataIndex: 'fieldName',
            tooltip: '只读，字段名称',
            width: '20%',
            readonly: true
        },
        {
            title: '字段内容',
            dataIndex: 'fieldContentDTOList',
            width: '30%',
            renderFormItem: (_, record) => {
                return <FieldContent key={record['record']?.fieldId} handleChange={() => {
                    const data = formRef.current?.getFieldValue('table')
                    handleChange(data)
                }} />
            }
        },
        {
            title: '操作',
            valueType: 'option',
            width: 100,
            align: 'center'
        },
    ]

    // 删除确认
    const handleOk = (key: React.Key) => {
        const tableData = formRef.current?.getFieldValue('table')
        const data = tableData.filter((item: DataSourceType) => item.fieldId !== key)
        handleChange(data)
    }
    // 获取校验通过后的数据
    const getTableData = () => {
        return formRef.current?.validateFieldsReturnFormatValue?.().then((values) => values['table'])
    }
    // 暴露获取表格数据方法
    useImperativeHandle(ref, () => ({
        getTableData: getTableData
    }))
    useEffect(() => {
        formRef.current?.setFieldValue('table', eTableData)
    }, [eTableData])

    return (
        <ProForm<{ table: DataSourceType[] }>
            formRef={formRef}
            submitter={false}
            onFinish={async (values) => { }}
        >
            <EditableProTable<DataSourceType>
                rowKey="fieldId"
                name="table"
                actionRef={actionRef}
                editableFormRef={editorFormRef}
                scroll={{ y: 420 }}
                maxLength={5}
                loading={false}
                columns={columns}
                recordCreatorProps={false}
                rowSelection={{
                    onChange: (_, list) => {
                        setSelectList(list.map(item => item.fieldId))
                    },
                }}
                tableAlertRender={({ selectedRowKeys, selectedRows, onCleanSelected }) => (
                    <span>
                        已选 {selectedRowKeys.length} 项
                        <a style={{ marginInlineStart: 8 }} onClick={onCleanSelected}>
                            取消选择
                        </a>
                    </span>
                )}
                tableAlertOptionRender={() => (
                    <a onClick={() => {
                        const list: DataSourceType[] = []
                        eTableData.forEach((item) => {
                            if (!selectList.includes(item.fieldId)) {
                                list.push(item)
                            }
                        })

                        handleChange(list)
                        actionRef.current?.reloadAndRest?.()
                    }}>
                        批量移除
                    </a>
                )}
                editable={{
                    type: 'multiple',
                    editableKeys: editableKeys,
                    actionRender: (row) => {
                        return [
                            <a onClick={() => handleOk(row.fieldId)}>移除</a>
                            // <RemoveConfirm key='RemoveConfirm' handleOk={handleOk} data={row.fieldId} />
                        ]
                    }
                }}
            />
        </ProForm>
    )
})

export default ExportETable;