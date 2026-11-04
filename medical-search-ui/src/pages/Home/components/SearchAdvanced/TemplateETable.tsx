import { getLogicSymbolList, getRelationalSymbolList } from '@/services/home/api';
import { groupByMap } from '@/utils';
import {
  ActionType,
  EditableFormInstance,
  EditableProTable,
  ProColumns,
  ProForm,
  ProFormInstance,
} from '@ant-design/pro-components';
import { DatePicker, Input } from 'antd';
import dayjs from 'dayjs';
import React, { forwardRef, useEffect, useImperativeHandle, useRef, useState } from 'react';

export type DataSourceType = {
  isCopy?: any;
  id?: string;
  key?: string;
  copyKey?: React.Key;
  fieldId: React.Key;
  selectField?: string;
  fieldVal?: string;
  logic?: string | number;
  relation?: string | number;
  dataType?: string;
  tableCode?: string;
  tableName?: string;
  fieldCode?: string;
  fieldName?: string;
  children?: DataSourceType[];
};
interface tableProps {
  ref?: any;
  eTableData: DataSourceType[];
  editableKeys: React.Key[];
  handleChange: (data: DataSourceType[]) => void;
}

const isValidDateString = (stringVal: string) => {
  // 正则表达式，匹配 YYYY-MM-DD 格式，并且有两个这样的日期，用逗号分隔
  const regex = /^\d{4}-\d{2}-\d{2},\d{4}-\d{2}-\d{2}$/;
  return regex.test(stringVal);
};

const FieldValue: React.FC<{
  record?: DataSourceType;
  value?: string;
  rowKey?: React.Key;
  onChange?: (value: string) => void;
  handleChange: () => void;
}> = ({ record, value, rowKey, onChange, handleChange }) => {
  const { RangePicker } = DatePicker as any;
  const dateChange = (date: string[], dateString: string[]) => {
    onChange?.(dateString.join(','));
    handleChange();
  };
  const inputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    onChange?.(e.target.value);
    handleChange();
  };

  const getFormatDate = (stringVal: string) => {
    // 正则表达式，匹配 YYYY-MM-DD 格式，并且有两个这样的日期，用逗号分隔
    const regex = /^\d{4}-\d{2}-\d{2},\d{4}-\d{2}-\d{2}$/;
    if (!regex.test(stringVal)) return '';
    return stringVal?.split(',').map((item) => dayjs(item, 'YYYY-MM-DD'));
  };

  const defaultValue = value ? getFormatDate(value as string) : '';

  return record?.dataType == 'date' && record?.relation === 11 ? (
    <RangePicker rowKey={rowKey} value={defaultValue} onChange={dateChange} allowClear={false} />
  ) : (
    <Input key={rowKey} disabled={record?.relation === 7} value={value} onChange={inputChange} />
  );
};

const TemplateETable: React.FC<tableProps> = forwardRef((props, ref) => {
  const { eTableData, editableKeys, handleChange } = props;
  const [selectList, setSelectList] = useState<React.Key[]>([]);
  const formRef = useRef<ProFormInstance<any>>();
  const actionRef = useRef<ActionType>();
  const editorFormRef = useRef<EditableFormInstance<DataSourceType>>();
  const [relationOptions, setRelationOptions] = useState<any[]>([]);
  useEffect(() => {
    const fetchRelationOptions = async () => {
      const { code, data } = await getRelationalSymbolList();

      if (code) {
        setRelationOptions([]);
        return;
      }

      setRelationOptions(data || []);
    };

    fetchRelationOptions();
  }, []);

  const columns: ProColumns<DataSourceType>[] = [
    {
      title: '已选字段',
      dataIndex: 'selectField',
      tooltip: '只读，已选择的字段',
      width: '25%',
      readonly: true,
    },
    {
      title: '检索值',
      dataIndex: 'fieldVal',
      width: '30%',
      formItemProps: () => {
        return {
          rules: [{ required: true, message: '此项为必填项' }],
        };
      },
      renderFormItem: (_, { record }) => {
        return (
          <FieldValue
            rowKey={record?.fieldId}
            record={record}
            handleChange={() => {
              const data = formRef.current?.getFieldValue('table');
              handleChange(data);
            }}
          />
        );
      },
    },
    {
      title: '符号',
      key: 'relation',
      dataIndex: 'relation',
      valueType: 'select',
      fieldProps: (_form, { entity }) => {
        const dataType = String(entity?.dataType || '').toLowerCase();

        return {
          options: relationOptions
            .filter((item: any) => {
              // code = 11 是 BETWEEN / 介于
              // 只有 dataType === 'date' 的字段才显示介于
              if (Number(item.code) === 11) {
                return dataType === 'date';
              }

              return true;
            })
            .map((item: any) => ({
              label: item.desc,
              value: item.code,
            })),
          onChange: () => {
            const tableData = formRef.current?.getFieldValue('table');
            const newTableData = structuredClone(tableData);

            const data = newTableData.map((item: DataSourceType) => {
              if (item.relation === 7) {
                item.fieldVal = '非空';
              }

              if (item.relation === 11 && !isValidDateString(item.fieldVal as string)) {
                item.fieldVal = '';
              }

              return item;
            });

            handleChange(data);
          },
        };
      },
      formItemProps: () => {
        return {
          rules: [{ required: true, message: '此项为必填项' }],
        };
      },
    },
    {
      title: '与下一条关系',
      key: 'logic',
      dataIndex: 'logic',
      valueType: 'select',
      initialValue: 0,
      fieldProps: {
        onChange: () => {
          const data = formRef.current?.getFieldValue('table');
          handleChange(data);
        },
      },
      formItemProps: () => {
        return {
          rules: [{ required: true, message: '此项为必填项' }],
        };
      },
      request: async () => {
        const { code, data } = await getLogicSymbolList();
        if (code) return [];
        return data.map((item: any) => ({
          label: item.desc,
          value: item.code,
        }));
      },
    },
    {
      title: '操作',
      valueType: 'option',
      width: 100,
      align: 'center',
    },
  ];

  // 删除确认
  const handleOk = (row: DataSourceType, index: number) => {
    const tableData = formRef.current?.getFieldValue('table');
    const newTableData = structuredClone(tableData);
    newTableData.splice(index, 1);

    // formRef.current?.setFieldValue('table', data)
    formRef.current?.setFieldValue('table', []);
    handleChange(newTableData);
  };
  // 复制
  const handleCopy = (row: DataSourceType, index: number) => {
    const tableData = formRef.current?.getFieldValue('table');
    const newTableData = structuredClone(tableData);
    const copyObj = structuredClone(row);
    newTableData.splice(index + 1, 0, copyObj); // 添加到当前位置后面
    // newTableData.push(copyObj) // 添加到最后

    // formRef.current?.setFieldValue('table', newTableData)
    formRef.current?.setFieldValue('table', []);
    handleChange(newTableData);
  };
  // 获取校验通过后的数据
  const getValidateTableData = () => {
    return formRef.current?.validateFieldsReturnFormatValue?.().then((values) => values['table']);
  };

  // 清空表格数据
  const clearTableData = () => {
    formRef.current?.setFieldValue('table', []);
  };

  // 暴露获取表格数据方法
  useImperativeHandle(ref, () => ({
    getTableData: getValidateTableData,
    clearTableData: clearTableData,
  }));
  useEffect(() => {
    const groupByList = groupByMap(eTableData, 'tableCode');
    formRef.current?.setFieldValue('table', groupByList);
  }, [eTableData]);

  return (
    <ProForm<{ table: DataSourceType[] }>
      formRef={formRef}
      submitter={false}
      onFinish={async (values) => {}}
    >
      <EditableProTable<DataSourceType>
        rowKey="fieldId"
        name="table"
        actionRef={actionRef}
        editableFormRef={editorFormRef}
        scroll={{ y: 420 }}
        maxLength={5}
        loading={false}
        columns={columns}
        recordCreatorProps={false}
        rowSelection={{
          onChange: (_, list) => {
            setSelectList(list.map((item) => item.fieldId));
          },
        }}
        tableAlertRender={({ selectedRowKeys, selectedRows, onCleanSelected }) => (
          <span>
            已选 {selectedRowKeys.length} 项
            <a style={{ marginInlineStart: 8 }} onClick={onCleanSelected}>
              取消选择
            </a>
          </span>
        )}
        tableAlertOptionRender={() => (
          <a
            onClick={() => {
              const list: DataSourceType[] = [];
              eTableData.forEach((item) => {
                if (!selectList.includes(item.fieldId)) {
                  list.push(item);
                }
              });

              handleChange(list);
              actionRef.current?.reloadAndRest?.();
            }}
          >
            批量移除
          </a>
        )}
        editable={{
          type: 'multiple',
          editableKeys: editableKeys,
          actionRender: (row, { index }) => {
            return [
              <a onClick={() => handleOk(row, index as number)}>移除</a>,
              <a onClick={() => handleCopy(row, index as number)}>复制</a>,
            ];
          },
        }}
      />
    </ProForm>
  );
});

export default TemplateETable;
