import React, { useEffect, useState } from 'react'
import {
    PageContainer,
} from '@ant-design/pro-components'
import User from './components/User'
import Role from './components/Role'
import Permission from './components/Permission'
import { useModel } from '@umijs/max'

// 权限管理
const PermissionManage: React.FC = () => {
    const [tabKey, setTabKey] = useState('user')
    const { initialState } = useModel('@@initialState')
    const [isHasUserPermission, setIsHasUserPermission] = useState(false)
    const [isHasRolePermission, setIsHasRolePermission] = useState(false)

    const fetchUserInfo = async () => {
        if (!initialState) {
            return ;
        }
        const { permissionList } = initialState
        const fatherP = permissionList?.filter(item => item.url == '/permissionManage')[0]
        const userP = fatherP['children'].filter((child: any) => child.url == 'sys/user')
        const roleP = fatherP['children'].filter((child: any) => child.url == 'sys/role')
        setIsHasUserPermission(userP.length > 0)
        setIsHasRolePermission(roleP.length > 0)
    }

    const Children = () => {
        return (
            <>
                {tabKey === 'user' && <User />}
                {tabKey === 'role' && <Role />}
                {tabKey === 'permission' && <Permission />}
            </>
        )
    }

    useEffect(() => {
        fetchUserInfo()
    }, [])

    return (
        <PageContainer
            fixedHeader
            tabList={[
                {
                    tab: '用户管理',
                    key: 'user',
                    disabled: !isHasUserPermission
                },
                {
                    tab: '角色管理',
                    key: 'role',
                    disabled: !isHasRolePermission
                },
                // {
                //   tab: '权限管理',
                //   key: 'permission',
                // },
            ]}

            onTabChange={(key) => {
                setTabKey(key)
            }}
        >
            <Children />
        </PageContainer>
    )
}

export default PermissionManage;
