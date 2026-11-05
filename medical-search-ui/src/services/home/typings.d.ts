// @ts-ignore
/* eslint-disable */

declare namespace HOMEAPI {
    type SearchParams = {
        dimension: number;
        expression: string;
        templateId?: number | string;
        orderTableCode?: string;
        orderFieldCode?: string;
        orderMode?: string;
        page: number;
        size: number;
    }

    type TreeReqParams = {
        classifyId: string;
        keyword?: string;
        type: number
    }

    type TreeResParams = {
        id?: string;
        tableName?: string;
        fieldName?: string;
        fieldList?: TreeResParams[];
    }

    type TreeItemType = {
        title: string;
        key: string;
        children?: TreeItemType[];
    }

    type SaveDataParams = {
        amount: number;
        dimension: number;
        expression: string;
        name?: string;
        remark?: string;
        orderTableCode: string;
        orderFieldCode: string;
        orderMode: string;
    }
}
