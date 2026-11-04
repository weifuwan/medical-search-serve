// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';

/** 修改密码 PUT /medical-search-admin/sys/user/password */
export async function uPsw(body: UPDATEPSW.SaveForm, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/sys/user/password', {
    method: 'PUT',
    data: body,
    ...(options || {}),
  });
}
