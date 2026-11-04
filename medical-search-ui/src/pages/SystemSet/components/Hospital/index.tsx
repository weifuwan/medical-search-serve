import { getHispitalInfo, saveHospitalConfig } from '@/services/systemSet/api';
import { getToken } from '@/utils';
import { UploadOutlined } from '@ant-design/icons';
import { Alert, Button, Form, Image, Input, message, Space, Upload } from 'antd';
import React, { useEffect, useState } from 'react';
import { HOSTIP } from '../../config';

import type { UploadFile, UploadProps } from 'antd';
import styles from '../../index.less';

const { Item } = Form;

const Hospital: React.FC = () => {
  const [form] = Form.useForm();
  const [fileList, setFileList] = useState<UploadFile[]>([]);
  const [logoData, setLogoData] = useState<string>('');
  const [id, setId] = useState("");
  const [uploading, setUploading] = useState(false);

  // 上传配置
  const uploadProps: UploadProps = {
    name: 'file',
    headers: { token: getToken() },
    maxCount: 1,
    listType: 'picture',
    beforeUpload: (file) => {
      const imgType = ['image/png', 'image/jpg', 'image/gif', 'image/jpeg'];
      if (!imgType.includes(file.type)) {
        message.error('不支持的格式');
        return false;
      }

      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isLt2M) {
        message.error('图片大小不能超过2MB');
        return false;
      }

      return false; // Prevent auto upload
    },
    onChange: (info) => {
      if (info.file.status === 'removed') {
        setFileList([]);
        return;
      }
      setFileList(info.fileList);
    },
    fileList: fileList,
  };

  const handleHispitalInfo = async () => {
    const { code, data } = await getHispitalInfo();
    if (code === 0) {
      setLogoData(data?.logoBase64 || "");
      setId(data?.id) 
      form.setFieldsValue({
        name: data?.hospitalName || "",
      });
    }
  };

  const handleSubmit = async () => {
    try {
      const values = await form.validateFields();
      if (!values) return;

      setUploading(true);

      const formData = new FormData();
      formData.append('hospitalName', values.name);

      if (fileList.length > 0) {
        formData.append('file', fileList[0].originFileObj as File);
      }

      if(id !== "" && id !== undefined) {
        formData.append('id', id);
      }

      const { code, msg } = await saveHospitalConfig(formData);
      if (code === 0) {
        message.success('保存成功');
        localStorage.setItem('hispitalName', values.name);
        await handleHispitalInfo();
        setFileList([]);
      } else {
        message.error(msg || '保存失败');
      }
    } catch (error) {
      console.error('Error submitting form:', error);
      message.error('提交失败，请检查表单');
    } finally {
      setUploading(false);
    }
  };

  useEffect(() => {
    handleHispitalInfo();
  }, []);

  return (
    <>
      <Alert className={styles.tipAlert} message={HOSTIP} type="success" closable />
      <div className={styles.proFormCenter}>
        <Form form={form} layout="vertical">
          <Item name="name" label="医院名称" rules={[{ required: true, message: '这是必填项' }]}>
            <Input style={{ width: '400px' }} />
          </Item>

          <Form.Item noStyle shouldUpdate>
            <div>
              <div>当前 logo：</div>
              {logoData ? (
                <Image
                  src={logoData}
                  width={300}
                  style={{ margin: '16px 0' }}
                  preview={{
                    maskClassName: styles.previewMask,
                  }}
                />
              ) : <Image />}

              <Item
                label="医院 logo (支持JPG/PNG/JPEG格式，不超过2MB)"
                // extra="建议上传300x300像素的方形Logo"
              >
                <Upload {...uploadProps}>
                  <Button icon={<UploadOutlined />}>上传Logo</Button>
                </Upload>
              </Item>
            </div>
          </Form.Item>

          <div style={{ marginTop: 24 }}>
            <Space>
              <Button type="primary" onClick={handleSubmit} loading={uploading}>
                保存
              </Button>
              <Button
                onClick={() => {
                  form.resetFields();
                  setFileList([]);
                }}
              >
                重置
              </Button>
            </Space>
          </div>
        </Form>
      </div>
    </>
  );
};

export default Hospital;
