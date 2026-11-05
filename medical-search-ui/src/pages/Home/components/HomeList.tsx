import React, { useState } from 'react';
import { history, useDispatch } from '@umijs/max';
import { Card, Col, message, Row, Space, Tooltip } from 'antd';
import { ShareAltOutlined, StarOutlined } from '@ant-design/icons';
import NoData from '@/components/JYNoData';
import ExpressionShareModal from '@/components/ExpressionShareModal';
import { addFavorite } from '@/services/expressionShare/api';
import defaultSettings from '../../../../config/defaultSettings';
import { setSessionVal } from '@/utils';
import styles from '../index.less';

const HomeList: React.FC<HOME.ListProps> = (props) => {
  const { loading, list, handleMore, emptyText } = props;
  const dispatch = useDispatch();
  const [isShowMore, setIsShowMore] = useState(true);
  const [shareExpression, setShareExpression] = useState<string>();

  const actionClick = (num: number, expression: string) => {
    if (num === 1) {
      dispatch({ type: 'searchModel/reset' });
      setSessionVal('searchVal', expression);
      history.push({
        pathname: '/home/searchList',
        search: '?searchParams=' + encodeURIComponent(expression),
      });
      return;
    }
    handleMore();
    setIsShowMore(false);
  };

  const favorite = async (expression: string) => {
    try {
      const response = await addFavorite(expression.slice(0, 50), expression);
      if (response.code !== 0) throw new Error(response.msg || '收藏失败');
      message.success('已保存到我的常用检索');
    } catch {
      message.error('收藏失败');
    }
  };

  return (
    <>
      {list.length > 0 ? (
        <Row gutter={[16, 8]}>
          {list.map((item, index) => (
            <Col span={8} key={index + 1}>
              <Card
                hoverable
                loading={loading}
                style={{ borderRadius: 10 }}
                className={styles.expressionCard}
                onClick={() => actionClick(1, item.expression)}
              >
                <Tooltip
                  placement="top"
                  color={defaultSettings.colorPrimary}
                  title={item.expression}
                >
                  <div className={styles.hideText}>{item.expression}</div>
                </Tooltip>
                <div style={{ display: 'flex', justifyContent: 'flex-end', marginTop: 10 }}>
                  <Space size="middle">
                    <Tooltip title="保存到常用检索">
                      <StarOutlined
                        onClick={(event) => {
                          event.stopPropagation();
                          favorite(item.expression);
                        }}
                      />
                    </Tooltip>
                    <Tooltip title="分享检索条件">
                      <ShareAltOutlined
                        onClick={(event) => {
                          event.stopPropagation();
                          setShareExpression(item.expression);
                        }}
                      />
                    </Tooltip>
                  </Space>
                </div>
              </Card>
            </Col>
          ))}
          {isShowMore && (
            <Col span={8} key="more">
              <Card
                hoverable
                loading={loading}
                style={{ borderRadius: 10 }}
                className={styles.more}
                onClick={() => actionClick(2, '')}
              >
                更多...
              </Card>
            </Col>
          )}
        </Row>
      ) : (
        <NoData text={emptyText} />
      )}
      <ExpressionShareModal
        open={!!shareExpression}
        expression={shareExpression}
        onClose={() => setShareExpression(undefined)}
      />
    </>
  );
};

export default HomeList;
