// @ts-ignore
/* eslint-disable */

declare namespace TABLEORFIELDAPI {
    // 表格分页
    type PageParams = {
        current?: number;
        pageSize?: number;
        classifyId?: string;
    }

    type TableListItem = {
        id?: number | string;
        classifyId: string;
        tableName: string;
        isShow: boolean;
        tableId: string;
        fieldCode: string;
    }

    type TableShowType = {
      isShow: boolean;
      tableId?: number | string;
  }

    type FieldListItem = {
        id?: number | string;
        name: string;
        createDate?: string;
        menuIdList: React.Key[];
        isShow: boolean;
        tableCode: string;
        fieldCode: string;
    }

    type PermissionItem = {
        id: number | string;
        name: string;
        children: PermissionItem[];
    }
}
