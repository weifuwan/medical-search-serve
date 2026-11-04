import React from 'react';
import { ProForm, ProFormText } from '@ant-design/pro-components';
import { Alert, Button } from 'antd';
import { TIMETIP } from '../../config'
import styles from '../../index.less'

const Time: React.FC = () => {
    return (
        <div>
            <Alert className={styles.tipAlert} message={TIMETIP} type="success" closable />
            <ProForm
                layout='horizontal'
                readonly={true}
                initialValues={{
                    name: '2022-08-18 16:03:06',
                }}
                onFinish={async (value) => console.log(value)}
            >
                <div style={{ display: 'flex' }}>
                    <ProFormText
                        name="name"
                        width="md"
                        label="最近数据更新时间"
                    />
                    <Button style={{ marginLeft: '24px' }}>数据更新</Button>
                </div>

            </ProForm>
        </div>
    );
};

export default Time;