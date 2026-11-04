import React from "react";
import { Popconfirm } from "antd";

type removeConfirmProps = {
  text?: string;
  data?: any;
  handleOk?: (data: any) => void
}

// 删除确认提示框
const RemoveConfirm: React.FC<removeConfirmProps> = (props) => {
  const { text = '删除', data, handleOk = () => { } } = props
  return (
    <Popconfirm
      key="delete"
      onConfirm={(e) => {
        handleOk(data)
        e?.stopPropagation()
      }}
      onCancel={(e) => {
        e?.stopPropagation()
      }}
      title={`确认${text}吗?`}
    >
      <a onClick={(e) => {
        e?.stopPropagation()
      }}>
        {text}
      </a>
    </Popconfirm>
  )
}

export default RemoveConfirm