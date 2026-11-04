import React, { useEffect, useRef, forwardRef, useState } from 'react';
import {
    ActionType,
    DragSortTable,
    ProColumns
} from '@ant-design/pro-components';

import RemoveConfirm from '@/components/JYRemoveConfirm';
import { sort } from '@/services/systemSet/api'
import { message } from 'antd';

export type DataSourceType = {
    fieldId?: string;
    resultFieldId: React.Key;
    selectField?: string;
    isDefault: number;
    sort: number;
}
interface tableProps {
    ref?: any;
    eTableData: DataSourceType[],
    handleChange: (data: String[]) => void
}

const TemplateETable: React.FC<tableProps> = forwardRef((props, ref) => {
    const { eTableData, handleChange } = props

    const [dataSource, setDataSource] = useState<DataSourceType[]>([])
    const [selectList, setSelectList] = useState<React.Key[]>([])
    const actionRef = useRef<ActionType>()

    const columns: ProColumns<DataSourceType>[] = [
        {
            title: '拖动排序',
            dataIndex: 'sort',
            width: 80,
            className: 'drag-visible',
        },
        {
            title: '已选字段',
            dataIndex: 'fieldName',
            tooltip: '只读，已选择的字段',
            width: '70%',
            readonly: true
        },
        {
            title: '操作',
            valueType: 'option',
            width: 100,
            render: (_, record) => (
                record.isDefault === 1 ?
                    []
                    :
                    [
                        <RemoveConfirm key='RemoveConfirm' text={'移除'} handleOk={handleOk} data={record} />
                    ]
            ),
        },
    ]

    // 删除确认
    const handleOk = (record: DataSourceType) => {
        const list: String[] = []
        list.push(record.resultFieldId as String)
        handleChange(list)
    }

    // 排序设置
    const handleDragSortEnd = (
        beforeIndex: number,
        afterIndex: number,
        newDataSource: any
    ) => {
        handleSort(newDataSource.map(((item: any, index: number) => ({
            id: item.resultFieldId,
            sort: index + 1
        }))))
        setDataSource(newDataSource)
    }

    // 重置
    const handleSort = async (data: any) => {
        const { code } = await sort(data)
        if (code === 0) {
            message.success('排序成功')
        }
    }

    useEffect(() => {
        setDataSource(eTableData)
    }, [eTableData])

    return (
        <DragSortTable<DataSourceType>
            name="table"
            rowKey="resultFieldId"
            dragSortKey="sort"
            actionRef={actionRef}
            columns={columns}
            dataSource={dataSource}
            onDragSortEnd={handleDragSortEnd}
            scroll={{ y: 520 }}
            loading={false}
            search={false}
            toolBarRender={false}
            pagination={false}
            rowSelection={{
                selectedRowKeys: selectList,
                getCheckboxProps: (record: DataSourceType) => ({
                    disabled: record.isDefault === 1,
                }),
                onChange: (_, list) => {
                    setSelectList(list.map(item => item.resultFieldId))
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
                    handleChange(selectList as String[])
                    actionRef.current?.reloadAndRest?.()
                }}>
                    批量移除
                </a>
            )}
        />
    )
})

export default TemplateETable;