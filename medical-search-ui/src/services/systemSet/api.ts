// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTablePageList } from '../common/api';

/** 获取系统配置 GET /medical-search-admin/sys/config/findList */
export async function getConfigList(
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/sys/config/findList', {
        method: 'GET',
        ...(options || {}),
    });
}

/** 保存基本配置：保存 POST /medical-search-admin/search/resultfield/saveBatch */
export async function saveConfigList(body: SYSTEMSET.SaveConfigListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/sys/config/updateByConfigCode', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 获取医院信息 GET /medical-search-admin/sys/params/getHospitalConfig */
export async function getHispitalInfo(
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/sys/params/getHospitalConfig', {
        method: 'GET',
        ...(options || {}),
    });
}

export async function saveHospitalConfig(
    data: FormData
) {
    return request<API.RequestResult>('/medical-search-admin/sys/params/saveHospitalConfig', {
        method: 'POST',
        data,
        headers: {
            'Content-Type': 'multipart/form-data',

        }
    });
}

/** 默认展示字段：查询默认字段列表 GET /medical-search-admin/search/resultfield/getDefaultShowFieldList */
export async function defaultFieldList(
    params?: {
        page?: number;
        limit?: number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/search/resultfield/getDefaultShowFieldList', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}

/** 用户展示字段：查询默认字段列表 GET /medical-search-admin/search/resultfield/getUserShowFieldList */
export async function userFieldList(
    params?: {
        page?: number;
        limit?: number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/search/resultfield/getUserShowFieldList', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}

/** 默认展示字段：删除 DELETE /medical-search-admin/search/resultfield  */
export async function dField(body: String[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/search/resultfield', {
        method: 'DELETE',
        data: body,
        ...(options || {}),
    });
}

/** 默认展示字段：保存 POST /medical-search-admin/search/resultfield/defaultShowFieldBatchSave */
export async function defaultShowFieldBatchSave(body: SYSTEMSET.SaveListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/search/resultfield/defaultShowFieldBatchSave', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 用户展示字段：保存 POST /medical-search-admin/search/resultfield/userShowFieldBatchSave */
export async function saveBatch(body: SYSTEMSET.SaveListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/search/resultfield/userShowFieldBatchSave', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 默认展示字段：重置 GET /medical-search-admin/search/resultfield/reset */
export async function reset(
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/search/resultfield/reset', {
        method: 'GET',
        ...(options || {}),
    });
}

/** 默认展示字段：排序 POST /medical-search-admin/search/resultfield/sort */
export async function sort(body: SYSTEMSET.SaveListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/search/resultfield/sort', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 默认搜索字段：查询默认检索字段列表 GET /medical-search-admin/search/keywordConfig/list */
export async function defaultSearchFieldList(
    params?: {
        page?: number;
        limit?: number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/search/keywordConfig/list', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}

/** 默认搜索字段：删除 DELETE   */
export async function dSearchField(body: String[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/search/keywordConfig', {
        method: 'DELETE',
        data: body,
        ...(options || {}),
    });
}

/** 默认搜索字段：保存 POST /medical-search-admin/search/keywordConfig/saveBatch */
export async function saveSearchBatch(body: SYSTEMSET.SaveListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/search/keywordConfig/saveBatch', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 默认搜索字段：重置 GET /medical-search-admin/search/keywordConfig/reset */
export async function searchReset(
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/search/keywordConfig/reset', {
        method: 'GET',
        ...(options || {}),
    });
}

/** 获取分类列表（分页） GET /medical-search-admin/classify/page */
export async function getClassifyList(
    params: {
        // query
        /** 当前的页码 */
        current?: number;
        /** 页面的容量 */
        pageSize?: number;
    },
    options?: { [key: string]: any },
) {
    return getTablePageList('/medical-search-admin/classify/page', params, options)
}

/** 删除分类 DELETE  /medical-search-admin/classify */
export async function dClassify(body: SYSTEMSET.ClassifyListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/classify', {
        method: 'DELETE',
        data: body,
        ...(options || {}),
    });
}

/** 新建分类 POST /medical-search-admin/classify */
export async function iClassify(body: SYSTEMSET.ClassifyListItem, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/classify', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 修改分类 PUT /medical-search-admin/classify */
export async function uClassify(body: SYSTEMSET.ClassifyListItem, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/classify', {
        method: 'PUT',
        data: body,
        ...(options || {}),
    });
}

/** 获取分类详情 GET /medical-search-admin/classify/{id} */
export async function getClassifyInfo(
    params: {
        // 用户 id
        id?: string | number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>(`/medical-search-admin/classify/${params.id}`, {
        method: 'GET',
        ...(options || {}),
    });
}

/** 获取检索符号列表（分页） GET /medical-search-admin/searchSymbol/page */
export async function getSearchSymbolList(
    params: {
        // query
        /** 当前的页码 */
        current?: number;
        /** 页面的容量 */
        pageSize?: number;
    },
    options?: { [key: string]: any },
) {
    return getTablePageList('/medical-search-admin/searchSymbol/page', params, options)
}

/** 删除检索符号 DELETE /medical-search-admin/searchSymbol */
export async function dSearchSymbol(body: SYSTEMSET.SearchSymbolListItem[], options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/searchSymbol', {
        method: 'DELETE',
        data: body,
        ...(options || {}),
    });
}

/** 新建检索符号 POST /medical-search-admin/searchSymbol */
export async function iSearchSymbol(body: SYSTEMSET.SearchSymbolListItem, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/searchSymbol', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 修改检索符号 PUT /medical-search-admin/searchSymbol */
export async function uSearchSymbol(body: SYSTEMSET.SearchSymbolListItem, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/searchSymbol', {
        method: 'PUT',
        data: body,
        ...(options || {}),
    });
}

/** 获取检索符号详情 GET /medical-search-admin/searchSymbol/{id} */
export async function getSearchSymbolInfo(
    params: {
        id?: string | number;
    },
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>(`/medical-search-admin/searchSymbol/${params.id}`, {
        method: 'GET',
        ...(options || {}),
    });
}

/** 获取检索符号下拉列表 GET /medical-search-admin/searchSymbol/findList */
export async function getSearchSymbolFindList(
    options?: { [key: string]: any },
) {
    return request<API.RequestResult>('/medical-search-admin/searchSymbol/findList', {
        method: 'GET',
        ...(options || {}),
    });
}