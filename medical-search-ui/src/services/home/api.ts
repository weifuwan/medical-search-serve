// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';
import { getTreeList } from '../common/api'


/** 获取模版列表 GET /medical-search-admin/template/template/list */
export async function getTemplateList(options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/template/template/list', {
        method: 'GET',
        ...(options || {}),
    });
}

export async function getSearchSymbolList(options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/searchSymbol/findList', {
        method: 'GET',
        ...(options || {}),
    });
}

/** 获取历史检索 GET /medical-search-admin/log/logsearch/listOfHistorySearch */
export async function getHistoryList(params: { top: number }, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/log/logsearch/listOfHistorySearch', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}

/** 获取热们检索 GET /medical-search-admin/log/logsearch/listOfPopularSearch */
export async function getHotList(params: { top: number }, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/log/logsearch/listOfPopularSearch', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}

/** Get user popular search GET /medical-search-admin/log/logsearch/listOfUserPopularSearch */
export async function getUserHotList(params: { top: number }, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/log/logsearch/listOfUserPopularSearch', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}
/** 获取检索列表 GET /medical-search-admin/index/search */
export async function getSearchList(body: HOMEAPI.SearchParams, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/index/search', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 获取检索列表 GET /medical-search-admin/index/search */
export async function getSearchListV2(body: HOMEAPI.SearchParams, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/index/search-v2', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 获取 tree (表)列表 GET /medical-search-admin/table/getAllTableList */
export async function getTreeListData(params: HOMEAPI.TreeReqParams, converField: string[]) {
    return getTreeList('/medical-search-admin/table/getTableInfo', params, converField)
}


/** 获取逻辑符号列表 GET /medical-search-admin/common/logicList */
export async function getLogicSymbolList(options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/common/logicList', {
        method: 'GET',
        ...(options || {}),
    });
}

/** 获取关系符号列表 GET /medical-search-admin/common/relationalList */
export async function getRelationalSymbolList(options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/common/relationalList', {
        method: 'GET',
        ...(options || {}),
    });
}

/** 数据保存 POST /medical-search-admin/export/exportsearchresult */
export async function saveData(body: HOMEAPI.SaveDataParams, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/export/exportsearchresult', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}

/** 电子病历查询接口 GET /medical-search-admin/ws/queryEmr */
export async function queryEmr(params: { domainId: string, patientId: string, visitNo: string, }, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/ws/queryEmr', {
        method: 'GET',
        params: {
            ...params
        },
        ...(options || {}),
    });
}

/** 字典列表批量查询（空就是查询全部）  POST /medical-search-admin/sys/dict/data/findListByBatchType  */
export async function findListByBatchType(body: any, options?: { [key: string]: any }) {
    return request<API.RequestResult>('/medical-search-admin/sys/dict/data/findListByBatchType', {
        method: 'POST',
        data: body,
        ...(options || {}),
    });
}
