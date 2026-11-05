import React from 'react';
import { Card, Col, Input, Radio, Row, Select, Typography } from 'antd';
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
    <Card size="small" title="检索参数设置" style={{ marginTop: 16, marginBottom: 16 }}>
      <Row gutter={[20, 16]}>
        <Col span={12}>
          <Typography.Text>检索范围（维度）</Typography.Text>
          <div style={{ marginTop: 8 }}>
            <Radio.Group
              value={value.dimension}
              onChange={(event) => update({ dimension: event.target.value })}
            >
              <Radio value={0}>按人次</Radio>
              <Radio value={1}>按患者</Radio>
            </Radio.Group>
          </div>
        </Col>
        <Col span={12}>
          <Typography.Text>附加范围条件</Typography.Text>
          <Input
            value={value.scopeExpression}
            onChange={(event) => update({ scopeExpression: event.target.value })}
            maxLength={600}
            placeholder="按检索语法填写一个限定条件（可选）"
            style={{ marginTop: 8 }}
          />
        </Col>
        <Col span={12}>
          <Typography.Text>排序字段</Typography.Text>
          <Select
            allowClear
            showSearch
            optionFilterProp="label"
            placeholder="默认顺序"
            style={{ display: 'block', marginTop: 8 }}
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
        </Col>
        <Col span={12}>
          <Typography.Text>排序方向</Typography.Text>
          <div style={{ marginTop: 8 }}>
            <Radio.Group
              disabled={!value.sort}
              value={value.sort?.mode || 'desc'}
              onChange={(event) => update({
                sort: value.sort ? { ...value.sort, mode: event.target.value } : undefined,
              })}
            >
              <Radio value="asc">升序</Radio>
              <Radio value="desc">降序</Radio>
            </Radio.Group>
          </div>
        </Col>
        <Col span={12}>
          <Typography.Text>结果展示方式</Typography.Text>
          <div style={{ marginTop: 8 }}>
            <Radio.Group
              value={value.viewMode}
              onChange={(event) => update({ viewMode: event.target.value })}
            >
              <Radio value="TABLE">表格</Radio>
              <Radio value="CARD">卡片</Radio>
            </Radio.Group>
          </div>
        </Col>
        <Col span={12}>
          <Typography.Text>每页数量</Typography.Text>
          <Select
            value={value.pageSize}
            style={{ display: 'block', marginTop: 8 }}
            onChange={(pageSize) => update({ pageSize })}
            options={[10, 20, 50, 100].map((num) => ({ value: num, label: num + ' 条' }))}
          />
        </Col>
        <Col span={24}>
          <Typography.Text>结果展示字段（按选择顺序）</Typography.Text>
          <Select
            mode="multiple"
            showSearch
            optionFilterProp="label"
            maxTagCount="responsive"
            style={{ display: 'block', marginTop: 8 }}
            value={value.columns.map((column) => column.fieldCode)}
            options={fieldOptions}
            placeholder="不选择则使用个人默认展示字段"
            onChange={(codes: string[]) => update({
              columns: codes.map((fieldCode) => ({ tableCode: 'ms_visit_record', fieldCode })),
            })}
          />
        </Col>
      </Row>
    </Card>
  );
};

export default SearchConfigEditor;
