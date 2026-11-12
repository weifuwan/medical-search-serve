import { getSessionVal, setSessionVal } from '@/utils';

export interface TemplateSort {
  tableCode: 'ms_visit_record';
  fieldCode: string;
  mode: 'asc' | 'desc';
}

export interface TemplateColumn {
  tableCode: 'ms_visit_record';
  fieldCode: string;
}

export interface TemplateSearchConfig {
  dimension: 0 | 1;
  scopeExpression: string;
  sorts: TemplateSort[];
  /** 兼容历史模板的单字段排序配置 */
  sort?: TemplateSort;
  pageSize: 10 | 20 | 50 | 100;
  viewMode: 'TABLE' | 'CARD';
  columns: TemplateColumn[];
}

export interface ActiveSearchTemplate {
  id: number | string;
  expression: string;
  config: TemplateSearchConfig;
}

export const defaultSearchConfig: TemplateSearchConfig = {
  dimension: 0,
  scopeExpression: '',
  sorts: [],
  pageSize: 10,
  viewMode: 'TABLE',
  columns: [],
};

export const readSearchConfig = (raw?: string): TemplateSearchConfig => {
  if (!raw) return { ...defaultSearchConfig, columns: [] };
  try {
    const data: Partial<TemplateSearchConfig> = JSON.parse(raw);
    const sorts = Array.isArray(data.sorts)
      ? data.sorts
      : data.sort
        ? [data.sort]
        : [];

    return {
      ...defaultSearchConfig,
      ...data,
      sorts,
      sort: undefined,
      dimension: data.dimension === 1 ? 1 : 0,
      pageSize: [10, 20, 50, 100].includes(Number(data.pageSize))
        ? data.pageSize as TemplateSearchConfig['pageSize'] : 10,
      viewMode: data.viewMode === 'CARD' ? 'CARD' : 'TABLE',
      columns: Array.isArray(data.columns) ? data.columns : [],
    };
  } catch {
    return { ...defaultSearchConfig, columns: [] };
  }
};

export const saveActiveSearchTemplate = (template: ActiveSearchTemplate) => {
  setSessionVal('activeSearchTemplate', template);
};

export const clearActiveSearchTemplate = () => {
  setSessionVal('activeSearchTemplate', '');
};

export const getActiveSearchTemplate = (expression: string): ActiveSearchTemplate | null => {
  const active = getSessionVal('activeSearchTemplate') as ActiveSearchTemplate | null;
  if (!active || typeof active !== 'object' || active.expression !== expression) return null;
  return active;
};
