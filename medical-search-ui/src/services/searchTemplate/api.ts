// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api'

/** 获取模版列表（分页） GET /medical-search-admin/template/template/page */
export async function getTemplateList(
  params: {
    // query
    /** 当前的页码 */
    current?: number;
    /** 页面的容量 */
    pageSize?: number;
  },
  options?: { [key: string]: any },
) {
  return getTablePageList('/medical-search-admin/template/template/page', params, options)
}

/** 获取详情 GET /medical-search-admin/template/template/{id} */
export async function getTemplateInfo(
  params: {
    id?: string | number;
  },
  options?: { [key: string]: any },
) {
  return request<API.RequestResult>(`/medical-search-admin/template/template/${params.id}`, {
    method: 'GET',
    ...(options || {}),
  });
}


/** 预览模版 POST /medical-search-admin/template/template/preview */
export async function previewTemplate(body: STEMPLATEAPI.IUTemplateItem, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/template/template/preview', {
    method: 'POST',
    data: body,
    ...(options || {}),
  });
}

/** 新建/修改 POST /medical-search-admin/template/template/saveOrUpdate */
export async function iuTemplate(body: STEMPLATEAPI.IUTemplateItem, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/template/template/saveOrUpdate', {
    method: 'POST',
    data: body,
    ...(options || {}),
  });
}

/** 删除 DELETE  /medical-search-admin/template/template */
export async function dTemplate(body: STEMPLATEAPI.TemplateListItem[], options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/template/template', {
    method: 'DELETE',
    data: body,
    ...(options || {}),
  });
}