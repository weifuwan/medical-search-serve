package com.jiayuan.modules.search.service;

import com.jiayuan.modules.search.dto.StatDTO;
import com.jiayuan.modules.search.request.StatRequest;

/**
 * @Title: StatService
 * @Package: com.jiayuan.modules.search.service
 * @Description: 统计管理接口
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/23
 */
public interface StatService {

    /**
     * 数据统计
     *
     * @param param
     * @return
     */
    StatDTO.DataStat statOfData(StatRequest param);

    /**
     * 导出占比统计
     *
     * @param param
     * @return
     */
    StatDTO.ExportStat statOfExport(StatRequest param);
}
