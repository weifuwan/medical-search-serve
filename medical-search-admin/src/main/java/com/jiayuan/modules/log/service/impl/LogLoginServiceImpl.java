
package com.jiayuan.modules.log.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.impl.BaseServiceImpl;
import com.jiayuan.modules.log.dao.LogLoginDao;
import com.jiayuan.modules.log.dto.LogLoginDTO;
import com.jiayuan.modules.log.entity.LogLoginEntity;
import com.jiayuan.modules.log.service.LogLoginService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;

/**
 * 登录日志
 *
 * @author lijiankui
 * @since 1.0.0
 */
@Service
public class LogLoginServiceImpl extends BaseServiceImpl<LogLoginDao, LogLoginEntity> implements LogLoginService {

    @Override
    public PageData<LogLoginDTO> page(Map<String, Object> params) {
        IPage<LogLoginEntity> page = baseDao.selectPage(
                getPage(params, Constant.CREATE_DATE, false),
                getWrapper(params)
        );

        return getPageData(page, LogLoginDTO.class);
    }

    public QueryWrapper<LogLoginEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        QueryWrapper<LogLoginEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(LogLoginEntity entity) {
        insert(entity);
    }

    @Override
    public void clearLog(Date date) {
        this.baseDao.clearLog(date);
    }

}