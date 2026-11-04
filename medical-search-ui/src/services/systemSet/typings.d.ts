// @ts-ignore
/* eslint-disable */

declare namespace SYSTEMSET {
    type ConfigListItem = {
        moduleId: number | string;
        moduleName: string;
        children: any[]
    }

    type SaveConfigListItem = {
        key: string;
        value: string;
    }

    type SaveListItem = {
        id?: number | string;
        fieldId?: number | string;
        fieldCode?: string;
        fieldName?: string;
        tableCode?: string;
        tableName?: string;
        isDefault: number;
        sort?: number;
    }

    type ClassifyListItem = {
      id?: number | string;
      name: string;
      createDate: string;
      updateDate: string;
      isDeleted: number;
      sort: number | string;
  }

  type SearchSymbolListItem = {
        id?: string | number;
        symbolValue?: string;
        symbolLabel?: string;
        sort?: number;
        isDeleted?: number;
        createDate?: string;
        updateDate?: string;
    }
}
