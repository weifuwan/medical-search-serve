// @ts-ignore
/* eslint-disable */

declare namespace SAVEDATAAPI {
    type SaveDataListItem = {
        id: number | string;
        dimension: number;
        name: string;
        amount: number;
        expression: string;
        remark: string;
        createDate: string;
        updateDate: string;
        isDeleted: number;
    }

    type SaveDataUD = {
        id: number | string;
        dimension: number;
    }

    type FieldContentItemReq = {
        code: string;
        name: string
    }

    type FieldContentItem = {
        key?: string;
        title?: string;
        code?: string;
        name?: string
    }

    type SeniorExportItem = {
        id: string | number;
        contentType: number;
        fieldId: string | number;
        tableFieldId: string | number;
        fieldCode: string;
        fieldName: string;
        fieldSort: number;
        fieldContentDTOList: FieldContentItem[];
        tableId: string | number;
        tableCode: string;
        tableName: string;
        tableSort: number;
        sort?: any;
        title?: string;
        val?: string;
    }

    type SeniorExport = {
        id: string | number;
        fieldDTOList: SeniorExportItem[];
        page?: number,
        size?: number
    }

    // 表格分页
    type PageParams = {
        current?: number;
        pageSize?: number;
        id: string | number;
        fieldDTOList: SeniorExportItem[];
    }

    type RecycledStationListItem = {
        id?: number | string;
        searchId?: number | string;
        searchName: string;
        dimension: number;
        amount: string | number;
        expression: string;
        remark: string;
        createDate: string;
        createUserName: string;
        expireDate: string;
    }

    type ExportRecordListItem = {
        id: number | string;
        status: number;
        searchId?: number | string;
        searchName: string;
        dimension: number;
        amount: string | number;
        expression: string;
        fieldAmount: number;
        createDate: string;
        createUserName: string;
    }
}
