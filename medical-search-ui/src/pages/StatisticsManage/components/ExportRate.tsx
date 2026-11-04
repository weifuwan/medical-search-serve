import React, { useEffect, useState } from 'react'
import { Pie, G2, PieConfig } from '@ant-design/charts'
import { getExportRate } from '@/services/statisticsManage/api'
import type { RangePickerProps } from 'antd/es/date-picker/generatePicker'
import { flushSync } from 'react-dom'
import moment from 'moment'

type RangePickerValue = RangePickerProps<moment.Moment>['value']
interface ExportRateProps {
    time: RangePickerValue
}

const G = G2.getEngine('canvas');

const ExportRate: React.FC<ExportRateProps> = (props) => {
    const { time } = props
    const [pieData, setPieData] = useState<Record<string, any>[]>([])

    const handleData = async () => {
        const params: any = {
            startDate: moment(time![0]).format("YYYY-MM-DD") + ' 00:00:00',
            endDate: moment(time![1]).format("YYYY-MM-DD") + ' 23:59:00'
        }
        const { code, data } = await getExportRate(params)
        if (code === 0) {
           
            const list = [
                {
                    type: '基本导出',
                    value: parseInt(data?.baseExportTimes) || 0,
                },
                {
                    type: '高级导出',
                    value: parseInt(data?.highExportTimes) || 0,
                }
            ]
            flushSync(() => {
                setPieData(list)
            })
        }
    }

    const config: PieConfig = {
        data: pieData,
        appendPadding: 2,
        height: 200,
        angleField: 'value',
        colorField: 'type',
        radius: 0.45,
        legend: {
            position: 'left'
        },
        label: {
            type: 'spider',
            labelHeight: 40,
            formatter: ({ type, value, percent,index }, { color }) => {
                const group = new G.Group({})
                group.addShape({
                    type: 'circle',
                    attrs: {
                        x: 0,
                        y: 0,
                        width: 40,
                        height: 50,
                        r: 5,
                        fill: color,
                    },
                })
                group.addShape({
                    type: 'text',
                    attrs: {
                        x: 10,
                        y: 6,
                        text: `${type}`,
                        fill: color,
                    },
                })
                group.addShape({
                    type: 'text',
                    attrs: {
                        x: 0,
                        y: 25,
                        text: `${value}个 ${(percent * 100).toFixed(1)}%`,
                        fill: 'rgba(0, 0, 0, 0.65)',
                        fontWeight: 700,
                    },
                });
                return group
            },
        },
        interactions: [
            {
                type: 'element-selected',
            },
            {
                type: 'element-active',
            },
        ],
    }

    useEffect(() => {
        handleData()
    }, [time])
    return (
        <Pie {...config} />
    )
}

export default ExportRate;
