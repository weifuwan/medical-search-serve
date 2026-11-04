import React, { useState, useRef, useEffect } from 'react'
import { Input, Transfer, Tree, Space, Button, Spin, Alert, message, Popconfirm } from 'antd'
import { difference } from 'lodash'
import { SEARCHTIP } from '../../config'
import {
    getTreeListData,
} from '@/services/home/api'
import { defaultSearchFieldList, dSearchField, saveSearchBatch, searchReset } from '@/services/systemSet/api'
import type { TransferItem } from 'antd/es/transfer'
import type { DataNode } from 'antd/es/tree'
import SearchETable, { DataSourceType } from './SearchETable'
import styles from '../../index.less'
import './index.less'
import { ProForm, ProFormInstance, ProFormRadio, ProFormSelect } from '@ant-design/pro-components'
import { getPageClassify } from '@/services/fieldManage/table'

const { Search } = Input

// 判断当前树下的 节点 是否全部选中
const containsAllValues = (children: any, checkedKeys: any) => {
    let num = 0
    for (let i = 0; i < children.length; i++) {
        if (checkedKeys.indexOf(children[i]['key']) !== -1) {
            num++
        }
    }

    return children.length === num
}

// 重新格式化 tree
const generateTree = (treeNodes: DataNode[] = [], checkedKeys: string[] = []): DataNode[] =>
    treeNodes.map(({ children, ...props }) => ({
        ...props,
        disabled: children ? containsAllValues(children, checkedKeys) : checkedKeys.includes(props.key as string),
        children: generateTree(children, checkedKeys),
    }))

const Insert: React.FC = () => {
    const formRef = useRef<ProFormInstance>()
    const childRef = useRef()
    const [searchName, setSearchName] = useState('')
    const [saveTransferData, setSaveTransferData] = useState<TransferItem[]>([])
    const [transferData, setTransferData] = useState<TransferItem[]>([])
    const [saveTreeData, setSaveTreeData] = useState<HOMEAPI.TreeItemType[]>([])
    const [treeData, setTreeData] = useState<HOMEAPI.TreeItemType[]>([])
    const [classifyId, setClassifyId] = useState('')
    const [searchType, setSearchType] = useState(2)
    const [pageClassifyData, setPageClassifyData] = useState<API.CommonSelectType[]>([])
    const [targetKeys, setTargetKeys] = useState<string[]>([])
    const [alreadyTableData, setAlreadyTableData] = useState<DataSourceType[]>([])// 已经选择的数据
    const [pageLoading, setPageLoading] = useState(false)
    const transferDataSource: TransferItem[] = []
    const transferDataSource1: TransferItem[] = []

    // 根据当前 tree key 获取 item 节点信息
    const getTreeNodeInfo = (key: string | number, list: HOMEAPI.TreeItemType[], isChild?: boolean) => {
        let nodeObj = {}
        list.forEach(item => {
            item.children?.forEach(child => {
                if (key === child.key) {
                    nodeObj = isChild ? { ...child } : { ...item }
                }
            })
        })

        return nodeObj as any
    }

    // 得到 Transfer 的 ALL 数据
    const flatten = (list: DataNode[] = []) => {
        list.forEach(item => {
            transferDataSource.push(item as TransferItem)
            flatten(item.children)
        })
        return transferDataSource
    }

    // 得到 Transfer 的 ALL 数据
    const flatten1 = (list: DataNode[] = []) => {
        list.forEach(item => {
            transferDataSource1.push(item as TransferItem)
            flatten1(item.children)
        })
        return transferDataSource1
    }

    // 获取 分类 数据
    const handlePageClassify = async () => {
        const { code, data } = await getPageClassify({ page: 1, limit: 50 })
        if (!code) {
            const list = data.list.map((item: { name: string, id: string }) => ({
                label: item.name,
                value: item.id
            }))
            setPageClassifyData(list)
            handleTreeList('', '')
        }
    }


    // 获取 tree 数据
    const handleTreeList = async (tableName: string, classifyIdVal: string) => {
        const paramsData = {
            classifyId: classifyIdVal,
            keyword: tableName,
            type: searchType
        }
        setPageLoading(true)
        const data = await getTreeListData(paramsData, ['tableName', 'tableCode', 'fieldList', 'fieldName', 'id'])

        setTreeData(data)
        setTransferData(flatten(data))

        if (!saveTransferData.length) {
            setSaveTreeData(data)
            setSaveTransferData(flatten1(data))
        }
        handleTemplateInfo(saveTreeData.length > 0 ? saveTreeData : data)
        setPageLoading(false)
    }

    // 表单数据变化时
    const formChange = (e: any) => {
        if (e && e['type']) {
            const typeVal = e['type']
            setSearchType(typeVal)
            return
        }

        const classifyIdVal = formRef.current?.getFieldValue('classifyId')
        setClassifyId(classifyIdVal)
        setSearchName('')
        handleTreeList('', classifyIdVal)
    }

    // tree 搜索
    const handleSearch = (val: string) => {
        handleTreeList(val, classifyId)
    }

    // tree 搜索 change
    const searchValChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setSearchName(e.target.value)
    }


    // 获取 默认字段信息
    const handleTemplateInfo = async (list: HOMEAPI.TreeItemType[]) => {
        const { code, data } = await defaultSearchFieldList()
        if (code === 0) {
            setAlreadyTableData(data?.map((item: SYSTEMSET.SaveListItem) => ({
                ...item,
                fieldName: '[' + item.tableName + '.' + item.fieldName + ']'
                // fieldName: '[' + getTreeNodeInfo(item.fieldId!, list)['tableName'] + '.' + getTreeNodeInfo(item.fieldId!, list, true)['fieldName'] + ']',
            })))
            const keys = data?.map((item: SYSTEMSET.SaveListItem) => item.fieldId)
            setTargetKeys(keys)
        }
        setPageLoading(false)
    }

    // 保存
    const handleSave = async (paramsData: SYSTEMSET.SaveListItem[]) => {
        const { code } = await saveSearchBatch(paramsData)
        if (code === 0) {
            message.success('成功')
            handleTemplateInfo(saveTreeData)
        }
    }

    // 重置
    const handleReset = async () => {
        const { code } = await searchReset()
        if (code === 0) {
            message.success('成功')
            handleTemplateInfo(saveTreeData)
        }
    }

    // 穿梭框回调
    const onChange = (keys: string[]) => {
        // if (keys.length <= 30) {
        let list: SYSTEMSET.SaveListItem[] = []
        const keyList = [...new Set(keys)]
        keyList.forEach((child, index) => {
            saveTransferData.forEach(item => {
                if (child == item.key && item.fieldCode) {
                    const arr = alreadyTableData.filter(children => children.fieldId === child)
                    list.push({
                        // id: item.id,
                        isDefault: arr.length > 0 ? arr[0].isDefault : 0,
                        fieldCode: item.fieldCode,
                        tableCode: getTreeNodeInfo(child, saveTreeData)['tableCode'],
                    })
                }
            })
        })

        handleSave(list)

        // } else {
        //     message.error('一次最多选30个字段')
        // }
    }

    // 编辑表格回调（删除）
    const handleChange = async (data: String[]) => {
        const { code } = await dSearchField(data)
        if (code === 0) {
            message.success('成功')
            handleTemplateInfo(saveTreeData)
        }
    }

    useEffect(() => {
        handlePageClassify()
    }, [])

    return (
        <Spin spinning={pageLoading}>
            {/* <Alert className={styles.tipAlert} message={SEARCHTIP} type="success" closable /> */}
            <Transfer
                className="insert-transfer"
                dataSource={transferData}
                targetKeys={targetKeys}
                render={item => item.title!}
                showSelectAll={false}
                onChange={onChange}
                selectAllLabels={[<span>{targetKeys.length}/{saveTransferData.length}项</span>, <span>{targetKeys.length}项</span>]}
                titles={[<h4>选择字段</h4>, <h4>已选结果</h4>]}
                oneWay
            >
                {
                    ({ direction, selectedKeys, onItemSelectAll, onItemSelect, filteredItems }) => {
                        if (direction === 'left') {
                            const checkedKeys = [...selectedKeys, ...targetKeys]
                            return (
                                <>
                                    <ProForm
                                        style={{ margin: '12px 4px 0 12px' }}
                                        formRef={formRef}
                                        layout="horizontal"
                                        submitter={false}
                                        onValuesChange={formChange}
                                    >
                                        <ProFormSelect
                                            name="classifyId"
                                            label="分类"
                                            showSearch
                                            placeholder="请选择"
                                            options={pageClassifyData}
                                        />
                                        <ProFormRadio.Group
                                            name="type"
                                            label="类型："
                                            fieldProps={{ defaultValue: 2 }}
                                            options={[
                                                {
                                                    label: '关键词',
                                                    value: 2,
                                                },
                                                {
                                                    label: '数据集',
                                                    value: 1,
                                                },
                                            ]}
                                        />
                                    </ProForm>
                                    <Search
                                        allowClear
                                        value={searchName}
                                        style={{ width: '97%', margin: '0 12px 12px 12px' }}
                                        placeholder="请输入名称进行搜索"
                                        onSearch={handleSearch}
                                        onChange={searchValChange}
                                    />
                                    <Tree
                                        checkable
                                        blockNode
                                        height={420}
                                        defaultExpandAll
                                        checkedKeys={checkedKeys}
                                        treeData={generateTree(treeData, targetKeys)}
                                        onCheck={(_, { node: { key, checked } }) => {
                                            const fatherList = treeData.filter(item => key === item.key)
                                            const isCheck = !checked
                                            // if (fatherList.length > 0) {
                                            const keys = _ as string[]
                                            const diffKeys = isCheck
                                                ? difference(keys, selectedKeys)
                                                : difference(selectedKeys, keys)

                                            onItemSelectAll(diffKeys as string[], isCheck)
                                            // } else {
                                            //     onItemSelect(key as string, isCheck);
                                            // }
                                        }}
                                    />
                                </>
                            )
                        }
                        if (direction === 'right' && alreadyTableData.length > 0) {
                            return (
                                <SearchETable
                                    ref={childRef}
                                    eTableData={alreadyTableData}
                                    handleChange={handleChange}
                                />
                            )
                        }
                    }
                }
            </Transfer>

            <div className="insert-footer">
                <Space size="large">
                    <Popconfirm
                        key="delete"
                        onConfirm={(e) => {
                            handleReset()
                            e?.stopPropagation()
                        }}
                        onCancel={(e) => {
                            e?.stopPropagation()
                        }}
                        title={`确认重置吗?`}
                    >
                        <Button type="primary">
                            重置
                        </Button>
                    </Popconfirm>
                </Space>
            </div>
        </Spin>
    )
}

export default Insert;