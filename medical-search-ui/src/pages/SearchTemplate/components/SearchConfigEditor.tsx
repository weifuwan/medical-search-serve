import React from 'react';
import { Input, Radio, Select } from 'antd';
import type { TemplateSearchConfig } from '@/services/searchTemplate/searchConfig';

interface FieldOption {
  fieldCode: string;
  fieldName: string;
}

interface Props {
  value: TemplateSearchConfig;
  onChange: (value: TemplateSearchConfig) => void;
  fields: FieldOption[];
}

const SearchConfigEditor: React.FC<Props> = ({ value, onChange, fields }) => {
  const update = (next: Partial<TemplateSearchConfig>) => onChange({ ...value, ...next });
  const fieldOptions = fields.map((field) => ({
    label: field.fieldName,
    value: field.fieldCode,
  }));

  return (
    <div className="search-config-panel">
      <div className="search-config-title">检索参数</div>
      <div className="search-config-grid">
        <div className="search-config-item">
          <span className="search-config-label">检索维度</span>
          <Radio.Group
            value={value.dimension}
            onChange={(event) => update({ dimension: event.target.value })}
          >
            <Radio value={0}>按人次</Radio>
            <Radio value={1}>按患者</Radio>
          </Radio.Group>
        </div>

        <div className="search-config-item">
          <span className="search-config-label">排序</span>
          <div className="search-config-control search-config-sort">
            <Select
              allowClear
              showSearch
              optionFilterProp="label"
              placeholder="默认顺序"
              value={value.sort?.fieldCode}
              options={fieldOptions}
              onChange={(fieldCode: string | undefined) => update({
                sort: fieldCode ? {
                  tableCode: 'ms_visit_record',
                  fieldCode,
                  mode: value.sort?.mode || 'desc',
                } : undefined,
              })}
            />
            <Select
              className="search-config-order"
              disabled={!value.sort}
              value={value.sort?.mode || 'desc'}
              options={[
                { label: '升序', value: 'asc' },
                { label: '降序', value: 'desc' },
              ]}
              onChange={(mode) => update({
                sort: value.sort ? { ...value.sort, mode } : undefined,
              })}
            />
          </div>
        </div>

        <div className="search-config-item">
          <span className="search-config-label">结果展示</span>
          <div className="search-config-control search-config-display">
            <Radio.Group
              value={value.viewMode}
              onChange={(event) => update({ viewMode: event.target.value })}
            >
              <Radio value="TABLE">表格</Radio>
              <Radio value="CARD">卡片</Radio>
            </Radio.Group>
            <span className="search-config-inline-label">每页</span>
            <Select
              className="search-config-page-size"
              value={value.pageSize}
              onChange={(pageSize) => update({ pageSize })}
              options={[10, 20, 50, 100].map((num) => ({ value: num, label: num + ' 条' }))}
            />
          </div>
        </div>

        <div className="search-config-item">
          <span className="search-config-label">范围条件</span>
          <Input
            className="search-config-control"
            value={value.scopeExpression}
            onChange={(event) => update({ scopeExpression: event.target.value })}
            maxLength={600}
            placeholder="可选"
          />
        </div>

        <div className="search-config-item search-config-item-wide">
          <span className="search-config-label">展示字段</span>
          <Select
            className="search-config-control"
            mode="multiple"
            showSearch
            optionFilterProp="label"
            maxTagCount="responsive"
            value={value.columns.map((column) => column.fieldCode)}
            options={fieldOptions}
            placeholder="使用默认字段"
            onChange={(codes: string[]) => update({
              columns: codes.map((fieldCode) => ({ tableCode: 'ms_visit_record', fieldCode })),
            })}
          />
        </div>
      </div>
    </div>
  );
};

export default SearchConfigEditor;
