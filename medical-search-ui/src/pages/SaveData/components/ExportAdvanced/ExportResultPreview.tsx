import React, { useEffect, useState } from 'react'
import { previewExport } from '@/services/saveData/api'
import { PaginationProps, Table } from 'antd'
import { ColumnsType } from 'antd/lib/table'

interface ExportResultPreviewProps {
    previewParams: SAVEDATAAPI.SeniorExport,
    handleReturnTotal: (tableTotal: number) => void
}

// 预览导出结果
const ExportResultPreview: React.FC<ExportResultPreviewProps> = (props) => {
    const { previewParams, handleReturnTotal } = props
    const [tableColumns, setTableColumns] = useState<ColumnsType<any>>([])
    const [tableData, setTableData] = useState([])
    const [page, setPage] = useState(1)
    const [size, setSize] = useState(10)
    const [tableTotal, setTableTotal] = useState(0)

    const requestParams = {
        id: previewParams.id,
        fieldDTOList: previewParams.fieldDTOList,
        page: (page - 1) || 0,
        size: size || 10
    }

    const defaultColumns: ColumnsType = [
        {
            title: '序号',
            dataIndex: 'tableId',
            fixed: 'left',
            width: 100
        },
    ]
    // 获取列表
    const getPreviewExportData = async () => {
        const { code, data } = await previewExport(requestParams)
        if (!code) {
            const columns = data.columnList.map((item: any, index: number) => (
                {
                    title: data.columnList.filter((child: any) => item.fieldName === child.fieldName).length > 1 ?
                        item.tableName + '.' + item.fieldName :
                        item.fieldName,
                    dataIndex: item.tableCode + '.' + item.fieldCode,
                    width: 120,
                    fixed: index === (data.columnList.length - 1) ? 'right' : '',
                }
            ))
            console.log(defaultColumns.concat(columns));

            setTableColumns(defaultColumns.concat(columns))

            const tableData: any = data.rows.map((item: any, index: number) => ({ tableId: index + 1 }))
            data.rows.map((item: any, index: number) => {
                for (const key in item) {
                    if (Array.isArray(item[key])) {
                        let kVal = ''
                        item[key].map((child: any) => {
                            for (const k in child) {
                                kVal = k
                            }
                        })
                        tableData[index][key + '.' + kVal] = item[key].map((child: any) => child[kVal]).join('、')
                    } else {
                        for (const k in item[key]) {
                            tableData[index][key + '.' + k] = item[key][k]
                        }
                    }
                }
            })
            handleReturnTotal(data.total)
            setTableTotal(data.total)
            setTableData(tableData)
        }
    }

    const pageChange: PaginationProps['onChange'] = (page, size) => {
        setPage(page)
        setSize(size)
    }

    useEffect(() => {
        getPreviewExportData()
    }, [previewParams.fieldDTOList, page, size])

    return (
        <Table
            bordered
            rowKey="tableId"
            dataSource={tableData}
            columns={tableColumns}
            scroll={{ x: '80%' }}
            pagination={{
                total: tableTotal,
                showSizeChanger: true,
                showQuickJumper: true,
                showTotal: (total) => `共 ${total} 条`,
                onChange: () => { pageChange }
            }} />
    )
}

export default ExportResultPreview
