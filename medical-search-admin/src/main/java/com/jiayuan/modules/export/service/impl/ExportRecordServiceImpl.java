package com.jiayuan.modules.export.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.enums.ExportStatus;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.modules.export.dao.ExportRecordDao;
import com.jiayuan.modules.export.dao.ExportSearchResultDao;
import com.jiayuan.modules.export.dto.ExportRecordDTO;
import com.jiayuan.modules.export.dto.ExportRecordFieldDTO;
import com.jiayuan.modules.export.dto.ExportSearchResultDTO;
import com.jiayuan.modules.export.dto.SeniorExportRecordDTO;
import com.jiayuan.modules.export.entity.ExportRecordEntity;
import com.jiayuan.modules.export.entity.ExportRecordFieldContentEntity;
import com.jiayuan.modules.export.entity.ExportSearchResultEntity;
import com.jiayuan.modules.export.service.ExportRecordFieldContentService;
import com.jiayuan.modules.export.service.ExportRecordFieldService;
import com.jiayuan.modules.export.service.ExportRecordService;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 数据导出记录
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-29
 */
@Service
@RequiredArgsConstructor
public class ExportRecordServiceImpl extends CrudServiceImpl<ExportRecordDao, ExportRecordEntity, ExportRecordDTO> implements ExportRecordService {

    private final ExportRecordFieldContentService exportRecordFieldContentService;
    private final ExportRecordFieldService exportRecordFieldService;
    private final ExportSearchResultDao exportSearchResultDao;

    @Override
    public Wrapper<ExportRecordEntity> getWrapper(Map<String, Object> params) {
        String searchName = (String) params.get("searchName");
        String createUserName = (String) params.get("createUserName");
        String startTime = (String) params.get("startTime");
        String endTime = (String) params.get("endTime");

        return Wrappers.<ExportRecordEntity>lambdaQuery()
                .eq(ExportRecordEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .like(StringUtils.isNotBlank(searchName), ExportRecordEntity::getSearchName, searchName)
                .like(StringUtils.isNotBlank(createUserName), ExportRecordEntity::getCreateUserName, createUserName)
                .ge(StringUtils.isNotBlank(startTime), ExportRecordEntity::getCreateDate, String.format("%s 00:00:00", startTime))
                .le(StringUtils.isNotBlank(endTime), ExportRecordEntity::getCreateDate, String.format("%s 23:59:59", endTime))
                .eq(ExportRecordEntity::getCreateUserId, SecurityUser.getUserId())
                .orderByDesc(ExportRecordEntity::getCreateDate);
    }


    @Override
    public ExportRecordDTO save(ExportSearchResultDTO searchResult, BizConstant.ExportType exportType, UserDetail curUser) {
        //保存导出记录
        ExportRecordDTO exportRecordDTO = ExportRecordDTO.builder()
                .expression(searchResult.getExpression())
                .amount(0)
                .dimension(searchResult.getDimension())
                .searchId(searchResult.getId())
                .searchName(searchResult.getName())
                .orderTableCode(searchResult.getOrderTableCode())
                .orderFieldCode(searchResult.getOrderFieldCode())
                .orderMode(searchResult.getOrderMode())
                .fieldAmount(0)
                .exportType(exportType.getCode())
                .createDate(new Date())
                .createUserId(String.valueOf(curUser.getUserId()))
                .createUserName(curUser.getUserName())
                .isDeleted(BooleanEnum.FALSE.getCode())
                .updateDate(new Date())
                .startDate(new Date())
                .status(ExportStatus.EXPORTING.code())
                .build();

        this.save(exportRecordDTO);

        return exportRecordDTO;
    }

    @Override
    public ExportRecordDTO startExportTask(ExportSearchResultDTO searchResult, BizConstant.ExportType exportType) {
        //保存导出记录
        UserDetail curUser = SecurityUser.getUser();
        ExportRecordDTO exportRecordDTO = ExportRecordDTO.builder()
                .expression(searchResult.getExpression())
                .amount(0)
                .dimension(searchResult.getDimension())
                .searchId(searchResult.getId())
                .searchName(searchResult.getName())
                .orderTableCode(searchResult.getOrderTableCode())
                .orderFieldCode(searchResult.getOrderFieldCode())
                .orderMode(searchResult.getOrderMode())
                .fieldAmount(0)
                .exportType(exportType.getCode())
                .createDate(new Date())
                .createUserId(String.valueOf(curUser.getUserId()))
                .createUserName(curUser.getUserName())
                .isDeleted(BooleanEnum.FALSE.getCode())
                .updateDate(new Date())
                .startDate(new Date())
                .status(ExportStatus.EXPORTING.code())
                .build();

        this.save(exportRecordDTO);

        return exportRecordDTO;
    }

    @Override
    public void endExportTask(ExportSearchResultDTO searchResult, ExportRecordDTO exportRecordDTO) {
        //更新检索结果
        ExportSearchResultEntity exportSearchResultEntity = new ExportSearchResultEntity();
        exportSearchResultEntity.setId(searchResult.getId());
        exportSearchResultEntity.setAmount(exportRecordDTO.getAmount());
        exportSearchResultDao.updateById(exportSearchResultEntity);

        // 更新导出记录
        exportRecordDTO.setEndDate(new Date());
        exportRecordDTO.setUpdateDate(new Date());
        this.update(exportRecordDTO);
    }

    @Override
    public void saveField(Long exportId, SeniorExportRecordDTO selectFieldList) {
        selectFieldList.getFieldDTOList().forEach(m -> {
            ExportRecordFieldDTO exportRecordFieldDTO = ExportRecordFieldDTO.builder()
                    .exportId(exportId)
                    .tableId(m.getTableId())
                    .tableFieldId(m.getTableFieldId())
                    .isDeleted(BooleanEnum.FALSE.getCode())
                    .createDate(new Date())
                    .updateDate(new Date())
                    .build();
            exportRecordFieldService.save(exportRecordFieldDTO);

            // 选择框
            if (CollectionUtils.isNotEmpty(m.getFieldContentDTOList())) {
                List<ExportRecordFieldContentEntity> contentEntityList = m.getFieldContentDTOList().stream().map(c -> ExportRecordFieldContentEntity.builder()
                        .fieldId(exportRecordFieldDTO.getId())
                        .code(c.getCode())
                        .name(c.getName())
                        .isDeleted(BooleanEnum.FALSE.getCode())
                        .createDate(new Date())
                        .updateDate(new Date())
                        .build()).collect(Collectors.toList());

                exportRecordFieldContentService.insertBatch(contentEntityList);
            }
        });
    }

    @Override
    public boolean checkExportTask(Long saveDataId) {
        Long count = this.baseDao.selectCount(Wrappers.<ExportRecordEntity>lambdaQuery()
                .eq(ExportRecordEntity::getSearchId, saveDataId)
                .eq(ExportRecordEntity::getStatus, ExportStatus.EXPORTING.code())
                .eq(ExportRecordEntity::getCreateUserId, SecurityUser.getUserId()));
        return count <= 0;
    }

}