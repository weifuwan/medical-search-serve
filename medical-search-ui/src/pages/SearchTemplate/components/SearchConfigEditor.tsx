import React from 'react';
import { Button, Input, Radio, Select } from 'antd';
import {
  ArrowDownOutlined,
  ArrowUpOutlined,
  DeleteOutlined,
  PlusOutlined,
} from '@ant-design/icons';
import type {
  TemplateSearchConfig,
  TemplateSort,
} from '@/services/searchTemplate/searchConfig';

interface FieldOption {
  fieldCode: string;
  fieldName: string;
}

interface Props {
  value: TemplateSearchConfig;
  onChange: (value: TemplateSearchConfig) => void;
  fields: FieldOption[];
}

const MAX_SORT_FIELDS = 5;

const SearchConfigEditor: React.FC<Props> = ({ value, onChange, fields }) => {
  const update = (next: Partial<TemplateSearchConfig>) => onChange({ ...value, ...next });
  const sorts = value.sorts || (value.sort ? [value.sort] : []);
  const fieldOptions = Array.from(
    new Map(fields.map((field) => [field.fieldCode, {
      label: field.fieldName,
      value: field.fieldCode,
    }])).values(),
  );

  const updateSorts = (next: TemplateSort[]) => update({
    sorts: next,
    sort: undefined,
  });

  const updateSort = (index: number, next: Partial<TemplateSort>) => {
    updateSorts(sorts.map((item, itemIndex) => (
      itemIndex === index ? { ...item, ...next } : item
    )));
  };

  const addSort = () => {
    if (sorts.length >= MAX_SORT_FIELDS) return;

    const usedFields = new Set(sorts.map((item) => item.fieldCode));
    const nextField = fieldOptions.find((field) => !usedFields.has(field.value));
    if (!nextField) return;

    updateSorts([
      ...sorts,
      {
        tableCode: 'ms_visit_record',
        fieldCode: nextField.value,
        mode: 'desc',
      },
    ]);
  };

  const removeSort = (index: number) => {
    updateSorts(sorts.filter((_, itemIndex) => itemIndex !== index));
  };

  const moveSort = (index: number, offset: number) => {
    const targetIndex = index + offset;
    if (targetIndex < 0 || targetIndex >= sorts.length) return;

    const next = [...sorts];
    [next[index], next[targetIndex]] = [next[targetIndex], next[index]];
    updateSorts(next);
  };

  const canAddSort = sorts.length < MAX_SORT_FIELDS
    && fieldOptions.some((field) => !sorts.some((item) => item.fieldCode === field.value));

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

        <div className="search-config-item search-config-item-wide search-config-item-sort">
          <span className="search-config-label">排序</span>
          <div className="search-config-sort-editor">
            {sorts.length === 0 ? (
              <span className="search-config-sort-empty">默认顺序</span>
            ) : (
              sorts.map((sort, index) => (
                <div className="search-config-sort-row" key={`${sort.fieldCode}-${index}`}>
                  <span className="search-config-sort-index">{index + 1}</span>
                  <Select
                    showSearch
                    optionFilterProp="label"
                    value={sort.fieldCode}
                    options={fieldOptions.map((option) => ({
                      ...option,
                      disabled: sorts.some((item, itemIndex) => (
                        itemIndex !== index && item.fieldCode === option.value
                      )),
                    }))}
                    onChange={(fieldCode: string) => updateSort(index, { fieldCode })}
                  />
                  <Select
                    className="search-config-order"
                    value={sort.mode}
                    options={[
                      { label: '升序', value: 'asc' },
                      { label: '降序', value: 'desc' },
                    ]}
                    onChange={(mode: 'asc' | 'desc') => updateSort(index, { mode })}
                  />
                  <div className="search-config-sort-actions">
                    <Button
                      type="text"
                      size="small"
                      title="上移"
                      aria-label="上移"
                      icon={<ArrowUpOutlined />}
                      disabled={index === 0}
                      onClick={() => moveSort(index, -1)}
                    />
                    <Button
                      type="text"
                      size="small"
                      title="下移"
                      aria-label="下移"
                      icon={<ArrowDownOutlined />}
                      disabled={index === sorts.length - 1}
                      onClick={() => moveSort(index, 1)}
                    />
                    <Button
                      type="text"
                      size="small"
                      danger
                      title="删除"
                      aria-label="删除"
                      icon={<DeleteOutlined />}
                      onClick={() => removeSort(index)}
                    />
                  </div>
                </div>
              ))
            )}
            <div className="search-config-sort-add">
              <Button
                type="dashed"
                size="small"
                icon={<PlusOutlined />}
                disabled={!canAddSort}
                onClick={addSort}
              >
                添加排序条件
              </Button>
              <span className="search-config-sort-hint">
                按顺序执行，最多 {MAX_SORT_FIELDS} 个字段
              </span>
            </div>
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
