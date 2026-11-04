package com.jiayuan.modules.search.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.search.dao.LogSearchDao;
import com.jiayuan.modules.search.dto.LogSearchDTO;
import com.jiayuan.modules.search.entity.LogSearchEntity;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.search.service.LogSearchService;
import com.jiayuan.modules.security.user.SecurityUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 检索日志
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Service
public class LogSearchServiceImpl extends CrudServiceImpl<LogSearchDao, LogSearchEntity, LogSearchDTO> implements LogSearchService {

    @Override
    public QueryWrapper<LogSearchEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        QueryWrapper<LogSearchEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


    @Override
    public List<LogSearchDTO> listOfHistorySearch(Integer top) {
        if (Objects.isNull(top)) {
            top = BizConstant.TOP;
        }

        final QueryWrapper<LogSearchEntity> queryWrapper = Wrappers.<LogSearchEntity>query()
                .select("expression, max(create_date) as create_date")
                .eq("creator", SecurityUser.getUserId())
                .groupBy("expression")
                .orderByDesc("create_date")
                .last("FETCH FIRST " + top + " ROWS ONLY"); // Oracle 12c+ syntax

        // Alternative for older Oracle versions:
        // .last("WHERE ROWNUM <= " + top);

        final List<LogSearchDTO> list = this.list(queryWrapper);
        return list;
    }

    @Override
    public List<LogSearchDTO> listOfPopularSearch(Integer top) {
        if (Objects.isNull(top)) {
            top = BizConstant.TOP;
        }

        final QueryWrapper<LogSearchEntity> queryWrapper = Wrappers.<LogSearchEntity>query()
                .select("expression, count(1) as amount")
                .groupBy("expression")
                .orderByDesc("amount")
                .last("FETCH FIRST " + top + " ROWS ONLY");  // Oracle 12c+ syntax

        // Alternative for older Oracle versions:
        // .last("WHERE ROWNUM <= " + top);

        final List<LogSearchDTO> list = this.list(queryWrapper);
        return list;
    }

    @Async
    @Override
    public void saveLog(SearchRequest request) {
        LogSearchEntity build = LogSearchEntity.builder()
                .expression(request.getExpression()).build();
        System.out.println("user = " + SecurityUser.getUser());
        System.out.println("userId = " + SecurityUser.getUserId());
        System.out.println("object = " + SecurityUser.getSubject());
        this.baseDao.insert(build);
    }
}