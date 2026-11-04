// @ts-ignore
/* eslint-disable */

declare namespace PERSSIONAPI {
    type UserListItem = {
        id?: number | string;
        gender?: number;
        status?: number;
        username: string;
        realName: string;
        account: string;
        password: string;
        roleList: RoleListItem[];
        createDate: string;
        superAdmin: number;
    }
    type RoleListItem = {
        id?: number | string;
        name: string;
        createDate?: string;
        menuIdList: React.Key[]
    }

    type SwitchCode = {
        status?:  string;
        tableCode: string;
        fieldCOde?: string;
    }

    type PermissionItem = {
        id: number | string;
        name: string;
        children: PermissionItem[];
    }

    type ResetPswForm = {
        id?: number | string;
        password: string;
        againPassword?: string;
    }
}
