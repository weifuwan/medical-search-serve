import { MessageOutlined, MobileOutlined, UserOutlined } from '@ant-design/icons';
import { GridContent } from '@ant-design/pro-layout';
import { useModel } from '@umijs/max';
import { Avatar, Spin } from 'antd';
import React from 'react';
import styles from './index.less';

export type CurrentUser = {
  username: string;
  avatar: string;
  userid: string;
  email: string;
  title: string;
  country: string;
  address: string;
  mobile: string;
};

const PersonalCenter: React.FC = () => {
  const { initialState } = useModel('@@initialState');
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

  //  渲染用户信息
  const renderUserInfo = ({ userName, mobile, email }: Partial<CurrentUser>) => {
    return (
      <div className={styles.detail}>
        <p>
          <UserOutlined
            style={{
              marginRight: 8,
            }}
          />
          {userName || ''}
        </p>
        <p>
          <MobileOutlined
            style={{
              marginRight: 8,
            }}
          />
          {mobile || ''}
        </p>
        <p>
          <MessageOutlined
            style={{
              marginRight: 8,
            }}
          />
          {email || ''}
        </p>
      </div>
    );
  };

  return (
    <GridContent>
      {currentUser && (
        <div>
          <div className={styles.avatarHolder}>
            {currentUser?.avatar ? (
              <Avatar className={styles.avatar} size={80} src={currentUser?.avatar || ""} alt="avatar" />
            ) : (
              <Avatar size={64} icon={<UserOutlined />} />
            )}

            <div className={styles.name}>{currentUser.realName || ''}</div>
          </div>
          {renderUserInfo(currentUser)}
        </div>
      )}
    </GridContent>
  );
};
export default PersonalCenter;
