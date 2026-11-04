import React, { useRef } from 'react'
import { ActionType, ProColumns, ProTable } from '@ant-design/pro-components'
import { getActionLogList } from '@/services/statisticsManage/api';
import type { RangePickerProps } from 'antd/es/date-picker/generatePicker'
import moment from 'moment';

type RangePickerValue = RangePickerProps<moment.Moment>['value']
interface ActionLogProps {
    time: RangePickerValue
}

const columns: ProColumns<STATISTICSAPI.ActionLogListItem>[] = [
    {
        title: '序号',
        dataIndex: 'index',
        valueType: 'indexBorder',
        width: 48,
    },
    {
        title: '任务名称',
        dataIndex: 'operation',
    },
    {
        title: '任务描述',
        dataIndex: 'describe',
    },
    {
        title: '操作人',
        dataIndex: 'creatorName',
    },
    {
        title: '时间',
        dataIndex: 'createDate',
    },
]

const ActionLog: React.FC<ActionLogProps> = (props) => {
    const { time } = props
    const actionRef = useRef<ActionType>()
    return (
        <ProTable<STATISTICSAPI.ActionLogListItem, STATISTICSAPI.StatisticsDataParams>
            actionRef={actionRef}
            rowKey="id"
            bordered
            search={false}
            options={false}
            // scroll={{ y: 600 }}
            params={{
                startDate: moment(time![0]).format("YYYY-MM-DD") + ' 00:00:00',
                endDate: moment(time![1]).format("YYYY-MM-DD") + ' 23:59:00'
            }}
            request={getActionLogList}
            columns={columns}
        />
    )
}

export default ActionLog;