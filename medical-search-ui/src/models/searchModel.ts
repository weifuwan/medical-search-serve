import type { Effect, Reducer } from 'umi';

export interface IndexModelState {
    showUpdate: boolean;
    dimension: number;
}

export interface searchModelType {
    namespace: string;
    state: IndexModelState;
    effects: {
        query: Effect;
    };
    reducers: {
        update: Reducer<IndexModelState>,
        reset: Reducer<IndexModelState>
    };
}
const SearchIndex: searchModelType = {
    namespace: 'searchModel',
    state: {
        showUpdate: false,
        dimension: 0
    },

    effects: {
        *query() { },
    },

    reducers: {
        update(state, action) {
            return {
                ...state,
                ...action.payload,
            }
        },
        reset() {
            return {
                showUpdate: false,
                dimension: 0
            }
        },
    },
}

export default SearchIndex