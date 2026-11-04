// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';

/** 获取权限列表 GET  */
export async function getPermissionList(options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/sys/menu/select', {
      method: 'GET',
      ...(options || {}),
    });
  }