package com.jiayuan.modules.template.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.BizConstant;
import com.jiayuan.common.constant.Constant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.page.PageData;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.validator.AssertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.security.user.UserDetail;
import com.jiayuan.modules.template.dao.TemplateDao;
import com.jiayuan.modules.template.dto.*;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import com.jiayuan.modules.template.entity.TemplateEntity;
import com.jiayuan.modules.template.entity.TemplateFieldEntity;
import com.jiayuan.modules.template.service.TableFieldService;
import com.jiayuan.modules.template.service.TemplateFieldService;
import com.jiayuan.modules.template.service.TemplateService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * @Title: TemplateServiceImpl
 * @Package: com.jiayuan.modules.template.service.impl
 * @Description: 模板Service
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-16
 */
@Service
@Slf4j
public class TemplateServiceImpl extends CrudServiceImpl<TemplateDao, TemplateEntity, TemplateDTO> implements TemplateService {

    @Resource
    private TemplateFieldService templateFieldService;

    @Resource
    private TableFieldService tableFieldService;


    @Override
    public Wrapper<TemplateEntity> getWrapper(Map<String, Object> params) {
        String templateName = (String) params.get("templateName");
        Integer useScope = ObjectUtil.isNotEmpty(params.get("useScope")) ? Integer.parseInt((String) params.get("useScope")) : null;
        String startDate = (String) params.get(Constant.START_DATE);
        String endDate = (String) params.get(Constant.END_DATE);

        return Wrappers.<TemplateEntity>lambdaQuery()
                .likeRight(StrUtil.isNotBlank(templateName), TemplateEntity::getTemplateName, StrUtil.trim(templateName))
                .and(Objects.nonNull(useScope),
                        BizConstant.UseScope.PERSONAL.getCode().equals(useScope)
                                ? w -> w.eq(TemplateEntity::getCreator, SecurityUser.getUser().getUserId())
                                : w -> w.eq(TemplateEntity::getUseScope, useScope))
                // 修改日期比较方式，使用apply和TO_DATE函数
                .apply(StrUtil.isNotBlank(startDate),
                        "TO_CHAR(create_date, 'YYYY-MM-DD') >= TO_CHAR(TO_DATE('" + startDate + "', 'YYYY-MM-DD'), 'YYYY-MM-DD')")
                .eq(TemplateEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .apply(StrUtil.isNotBlank(endDate),
                        "TO_CHAR(create_date, 'YYYY-MM-DD') < TO_CHAR(TO_DATE('" + endDate + "', 'YYYY-MM-DD'), 'YYYY-MM-DD')");
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveOrUpdateTemplate(TemplateDTO dto) {
        UserDetail loginUser = SecurityUser.getUser();
        Long templateId = dto.getId();
        final List<TemplateFieldDTO> fieldDTOList = dto.getTemplateFieldDTOList();
        TemplateSearchConfig.parse(dto.getSearchConfig());
        if (Objects.nonNull(templateId)) {
            // 更新
            ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
            templateFieldService.deleteBatchByTemplateId(templateId);
            dto.setUpdaterName(loginUser.getUserName());
            dto.setCreatorName(loginUser.getUserName());
            this.update(dto);
        } else {
            // 新增
            ValidatorUtils.validateEntity(dto);
            dto.setUpdaterName(loginUser.getUserName());
            dto.setCreatorName(loginUser.getUserName());
            this.save(dto);
            templateId = dto.getId();
        }
        // 模板关联字段处理
        final List<TemplateFieldEntity> fieldList = ConvertUtils.sourceToTarget(fieldDTOList, TemplateFieldEntity.class);
        if (CollectionUtil.isNotEmpty(fieldList)) {
            Map<Long, TableFieldDTO> collect = tableFieldService.list(Wrappers.<TableFieldEntity>lambdaQuery().in(TableFieldEntity::getId, fieldList.stream().map(TemplateFieldEntity::getFieldId).collect(Collectors.toList())))
                    .stream().collect(Collectors.toMap(TableFieldDTO::getId, Function.identity(), (key1, key2) -> key2));
            for (TemplateFieldEntity field : fieldList) {
                field.setTemplateId(templateId);
                TableFieldDTO fieldDTO = collect.get(field.getFieldId());
                Optional.ofNullable(fieldDTO).ifPresent(tf -> {
                    field.setTableCode(fieldDTO.getTableCode());
                    field.setFieldCode(fieldDTO.getFieldCode());
                });

            }

            templateFieldService.insertBatch(fieldList, fieldList.size());
        }
    }

    @Override
    public TemplateDTO getById(Long id) {
        AssertUtils.isNull(id, "id");
        final TemplateDTO templateDTO = this.get(id);
        final List<TemplateFieldDTO> fieldList = templateFieldService.list(id);
        templateDTO.setTemplateFieldDTOList(fieldList);
        ExpressionParser.parseExpressionOfOptimized(templateDTO);
        return templateDTO;
    }

    @Override
    public PageData<TemplateDTO> getPageInfo(Map<String, Object> params) {
        PageData<TemplateDTO> page = this.page(params);
        fillFieldInfoAndExpression(page.getList());
        return page;
    }

    @Override
    public List<TemplateDTO> selectList() {
        final List<TemplateDTO> list = this.list(Wrappers.<TemplateEntity>lambdaQuery()
                .eq(TemplateEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .and(q -> q.eq(TemplateEntity::getUseScope, BizConstant.UseScope.ALL.getCode()).or().eq(TemplateEntity::getCreator, SecurityUser.getUser().getUserId()))
        );
        if (CollectionUtil.isNotEmpty(list)) {
            fillFieldInfoAndExpression(list);
        }
        return list;
    }

    @Override
    public String preview(TemplateDTO dto) {
        final List<TemplateFieldDTO> fieldDTOList = dto.getTemplateFieldDTOList();
        if (CollectionUtil.isNotEmpty(fieldDTOList)) {
            final List<Long> fieldIds = fieldDTOList.stream().map(TemplateFieldDTO::getFieldId).collect(Collectors.toList());
            final List<FieldDTO> fieldList = tableFieldService.getFieldList(fieldIds);
            final Map<Long, FieldDTO> fieldMap = fieldList.stream().collect(Collectors.toMap(FieldDTO::getFieldId, Function.identity(), (key1, key2) -> key2));
            // 填充模板字段信息（模板字段+字段关键信息）
            fieldDTOList.stream().forEach(e -> {
                final FieldDTO fieldDTO = fieldMap.get(e.getFieldId());
                BeanUtil.copyProperties(fieldDTO, e);
            });
            dto.setTemplateFieldDTOList(fieldDTOList);
            ExpressionParser.parseExpressionOfOptimized(dto);
        }
        return dto.getExpression();
    }


    /**
     * 填充字段信息和表达式信息
     *
     * @param rows
     */
    private void fillFieldInfoAndExpression(List<TemplateDTO> rows) {
        if (CollectionUtil.isNotEmpty(rows)) {
            // 获取关联模板字段信息
            final List<Long> templateIds = rows.stream().map(TemplateDTO::getId).collect(Collectors.toList());
            final List<TemplateFieldEntity> templateFieldEntities = templateFieldService.selectList(
                    Wrappers.<TemplateFieldEntity>lambdaQuery()
                            .in(TemplateFieldEntity::getTemplateId, templateIds)
            );

            if (CollectionUtil.isNotEmpty(templateFieldEntities)) {
                // 使用 tableCode + fieldCode 查询字段信息
                List<TableFieldCodePair> codePairs = templateFieldEntities.stream()
                        .map(entity -> TableFieldCodePair.of(entity.getTableCode(), entity.getFieldCode()))
                        .collect(Collectors.toList());

                final List<FieldDTO> fieldList = tableFieldService.getFieldListByCodes(codePairs);

                // 改用 tableCode + fieldCode 作为唯一标识（替代 fieldId）
                final Map<TableFieldCodePair, FieldDTO> fieldMap = fieldList.stream()
                        .collect(Collectors.toMap(
                                field -> TableFieldCodePair.of(field.getTableCode(), field.getFieldCode()),
                                Function.identity(),
                                (key1, key2) -> key2
                        ));

                // 按模板ID分组模板字段
                final Map<Long, List<TemplateFieldEntity>> templateFieldMap = templateFieldEntities.stream()
                        .collect(Collectors.groupingBy(TemplateFieldEntity::getTemplateId));

                // 填充模板字段信息
                for (TemplateDTO templateDTO : rows) {
                    List<TemplateFieldEntity> templateFieldList = templateFieldMap.get(templateDTO.getId());
                    if (CollectionUtil.isNotEmpty(templateFieldList)) {
                        List<TemplateFieldDTO> templateFieldDTOs = ConvertUtils.sourceToTarget(templateFieldList, TemplateFieldDTO.class);
                        templateFieldDTOs.forEach(e -> {
                            // 用 tableCode + fieldCode 匹配字段信息
                            TableFieldCodePair key = TableFieldCodePair.of(e.getTableCode(), e.getFieldCode());
                            FieldDTO fieldDTO = fieldMap.get(key);

                            if (fieldDTO != null) {
                                BeanUtil.copyProperties(fieldDTO, e);
                                // 保留原 fieldId（如果需要）
                                e.setFieldId(fieldDTO.getFieldId());
                            } else {
                                log.info("e -> " + e);
                                log.info("key -> " + key.toString());
                                log.info("value -> " + fieldDTO);
                                log.info("fieldMap -> " + fieldMap);
                            }
                        });

                        templateDTO.setTemplateFieldDTOList(templateFieldDTOs);
                    }
                    ExpressionParser.parseExpressionOfOptimized(templateDTO);
                }
            }
        }
    }

}