
package com.jiayuan.modules.log.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.impl.BaseServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.modules.log.dao.SysLogOperationDao;
import com.jiayuan.modules.log.dto.SysLogOperationDTO;
import com.jiayuan.modules.log.entity.SysLogOperationEntity;
import com.jiayuan.modules.log.service.SysLogOperationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 操作日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Service
public class SysLogOperationServiceImpl extends BaseServiceImpl<SysLogOperationDao, SysLogOperationEntity> implements SysLogOperationService {

    @Override
    public PageData<SysLogOperationDTO> page(Map<String, Object> params) {
        IPage<SysLogOperationEntity> page = baseDao.selectPage(
                getPage(params, Constant.CREATE_DATE, false),
                getWrapper(params)
        );

        return getPageData(page, SysLogOperationDTO.class);
    }

    @Override
    public List<SysLogOperationDTO> list(Map<String, Object> params) {
        List<SysLogOperationEntity> entityList = baseDao.selectList(getWrapper(params));

        return ConvertUtils.sourceToTarget(entityList, SysLogOperationDTO.class);
    }

    private Wrapper<SysLogOperationEntity> getWrapper(Map<String, Object> params) {
        String status = (String) params.get("status");
        String startDate = (String) params.get(Constant.START_DATE);
        String endDate = (String) params.get(Constant.END_DATE);

        return Wrappers.<SysLogOperationEntity>lambdaQuery()
                .eq(StrUtil.isNotBlank(status), SysLogOperationEntity::getStatus, status)
                // 使用apply方法处理Oracle日期比较
                .apply(StrUtil.isNotBlank(startDate),
                        "create_date >= TO_DATE('" + startDate + "', 'YYYY-MM-DD HH24:MI:SS')")
                .apply(StrUtil.isNotBlank(endDate),
                        "create_date <= TO_DATE('" + endDate + "', 'YYYY-MM-DD HH24:MI:SS')");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(SysLogOperationEntity entity) {
        insert(entity);
    }


    @Override
    public void clearLog(Date date) {
        this.baseDao.clearLog(date);
    }

}