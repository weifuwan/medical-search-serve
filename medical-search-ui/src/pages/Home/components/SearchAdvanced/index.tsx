import React, { useState, useRef, useEffect } from 'react';
import { history, useDispatch } from '@umijs/max';
import { Input, Transfer, Tree, Space, Button, Spin, message } from 'antd';
import { ProForm, ProFormInstance, ProFormRadio, ProFormSelect } from '@ant-design/pro-components';
import { difference } from 'lodash';
import {
    getPageClassify,
} from '@/services/fieldManage/table'
import {
    getTreeListData,
    getLogicSymbolList,
    getRelationalSymbolList
} from '@/services/home/api'
import type { TransferItem } from 'antd/es/transfer';
import type { DataNode } from 'antd/es/tree';
import { setSessionVal } from '@/utils';

import TemplateETable, { DataSourceType } from './TemplateETable'
import TemplateSave from './TemplateSave'
import './index.less'

const { Search } = Input

interface SearchHighLevelProps {
    isHome: boolean;
    handleFinish: (val: string) => void;
}

// 重新格式化 tree
const generateTree = (treeNodes: DataNode[] = [], checkedKeys: string[] = []): DataNode[] =>
    treeNodes.map(({ children, ...props }) => ({
        ...props,
        disabled: checkedKeys.includes(props.key as string),
        children: generateTree(children, checkedKeys),
    }))

const SearchHighLevel: React.FC<SearchHighLevelProps> = (props) => {
    const { isHome, handleFinish } = props
    const formRef = useRef<ProFormInstance>()
    const childRef = useRef()
    const dispatch = useDispatch()
    const [searchName, setSearchName] = useState('')
    const [relationList, setRelationList] = useState<API.CommonListType[]>([])// 逻辑符号列表
    const [logicList, setLogicList] = useState<API.CommonListType[]>([])// 关系符号列表
    const [saveTransferData, setSaveTransferData] = useState<TransferItem[]>([])
    const [transferData, setTransferData] = useState<TransferItem[]>([])
    const [classifyId, setClassifyId] = useState('')
    const [searchType, setSearchType] = useState(2)
    const [pageClassifyData, setPageClassifyData] = useState<API.CommonSelectType[]>([])
    const [saveTreeData, setSaveTreeData] = useState<HOMEAPI.TreeItemType[]>([])
    const [treeData, setTreeData] = useState<HOMEAPI.TreeItemType[]>([])
    const [targetKeys, setTargetKeys] = useState<string[]>([])
    const [editableRowKeys, setEditableRowKeys] = useState<React.Key[]>([])// 表格编辑状态的 key
    const [alreadyTableData, setAlreadyTableData] = useState<DataSourceType[]>([])// 已经选择的数据
    const [eTableFormData, setETableFormData] = useState<STEMPLATEAPI.TemplateField[]>([])
    const [pageLoading, setPageLoading] = useState(false)
    const [previewData, setPreviewData] = useState('')
    const [showModalForm, setShowModalForm] = useState(false)
    const transferDataSource: TransferItem[] = []
    const transferDataSource1: TransferItem[] = []
    // 获取 逻辑符号列表
    const handleRelationList = async () => {
        const { code, data } = await getRelationalSymbolList()
        if (code === 0) {
            setRelationList(data)
        }
    }
    // 获取 关系符号列表
    const handleLogicSymbolList = async () => {
        const { code, data } = await getLogicSymbolList()
        if (code === 0) {
            setLogicList(data)
        }
    }
    // 得到 Transfer 的 ALL 数据
    const flatten = (list: DataNode[] = []) => {
        list.forEach((item: any) => {
            transferDataSource.push(item as TransferItem)
            if (item.children?.length) {
              const newChildren = item.children.map((child: any)=>{
                child.tableCode = item.tableCode
                child.tableName = item.tableName
                return child
              })

              flatten(newChildren)
            }
        })
        return transferDataSource
    }

    // 得到 Transfer 的 ALL 数据，保存
    const flatten1 = (list: DataNode[] = []) => {
        list.forEach((item: any) => {
            transferDataSource1.push(item as TransferItem)
            if (item.children?.length) {
              const newChildren = item.children.map((child: any)=>{
                child.tableCode = item.tableCode
                child.tableName = item.tableName
                return child
              })

              flatten1(newChildren)
            }
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

    // 保存模版完成
    const handleSaveTemFinish = () => {
        setShowModalForm(false)
    }


    // 检索/另存为模版（点击事件）
    const actionClick = (num: number) => {
        const cRef: any = childRef?.current
        cRef?.getTableData().then((tableValues: STEMPLATEAPI.TemplateField[]) => {
            setETableFormData(tableValues)
            switch (num) {
                case 1:// 检索
                    if (isHome) {
                        setSessionVal('searchVal', previewData)
                        dispatch({ type: "searchModel/reset" })
                        history.push(
                            {
                                pathname: '/home/searchList',
                                search: `?searchParams=${previewData}`
                            }
                        )
                    } else {
                        handleFinish(previewData)
                    }

                    break;
                default:// 另存为模版
                    setShowModalForm(true)
                    break;
            }
        })
    }

    // 穿梭框回调
    const onChange = (keys: string[]) => {
        const cRef: any = childRef?.current
        cRef?.clearTableData()
        // if (keys.length <= 20) {
        const targetKeyList = [...new Set(keys)]
        const list: DataSourceType[] = structuredClone(alreadyTableData)
        const aleradyKeys = alreadyTableData.map((item: DataSourceType) => item.fieldId)
        const keyList = difference(keys, aleradyKeys)

        keyList.forEach(item => {
            saveTransferData.forEach((child: TransferItem) => {
                if (item === child.key && item !== (saveTreeData?.filter(children => children.key === item)[0]?.key)) {
                    list.push({
                        ...child,
                        fieldId: child.key as React.Key,
                        logic:0,
                        selectField: '[' + getTreeNodeInfo(child.key!, saveTreeData)['title'] + '.' + child.fieldName + ']',
                    })
                }
            })
        })
        setTargetKeys(targetKeyList)
        setEditableRowKeys(targetKeyList)
        setAlreadyTableData(list)
        // } else {
        //     message.error('一次最多选20个字段')
        // }
    }

    // 编辑表格回调（删除、输入）
    const handleChange = (data: DataSourceType[]) => {
        const previewStr = data.map((item, index) => {
            const relationVal = (relationList.filter(child => child.code === item.relation))[0]?.name as string
            const logicVal = (logicList.filter(child => child.code === item.logic))[0]?.name
            const relationValList = ['=', 'IS NOT NULL', 'LIKE']
            const itemVal =
                (relationValList.includes(relationVal) ? (item.fieldVal ?
                    ((relationVal === 'LIKE' ? '*' : '') + item.fieldVal + (relationVal === 'LIKE' ? '*' : '')) : '') : '') +
                (item.selectField) +
                (relationValList.includes(relationVal) ? '' : relationVal ? relationVal : '') +
                (relationValList.includes(relationVal) ? '' : item.fieldVal ? item.fieldVal : '') +
                ((data.length - 1) > index ? (logicVal ? ('  ' + logicVal + '  ') : '') : '')

            return itemVal
        }).join('')
        setPreviewData(previewStr)

        const keys = data.map(item => (item.fieldId)) as string[]
        const keyList = [...new Set(keys)]
        
        setTargetKeys(keyList)
        setAlreadyTableData(data)// 已经选择的数据
    }

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

        return nodeObj as HOMEAPI.TreeItemType
    }
    useEffect(() => {
        handleRelationList()
        handleLogicSymbolList()
        handlePageClassify()
    }, [])

    return (
        <Spin spinning={pageLoading}>
            <Transfer
                className="search-high-transfer"
                dataSource={transferData}
                targetKeys={targetKeys}
                render={item => item.title!}
                showSelectAll={false}
                onChange={onChange}
                selectAllLabels={[<span>{targetKeys.length}/{saveTransferData.length}项</span>, <span>{alreadyTableData.length}项</span>]}
                titles={[<h4>选择字段</h4>, <h4>已选择结果</h4>]}
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
                                        style={{ width: '95%', margin: '0 12px 12px 12px' }}
                                        placeholder="请输入名称进行搜索"
                                        onSearch={handleSearch}
                                        onChange={searchValChange}
                                    />
                                    <Tree
                                        checkable
                                        blockNode
                                        height={312}
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
                                <TemplateETable
                                    ref={childRef}
                                    eTableData={alreadyTableData}
                                    editableKeys={editableRowKeys}
                                    handleChange={handleChange}
                                />
                            )
                        }
                    }

                }
            </Transfer>
            <div className='search-etable-preview-footer break-word'>
                {
                    <span>
                        检索条件结果预览：{previewData}
                    </span>
                }
            </div>
            <div className="search-high-footer">
                <Space size="large">
                    <Button type="primary" onClick={() => actionClick(1)}>
                        开始检索
                    </Button>
                    <Button onClick={() => actionClick(2)}>
                        另存为模版
                    </Button>
                </Space>
            </div>

            <TemplateSave
                showModalForm={showModalForm}
                list={eTableFormData}
                expression={previewData}
                handleFinish={handleSaveTemFinish}
            />
        </Spin>
    )
}

export default SearchHighLevel;