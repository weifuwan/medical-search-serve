import React, { Suspense, useState } from 'react'
import {
  PageContainer, PageLoading,
} from '@ant-design/pro-components'
import Explain from './components/Explain'
import Process from './components/Process'

// 帮助
const Help: React.FC = () => {
  const [tabKey, setTabKey] = useState('process')

  const Children = () => {
    return (
      <>
        {tabKey === 'process' && <Process />}
        {tabKey === 'explain' && <Explain />}
      </>
    )
  }

  return (
    <PageContainer
      fixedHeader
      tabList={[
        {
          tab: '流程及功能',
          key: 'process',
        },
        {
          tab: '检索、符号、功能说明',
          key: 'explain',
        },
      ]}
      onTabChange={(key) => {
        setTabKey(key)
      }}
    >
      <Suspense fallback={<PageLoading />}>
        <Children />
      </Suspense>
    </PageContainer>
  )
}

export default Help
