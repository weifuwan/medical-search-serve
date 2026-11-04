import React, { useRef } from 'react'
import { ActionType, ProColumns, ProTable } from '@ant-design/pro-components'
type TableItemType = {
    id: number;
    function: string;
    memo: string;
    example: string;
}
const columns: ProColumns<TableItemType>[] = [
    {
        title: '序号',
        dataIndex: 'index',
        valueType: 'indexBorder',
        width: 48,
    },
    {
        title: '功能',
        dataIndex: 'function',
    },
    {
        title: '功能说明',
        dataIndex: 'memo',
    },
    {
        title: '示例',
        dataIndex: 'example',
    },
]

const data: TableItemType[] = [
    {
        id: 1,
        function: '检索结果默认显示页面',
        memo: '默认展示【empi id  /序号/就诊iD/姓名/性别/年龄/门诊或住院/门诊诊断/住院诊断/看诊科室/入院科室/医生】字段显示，可隐藏字段，也可在【系统设置】中手动配置更多字段显示',
        example: ''
    },
    {
        id: 2,
        function: '模糊检索',
        memo: '不带任何符号、公式的文本或数字检索时，都是从显示页面中的字段进行匹配，如设置中增加了字段，则包含增加的字段',
        example: '请见首页检索'
    },
    {
        id: 3,
        function: '精准检索',
        memo: '带符号、公式的文本或数字检索时，直接从定位的数据中进行检索',
        example: '请见首页检索'
    },
    {
        id: 4,
        function: '检索公式',
        memo: '检索内容[表名.字段]号前的文本表示检索内容，括号前部分表示数据库中表名，括号后部分表示字段',
        example: ''
    },
    {
        id: 5,
        function: '[ . ]',
        memo: '括号表示数据库表、字段意思，可直接按库表中检索[检查数据] ；也可直接在库表中的字段进行检索；',
        example: '腹部[检查数据] ：表示在检查数据这个表中进行检索，腹部[检查数据.项目名称] ：表示在检查数据表中的项目名称字段进行检索'
    },
    {
        id: 6,
        function: '<  >  =  ≥  ≤',
        memo: '检索某个指定字段内容时，缩小范围',
        example: '年龄＜8[患者基本信息.年龄] ：检索公式表示在‘患者基本信息.年龄’这个字段中，检索年龄小于‘8’相关的数据'
    },
    {
        id: 7,
        function: '*',
        memo: '精确的指定检索某个字段样式',
        example: '上呼吸*[检查数据.诊断名称]：表示从诊断名称字段中检索以’上呼吸‘3字开头的诊断患者*上呼吸[检查数据.诊断名称]：表示从诊断名称字段中检索以’上呼吸‘3字结尾的诊断患者*上呼吸*[检查数据.诊断名称]：表示从诊断名称字段中检索’上呼吸‘3字的诊断患者'
    },
    {
        id: 8,
        function: 'AND  OR',
        memo: "'AND'  表示包含 ' OR ' 表示不包含；一般用在一个字段和另一个字段之间的符号",
        example: '年龄＜8[患者基本信息.年龄] +年龄＞2[患者基本信息.年龄] ，表示2岁至8岁之间的患者年龄＜8[患者基本信息.年龄] OR 胃炎[门诊诊断.诊断名称] ，表示在小于8岁患者中，不包含胃炎的患者'
    },
    {
        id: 9,
        function: '基本导出',
        memo: '表示只能导出默认的基本信息，如在设置中增加了默认的信息，则带上设置中的一起',
        example: '【empi id  /序号/就诊iD/姓名/性别/年龄/门诊或住院/门诊诊断/住院诊断/看诊科室/入院科室/医生/就诊或入院时间】+设置默认字段'
    },
    {
        id: 10,
        function: '高级导出',
        memo: '选择高级导出时，自定义字段',
        example: '自定义字段'
    },
    {
        id: 11,
        function: '历史导出',
        memo: '记录已导出的历史列表，并且可查看和再次导出',
        example: ''
    },
    {
        id: 12,
        function: '回收站',
        memo: '保存记录从【数据保存】中删除的信息，可预览详细信息人数，且可撤回和永久删除',
        example: ''
    },
    {
        id: 13,
        function: '数据保存中修改、增加、删除数据',
        memo: '数据保存增加数据、删除数据，通过数据保存列表中【查看】页面进行修改、增加、删除',
        example: ''
    },
    {
        id: 14,
        function: '检索模板',
        memo: '为检索的公式做相应的模板，在检索时可方便、快速直接插入模板，模板可设置个人使用、以及全部使用，个人使用模板可以随时修改，全部使用模板只能创建人修改',
        example: '[患者基本信息.性别]-顺庆[患者基本信息.住址]+上呼吸道[门诊诊断.诊断名称]+CT[检查信息.检查名称]'
    },
]

const Explain: React.FC = () => {
    const actionRef = useRef<ActionType>();
    return (
        <ProTable<TableItemType>
            actionRef={actionRef}
            rowKey="id"
            bordered
            search={false}
            options={false}
            columns={columns}
            dataSource={data}
            pagination={false}
        />
    )
}

export default Explain;
