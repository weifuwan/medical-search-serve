import React from 'react';
import { Flowchart } from '@ant-design/flowchart';
import DATA from './ProcessConfig'
import "@ant-design/flowchart/dist/index.css";

const nodePanelProps: any = { show: false }

const Process: React.FC = () => {
  return (
    <div style={{ height: 760, maxWidth: 1380, margin: '0 auto' }}>
      <Flowchart
        data={DATA}
        mode="scan"
        canvasProps={{
          position: {
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
          }
        }}
        isAutoCenter={true}
        toolbarPanelProps={{ show: false }}
        detailPanelProps={{ show: false }}
        nodePanelProps={nodePanelProps}
      />
    </div>
  )
}
export default Process