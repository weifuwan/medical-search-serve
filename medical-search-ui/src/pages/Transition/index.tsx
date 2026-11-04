import { getHispitalInfo } from '@/services/systemSet/api';
import { setLocalVal, setSessionVal } from '@/utils';
import { history, useModel } from '@umijs/max';
import { Spin } from 'antd';
import React, { useEffect } from 'react';
import { flushSync } from 'react-dom';

const TransitionPage: React.FC = () => {
    const { initialState, setInitialState } = useModel('@@initialState')

    const fetchUserInfo = async () => {
        const userInfo = await initialState?.fetchUserInfo?.()
        const permissionList = await initialState?.fetchPermission?.()
        if (userInfo && permissionList) {
            flushSync(() => {
                setInitialState((s) => ({
                    ...s,
                    currentUser: userInfo,
                    permissionList: permissionList,
                    hasRoutes: permissionList.map((item: any) => item.name)
                }))
            })
        }

        // 获取医院信息
        const { code, data } = await getHispitalInfo()
        if (code === 0) {
            // setLocalVal('logoUrl', data.filter((item: { paramCode: string }) => item.paramCode === 'HOSPITAL_LOGO_URL')[0].paramValue)
            // setSessionVal('hispitalName', data.filter((item: { paramCode: string }) => item.paramCode === 'HOSPITAL_NAME')[0].paramValue)
        }

        const url = permissionList?.length ? permissionList[0].url : '/help'
        history.push(url)
    }

    useEffect(() => {
        fetchUserInfo()
    },[])

    return (
        <div style={{ width: "100%", height: "100%", display: 'grid', placeItems: 'center' }}>
            <Spin size="large" />
        </div>
    );
}

export default TransitionPage;
