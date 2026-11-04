// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api'

/** 获取回收站列表（分页） GET /medical-search-admin/export/exportrecyclebin/page */
export async function getRecycledStationList(
  params: {
    // query
    /** 当前的页码 */
    current?: number;
    /** 页面的容量 */
    pageSize?: number;
  },
  options?: { [key: string]: any },
) {
  return getTablePageList('/medical-search-admin/export/exportrecyclebin/page', params, options)
}

/** 撤销 POST /medical-search-admin/export/exportrecyclebin/revoke */
export async function undo(body: SAVEDATAAPI.RecycledStationListItem[], options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/export/exportrecyclebin/revoke', {
    method: 'POST',
    data: body,
    ...(options || {}),
  });
}

/** 删除 DELETE  /medical-search-admin/export/exportrecyclebin */
export async function dRecycledStation(body: SAVEDATAAPI.RecycledStationListItem[], options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/export/exportrecyclebin', {
    method: 'DELETE',
    data: body,
    ...(options || {}),
  });
}