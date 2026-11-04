// @ts-ignore
/* eslint-disable */

declare namespace HOME {
  type HistoryOrHotItem = {
    id: string;
    expression: string;
    amount: string | number
  }

  type ListProps = {
    loading: boolean;
    list: HistoryOrHotItem[];
    handleMore: () => void;
    emptyText?: string
  }
}
