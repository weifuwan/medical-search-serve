import { getPermissionList } from '@/services/permissionManage/api';
import { PageContainer } from '@ant-design/pro-components';
import { GridContent } from '@ant-design/pro-layout';
import { Menu } from 'antd';
import React, { useEffect, useLayoutEffect, useRef, useState } from 'react';
import UpdatePsw from '../User/UpdatePsw';
import Base from './components/Base';
import Hospital from './components/Hospital';
import Insert from './components/Insert';
import Personal from './components/Personal';
import Search from './components/Search';
import SearchSymbol from './components/SearchSymbol';
import TableClass from './components/TableClass';
import Time from './components/Time';
import User from './components/User';
import styles from './index.less';

const { Item } = Menu;

type SettingsStateKeys =
  | 'sys/searchSymbol'
  | 'sys/basic'
  | 'sys/logo'
  | 'sys/defaultShowField'
  | 'sys/userShowField'
  | 'sys/defaultCheck'
  | 'sys/classify'
  | 'sys/personal'
  | 'updatePsw'
  | 'time';
type SettingsState = {
  mode: 'inline' | 'horizontal';
  selectKey: SettingsStateKeys;
};

const SystemSet: React.FC = () => {
  // const menuMap: Record<string, React.ReactNode> = {
  //     // "sys/basic": '基本配置',
  //     // "sys/logo": '医院名称/logo配置',
  //     // "sys/defaultShowField": '默认展示字段配置',
  //     // "sys/userShowField": '用户展示字段配置',
  //     // "sys/defaultCheck": '默认检索字段配置',
  //     // "sys/classify": '表分类配置',
  //     // "sys/personal": '个人中心',
  //     // updatePsw: '修改密码',
  //     // time: '数据更新时间',
  // }

  const [menuMap, setMenuMap] = useState<Record<string, React.ReactNode>>({});
  const saveKey = sessionStorage.getItem('systemSetSelectName') as SettingsStateKeys;
  const [initConfig, setInitConfig] = useState<SettingsState>({
    mode: 'inline',
    selectKey: saveKey,
  });
  const dom = useRef<HTMLDivElement>();

  const resize = () => {
    requestAnimationFrame(() => {
      if (!dom.current) {
        return;
      }
      let mode: 'inline' | 'horizontal' = 'inline';
      const { offsetWidth } = dom.current;
      if (dom.current.offsetWidth < 641 && offsetWidth > 400) {
        mode = 'horizontal';
      }
      if (window.innerWidth < 768 && offsetWidth > 400) {
        mode = 'horizontal';
      }
      setInitConfig({ ...initConfig, mode: mode as SettingsState['mode'] });
    });
  };

  // 查询所有权限
  const handlePermissionList = async () => {
    const { code, data } = await getPermissionList();
    if (code === 0) {
      const obj: Record<string, React.ReactNode> = {};
      data.forEach((item: any) => {
        if (item.name === '系统设置') {
          if (!saveKey) {
            setInitConfig({
              mode: 'inline',
              selectKey: item.children[0]?.url,
            });
          }
          item.children?.forEach((child: any) => {
            obj[child.url] = child.name;
          });
        }
      });

      setMenuMap(obj);
    }
  };

  useEffect(() => {
    handlePermissionList();
  }, []);

  useLayoutEffect(() => {
    if (dom.current) {
      window.addEventListener('resize', resize);
      resize();
    }
    return () => {
      window.removeEventListener('resize', resize);
    };
  }, [dom.current]);

  const getMenu = () => {
    return Object.keys(menuMap).map((item) => <Item key={item}>{menuMap[item]}</Item>);
  };

  const renderChildren = () => {
    const { selectKey } = initConfig;
    switch (selectKey) {
      case 'sys/basic':
        return <Base />;
      case 'sys/logo':
        return <Hospital />;
      case 'sys/defaultShowField':
        return <Insert />;
      case 'sys/userShowField':
        return <User />;
      case 'sys/defaultCheck':
        return <Search />;
      case 'sys/classify':
        return <TableClass />;
      case 'sys/searchSymbol':
        return <SearchSymbol />;
      case 'sys/personal':
        return <Personal />;
      case 'updatePsw':
        return <UpdatePsw />;
      case 'time':
        return <Time />;
      default:
        return null;
    }
  };

  return (
    <PageContainer fixedHeader>
      <GridContent>
        <div
          className={styles.main}
          ref={(ref) => {
            if (ref) {
              dom.current = ref;
            }
          }}
        >
          <div className={styles.leftMenu}>
            <Menu
              mode={initConfig.mode}
              selectedKeys={[initConfig.selectKey]}
              onClick={({ key }) => {
                setInitConfig({
                  ...initConfig,
                  selectKey: key as SettingsStateKeys,
                });
                sessionStorage.setItem('systemSetSelectName', key);
              }}
            >
              {getMenu()}
            </Menu>
          </div>
          <div className={styles.right}>
            <div className={styles.title}>{menuMap[initConfig.selectKey]}</div>
            {renderChildren()}
          </div>
        </div>
      </GridContent>
    </PageContainer>
  );
};
export default SystemSet;
