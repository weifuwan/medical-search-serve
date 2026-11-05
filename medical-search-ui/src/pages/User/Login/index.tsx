import { checkToken, getLoginBranding, login } from '@/services/login/api';
import { getLocalVal, getToken, setLocalVal, setSessionVal, setToken } from '@/utils';
import {
  EyeInvisibleOutlined,
  EyeOutlined,
  LockOutlined,
  SafetyCertificateOutlined,
  UserOutlined,
} from '@ant-design/icons';
import { history } from '@umijs/max';
import { message } from 'antd';
import React, { useEffect, useState } from 'react';
import styles from './index.less';

const jumpPath = '/transition/index';
const defaultHospitalName = '隆昌医院';

const MedicalIcon: React.FC = () => (
  <svg viewBox="0 0 64 64" aria-hidden="true" className={styles.medicalIcon}>
    <rect x="23" y="2" width="18" height="60" rx="9" fill="#079d86" />
    <rect x="2" y="23" width="60" height="18" rx="9" fill="#079d86" />
    <rect x="28" y="13" width="8" height="38" rx="3" fill="#fff" />
    <rect x="13" y="28" width="38" height="8" rx="3" fill="#fff" />
  </svg>
);

const Login: React.FC = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [autoLogin, setAutoLogin] = useState(() => Boolean(getLocalVal('autoLogin')));
  const [passwordVisible, setPasswordVisible] = useState(false);
  const [submitting, setSubmitting] = useState(false);
  const [loginError, setLoginError] = useState('');
  const [hospitalName, setHospitalName] = useState(defaultHospitalName);
  const [hospitalLogo, setHospitalLogo] = useState('');

  useEffect(() => {
    let mounted = true;

    getLoginBranding({ skipErrorHandler: true })
      .then(({ code, data }) => {
        if (!mounted || code !== 0 || !data) return;
        if (data.hospitalName?.trim()) setHospitalName(data.hospitalName.trim());
        if (data.logoBase64?.startsWith('data:image/')) setHospitalLogo(data.logoBase64);
      })
      .catch(() => {
        // The login form remains available when branding cannot be loaded.
      });

    const checkSingleToken = async () => {
      const singleToken = new URLSearchParams(window.location.search).get('singleToken');
      if (!singleToken) return;
      try {
        const params = new URLSearchParams();
        params.append('singleToken', singleToken);
        const { code, data } = await checkToken(params);
        if (code === 0 && data?.token) {
          setToken(data.token);
          setLocalVal('autoLogin', false);
          history.push(jumpPath);
        }
      } catch {
        message.error('单点登录失败，请使用账号密码登录');
      }
    };

    checkSingleToken();
    setSessionVal('isOverdue', false);
    if (getLocalVal('autoLogin') && getToken()) {
      history.push(jumpPath);
    }

    return () => {
      mounted = false;
    };
  }, []);

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (submitting) return;

    const loginName = username.trim();
    if (!loginName || !password) {
      setLoginError('请输入用户名和密码');
      return;
    }

    setLoginError('');
    setSubmitting(true);
    try {
      const { code, data, msg } = await login({
        username: loginName,
        password,
        autoLogin,
      });
      if (code === 0 && data?.token) {
        setSessionVal('searchVal', '');
        setToken(data.token);
        setLocalVal('autoLogin', autoLogin);
        history.push(jumpPath);
        message.success('登录成功！');
      } else {
        setLoginError(msg || '登录失败，请检查用户名或密码');
      }
    } catch {
      setLoginError('登录失败，请重试');
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <main className={styles.container}>
      <header className={styles.brand} aria-label={hospitalName}>
        <div className={styles.brandIcon}>
          {hospitalLogo ? (
            <img src={hospitalLogo} alt="" className={styles.hospitalLogo} />
          ) : (
            <MedicalIcon />
          )}
        </div>
        <span className={styles.brandDivider} aria-hidden="true" />
        <div className={styles.brandCopy}>
          <div className={styles.hospitalName}>{hospitalName}</div>
          {hospitalName === defaultHospitalName && (
            <div className={styles.hospitalEnglish}>LONGCHANG HOSPITAL</div>
          )}
        </div>
      </header>

      <section className={styles.card} aria-labelledby="login-title">
        <h1 className={styles.title} id="login-title">欢迎登录</h1>
        <span className={styles.titleLine} aria-hidden="true" />
        <p className={styles.description}>请使用您的工作账号登录</p>

        <form className={styles.loginForm} onSubmit={handleSubmit}>
          <div className={styles.field}>
            <UserOutlined className={styles.fieldIcon} aria-hidden="true" />
            <input
              aria-label="用户名"
              autoComplete="username"
              name="username"
              placeholder="用户名"
              type="text"
              value={username}
              onChange={(event) => setUsername(event.target.value)}
            />
          </div>

          <div className={styles.field}>
            <LockOutlined className={styles.fieldIcon} aria-hidden="true" />
            <input
              aria-label="密码"
              autoComplete="current-password"
              name="password"
              placeholder="密码"
              type={passwordVisible ? 'text' : 'password'}
              value={password}
              onChange={(event) => setPassword(event.target.value)}
            />
            <button
              className={styles.visibilityButton}
              type="button"
              aria-label={passwordVisible ? '隐藏密码' : '显示密码'}
              aria-pressed={passwordVisible}
              onClick={() => setPasswordVisible(!passwordVisible)}
            >
              {passwordVisible ? <EyeOutlined /> : <EyeInvisibleOutlined />}
            </button>
          </div>

          <label className={styles.remember}>
            <input
              type="checkbox"
              checked={autoLogin}
              onChange={(event) => setAutoLogin(event.target.checked)}
            />
            <span>自动登录</span>
          </label>

          {loginError && <div className={styles.loginError} role="alert">{loginError}</div>}

          <button className={styles.submitButton} type="submit" disabled={submitting}>
            {submitting ? '登录中…' : '登 录'}
          </button>
        </form>

        <div className={styles.securityNote}>
          <span className={styles.securityLine} />
          <SafetyCertificateOutlined aria-hidden="true" />
          <span>安全访问 · 授权使用</span>
          <span className={styles.securityLine} />
        </div>
      </section>
    </main>
  );
};

export default Login;
