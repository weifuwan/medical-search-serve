package com.jiayuan.modules.search.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.modules.export.entity.ExportRecordEntity;
import com.jiayuan.modules.export.service.ExportRecordService;
import com.jiayuan.modules.search.dto.StatDTO;
import com.jiayuan.modules.search.request.StatRequest;
import com.jiayuan.modules.search.service.StatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Title: StatServiceImpl
 * @Package: com.jiayuan.modules.search.service.impl
 * @Description: 统计impl
 * @Author: 李建奎
 * @Date: 创建时间 2022/11/23
 */
@Service
public class StatServiceImpl implements StatService {

    @Resource
    private ExportRecordService exportRecordService;

    @Override
    public StatDTO.DataStat statOfData(StatRequest param) {
        final QueryWrapper<ExportRecordEntity> queryWrapper = Wrappers.<ExportRecordEntity>query()
                .select("dimension type,count(1) amount")

                .apply(param.getStartDate() != null, "create_date > to_date('" + formatDate(param.getStartDate()) + "', 'yyyy-mm-dd hh24:mi:ss')")
                .apply(param.getEndDate() != null, "create_date <= to_date('" + formatDate(param.getEndDate()) + "', 'yyyy-mm-dd hh24:mi:ss')")
                .groupBy("dimension");

        final List<Map<String, Object>> list = exportRecordService.selectMaps(queryWrapper);
        if (CollectionUtil.isNotEmpty(list)) {
            final StatDTO.DataStat dataStat = new StatDTO.DataStat();
            list.forEach(map -> {
                BigDecimal bic = (BigDecimal) map.get(BizConstant.Filed.type.name().toUpperCase());

                int intValue = bic.intValue();

                if (BizConstant.Dimension.PERSON_TIMES.getCode().equals(intValue)) {
                    BigDecimal bigDecimal = (BigDecimal) map.get(BizConstant.Filed.amount.name().toUpperCase());
                    dataStat.setPersonTimes(bigDecimal.longValue());
                }
                if (BizConstant.Dimension.PERSON.getCode().equals(intValue)) {
                    BigDecimal bigDecimal = (BigDecimal) map.get(BizConstant.Filed.amount.name().toUpperCase());
                    dataStat.setPersons(bigDecimal.longValue());
                }
            });
            return dataStat;
        }
        return null;
    }

    private String formatDate(Date date) {
        if (date == null) return null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }

    @Override
    public StatDTO.ExportStat statOfExport(StatRequest param) {
        final QueryWrapper<ExportRecordEntity> queryWrapper = Wrappers.<ExportRecordEntity>query()
                .select("export_type type,count(1) amount")
                .apply("TO_CHAR(create_date, 'YYYY-MM-DD HH24:MI:SS') >= TO_CHAR({0}, 'YYYY-MM-DD HH24:MI:SS')", param.getStartDate())
                .apply("TO_CHAR(create_date, 'YYYY-MM-DD HH24:MI:SS') < TO_CHAR({0}, 'YYYY-MM-DD HH24:MI:SS')", param.getEndDate())
                .groupBy("export_type");

        final List<Map<String, Object>> list = exportRecordService.selectMaps(queryWrapper);
        if (CollectionUtil.isNotEmpty(list)) {
            final StatDTO.ExportStat exportStat = new StatDTO.ExportStat();
            list.forEach(map -> {
                if (BizConstant.ExportType.BASE.getCode().toString().equals(map.get(BizConstant.Filed.type.name().toUpperCase()).toString())) {
                    BigDecimal bigDecimal = (BigDecimal) map.get(BizConstant.Filed.amount.name().toUpperCase());
                    if (bigDecimal != null) {
                        exportStat.setBaseExportTimes(bigDecimal.longValue());
                    }
                }
                if (BizConstant.ExportType.HIGH.getCode().toString().equals(map.get(BizConstant.Filed.type.name().toUpperCase()).toString())) {
                    BigDecimal bigDecimal = (BigDecimal) map.get(BizConstant.Filed.amount.name().toUpperCase());
                    if (bigDecimal != null) {
                        exportStat.setHighExportTimes(bigDecimal.longValue());
                    }
                }
            });
            return exportStat;
        }
        return null;
    }
}