import React, { Suspense, useState } from 'react';
import { PageLoading } from '@ant-design/pro-layout';
import { PageContainer, ProCard } from '@ant-design/pro-components';
import { Col, DatePicker as TDatePicker, Row } from 'antd'

import DataStatics from './components/DataStatics'
import ExportRate from './components/ExportRate'
import ActionLog from './components/ActionLog'
import Ranking from './components/Ranking'

import { getTimeDistance } from './utils/utils'
import styles from './index.less'

import type { RangePickerProps } from 'antd/es/date-picker/generatePicker'
import moment from 'moment';
type TimeType = 'today' | 'week' | 'month' | 'year'
type RangePickerValue = RangePickerProps<moment.Moment>['value']

const DatePicker: any = TDatePicker
const { RangePicker } = DatePicker
const dateFormat = 'YYYY-MM-DD';

const StatisticsManage: React.FC = () => {
    const [tabKey, setTabKey] = useState('data')
    const [time, setTime] = useState<RangePickerValue>(getTimeDistance('year'))

    const handleTime = (value: RangePickerValue) => {
        setTime(value)
    }

    const selectDate = (type: TimeType) => {
        setTime(getTimeDistance(type))
    }

    // 选中颜色设置
    const isActive = (type: TimeType) => {
        if (!time) {
            return ''
        }
        const value = getTimeDistance(type)
        if (!value) {
            return ''
        }
        if (!time[0] || !time[1]) {
            return ''
        }
        if (time[0].isSame(value[0] as moment.Moment, 'day') &&
            time[1].isSame(value[1] as moment.Moment, 'day')
        ) {
            return styles.currentDate
        }
        return ''
    }

    return (
        <PageContainer
            fixedHeader
            tabList={[
                {
                    tab: '数据统计',
                    key: 'data',
                },
                {
                    tab: '操作日志',
                    key: 'action',
                },
            ]}
            tabBarExtraContent={
                <div className={styles.tabBarExtra}>
                    <a className={isActive('today')} onClick={() => selectDate('today')}>
                        今日
                    </a>
                    <a className={isActive('week')} onClick={() => selectDate('week')}>
                        本周
                    </a>
                    <a className={isActive('month')} onClick={() => selectDate('month')}>
                        本月
                    </a>
                    <a className={isActive('year')} onClick={() => selectDate('year')}>
                        本年
                    </a>

                    <RangePicker
                        value={time}
                        onChange={handleTime}
                        format={dateFormat}
                        allowClear={false}
                        style={{ width: 256, marginLeft: 24 }}
                    />
                </div>
            }
            onTabChange={(key) => {
                setTabKey(key)
            }}
        >
            <Suspense fallback={<PageLoading />}>
                {
                    tabKey === 'data' &&
                    <ProCard>
                        <Row>
                            <Col xl={16} lg={12} md={12} sm={24} xs={24}>
                                <ProCard direction="column" bordered >
                                    <ProCard title="数据统计">
                                        <DataStatics time={time} />
                                    </ProCard>
                                    <ProCard title="导出占比情况" style={{ height: 360 }}>
                                        <ExportRate time={time} />
                                    </ProCard>
                                </ProCard>
                            </Col>
                            <Col xl={8} lg={12} md={12} sm={24} xs={24}>
                                <Ranking />
                            </Col>
                        </Row>
                    </ProCard>
                }
                {
                    tabKey === 'action' &&
                    <ProCard>
                        <Row>
                            <Col xl={16} lg={12} md={12} sm={24} xs={24}>
                                <ActionLog time={time} />
                            </Col>
                            <Col xl={8} lg={12} md={12} sm={24} xs={24}>
                                <Ranking />
                            </Col>
                        </Row>
                    </ProCard>
                }
            </Suspense>
        </PageContainer>
    )
}

export default StatisticsManage;