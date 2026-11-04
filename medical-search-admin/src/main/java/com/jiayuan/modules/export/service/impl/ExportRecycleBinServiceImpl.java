package com.jiayuan.modules.export.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.config.CustomConfig;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.export.dao.ExportRecycleBinDao;
import com.jiayuan.modules.export.dto.ExportRecycleBinDTO;
import com.jiayuan.modules.export.dto.ExportSearchResultDTO;
import com.jiayuan.modules.export.entity.ExportRecycleBinEntity;
import com.jiayuan.modules.export.entity.ExportSearchResultEntity;
import com.jiayuan.modules.export.service.ExportRecycleBinService;
import com.jiayuan.modules.export.service.ExportSearchResultService;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 数据检索保存记录回收站
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Service
@RequiredArgsConstructor
public class ExportRecycleBinServiceImpl extends CrudServiceImpl<ExportRecycleBinDao, ExportRecycleBinEntity, ExportRecycleBinDTO>
        implements ExportRecycleBinService {

    private final ExportSearchResultService exportSearchResultService;
    private final CustomConfig customConfig;

    @Override
    public Wrapper<ExportRecycleBinEntity> getWrapper(Map<String, Object> params) {
        return Wrappers.<ExportRecycleBinEntity>lambdaQuery()
                .eq(ExportRecycleBinEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .ge(ExportRecycleBinEntity::getExpireDate, new Date())
                .eq(ExportRecycleBinEntity::getCreateUserId, SecurityUser.getUserId())
                .orderByDesc(ExportRecycleBinEntity::getUpdateDate);
    }

    @Override
    public void revoke(Long[] ids) throws Exception {
        deletedLogicallyBatchIds(ids);

        // 恢复数据检索保存记录
        LambdaQueryWrapper<ExportRecycleBinEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.in(ExportRecycleBinEntity::getId, ids);

        List<ExportRecycleBinEntity> entities = this.baseDao.selectList(wrapper);

        List<ExportSearchResultEntity> exportSearchResults = entities.stream().map(e -> {
            ExportSearchResultEntity entity = new ExportSearchResultEntity();
            entity.setId(e.getSearchId());
            entity.setIsDeleted(BooleanEnum.FALSE.getCode());
            return entity;
        }).collect(Collectors.toList());

        exportSearchResultService.updateBatchById(exportSearchResults);
    }

    @Override
    public void clear() {
        LambdaUpdateWrapper<ExportRecycleBinEntity> updateWrapper = new LambdaUpdateWrapper<>();
        updateWrapper.eq(ExportRecycleBinEntity::getIsDeleted, BooleanEnum.FALSE.getCode());
        updateWrapper.le(ExportRecycleBinEntity::getExpireDate, new Date());

        ExportRecycleBinEntity entity = new ExportRecycleBinEntity();
        entity.setIsDeleted(BooleanEnum.TRUE.getCode());
        this.baseDao.update(entity, updateWrapper);
    }

    @Override
    public void save(ExportSearchResultDTO exportSearchResultDTO) {
        UserDetail loginUser = SecurityUser.getUser();
        Date now = new Date();

        ExportRecycleBinDTO dto = ExportRecycleBinDTO.builder()
                .searchId(exportSearchResultDTO.getId())
                .searchName(exportSearchResultDTO.getName())
                .dimension(exportSearchResultDTO.getDimension())
                .amount(exportSearchResultDTO.getAmount())
                .expression(exportSearchResultDTO.getExpression())
                .remark(exportSearchResultDTO.getRemark())
                .expireDate(DateUtil.offsetDay(now, customConfig.getRecycleBinExpire()))
                .createUserId(String.valueOf(loginUser.getUserId()))
                .createUserName(loginUser.getUserName())
                .isDeleted(BooleanEnum.FALSE.getCode())
                .createDate(now)
                .updateDate(now)
                .build();

        this.save(dto);
    }
}