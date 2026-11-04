import React from 'react';
import styles from './index.less'

type NoDataProps = {
    text?: string;
}

const NoData: React.FC<NoDataProps> = ({ text = '暂无数据' }) => {
    return (
        <div className={styles.container}>
            {text}
        </div>
    );
};

export default NoData;