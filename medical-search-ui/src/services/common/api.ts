// @ts-ignore
/* eslint-disable */
import { request } from '@umijs/max';

/** 通用获取表格分页列表 GET */
export async function getTablePageList(
    url: string,
    params: {
        // query
        /** 当前的页码 */
        current?: number;
        /** 页面的容量 */
        pageSize?: number;
    },
    options?: { [key: string]: any },
) {

    const { code, data } = await request<API.RequestResult>(url, {
        method: 'GET',
        params: {
            page: params.current,
            limit: params.pageSize,
            ...params,
        },
        ...(options || {}),
    })

    return {
        success: code === 0,
        data: data?.list,
        total: data?.total,
    }
}

/** 通用获取下拉列表 GET */
export async function getSelectList(
    url: string,
    params?: {},
    converField?: string[],// 需要转换的字段
    options?: { [key: string]: any },
) {
    const { code, data } = await request<API.RequestResult>(url, {
        method: 'GET',
        params: {
            ...params,
        },
        ...(options || {}),
    })
    if (code !== 0) return
    if (!converField?.length) return data
    const converData = data?.map((item: any) => ({
        label: item[converField![0]],
        value: item[converField![1]],
    }))
    return converData
}

/** 通用获取 2 层树形列表 GET */
export async function getTreeList(
    url: string,
    params?: {},
    converField?: string[],// 需要转换的字段
    options?: { [key: string]: any },
) {
    const { code, data } = await request<API.RequestResult>(url, {
        method: 'GET',
        params: {
            ...params,
        },
        ...(options || {}),
    })
    if (code !== 0) return
    if (!converField?.length) return data
    const converData = data?.map((item: any) => ({
        title: item[converField![0]],
        key: item[converField![1]],
        children: item[converField![2]]?.map((child: any) => (
            {
                title: child[converField![3]] + (child.remark ? ('（' + child.remark + '）') : ''),
                key: child[converField![4]],
                ...child
            }
        )).filter((children: any) => children.isShow),
        ...item
    }))
    return converData.filter((children: any) => children.isShow)
}