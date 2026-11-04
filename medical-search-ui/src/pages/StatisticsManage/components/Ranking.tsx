import React, { useEffect, useState } from 'react';
import styles from '../index.less'
import numeral from 'numeral';
import { ProCard } from '@ant-design/pro-components';
import { getHotList } from '@/services/home/api';
type RankingType = {
    title: string;
    total: string | number
}
const Ranking: React.FC = () => {
    const [rankingListData, setRankingListData] = useState<RankingType[]>([])
    const handleHotList = async () => {
        const { code, data } = await getHotList({ top: 10 })
        if (code === 0) {
            const list: RankingType[] = data.map((item: HOME.HistoryOrHotItem) => (
                {
                    title: item.expression,
                    total: item.amount,
                }
            ))
            setRankingListData(list)
        }
    }

    useEffect(() => {
        handleHotList()
    }, [])

    return (
        <ProCard title="检索词条排名">
            <ul className={styles.rankingList}>
                <li style={{ marginBottom: 24 }}>
                    <span className={styles.rankingItemNumber}></span>
                    <span className={styles.rankingItemHeaderTitle}>
                        检索内容
                    </span>
                    <span className={styles.rankingItemHeaderValue}>
                        使用次数
                    </span>
                </li>
                {rankingListData.map((item, i) => (
                    <li key={item.title}>
                        <span className={`${styles.rankingItemNumber} ${i < 3 ? styles.active : ''}`}>
                            {i + 1}
                        </span>
                        <span className={styles.rankingItemTitle} title={item.title}>
                            {item.title}
                        </span>
                        <span className={styles.rankingItemValue}>
                            {numeral(item.total).format('0,0')}
                        </span>
                    </li>
                ))}
            </ul>
        </ProCard>
    )
}

export default Ranking;