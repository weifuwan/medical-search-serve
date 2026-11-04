import React, { useEffect, useState } from 'react';
import { StatisticCard } from '@ant-design/pro-components';
import { AuditOutlined, TeamOutlined } from '@ant-design/icons';
import styles from '../index.less'
import { getStatisticsData } from '@/services/statisticsManage/api'
import type { RangePickerProps } from 'antd/es/date-picker/generatePicker'
import moment from 'moment';

type RangePickerValue = RangePickerProps<moment.Moment>['value']
interface DataStaticsProps {
    time: RangePickerValue
}
const DataStatics: React.FC<DataStaticsProps> = (props) => {
    const { time } = props
    const [persons, setPersons] = useState(0)
    const [personTimes, setPersonTimes] = useState(0)
    const handleData = async () => {
        const { code, data } = await getStatisticsData({
            startDate: moment(time![0]).format("YYYY-MM-DD") + ' 00:00:00',
            endDate: moment(time![1]).format("YYYY-MM-DD") + ' 23:59:00'
        })
        if (code === 0) {
            setPersons(data?.persons || 0)
            setPersonTimes(data?.personTimes || 0)
        }
    }

    useEffect(() => {
        handleData()
    }, [time])

    return (
        <div>
            <StatisticCard.Group >
                <StatisticCard
                    statistic={{
                        title: '总人数',
                        value: persons,
                    }}
                    chart={
                        <AuditOutlined className={styles.staticsIcon} />
                    }
                    chartPlacement="left"
                />
                <StatisticCard
                    statistic={{
                        title: '总人次数',
                        value: personTimes,
                    }}
                    chart={
                        <TeamOutlined className={styles.staticsIcon} />
                    }
                    chartPlacement="left"
                />
            </StatisticCard.Group>
        </div>
    )
}

export default DataStatics;