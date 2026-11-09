import React from 'react'
import { Modal } from 'antd'
import type { LegacyButtonType } from 'antd/es/button/button';

interface JYModalProps {
    title: string;// 标题
    width?: string;// 宽度
    keyboard?: boolean;// 是否支持键盘 esc 关闭
    mask?: boolean;// 是否展示遮罩
    maskClosable?: boolean;// 点击蒙层是否允许关闭
    isModalOpen: boolean;// 是否打开模态框
    confirmLoading?: boolean;// 确认 loding
    ChildNode: React.FC;// 插槽 dom
    footer?: any[] | null;// 插槽 dom
    centered?: boolean; //居中
    className?: string; // 自定义类名
    okText?: string;// 确认按钮文字
    okType?: LegacyButtonType;// 确认按钮类型 /primary
    handleOk?: () => void;// 确认回调
    handleCancel?: () => void;// 取消回调
}

const JYModal: React.FC<JYModalProps> = (props) => {
    const {
        title,
        width,
        isModalOpen,
        confirmLoading,
        keyboard,
        mask,
        maskClosable,
        okText,
        okType,
        centered,
        className,
        ChildNode,
        footer,
        handleOk,
        handleCancel
    } = props

    const Ok = () => {
        handleOk!()
    }

    const Cancel = () => {
        handleCancel!()
    }
    return (
        <Modal
            destroyOnClose
            className={className}
            title={title}
            width={width}
            open={isModalOpen}
            confirmLoading={confirmLoading}
            keyboard={keyboard}
            mask={mask}
            centered={centered}
            maskClosable={maskClosable}
            okText={okText}
            okType={okType}
            onOk={Ok}
            onCancel={Cancel}
            footer={footer}>

            <ChildNode />
        </Modal>
    )
}

export default JYModal