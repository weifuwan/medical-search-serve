import type { Effect, Reducer } from 'umi';

export interface IndexModelState {
    userReqParams: {};
}

export interface permissionModelType {
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
const permissionIndex: permissionModelType = {
    namespace: 'permissionModel',
    state: {
        userReqParams: {},
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
                userReqParams: {}
            }
        },
    },
}

export default permissionIndex