// @ts-ignore
/* eslint-disable */

declare namespace STEMPLATEAPI {
    type TemplateListItem = {
        id?: number | string;
        templateName: string;
        useScope: string;
        expression: string;
        searchConfig?: string;
        createDate: string;
        creatorName: string;
        updateDate: string;
        updaterName: string;
    }

    type TemplateField = {
        title?: string;
        sort: number;
        fieldCode?: string;
        fieldId: number | string;
        fieldName?: string;
        fieldVal: string;
        id?: number | string;
        logic: number | string;
        relation: number | string;
        tableCode?: string;
        tableId?: string | string;
        tableName?: "";
    }

    type IUTemplateItem = {
        id?: number | string;
        templateName: string;
        useScope: string;
        expression: string;
        searchConfig?: string;
        templateFieldDTOList: TemplateField[];
    }


    type SymbolListItem = {
        key: number | string;
        value: string;
    }
}
