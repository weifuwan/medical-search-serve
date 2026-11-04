import React, { useState } from 'react'
import {
  PageContainer,
} from '@ant-design/pro-components'
import Table from './components/Table'
import Field from './components/Field'

// 配置管理
const FieldManage: React.FC = () => {
  const [tableId, setTableId] = useState<string | number>('')
  const [tableName, setTableName] = useState<string>('')

  const handleSelectTable = (id: string | number, name: string) => {
    setTableId(id)
    setTableName(name)
  }

  return (
    <PageContainer
      fixedHeader
    >
      <div style={{ display: 'flex' }}>
        <Table handleSelectTable={handleSelectTable} />
        <Field tableId={tableId} tableName={tableName} />
      </div>
    </PageContainer>
  )
}

export default FieldManage;
