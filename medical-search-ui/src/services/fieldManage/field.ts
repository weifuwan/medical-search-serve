// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api'

/** 获取字段列表（分页） GET /medical-search-admin/field/page */
export async function getTableList(
  params: {
    // query
    /** 当前的页码 */
    current?: number;
    /** 页面的容量 */
    pageSize?: number;
  },
  options?: { [key: string]: any },
) {
  return getTablePageList('/medical-search-admin/field/page', params, options)
}

/** 获取字段列表（不分页） GET /medical-search-admin/field/getFieldList */
export async function getFieldSelectList(params: { tableId: string | number, fieldName: string }, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/field/getFieldList', {
    method: 'GET',
    params,
    ...(options || {}),
  });
}


// 字段显示控制
export async function switchShowFields(body: PERSSIONAPI.SwitchCode, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/field/switch', {
    method: 'PUT',
    data: body,
    'Content-type': 'x-www-form-urlencoded',
    ...(options || {}),
  });
}

/** 获取详情 GET /medical-search-admin/field/{id} */
export async function getFieldInfo(
  params: {
    id?: string | number;
  },
  options?: { [key: string]: any },
) {
  return request<API.RequestResult>(`/medical-search-admin/field/${params.id}`, {
    method: 'GET',
    ...(options || {}),
  });
}


/** 新建 POST /medical-search-admin/field */
export async function iField(body: PERSSIONAPI.RoleListItem, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/field', {
    method: 'POST',
    data: body,
    ...(options || {}),
  });
}

/** 修改 PUT /medical-search-admin/field */
export async function uField(body: PERSSIONAPI.RoleListItem, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/field', {
    method: 'PUT',
    data: body,
    ...(options || {}),
  });
}

/** 删除 DELETE  /medical-search-admin/field */
export async function dField(body: PERSSIONAPI.RoleListItem[], options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/field', {
    method: 'DELETE',
    data: body,
    ...(options || {}),
  });
}



