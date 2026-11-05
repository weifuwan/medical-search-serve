import React, { Suspense, useEffect, useState } from "react"
import { Row, Col, Divider } from "antd"
import { PageLoading } from "@ant-design/pro-components"
import { getHistoryList, getHotList } from '@/services/home/api'
import SearchInput from './components/SearchInput'
import HomeList from './components/HomeList'
import styles from './index.less'
import { setSessionVal } from "@/utils"

const Home: React.FC = () => {
    const [historyList, setHistoryList] = useState<HOME.HistoryOrHotItem[]>([])
    const [hotList, setHotList] = useState<HOME.HistoryOrHotItem[]>([])
    let historyLoading = false
    let hotLoading = false

    // 获取历史检索数据
    const handleHistoryList = async (top: number) => {
        historyLoading = true
        const { code, data } = await getHistoryList({ top })
        if (code === 0) {
            setHistoryList(data)
            historyLoading = false
        }
    }
    // 获取热门检索数据
    const handleHotList = async (top: number) => {
        hotLoading = true
        const { code, data } = await getHotList({ top })
        if (code === 0) {
            setHotList(data)
            hotLoading = false
        }
    }

    const handleSearchVal = () => { }

    useEffect(() => {
        setSessionVal('dimensionVal', 0)
        handleHistoryList(8)
        handleHotList(8)
    }, [])


    return (
        <div className={styles.container} >
            {/* <div className={styles.header}>
        <Avatar className={styles.headerAvatar} size={64} />
        <h1>南充中心医院</h1>
      </div> */}
            <div className={styles.content} >
                {/* 标题 */}
                <h1>临床大数据搜索引擎系统</h1>

                {/* 搜索框 */}
                <SearchInput handleSearchVal={handleSearchVal} />

                {/* 辅助搜索 */}
                <Row className={styles.searchType}>
                    <Col span={12} className={styles.history}>历史检索</Col>
                    <Col span={12} className={styles.hot}>热门检索</Col>
                </Row>
                <Row gutter={16} className={styles.searchTypeCon}>
                    <Col span={11}  >
                        <Suspense fallback={<PageLoading />}>
                            <HomeList list={historyList} loading={historyLoading} handleMore={() => handleHistoryList(12)} />
                        </Suspense>
                    </Col>
                    <Col span={1} >
                        <Divider type="vertical" className={styles.colBorder} />
                    </Col>
                    <Col span={11}>
                        <Suspense fallback={<PageLoading />}>
                            <HomeList list={hotList} loading={hotLoading} handleMore={() => handleHotList(12)} emptyText="暂无热门检索" />
                        </Suspense>
                    </Col>
                </Row>
            </div>
        </div>
    )
}

export default Home
