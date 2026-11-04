import moment from 'moment';
import type { RangePickerProps } from 'antd/es/date-picker/generatePicker';

type RangePickerValue = RangePickerProps<moment.Moment>['value'];

export function fixedZero(val: number) {
  return val * 1 < 10 ? `0${val}` : val;
}

export function getTimeDistance(type: 'today' | 'week' | 'month' | 'year'): RangePickerValue {
  const now = new Date() // 获取当前日期
  const year = now.getFullYear() // 获取当前年份
  const nowDate = moment().format("YYYY-MM-DD") // 获取当前年月日
  let startDate = ''
  let endDate = nowDate

  switch (type) {
    case 'today':
      startDate = nowDate
      break;
    case 'week':
      startDate = moment(nowDate).subtract(7, "days").format("YYYY-MM-DD")
      break;
    case 'month':
      startDate = moment().subtract(1, "month").format("YYYY-MM-DD")
      break;
    default:
      startDate = `${year}-01-01`
      endDate = `${year}-12-31`
      break;
  }

  return [moment(startDate), moment(endDate)]
}
