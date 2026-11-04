import { DefaultFooter } from '@ant-design/pro-components';
import { useIntl } from '@umijs/max';

const Footer: React.FC = () => {
  const intl = useIntl();
  const defaultMessage = intl.formatMessage({
    id: 'app.copyright.produced',
    defaultMessage: '佳缘科技股份有限公司出品 V1.0',
  });

  const currentYear = new Date().getFullYear();

  return (
    <div style={{backgroundColor: "rgba(0,0,0,0.1)",  display: "flex", justifyContent: "right", fontSize: 13, padding: "4px 0"}}>
      技术支持:佳缘科技股份有限公司 &nbsp;&nbsp;&nbsp;&nbsp;联系电话：028-62122223 &nbsp;&nbsp;&nbsp;&nbsp;版本v1.0 &nbsp;&nbsp;&nbsp;&nbsp;
    </div>
  );
};

export default Footer;
