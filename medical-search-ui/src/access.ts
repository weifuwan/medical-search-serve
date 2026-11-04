/**
 * @see https://umijs.org/zh-CN/plugins/plugin-access
 * */
export default function access(initialState: { currentUser?: LOGINAPI.CurrentUser; hasRoutes: string[] } | undefined) {
  const { currentUser, hasRoutes } = initialState ?? {};
  return {
    canAdmin: currentUser && currentUser.access === 'admin',
    hasPermission: (route: any) => hasRoutes?.includes(route.name), // initialState 中包含了的路由才有权限访问
  };
}
