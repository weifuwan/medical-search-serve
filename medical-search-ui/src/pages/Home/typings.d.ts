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
    emptyText?: string;
    favoritedExpressions: string[];
    favoritesReady: boolean;
    pendingFavorites: string[];
    onToggleFavorite: (expression: string) => void;
  }
}
