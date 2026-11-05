import Footer from '@/components/Footer';
import RightContent from '@/components/RightContent';
import { getPermissionList } from '@/services/permissionManage/api';
import { getHispitalInfo } from '@/services/systemSet/api';
import type { Settings as LayoutSettings } from '@ant-design/pro-components';
import { SettingDrawer } from '@ant-design/pro-components';
import type { RunTimeLayoutConfig } from '@umijs/max';
import { history } from '@umijs/max';
import { message } from 'antd';
import defaultSettings from '../config/defaultSettings';
import { requestConfig } from './requestConfig';
import { currentUser as queryCurrentUser } from './services/login/api';
import { getLocalVal, getToken } from './utils';

const isDev = process.env.NODE_ENV === 'development';
const loginPath = '/user/login';
const saveShareReturnPath = () => {
  const returnPath = window.location.pathname + window.location.search;
  if (window.location.pathname.startsWith('/share/')) {
    sessionStorage.setItem('expressionShareReturnTo', returnPath);
  }
};

/**
 * @see  https://umijs.org/zh-CN/plugins/plugin-initial-state
 * */
export async function getInitialState(): Promise<{
  loading?: boolean;
  settings?: Partial<LayoutSettings>;
  currentUser?: LOGINAPI.CurrentUser;
  permissionList?: any[];
  hasRoutes?: string[];
  logoUrl?: string;
  loginName?: string;
  fetchUserInfo?: () => Promise<LOGINAPI.CurrentUser | undefined>;
  fetchPermission?: () => Promise<any[]>;
  getLogoUrl?: () => Promise<string>;
  getLogoName?: () => Promise<string>;
}> {
  const fetchUserInfo = async () => {
    try {
      const res = await queryCurrentUser({
        skipErrorHandler: true,
      });
      return res.data;
      // return {}
    } catch (error) {
      saveShareReturnPath();
      history.push(loginPath);
    }
    return undefined;
  };
  const fetchPermission = async () => {
    try {
      const res = await getPermissionList({
        skipErrorHandler: true,
      });
      return res.data;
      // return {}
    } catch (error) {
      history.push(loginPath);
    }
    return undefined;
  };

  const getLogoUrl = async () => {
    try {
      // 获取医院信息
      const { code, data } = await getHispitalInfo();
      if (code === 0) {
        // return data.filter((item: { paramCode: string }) => item.paramCode === 'HOSPITAL_LOGO_URL')[0].paramValue
        return data?.logoBase64 || '';
      }
    } catch (error) {
      history.push(loginPath);
    }

    return '';
  };

  const getLogoName = async () => {
    try {
      // 获取医院信息
      const { code, data } = await getHispitalInfo();
      if (code === 0) {
        // return data.filter((item: { paramCode: string }) => item.paramCode === 'HOSPITAL_LOGO_URL')[0].paramValue
        return data?.hospitalName || '';
      }
    } catch (error) {
      history.push(loginPath);
    }

    return '';
  };

  const currentUser = await fetchUserInfo();
  // 如果不是登录页面，执行
  if (window.location.pathname !== loginPath && currentUser) {
    const permissionList = await fetchPermission();
    const logoUrl = await getLogoUrl();
    const loginName = await getLogoName();
    return {
      fetchUserInfo,
      currentUser,
      fetchPermission,
      permissionList,
      getLogoUrl,
      getLogoName,
      logoUrl,
      loginName,
      hasRoutes: permissionList.map((item: any) => item.name),
      settings: defaultSettings,
    };
  }
  return {
    fetchUserInfo,
    fetchPermission,
    getLogoUrl,
    getLogoName,
    settings: defaultSettings,
  };
}

// ProLayout 支持的api https://procomponents.ant.design/components/layout
export const layout: RunTimeLayoutConfig = ({ initialState, setInitialState }) => {

  return {
    // logo: false,
    // logo: 'https://www.scjydz.com/favicon.ico',
    logo:
      initialState?.logoUrl ||
      getLocalVal('logoUrl') ||
      '/my.png' ||
      'https://www.scjydz.com/favicon.ico',
    onMenuHeaderClick: undefined, // 去除点击 logo 跳转到首页
    title: initialState?.loginName || "隆昌市人民医院",
    // title: localStorage.getItem('hispitalName') || '临床大数据搜索引擎系统',
    // title: '佳缘科技',
    // waterMarkProps: {// 页面水印
    //   content: initialState?.currentUser?.realName,
    // },
    rightContentRender: () => <RightContent />,
    footerRender: () => <Footer />,
    onPageChange: () => {
      const { location } = history;
      // 如果没有登录，重定向到 login
      if (!getToken() && location.pathname !== loginPath) {
        saveShareReturnPath();
        message.error('登录过期！请重新登录！');
        history.push(loginPath);
      }
    },
    layoutBgImgList: [
      {
        src: 'https://mdn.alipayobjects.com/yuyan_qk0oxh/afts/img/D2LWSqNny4sAAAAAAAAAAAAAFl94AQBr',
        left: 85,
        bottom: 100,
        height: '303px',
      },
      {
        src: 'https://mdn.alipayobjects.com/yuyan_qk0oxh/afts/img/C2TWRpJpiC0AAAAAAAAAAAAAFl94AQBr',
        bottom: -68,
        right: -45,
        height: '303px',
      },
      {
        src: 'https://mdn.alipayobjects.com/yuyan_qk0oxh/afts/img/F6vSTbj8KpYAAAAAAAAAAAAAFl94AQBr',
        bottom: 0,
        left: 0,
        width: '331px',
      },
    ],
    // links: isDev
    //     ? [
    //         <Link key="openapi" to="/umi/plugin/openapi" target="_blank">
    //             <LinkOutlined />
    //             <span>OpenAPI 文档</span>
    //         </Link>,
    //     ]
    //     : [],
    menuHeaderRender: undefined,
    // 自定义 403 页面
    // unAccessible: <div>unAccessible</div>,
    // 增加一个 loading 的状态
    childrenRender: (children, props) => {
      // if (initialState?.loading) return <PageLoading />;
      return (
        <>
          {children}
          {!props.location?.pathname?.includes('/login') && (
            <SettingDrawer
              disableUrlParams
              enableDarkTheme
              settings={initialState?.settings}
              onSettingChange={(settings) => {
                setInitialState((preInitialState) => ({
                  ...preInitialState,
                  settings,
                }));
              }}
            />
          )}
        </>
      );
    },
    ...initialState?.settings,
  };
};

/**
 * @name request 配置，可以配置错误处理
 * 它基于 axios 和 ahooks 的 useRequest 提供了一套统一的网络请求和错误处理方案。
 * @doc https://umijs.org/docs/max/request#配置
 */
export const request = {
  ...requestConfig,
  // baseURL: 'http://192.168.30.167:8082'// 八院
  // baseURL: 'http://192.168.30.89:3082'// 八院测试环境
  // baseURL: 'http://192.168.1.116:2080'// 此处配置基本路径
  // baseURL: 'http://192.168.1.116:21000'// 此处配置基本路径
  // baseURL: 'http://171.223.208.184:20000'// 此处配置基本路径
  // baseURL: 'http://192.168.30.143:20000'// 此处配置基本路径
  // baseURL: 'http://10.231.30.201:20000'// 此处配置基本路径
  // baseURL: 'http://192.168.30.144:8080'// 此处配置基本路径
  // baseURL: 'http://10.10.102.12:8080'// 绵阳环境
  baseURL: 'http://localhost:8080', // 本地测试环境
  // baseURL: 'http://192.168.1.115:8082'// wfw base url
};
