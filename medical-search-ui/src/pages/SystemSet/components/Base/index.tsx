import React, { useEffect, useState } from 'react';
import { Form, Input, InputNumber, Switch, Button, message } from 'antd';
import { getConfigList, saveConfigList } from '@/services/systemSet/api'

const Base: React.FC = () => {
    const [form] = Form.useForm()
    const [confgList, setConfigList] = useState<SYSTEMSET.ConfigListItem[]>()

    const getConfig = async () => {
        const { code, data } = await getConfigList()
        if (code === 0) {
            let currModuleId = ''
            let list: SYSTEMSET.ConfigListItem[] = []
            data.map((item: any) => {
                if (item.moduleId !== currModuleId) {
                    currModuleId = item.moduleId
                    list.push({
                        moduleId: item.moduleId,
                        moduleName: item.moduleName,
                        children: []
                    })
                }

                if (item.configType == 2) {
                    item.configValue = item.configValue === 'Y'
                }

                list.forEach(child => {
                    if (item.moduleId === child.moduleId) {
                        child.children.push(item)
                    }
                })
            })
            let initsValue: any = {}
            data.forEach((item: any) => {
                initsValue[item.configCode] = item.configValue
            })

            form.setFieldsValue(initsValue)
            setConfigList(list)
        }
    }

    const saveClick = async () => {
        let paramsData: SYSTEMSET.SaveConfigListItem[] = []
        let formValues = form.getFieldsValue()

        for (const key in formValues) {
            paramsData.push({
                key,
                value: formValues[key]
            })
        }
        paramsData = paramsData.map(item => {
            if ((typeof item.value === 'boolean') && item.value) {
                item.value = 'Y'
            }
            if ((typeof item.value === 'boolean') && !item.value) {
                item.value = 'N'
            }

            return item
        })
        const { code } = await saveConfigList(paramsData)
        if (code === 0) {
            message.success('成功！')
            getConfig()
        }
    }

    useEffect(() => {
        getConfig()
    }, [])

    return (
        <div>
            {
                confgList?.map((item, index) => (
                    <div key={item.moduleId}>
                        <h3>{item.moduleName}</h3>
                        <Form form={form} labelCol={{ span: 6 }} >
                            {
                                item.children.map(child => (
                                    <Form.Item
                                        key={child.configCode}
                                        label={child.configName}
                                        rules={[{ required: true, message: '请输入!' }]}
                                        style={{ marginTop: '16px' }}

                                    >
                                        {
                                            child.configType == 1 &&
                                            <Form.Item name={child.configCode} noStyle>
                                                <Input style={{ width: '250px' }} />
                                            </Form.Item>
                                        }
                                        {
                                            child.configType == 2 &&
                                            <Form.Item name={child.configCode} noStyle valuePropName="checked">
                                                <Switch />
                                            </Form.Item>
                                        }
                                        {
                                            child.configType == 3 &&
                                            <Form.Item name={child.configCode} noStyle>
                                                <InputNumber />
                                            </Form.Item>
                                        }
                                        <span style={{ marginLeft: '16px' }}>提示：{child.description}</span>
                                    </Form.Item>
                                ))
                            }
                            {
                                (confgList.length === (index + 1)) &&
                                <Form.Item wrapperCol={{ offset: 6 }}>
                                    <Button type="primary" onClick={() => { saveClick() }}>
                                        保存
                                    </Button>
                                </Form.Item>
                            }
                        </Form>
                    </div>
                ))
            }
        </div>
    );
};

export default Base;