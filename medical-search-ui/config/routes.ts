/**
 * @name umi 的路由配置
 * @description 只支持 path,component,routes,redirect,wrappers,title 的配置
 * @param path  path 只支持两种占位符配置，第一种是动态参数 :id 的形式，第二种是 * 通配符，通配符只能出现路由字符串的最后。
 * @param component 配置 location 和 path 匹配后用于渲染的 React 组件路径。可以是绝对路径，也可以是相对路径，如果是相对路径，会从 src/pages 开始找起。
 * @param routes 配置子路由，通常在需要为多个路径增加 layout 组件时使用。
 * @param redirect 配置路由跳转
 * @param wrappers 配置路由组件的包装组件，通过包装组件可以为当前的路由组件组合进更多的功能。 比如，可以用于路由级别的权限校验
 * @doc https://umijs.org/docs/guides/routes
 */
export default [
  {
    path: '/user',
    layout: false,
    routes: [
      {
        name: '登录',
        path: '/user/login',
        component: './User/Login',
      }
    ],
  },
  {
    path: '/transition',
    layout: false,
    routes: [
      {
        name: '过渡',
        path: '/transition/index',
        component: './Transition/index',
      }
    ],
  },
  {
    path: '/welcome',
    name: '欢迎页',
    icon: 'smile',
    component: './Welcome',
    access: 'canAdmin'
  },
  {
    path: '/admin/sub-page',
    name: '主题页',
    icon: 'crown',
    component: './Admin',
    access: 'canAdmin'
  },
  {
    path: '/home',
    name: '首页',
    icon: 'home',
    access: 'hasPermission',
    routes: [
      {
        path: '/home',
        redirect: '/home/index',
      },
      {
        path: '/home/index',
        name: '首页',
        hideInMenu: true,
        component: './Home',
      },
      {
        path: '/home/searchList',
        name: '检索列表',
        hideInMenu: true,
        component: './Home/components/SearchList',
      },
    ]
  },
  {
    path: '/saveData',
    name: '数据保存',
    icon: 'save',
    access: 'hasPermission',
    routes: [
      {
        path: '/saveData',
        redirect: '/saveData/index',
      },
      {
        path: '/saveData/index',
        name: '数据保存',
        hideInMenu: true,
        component: './SaveData',
      },
      {
        path: '/saveData/exportRecord',
        name: '导出记录',
        hideInMenu: true,
        component: './SaveData/components/ExportRecord',
      },
    ]
  },
  {
    name: '检索模板',
    icon: 'search',
    path: '/searchTemplate',
    component: './SearchTemplate',
    access: 'hasPermission',
  },
  {
    name: '统计管理',
    icon: 'barChart',
    path: '/statisticsManage',
    component: './StatisticsManage',
    access: 'hasPermission',
  },
  {
    name: '权限管理',
    icon: 'usergroupAdd',
    path: '/permissionManage',
    component: './PermissionManage',
    access: 'hasPermission',
  },
  {
    name: '字段管理',
    icon: 'table',
    path: '/fieldManage',
    component: './FieldManage',
    access: 'hasPermission',
  },
  {
    name: '系统设置',
    icon: 'setting',
    path: '/systemSet',
    component: './SystemSet',
    access: 'hasPermission',
  },
  {
    name: '帮助',
    icon: 'questionCircle',
    path: '/help',
    component: './Help',
    // access: 'hasPermission',
  },
  {
    path: '/',
    redirect: '/home',
  },
  {
    path: '*',
    layout: false,
    component: './404',
  },
];
