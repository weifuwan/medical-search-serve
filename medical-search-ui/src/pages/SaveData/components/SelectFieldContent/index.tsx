import React, { forwardRef, useEffect, useImperativeHandle, useState } from 'react';
import { Transfer } from 'antd';
import { pageFieldContent } from '@/services/saveData/api'

interface SelectFieldContentProps {
  ref: any;
  defaultTargetData: RecordType[]
}

export interface RecordType {
  key: string;
  title: string;
}

const SelectFieldContent: React.FC<SelectFieldContentProps> = forwardRef((props, ref) => {
  const { defaultTargetData } = props
  const [mockData, setMockData] = useState<RecordType[]>([])
  const [targetKeys, setTargetKeys] = useState<string[]>(defaultTargetData?.map(item => item.key))
  const [targetData, setTargetData] = useState<RecordType[]>(defaultTargetData)

  // 获取校验通过后的数据
  const handleSelectData = () => {
    return targetData
  }
  // 暴露获取表格数据方法
  useImperativeHandle(ref, () => ({
    selectData: handleSelectData()
  }))

  const getMock = async () => {
    const paramsData = {
      page: 1,
      limit: 10
    }
    const { code, data } = await pageFieldContent(paramsData)
    if (code === 0) {
      const tempMockData = data?.list.map((item: any) => ({
        key: item.id,
        title: item.name,
      }))

      setMockData(tempMockData)
    }
  }

  // 本地搜索
  const filterOption = (inputValue: string, option: RecordType) =>
    option.title.indexOf(inputValue) > -1

  // 根据 keys 得到对应的 item
  const getSelectData = (keys: string[]) => {
    const data: RecordType[] = []
    mockData.map(item => {
      if ((keys.filter(child => item.key === child).length > 0)) {
        data.push(item)
      }
    })
    return data
  }

  // 穿梭回调
  const handleChange = (newTargetKeys: string[]) => {
    const data = getSelectData(newTargetKeys)
    setTargetKeys(newTargetKeys)
    setTargetData(data)
  }

  useEffect(() => {
    getMock()
  }, [])


  return (
    <Transfer
      showSearch
      listStyle={{ width: "50%", height: 400 }}
      dataSource={mockData}
      targetKeys={targetKeys}
      filterOption={filterOption}
      onChange={handleChange}
      render={item => item.title}
      titles={[<h4>选择字段内容</h4>, <h4>已选择结果</h4>]}
    />
  );
})

export default SelectFieldContent;