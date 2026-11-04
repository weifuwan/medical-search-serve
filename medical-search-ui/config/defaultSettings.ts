import { Settings as LayoutSettings } from '@ant-design/pro-components';

/**
 * @name
 */
const Settings: LayoutSettings & {
    pwa?: boolean;
    logo?: string;
} = {
    navTheme: 'light',
    colorPrimary: 'rgba(26, 188, 156, 1)',
    layout: 'top',
    contentWidth: 'Fluid',
    fixedHeader: true,
    fixSiderbar: true,
    colorWeak: false,
    //   title: '临床大数据搜索引擎系统',
    //   logo: 'https://www.scjydz.com/favicon.ico',
    // logo: '/mianyang-logo.png',
    pwa: false,
    iconfontUrl: '',
};

export default Settings;
