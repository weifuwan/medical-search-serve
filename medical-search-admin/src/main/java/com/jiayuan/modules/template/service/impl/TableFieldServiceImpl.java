package com.jiayuan.modules.template.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.lang.Assert;
import com.jiayuan.common.utils.Result;
import com.jiayuan.modules.template.dto.TableFieldCodePair;
import org.apache.commons.lang3.tuple.Pair;
import cn.hutool.extra.spring.SpringUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.enums.FieldUseType;
import com.jiayuan.common.exception.BizException;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.AddGroup;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.search.component.SearchComponent;
import com.jiayuan.modules.searchv2.cache.TableFieldUpdateEvent;
import com.jiayuan.modules.template.dao.TableFieldDao;
import com.jiayuan.modules.template.dto.FieldDTO;
import com.jiayuan.modules.template.dto.TableDTO;
import com.jiayuan.modules.template.dto.TableFieldDTO;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import com.jiayuan.modules.template.service.TableFieldService;
import com.jiayuan.modules.template.service.TableService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * 字段
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Service
@RequiredArgsConstructor
public class TableFieldServiceImpl extends CrudServiceImpl<TableFieldDao, TableFieldEntity, TableFieldDTO> implements TableFieldService {

    @Autowired
    private ApplicationEventPublisher eventPublisher;


    @Override
    public QueryWrapper<TableFieldEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");
        String tableId = (String) params.get("tableId");

        QueryWrapper<TableFieldEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);
        wrapper.eq(StringUtils.isNotBlank(tableId), "table_id", tableId);

        return wrapper;
    }

    @Override
    public List<TableFieldDTO> getFieldList(Long tableId, String fieldName) {
        if (Objects.isNull(tableId) && StringUtils.isBlank(fieldName)) {
            throw new BizException("tableId和fieldName不能同时为空");
        }
        List<TableFieldEntity> fieldList = baseDao.selectList(Wrappers.<TableFieldEntity>lambdaQuery()
                .eq(Objects.nonNull(tableId), TableFieldEntity::getTableId, tableId)
                .like(StringUtils.isNotBlank(fieldName), TableFieldEntity::getFieldName, fieldName)
                .eq(TableFieldEntity::getIsDeleted, BooleanEnum.FALSE.getCode())
                .orderByAsc(TableFieldEntity::getFieldName));

        List<TableFieldDTO> dtoList = ConvertUtils.sourceToTarget(fieldList, TableFieldDTO.class);

        return dtoList;
    }

    @Override
    public FieldDTO getField(String fieldName, String tableName) {
        return this.baseDao.getField(fieldName, tableName);
    }

    @Override
    public List<FieldDTO> getFieldList(List<Long> fieldIds) {
        return this.baseDao.getFieldListByFieldIds(fieldIds);
    }

    @Override
    public void saveTableField(TableFieldDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, AddGroup.class, DefaultGroup.class);
        dto.setFieldType(FieldUseType.OTHER.getCode());
        Map<String, Object> tableMap = getSearchComponent().getIndexMapping();
        TableDTO tableDTO = getTableService().get(dto.getTableId());
        dto.setTableCode(tableDTO.getTableCode());
        if (CollectionUtil.isNotEmpty(tableMap)) {
            String tableCode = tableDTO.getTableCode();
            if (tableMap.containsKey(tableCode)) {
                Map<String, Object> fieldMap = (Map<String, Object>) ((Map<String, Object>) tableMap.get(tableCode)).get("properties");
                Optional.ofNullable(fieldMap).ifPresent(fm -> dto.setIsEffective(fm.containsKey(dto.getFieldCode())));
            } else {
                dto.setIsEffective(false);
            }

        }
        this.save(dto);
    }

    @Override
    public void updateTableField(TableFieldDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        TableFieldDTO fieldDTO = get(dto.getId());
        Assert.notNull(fieldDTO, "修改字段不存在");
        this.update(dto);
        eventPublisher.publishEvent(new TableFieldUpdateEvent(fieldDTO.getFieldName(), fieldDTO.getFieldCode()));
    }

    @Override
    public void deleteAll() {
        this.baseDao.deleteAll(EsConstant.MS_VISIT_RECORD);
    }

    @Override
    public void deleteByTableCode(long tableId) {
        LambdaQueryWrapper<TableFieldEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(TableFieldEntity::getTableId, tableId);
        this.baseDao.delete(wrapper);
    }


    @Override
    public List<TableFieldEntity> findList() {
        List<TableFieldEntity> list = new ArrayList<>(16);
        for (int i = 1; i < 1000; i++) {
            Page<TableFieldEntity> page = this.baseDao.selectPage(new Page<>(i, 1000),
                    Wrappers.<TableFieldEntity>lambdaQuery()
                            .eq(TableFieldEntity::getIsEffective, true)
                            .eq(TableFieldEntity::getIsShow, true)
                            .eq(TableFieldEntity::getIsDeleted, BooleanEnum.FALSE.value()));
            List<TableFieldEntity> records = page.getRecords();
            if (CollectionUtil.isNotEmpty(records)) {
                list.addAll(records);
            } else {
                break;
            }
        }

        return list;
    }

    @Override
    public List<FieldDTO> getPrimaryFieldList(Set<Long> tableIds) {
        return this.baseDao.getPrimaryFieldList(tableIds);
    }

    @Override
    public List<FieldDTO> getFieldListByCodes(List<TableFieldCodePair> codePairs) {
        return this.baseDao.getFieldListByCodes(codePairs);
    }

    @Override
    public void switchFieldsStatus(TableFieldDTO dto) {
        this.baseDao.switchShowStatus(dto.getIsShow(), dto.getTableCode(), dto.getFieldCode());
    }

    @Override
    public List<FieldDTO> getShowFieldsByTableId(String tableId) {
        return this.baseDao.getShowFieldsByTableId(tableId);
    }

    /**
     * 获取tableService
     *
     * @return
     */
    private TableService getTableService() {
        return SpringUtil.getBean(TableService.class);
    }

    /**
     * 获取检索组件
     *
     * @return
     */
    private SearchComponent getSearchComponent() {
        return SpringUtil.getBean(SearchComponent.class);
    }
}