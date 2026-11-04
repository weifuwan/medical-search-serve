import Footer from '@/components/Footer';
import { LockOutlined, UserOutlined } from '@ant-design/icons';
import { LoginForm, ProFormCheckbox, ProFormText } from '@ant-design/pro-components';
import { history } from '@umijs/max';
import { Alert, ConfigProvider, message } from 'antd';
import React, { useEffect, useState } from 'react';
// import { FormattedMessage, history, SelectLang, useIntl, useModel } from '@umijs/max';
import { checkToken, login } from '@/services/login/api';
import { getLocalVal, getToken, setLocalVal, setSessionVal, setToken } from '@/utils';
import defaultSettings from '../../../../config/defaultSettings';
import styles from './index.less';

// 登录页还未对主题进行配置，所以此处同步配置的颜色
ConfigProvider.config({
  theme: {
    primaryColor: defaultSettings.colorPrimary,
  },
});

const jumpPath = '/transition/index';

// 登录错误信息展示
const LoginMessage: React.FC<{
  content?: string;
}> = ({ content }) => {
  return <Alert style={{ marginBottom: 24 }} message={content} type="error" showIcon />;
};
const Login: React.FC = () => {
  const [userLoginState, setUserLoginState] = useState<API.RequestResult>({ code: 0 });

  // 提交登录
  const handleSubmit = async (values: LOGINAPI.LoginParams) => {
    try {
      // 登录
      const { code, data, msg } = await login({ ...values });
      if (code === 0) {
        setSessionVal('searchVal', '');
        setToken(data.token);
        setLocalVal('autoLogin', values['autoLogin'] || false);
        // const urlParams = new URL(window.location.href).searchParams
        // history.push(urlParams.get('redirect'))
        history.push(jumpPath);
        message.success('登录成功！');
        return;
      } else {
        // 如果失败去设置用户错误信息
        setUserLoginState({ code, data, msg });
      }
    } catch (error) {
      message.error('登录失败，请重试！');
    }
  };

  // 自动登录初始化
  const initStart = async () => {
    if (getLocalVal('autoLogin') && getToken()) {
      history.push(jumpPath);
    }
  };

  // 校验单点登录
  const checkSingleToken = async () => {
    const url = window.location.href;
    const paramsData = /singleToken=([^=&]*)/.exec(url);
    if (!paramsData) return;
    const singleToken = paramsData[1];
    const params = new URLSearchParams();
    params.append('singleToken', singleToken);
    const { code, data } = await checkToken(params);
    if (code === 0) {
      setToken(data.token);
      setLocalVal('autoLogin', false);
      history.push(jumpPath);
    }
  };

  useEffect(() => {
    checkSingleToken();
    setSessionVal('isOverdue', false); // 是否过期
  }, []);

  useEffect(() => {
    initStart();
  }, [getLocalVal('autoLogin')]);

  return (
    <>
      <div className={styles.container}>
        {/* <div className={styles.lang} data-lang>
        {SelectLang && <SelectLang />}
      </div> */}
        <div className={styles.content}>
          <LoginForm
            className={styles.loginForm}
            // logo={<img alt="logo" src="/logo.png" />}
            // title="佳缘科技"
            // subTitle="临床大数据搜索引擎系统"
            // initialValues={{
            //     username: 'admin',
            //     password: 'admin',
            //     autoLogin: true,
            // }}
            onFinish={async (values) => {
              await handleSubmit(values as LOGINAPI.LoginParams);
            }}
          >
            <div className={styles.loginHeader}>
              <h1 className={styles.primaryColor}>隆昌医院</h1>
              <h2 className={styles.primaryColor}>临床大数据搜索引擎系统</h2>
            </div>

            {userLoginState.code !== 0 && <LoginMessage content={userLoginState.msg} />}

            <ProFormText
              name="username"
              fieldProps={{
                size: 'large',
                prefix: <UserOutlined className={styles.prefixIcon} />,
              }}
              placeholder="请输入用户名"
              rules={[
                {
                  required: true,
                  message: '请输入用户名！',
                },
              ]}
            />
            <ProFormText.Password
              name="password"
              fieldProps={{
                size: 'large',
                prefix: <LockOutlined className={styles.prefixIcon} />,
              }}
              placeholder="请输入密码"
              rules={[
                {
                  required: true,
                  message: '请输入密码',
                },
              ]}
            />

            <div style={{ marginBottom: 24 }}>
              <ProFormCheckbox noStyle name="autoLogin" initialValue={getLocalVal('autoLogin')}>
                自动登录
              </ProFormCheckbox>
              <a style={{ float: 'right' }}>
                {/* <FormattedMessage id="pages.login.forgotPassword" defaultMessage="忘记密码" /> */}
              </a>
            </div>
          </LoginForm>
        </div>
      </div>
      <div style={{ position: 'fixed', bottom: 0, width: "100%" }}>
        <Footer />
      </div>
    </>
  );
};

export default Login;
