import type { Effect, Reducer } from 'umi';

export interface IndexModelState {
    hispitalName: string;
    hispitalLogo: string;
}

export interface hispitalModelType {
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
const hispitalIndex: hispitalModelType = {
    namespace: 'hispitalModel',
    state: {
        hispitalName: '',
        hispitalLogo: ''
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
                hispitalName: '',
                hispitalLogo: '',
            }
        },
    },
}

export default hispitalIndex