// @ts-ignore
/* eslint-disable */

// 通用类型定义
declare namespace API {
    // 表格分页
    type PageParams = {
        current?: number;
        pageSize?: number;
    }
    // 请求结果
    type RequestResult = {
        code?: number;
        data?: any;
        msg?: string;
    }

    type CommonListType = {
        key: number | string;
        value: number | string;
        code?: string | number | undefined;
        name?: string;
    }

    type CommonSelectType = {
        label: string;
        value: number | string;
    }
}
