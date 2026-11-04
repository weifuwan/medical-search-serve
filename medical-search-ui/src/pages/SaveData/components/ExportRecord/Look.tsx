import React, { useEffect, useState } from 'react'
import { lookExportRecord } from '@/services/saveData/exportRecord'
import { PaginationProps, Table } from 'antd'
import { ColumnsType } from 'antd/lib/table'

interface LookProps {
    id: string | number;
}

// 查看导出记录
const Look: React.FC<LookProps> = (props) => {
    const { id } = props
    const [tableColumns, setTableColumns] = useState<ColumnsType<any>>([])
    const [tableData, setTableData] = useState([])
    const [page, setPage] = useState(1)
    const [size, setSize] = useState(10)

    const defaultColumns: ColumnsType = [
        {
            title: '序号',
            dataIndex: 'tableId',
            width: 80
        },
    ]
    // 获取列表
    const getLookExportRecordData = async () => {
        const requestParams = {
            id: id,
            page: (page - 1) || 0,
            size: size || 10
        }
        const { code, data } = await lookExportRecord(requestParams)
        if (!code) {
            const columns = data.columnList.map((item: any, index: number) => (
                {
                    title: data.columnList.filter((child: any) => item.fieldName === child.fieldName).length > 1 ?
                        item.tableName + '.' + item.fieldName :
                        item.fieldName,
                    dataIndex: item.fieldCode,
                    width: 120,
                    fixed: index === 0 ? 'left' : (index === (data.columnList.length - 1)) ? 'right' : '',
                    ellipsis: true
                }
            ))
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
                        tableData[index][kVal] = item[key].map((child: any) => child[kVal]).join('、')
                    } else {
                        for (const k in item[key]) {
                            tableData[index][k] = item[key][k] ? item[key][k] : ''
                        }
                    }
                }
            })
            setTableData(tableData)
        }
    }

    const pageChange: PaginationProps['onChange'] = (page, size) => {
        setPage(page)
        setSize(size)
    }

    useEffect(() => {
        getLookExportRecordData()
    }, [id, page, size])

    return (
        <Table
            bordered
            rowKey="tableId"
            dataSource={tableData}
            columns={tableColumns}
            scroll={{ x: '80%' }}
            pagination={{
                total: tableData.length,
                showSizeChanger: true,
                showQuickJumper: true,
                showTotal: (total) => `共 ${total} 条`,
                onChange: () => { pageChange }
            }} />
    )
}

export default Look
