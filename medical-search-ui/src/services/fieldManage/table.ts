// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getSelectList, getTablePageList } from '../common/api'

/** 获取表分类列表 /medical-search-admin/table/pageClassify */
export async function getPageClassify(params: { page: number, limit: number, order?: string, orderField?: string }, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/table/pageClassify', {
        method: 'GET',
        params,
        ...(options || {}),
    });
}


/** 获取所有表列表（不分页） GET /medical-search-admin/table/getAllTableList */
export async function getTableSelectList(params: {classifyId: string} ) {
  return getSelectList('/medical-search-admin/table/getTableList', { include: false, ...params })
}

/** 获取表列表（分页） GET /medical-search-admin/table/page */
export async function getTableList(
    params: {
        // query
        /** 当前的页码 */
        current?: number;
        /** 页面的容量 */
        pageSize?: number;
        classifyId?: string;
        tableName?: string;
    },
    options?: { [key: string]: any },
) {
    return getTablePageList('/medical-search-admin/table/page', params, options)
}

// 表显示控制
export async function switchShowTable(body: TABLEORFIELDAPI.TableShowType, options?: { [key: string]: any }) {
  return request<API.RequestResult>('/medical-search-admin/table/updateDisplayStatus', {
    method: 'PUT',
    params: body,
    ...(options || {}),
  });
}

/** 获取表详情 GET /medical-search-admin/table/{id} */
export async function getTableInfo(
    params: {
        // 用户 id
        id?: string | number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>(`/medical-search-admin/table/${params.id}`, {
        method: 'GET',
        ...(options || {}),
    });
}


/** 新建 POST /medical-search-admin/table */
export async function iTable(body: TABLEORFIELDAPI.TableListItem, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/table', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 修改 PUT /medical-search-admin/table */
export async function uTable(body: TABLEORFIELDAPI.TableListItem, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/table', {
        method: 'PUT',
        data: body,
        ...(options || {}),
    });
}

/** 删除 DELETE  /medical-search-admin/table */
export async function dTable(body: TABLEORFIELDAPI.TableListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/table', {
        method: 'DELETE',
        data: body,
        ...(options || {}),
    });
}
