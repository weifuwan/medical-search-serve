// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api'

/** 获取权限管理-角色列表（分页） GET /medical-search-admin/sys/role/page */
export async function getRoleList(
  params: {
    // query
    /** 当前的页码 */
    current?: number;
    /** 页面的容量 */
    pageSize?: number;
  },
  options?: { [key: string]: any },
) {
  return getTablePageList('/medical-search-admin/sys/role/page', params, options)
}

/** 获取角色详情 GET /medical-search-admin/sys/role/{id} */
export async function getRoleInfo(
  params: {
    // 角色 id
    id?: string | number;
  },
  options?: { [key: string]: any },
) {
  return request<API.RequestResult>(`/medical-search-admin/sys/role/${params.id}`, {
    method: 'GET',
    ...(options || {}),
  });
}


/** 新建角色 POST /medical-search-admin/sys/role */
export async function iRole(body: PERSSIONAPI.RoleListItem, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/role', {
    method: 'POST',
    data: body,
    ...(options || {}),
  });
}

/** 修改角色 PUT /medical-search-admin/sys/role */
export async function uRole(body: PERSSIONAPI.RoleListItem, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/role', {
    method: 'PUT',
    data: body,
    ...(options || {}),
  });
}

/** 删除角色 DELETE  /medical-search-admin/sys/role */
export async function dRole(body: PERSSIONAPI.RoleListItem[], options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/role', {
    method: 'DELETE',
    data: body,
    ...(options || {}),
  });
}
