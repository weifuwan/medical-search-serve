// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api';

/** 获取数据统计 GET /medical-search-admin/stat/statOfData */
export async function getStatisticsData(params: STATISTICSAPI.StatisticsDataParams, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/stat/statOfData', {
    method: 'GET',
    params: {
      ...params
    },
    ...(options || {}),
  });
}

/** 获取导出占比统计 GET /medical-search-admin/stat/statOfExport */
export async function getExportRate(params: STATISTICSAPI.StatisticsDataParams, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/stat/statOfExport', {
    method: 'GET',
    params: {
      ...params
    },
    ...(options || {}),
  });
}

/** 获取操作日志列表（分页） GET /medical-search-admin/sys/log/operation/page */
export async function getActionLogList(
  params: {
    // query
    /** 当前的页码 */
    current?: number;
    /** 页面的容量 */
    pageSize?: number;
  },
  options?: { [key: string]: any },
) {
  return getTablePageList('/medical-search-admin/sys/log/operation/page', params, options)
}
