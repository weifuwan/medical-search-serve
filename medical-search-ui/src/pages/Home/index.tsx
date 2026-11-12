import React, { Suspense, useEffect, useRef, useState } from "react"
import { Row, Col, Divider, message } from "antd"
import { PageLoading } from "@ant-design/pro-components"
import { getHistoryList, getHotList } from '@/services/home/api'
import SearchInput from './components/SearchInput'
import HomeList from './components/HomeList'
import styles from './index.less'
import { setSessionVal } from "@/utils"
import { addFavorite, deleteFavorite, getFavorites } from '@/services/expressionShare/api'
import type { FavoriteItem } from '@/services/expressionShare/api'

const Home: React.FC = () => {
    const [historyList, setHistoryList] = useState<HOME.HistoryOrHotItem[]>([])
    const [hotList, setHotList] = useState<HOME.HistoryOrHotItem[]>([])
    const [favorites, setFavorites] = useState<FavoriteItem[]>([])
    const [favoritesReady, setFavoritesReady] = useState(false)
    const [pendingFavorites, setPendingFavorites] = useState<string[]>([])
    const favoriteRequests = useRef<Set<string>>(new Set())
    const mountedRef = useRef(true)
    let historyLoading = false
    let hotLoading = false

    // 获取历史检索数据
    const handleHistoryList = async (top: number) => {
        historyLoading = true
        const { code, data } = await getHistoryList({ top })
        if (!mountedRef.current) return
        if (code === 0) {
            setHistoryList(data)
            historyLoading = false
        }
    }
    // 获取热门检索数据
    const handleHotList = async (top: number) => {
        hotLoading = true
        const { code, data } = await getHotList({ top })
        if (!mountedRef.current) return
        if (code === 0) {
            setHotList(data)
            hotLoading = false
        }
    }

    const handleSearchVal = () => { }

    const toggleFavorite = async (expression: string) => {
        if (!mountedRef.current || !favoritesReady || favoriteRequests.current.has(expression)) return

        favoriteRequests.current.add(expression)
        setPendingFavorites(Array.from(favoriteRequests.current))
        const existing = favorites.find(item => item.expression === expression)

        try {
            if (existing) {
                const response = await deleteFavorite(existing.id)
                if (response.code !== 0) throw new Error(response.msg || '取消收藏失败')
                if (!mountedRef.current) return
                setFavorites(items => items.filter(item => item.id !== existing.id))
                message.success('已取消收藏')
            } else {
                const title = expression.slice(0, 50)
                const response = await addFavorite(title, expression)
                if (response.code !== 0 || !response.data?.id) {
                    throw new Error(response.msg || '收藏失败')
                }
                if (!mountedRef.current) return
                setFavorites(items => [...items, {
                    id: response.data.id,
                    title,
                    expression,
                    createdAt: new Date().toISOString(),
                }])
                message.success('已收藏')
            }
        } catch (error: any) {
            if (mountedRef.current) {
                message.error(error?.message || '收藏操作失败')
            }
        } finally {
            favoriteRequests.current.delete(expression)
            if (mountedRef.current) {
                setPendingFavorites(Array.from(favoriteRequests.current))
            }
        }
    }

    useEffect(() => {
        let active = true
        const loadFavorites = async () => {
            try {
                const response = await getFavorites({
                    pageNum: 1,
                    pageSize: 100,
                    sortField: 'createdAt',
                    sortOrder: 'DESC',
                })
                if (response.code !== 0) throw new Error(response.msg || '加载收藏失败')
                if (active) {
                    setFavorites(Array.isArray(response.data?.records) ? response.data.records : [])
                    setFavoritesReady(true)
                }
            } catch {
                if (active) message.error('加载收藏状态失败，请刷新页面重试')
            }
        }
        loadFavorites()
        return () => { active = false }
    }, [])

    useEffect(() => {
        mountedRef.current = true
        return () => {
            mountedRef.current = false
        }
    }, [])

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
                            <HomeList
                                list={historyList}
                                loading={historyLoading}
                                handleMore={() => handleHistoryList(12)}
                                favoritedExpressions={favorites.map(item => item.expression)}
                                favoritesReady={favoritesReady}
                                pendingFavorites={pendingFavorites}
                                onToggleFavorite={toggleFavorite}
                            />
                        </Suspense>
                    </Col>
                    <Col span={1} >
                        <Divider type="vertical" className={styles.colBorder} />
                    </Col>
                    <Col span={11}>
                        <Suspense fallback={<PageLoading />}>
                            <HomeList
                                list={hotList}
                                loading={hotLoading}
                                handleMore={() => handleHotList(12)}
                                emptyText="暂无热门检索"
                                favoritedExpressions={favorites.map(item => item.expression)}
                                favoritesReady={favoritesReady}
                                pendingFavorites={pendingFavorites}
                                onToggleFavorite={toggleFavorite}
                            />
                        </Suspense>
                    </Col>
                </Row>
            </div>
        </div>
    )
}

export default Home
