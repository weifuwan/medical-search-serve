// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api'

/** 获取数据保存列表（分页） GET /medical-search-admin/export/exportsearchresult/page */
export async function getSaveDataList(
    params: {
        // query
        /** 当前的页码 */
        current?: number;
        /** 页面的容量 */
        pageSize?: number;
    },
    options?: { [key: string]: any },
) {
    return getTablePageList('/medical-search-admin/export/exportsearchresult/page', params, options)
}

/** 删除 DELETE /medical-search-admin/export/exportsearchresult  */
export async function dSaveData(body: SAVEDATAAPI.SaveDataListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/export/exportsearchresult', {
        method: 'DELETE',
        data: body,
        ...(options || {}),
    });
}

/** 升级/降级 PUT /medical-search-admin/export/exportsearchresult */
export async function udSaveData(body: SAVEDATAAPI.SaveDataUD, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/export/exportsearchresult', {
        method: 'PUT',
        data: body,
        ...(options || {}),
    });
}

/** 基本导出 GET /medical-search-admin/export/exportsearchresult/basicExport */
export async function basicExport(
    params: {
        id?: string | number;
    },
    options?: { [key: string]: any },
) {
    return request<any>('/medical-search-admin/export/exportsearchresult/basicExport', {
        method: 'GET',
        params: {
            ...params
        },
        // responseType: "blob",
        // getResponse: true,
        ...(options || {}),
    });
}

/** 预览导出结果(高级导出) GET /medical-search-admin/export/exportsearchresult/preview */
export async function previewExport(
    params: {
        /** 当前的页码 */
        page?: number;
        /** 页面的容量 */
        size?: number;
    },
    options?: { [key: string]: any },
) {

    return request<API.RequestResult>('/medical-search-admin/export/exportsearchresult/preview', {
        method: 'POST',
        data: {
            page: params.page,
            size: params.size,
            ...params,
        },
        ...(options || {}),
    })
}


/** 获取高级导出字段字段列表 GET /medical-search-admin/export/exportsearchresult/getExportFields */
export async function getExportFields(
    params: {
        saveDataId?: string | number;
    },
    options?: { [key: string]: any },
) {
    return request<any>('/medical-search-admin/export/exportsearchresult/getExportFields', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}

/** 高级导出 POST /medical-search-admin/export/exportsearchresult/seniorExport */
export async function seniorExport(body: SAVEDATAAPI.SeniorExport, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/export/exportsearchresult/seniorExport', {
        method: 'POST',
        data: body,
        // responseType: "blob",
        // getResponse: true,
        ...(options || {}),
    });
}

/** 查询选择字段内容列表 GET /medical-search-admin/export/exportsearchresult/pageFieldContent */
export async function pageFieldContent(
    params: {
        fieldId?: string | number;
        name?: string;
        limit: number;
        page: number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/export/exportsearchresult/pageFieldContent', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}
