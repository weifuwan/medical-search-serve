import React, { useState } from 'react';
import { history, useDispatch } from '@umijs/max'
import { Card, Col, Row, Tooltip } from 'antd';
import NoData from '@/components/JYNoData';
import defaultSettings from '../../../../config/defaultSettings'
import styles from '../index.less'
import { setSessionVal } from "@/utils"

const HomeList: React.FC<HOME.ListProps> = (props) => {
    const { loading, list, handleMore, emptyText } = props
    const dispatch = useDispatch()
    const [isShowMore, setIsShowMore] = useState(true)

    const actionClick = (num: number, params: string) => {
        switch (num) {
            case 1:
                dispatch({ type: "searchModel/reset" })
                setSessionVal('searchVal', params)
                history.push(
                    {
                        pathname: '/home/searchList',
                        search: `?searchParams=${params}`
                    }
                )
                break;
            default:
                handleMore()
                setIsShowMore(false)
                break;
        }

    }

    return (
        list.length > 0 ?
            <Row gutter={[16, 8]}>
                {
                    list.map((item, index) => (
                        <Col span={8} key={index + 1}>
                            <Card hoverable loading={loading} style={{ borderRadius: 10 }} className={styles.expressionCard} onClick={() => {
                                actionClick(1, item.expression)
                            }}>
                                <Tooltip placement="top" color={defaultSettings.colorPrimary} title={item.expression}>
                                    <div className={styles.hideText}>
                                        {item.expression}
                                    </div>
                                </Tooltip>
                            </Card>
                        </Col>
                    ))
                }
                {
                    isShowMore &&
                    <Col span={8} key='more'>
                        <Card hoverable loading={loading} style={{ borderRadius: 10 }} className={styles.more} onClick={() => {
                            actionClick(2, '')
                        }}>
                            更多...
                        </Card>
                    </Col>
                }

            </Row>
            :
            <NoData text={emptyText} />
    )
}

export default HomeList;