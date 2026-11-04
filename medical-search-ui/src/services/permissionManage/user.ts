// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api'

/** 获取权限管理-用户列表（分页） GET /medical-search-admin/sys/user/page */
export async function getUserList(
  params: {
    // query
    /** 当前的页码 */
    current?: number;
    /** 页面的容量 */
    pageSize?: number;
  },
  options?: { [key: string]: any },
) {
  return getTablePageList('/medical-search-admin/sys/user/page', params, options)
}

/** 获取用户详情 GET /medical-search-admin/sys/user/{id} */
export async function getUserInfo(
  params: {
    // 用户 id
    id?: string | number;
  },
  options?: { [key: string]: any },
) {
  return request<API.RequestResult>(`/medical-search-admin/sys/user/${params.id}`, {
    method: 'GET',
    ...(options || {}),
  });
}

/** 重置密码 POST /medical-search-admin/sys/user/resetPassword */
export async function resetPsw(body: PERSSIONAPI.ResetPswForm, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/user/resetPassword', {
    method: 'POST',
    data: body,
    ...(options || {}),
  });
}


/** 新建用户 POST /medical-search-admin/sys/user */
export async function iUser(body: PERSSIONAPI.UserListItem, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/user', {
    method: 'POST',
    data: body,
    ...(options || {}),
  });
}

/** 修改用户 PUT /medical-search-admin/sys/user */
export async function uUser(body: PERSSIONAPI.UserListItem, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/user', {
    method: 'PUT',
    data: body,
    ...(options || {}),
  });
}

/** 删除用户 DELETE  /medical-search-admin/sys/user */
export async function dUser(body: PERSSIONAPI.UserListItem[], options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/user', {
    method: 'DELETE',
    data: body,
    ...(options || {}),
  });
}

/** 获取角色列表 GET /medical-search-admin/sys/role/list */
export async function getRoleListSelect(options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/role/list', {
    method: 'GET',
    ...(options || {}),
  });
}