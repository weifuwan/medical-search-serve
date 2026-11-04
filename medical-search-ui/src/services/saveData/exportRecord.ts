// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api'

/** 获取导出记录列表（分页） GET /medical-search-admin/export/exportrecord/page */
export async function getExportRecordList(
    params: {
        // query
        /** 当前的页码 */
        current?: number;
        /** 页面的容量 */
        pageSize?: number;
    },
    options?: { [key: string]: any },
) {
    return getTablePageList('/medical-search-admin/export/exportrecord/page', params, options)
}

/** 获取记录详情 GET /medical-search-admin/export/exportrecord/{id} */
export async function getExportRecordInfo(
    params: {
        id?: string | number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>(`/medical-search-admin/export/exportrecord/{id}${params.id}`, {
        method: 'GET',
        ...(options || {}),
    });
}

/** 再次导出 GET /medical-search-admin/export/exportrecord/export */
export async function againExport(
    params: {
        id?: string | number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/export/exportrecord/export', {
        method: 'GET',
        params: {
            ...params
        },
        responseType: "blob",
        getResponse: true,
        ...(options || {}),
    });
}

/** 下载 GET /medical-search-admin/export/exportsearchresult/download */
export async function downLoadRecord(
    params: {
        exportId?: string | number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/export/exportsearchresult/download', {
        method: 'GET',
        params: {
            ...params
        },
        responseType: "blob",
        getResponse: true,
        ...(options || {}),
    });
}

/** 查看导出记录 GET /medical-search-admin/export/exportrecord/info */
export async function lookExportRecord(
    params: {
        id?: string | number;
        /** 当前的页码 */
        page?: number;
        /** 页面的容量 */
        limit?: number;
    },
    options?: { [key: string]: any },
) {

    return request<API.RequestResult>('/medical-search-admin/export/exportrecord/info', {
        method: 'get',
        params: {
            ...params,
        },
        ...(options || {}),
    })
}
