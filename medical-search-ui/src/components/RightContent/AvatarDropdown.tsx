import { outLogin } from '@/services/login/api';
import { EditOutlined, LogoutOutlined, UserOutlined } from '@ant-design/icons';
import { history, useModel } from '@umijs/max';
import { Avatar, Menu, Spin } from 'antd';
import type { ItemType } from 'antd/es/menu/hooks/useItems';
import { stringify } from 'querystring';
import type { MenuInfo } from 'rc-menu/lib/interface';
import React, { useCallback, useState } from 'react';
import { flushSync } from 'react-dom';
import HeaderDropdown from '../HeaderDropdown';
import JYModal from '../JYModal';
import UpdatePsw from '@/pages/User/UpdatePsw'
import styles from './index.less';

export type GlobalHeaderRightProps = {
    menu?: boolean;
};

const AvatarDropdown: React.FC<GlobalHeaderRightProps> = ({ menu }) => {
    const [isModalOpen, setIsModalOpen] = useState(false)// 修改密码
    /**
     * 退出登录，并且将当前的 url 保存
     */
    const loginOut = async () => {
        await outLogin();
        localStorage.clear()
        // const { search, pathname } = window.location;
        const urlParams = new URL(window.location.href).searchParams;
        /** 此方法会跳转到 redirect 参数所在的位置 */
        const redirect = urlParams.get('redirect');
        // Note: There may be security issues, please note
        if (window.location.pathname !== '/user/login' && !redirect) {
            history.replace({
                pathname: '/user/login',
                // search: stringify({
                //     redirect: pathname + search,
                // }),
            });
        }
    };
    const { initialState, setInitialState } = useModel('@@initialState');

    const handleCancel = () => {
        setIsModalOpen(false)
    }

    const onMenuClick = useCallback(
        (event: MenuInfo) => {
            const { key } = event;
            if (key === 'logout') {
                flushSync(() => {
                    setInitialState((s) => ({ ...s, currentUser: undefined }));
                });
                loginOut();
                return;
            }
            // history.push(`/updatePsw`);// 修改密码
            setIsModalOpen(true)
        },
        [setInitialState],
    );

    const loading = (
        <span className={`${styles.action} ${styles.account}`}>
            <Spin
                size="small"
                style={{
                    marginLeft: 8,
                    marginRight: 8,
                }}
            />
        </span>
    );

    if (!initialState) {
        return loading;
    }

    const { currentUser } = initialState;

    console.log(currentUser)

    if (!currentUser || !currentUser.username) {
        return loading;
    }

    const menuItems: ItemType[] = [
        ...(menu
            ? [
                // {
                //   key: 'center',
                //   icon: <UserOutlined />,
                //   label: '个人中心',
                // },
                // {
                //   key: 'settings',
                //   icon: <SettingOutlined />,
                //   label: '个人设置',
                // },
                {
                    key: 'updatePsw',
                    icon: <EditOutlined />,
                    label: '修改密码',
                },
                {
                    type: 'divider' as const,
                },
            ]
            : []),
        {
            key: 'logout',
            icon: <LogoutOutlined />,
            label: '退出登录',
        },
    ];

    const menuHeaderDropdown = (
        <Menu className={styles.menu} selectedKeys={[]} onClick={onMenuClick} items={menuItems} />
    );

    return (
        <>
            <HeaderDropdown overlay={menuHeaderDropdown}>
                <span className={`${styles.action} ${styles.account}`}>
                    {/* <Avatar size="small" className={styles.avatar} src={currentUser.avatar || 'https://www.scjydz.com/favicon.ico'} alt="avatar" /> */}
                    <UserOutlined style={{ marginRight: 8, fontSize: 16 }} />
                    <span className={`${styles.name} anticon`}>{currentUser.username}</span>
                </span>

            </HeaderDropdown>
            <JYModal 
                title="修改密码"
                width="500px"
                isModalOpen={isModalOpen}
                ChildNode={UpdatePsw}
                handleCancel={handleCancel}
                footer={null}
                maskClosable={false}
            />
        </>
    );
};

export default AvatarDropdown;
