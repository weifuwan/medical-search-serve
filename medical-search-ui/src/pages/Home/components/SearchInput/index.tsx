import { CheckOutlined, CloseOutlined, EditOutlined } from '@ant-design/icons';
import { history, useDispatch, useSelector } from '@umijs/max';
import { AutoComplete, Button, Input, message, RadioChangeEvent } from 'antd';
import { useEffect, useState } from 'react';

import { IndexModelState } from '@/models/searchModel';
import { getSearchSymbolList, getTemplateList } from '@/services/home/api';
import { getSessionVal, setSessionVal } from '@/utils';
import {
  clearActiveSearchTemplate,
  getActiveSearchTemplate,
  readSearchConfig,
  saveActiveSearchTemplate,
} from '@/services/searchTemplate/searchConfig';
import type { ActiveSearchTemplate } from '@/services/searchTemplate/searchConfig';

import JYModal from '@/components/JYModal';
import SearchAdvanced from '../SearchAdvanced';
import styles from './index.less';
interface SearchInputProps {
  isShowUpdateBtn?: boolean;
  size?: string;
  defaultSearchVal?: string;
  handleSearchVal: (val: string, dimension: number) => void;
  onTemplateSelect?: (template: ActiveSearchTemplate | null) => void;
}

// 检索输入组件
const SearchInput: React.FC<SearchInputProps> = (props) => {
  const [symbolList, setSymbolList] = useState<any[]>([]);
  const {
    size = 'large',
    isShowUpdateBtn = false,
    defaultSearchVal = getSessionVal('searchVal'),
    handleSearchVal,
    onTemplateSelect,
  } = props;
  const defaultDimension = useSelector(
    (state: { searchModel: IndexModelState }) => state.searchModel.dimension,
  );
  const [options, setOptions] = useState<any>([]);
  const [templateList, setTemplateList] = useState<STEMPLATEAPI.TemplateListItem[]>([]);
  const [searchVal, setSearchVal] = useState(defaultSearchVal);
  const [dimension, setDimension] = useState(defaultDimension);
  const [isSymbol, setIsSymbol] = useState(false);
  const [isOpenSearchSelect, setIsOpenSearchSelect] = useState(false);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [confirmLoading, setConfirmLoading] = useState(false);
  const [isUpdate, setIsUpdate] = useState(!isShowUpdateBtn);
  const dispatch = useDispatch();

  const handleOk = () => {
    setConfirmLoading(true);
    setIsModalOpen(false);
  };

  // 获取符号列表
  const handleSearchSymbolList = async () => {
    const { code, data } = await getSearchSymbolList();

    if (code === 0) {
      setSymbolList(
        (data || []).map((item: any) => ({
          value: String(item.symbolValue),
          label: item.symbolLabel,
        })),
      );
    }
  };

  const handleCancel = () => {
    setConfirmLoading(false);
    setIsModalOpen(false);
  };

  const handleCloseSelect = () => {
    setOptions([]);
    setIsOpenSearchSelect(false);
  };

  const templateOptions = () => [
    {
      label: (
        <div className="flx-justify-between">
          <h3 style={{ marginLeft: 24 }}>模版名称</h3>
          <h3>模版内容</h3>
          <CloseOutlined
            style={{ marginRight: 36, cursor: 'pointer' }}
            onClick={() => handleCloseSelect()}
          />
        </div>
      ),
      options: templateList.map((item) => ({
        value: item.id,
        label: (
          <div style={{ display: 'flex', alignItems: 'center' }}>
            <span style={{ margin: '0 24px 0 12px', width: '160px' }} className="sle">
              {item.templateName}
            </span>
            <div
              style={{
                width: 0,
                flex: 1,
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
              }}
            >
              <span className="sle">{item.expression}</span>
              <Button type="link">选择</Button>
            </div>
          </div>
        ),
      })),
    },
  ];

  const symbolOptions = () => [
    {
      label: (
        <div className="flx-justify-between">
          <h3 style={{ marginLeft: 24 }}>符号</h3>
          <CloseOutlined
            style={{ marginRight: 36, cursor: 'pointer' }}
            onClick={() => handleCloseSelect()}
          />
        </div>
      ),
      options: symbolList.map((item) => ({
        value: item.value,
        label: <span className="sle">{item.label}</span>,
      })),
    },
  ];

  // 获取模版列表
  const handleTemplateList = async () => {
    const { code, data } = await getTemplateList();
    if (code === 0) {
      setTemplateList(data);
    }
  };

  useEffect(() => {
    handleTemplateList();
    handleSearchSymbolList();
  }, []);

  // 操作事件
  const actionClick = (num: number) => {
    switch (num) {
      case 1: // 修改
        setIsUpdate(!isUpdate);
        break;
      case 2: // 检索
        if (!getSessionVal('searchVal')) {
          message.error('表达式不能为空');
          return;
        }
        if (size === 'large') {
          // 使用 dispatch 调用 Model 中的 change 方法
          dispatch({ type: 'searchModel/reset' });
          history.push({
            pathname: '/home/searchList',
            search: `?searchParams=${encodeURIComponent(getSessionVal('searchVal'))}`,
          });
        } else {
          const searchVal = getSessionVal('searchVal');
          const dimensionVal = getSessionVal('dimensionVal');

          handleSearchVal(searchVal, dimensionVal);
        }
        break;
      case 3: // 返回
        history.back();
        break;
      case 4: // 下载表格
        break;
      case 5: // 上传数据
        break;
      case 6: // 选择模版
        const temDom = document.getElementById('searchInput');
        temDom?.focus();
        setOptions(templateOptions);
        setIsSymbol(false);
        setIsOpenSearchSelect(true);
        break;
      case 7: // 插入符号
        const symDom = document.getElementById('searchInput');
        symDom?.focus();
        setOptions(symbolOptions);
        setIsSymbol(true);
        setIsOpenSearchSelect(true);
        break;
      default: // 高级检索
        setIsModalOpen(true);
        break;
    }
  };

  // 选择模版或插入符号回调
  const onSelect = (val: string | number) => {
    handleCloseSelect();

    if (isSymbol) {
        const symbol = symbolList.find(item => item.value === String(val));

        if (!symbol) {
            message.error('未找到对应符号');
            return;
        }

        const searchValsymVal = `${searchVal || ''}${symbol.label}`;
        const active = getActiveSearchTemplate(searchVal);
        if (active) {
          saveActiveSearchTemplate({ ...active, expression: searchValsymVal });
        } else {
          clearActiveSearchTemplate();
        }
        setSessionVal('searchVal', searchValsymVal);
        setSearchVal(searchValsymVal);
    } else {
        const template = templateList.find(item => String(item.id) === String(val));

        if (!template) {
            message.error('未找到对应模版');
            return;
        }

        const temVal = template.expression;
        const config = readSearchConfig(template.searchConfig);
        const activeTemplate: ActiveSearchTemplate = {
          id: template.id!,
          expression: temVal,
          config,
        };
        saveActiveSearchTemplate(activeTemplate);
        setSessionVal('searchVal', temVal);
        setSessionVal('dimensionVal', config.dimension);
        setDimension(config.dimension);
        setSearchVal(temVal);
        onTemplateSelect?.(activeTemplate);
    }
};

  // 高级检索回调
  const handleFinish = (val: string) => {
    const active = getActiveSearchTemplate(searchVal);
    if (active) {
      saveActiveSearchTemplate({ ...active, expression: val });
    } else {
      clearActiveSearchTemplate();
    }
    setSessionVal('searchVal', val);
    setSearchVal(val);
    setIsModalOpen(false);
    handleSearchVal(val, dimension);
  };

  // 搜索词输入回调
  const handleChange = (val: string) => {
    const active = getActiveSearchTemplate(searchVal);
    if (active && val) {
      saveActiveSearchTemplate({ ...active, expression: val });
    } else {
      clearActiveSearchTemplate();
      onTemplateSelect?.(null);
    }
    isOpenSearchSelect ? setIsOpenSearchSelect(false) : null; // 关闭下拉框
    setSessionVal('searchVal', val);
    setSearchVal(val);
  };

  // 维度回调
  const onChange = (e: RadioChangeEvent) => {
    setSessionVal('dimensionVal', e.target.value);
    setDimension(e.target.value);
  };

  useEffect(() => {
    handleTemplateList();
  }, []);

  return (
    <div className={styles.content}>
      <Input.Group
        compact
        className={size === 'large' ? styles.searchConLarge : styles.searchConSmall}
      >
        {isShowUpdateBtn && (
          <Button className={styles.searchUpdBtn} onClick={() => actionClick(1)}>
            {isUpdate ? '保存' : '修改'}
            {isUpdate ? <CheckOutlined /> : <EditOutlined />}
          </Button>
        )}
        <AutoComplete
          id="searchInput"
          allowClear
          autoFocus
          disabled={!isUpdate}
          className={styles.searchInput}
          value={searchVal}
          open={isOpenSearchSelect}
          options={options}
          onBlur={() => {
            setIsOpenSearchSelect(false);
          }}
          onSelect={onSelect}
          onChange={handleChange}
          placeholder="精确/模糊匹配"
          onKeyUp={(e) => {
            if (e.key === 'Enter') {
              if (isShowUpdateBtn && isUpdate) return;
              actionClick(2);
            }
          }}
        ></AutoComplete>

        <Button
          disabled={isShowUpdateBtn && isUpdate}
          className={styles.searchBtn}
          onClick={() => actionClick(2)}
        >
          检索
        </Button>
      </Input.Group>

      <div className={styles.searchActionCon}>
        <div
          className={
            size === 'large'
              ? styles.searchLargeAction
              : isShowUpdateBtn
              ? styles.searchSmallAction
              : styles.searchMiddleAction
          }
        >
          <a onClick={() => actionClick(6)}>选择模版</a>
          <a onClick={() => actionClick(7)}>插入符号</a>
          <a onClick={() => actionClick(8)}>高级检索</a>
          {size !== 'large' && (
            <>
              {/* <Radio.Group style={{ marginLeft: '24px' }} onChange={onChange} value={dimension}>
                                <Radio value={0}>人次</Radio>
                                <Radio value={1}>人</Radio>
                            </Radio.Group> */}

              {/* <Button type="link" onClick={() => { actionClick(4) }}><DownloadOutlined />下载表格</Button>
                            <Button type="link" onClick={() => { actionClick(5) }}><UploadOutlined />上传数据</Button> */}
            </>
          )}
        </div>
      </div>

      <JYModal
        title="高级检索"
        width="1300px"
        isModalOpen={isModalOpen}
        ChildNode={() => <SearchAdvanced isHome={size === 'large'} handleFinish={handleFinish} />}
        confirmLoading={confirmLoading}
        handleOk={handleOk}
        handleCancel={handleCancel}
        maskClosable={false}
        footer={null}
      />
    </div>
  );
};

export default SearchInput;
