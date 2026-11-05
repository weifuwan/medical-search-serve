import React, { useRef } from 'react'
import {
    ModalForm,
    ProFormInstance,
    ProFormRadio,
    ProFormText,
} from '@ant-design/pro-components'
import { Form, message } from 'antd'
import { iuTemplate } from '@/services/searchTemplate/api'
import { defaultSearchConfig } from '@/services/searchTemplate/searchConfig'
import { getSessionVal } from '@/utils'

interface SaveTemplateProps {
    showModalForm: boolean;
    list: STEMPLATEAPI.TemplateField[];
    expression: string;
    handleFinish: () => void;
}

const SaveTemplate: React.FC<SaveTemplateProps> = (props) => {
    const { showModalForm, list, expression, handleFinish } = props
    const [form] = Form.useForm<STEMPLATEAPI.TemplateListItem>()
    const formRef = useRef<ProFormInstance>()


    // 新增/修改
    const handleIUTemplate = async (formValues: STEMPLATEAPI.TemplateListItem) => {
        const paramsData: STEMPLATEAPI.IUTemplateItem = {
            id: '',
            useScope: formValues.useScope,
            templateName: formValues.templateName,
            expression: expression,
            searchConfig: JSON.stringify({
                ...defaultSearchConfig,
                dimension: getSessionVal('dimensionVal') === 1 ? 1 : 0,
            }),
            templateFieldDTOList: list.map((item: STEMPLATEAPI.TemplateField, index: number) => ({
                fieldId: item.fieldId,
                fieldName: item.title,
                fieldVal: item.fieldVal,
                logic: item.logic,
                relation: item.relation,
                sort: index,
            }))
        }
        const { code, msg } = await iuTemplate(paramsData)
        if (code === 0) {
            message.success('保存成功')
        } else {
            message.error(msg)
        }
        handleFinish()
    }

    return (
        <ModalForm<STEMPLATEAPI.TemplateListItem>
            width={500}
            form={form}
            formRef={formRef}
            title='保存模版'
            open={showModalForm}
            autoFocusFirstInput
            modalProps={{
                destroyOnClose: true,// 会重置表单，如果是 initialValues，会重置到 initialValues 的值
                onOk: () => { },
                onCancel: () => { handleFinish() },
            }}
            submitTimeout={2000}
            onFinish={async (values) => {
                handleIUTemplate(values)
            }}
        >
            <ProFormText
                name="templateName"
                label="模版名称"
                placeholder="请请输入名称进行搜索"
                rules={[
                    { required: true, message: '请输入模版名称！' },
                ]}
            />
            <ProFormRadio.Group
                label="模版使用范围"
                name="useScope"
                initialValue={1}
                options={[
                    {
                        label: '全院',
                        value: 0,
                    },
                    {
                        label: '个人',
                        value: 1,
                    },
                ]}
                rules={[
                    { required: true, message: '请选择模版使用范围！' },
                ]}
            />
        </ModalForm>
    )
}

export default SaveTemplate