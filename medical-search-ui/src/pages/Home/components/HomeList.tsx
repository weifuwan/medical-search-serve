import React, { useState } from 'react';
import { history, useDispatch } from '@umijs/max';
import { Card, Col, Row, Space, Tooltip } from 'antd';
import { ShareAltOutlined, StarFilled, StarOutlined } from '@ant-design/icons';
import NoData from '@/components/JYNoData';
import ExpressionShareModal from '@/components/ExpressionShareModal';
import defaultSettings from '../../../../config/defaultSettings';
import { setSessionVal } from '@/utils';
import styles from '../index.less';

const HomeList: React.FC<HOME.ListProps> = (props) => {
  const {
    loading, list, handleMore, emptyText,
    favoritedExpressions, favoritesReady, pendingFavorites, onToggleFavorite,
  } = props;
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
                    <Tooltip title={
                      !favoritesReady ? '正在加载收藏状态' :
                      favoritedExpressions.includes(item.expression) ? '取消收藏' : '收藏检索条件'
                    }>
                      <button
                        type="button"
                        className={`${styles.favoriteAction} ${
                          favoritedExpressions.includes(item.expression) ? styles.favoriteSelected : ''
                        }`}
                        aria-label={favoritedExpressions.includes(item.expression) ? '取消收藏' : '收藏检索条件'}
                        aria-pressed={favoritedExpressions.includes(item.expression)}
                        disabled={!favoritesReady || pendingFavorites.includes(item.expression)}
                        onClick={(event) => {
                          event.stopPropagation();
                          onToggleFavorite(item.expression);
                        }}
                      >
                        {favoritedExpressions.includes(item.expression)
                          ? <StarFilled />
                          : <StarOutlined />}
                      </button>
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
