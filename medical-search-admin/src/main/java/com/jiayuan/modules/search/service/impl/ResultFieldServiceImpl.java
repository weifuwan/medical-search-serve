package com.jiayuan.modules.search.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.jiayuan.common.constant.EsConstant;
import com.jiayuan.common.enums.BooleanEnum;
import com.jiayuan.common.service.impl.CrudServiceImpl;
import com.jiayuan.common.utils.ConvertUtils;
import com.jiayuan.common.validator.ValidList;
import com.jiayuan.common.validator.ValidatorUtils;
import com.jiayuan.common.validator.group.DefaultGroup;
import com.jiayuan.common.validator.group.UpdateGroup;
import com.jiayuan.modules.search.dao.ResultFieldDao;
import com.jiayuan.modules.search.dto.ResultFieldDTO;
import com.jiayuan.modules.search.dto.SortDTO;
import com.jiayuan.modules.search.entity.ResultFieldEntity;
import com.jiayuan.modules.search.service.ResultFieldService;
import com.jiayuan.modules.security.user.SecurityUser;
import com.jiayuan.modules.template.dto.FieldDTO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 返回结果表头
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Service
public class ResultFieldServiceImpl extends CrudServiceImpl<ResultFieldDao, ResultFieldEntity, ResultFieldDTO> implements ResultFieldService {

    @Override
    public QueryWrapper<ResultFieldEntity> getWrapper(Map<String, Object> params) {
        String id = (String) params.get("id");

        QueryWrapper<ResultFieldEntity> wrapper = new QueryWrapper<>();
        wrapper.eq(StringUtils.isNotBlank(id), "id", id);

        return wrapper;
    }


    @Override
    public List<FieldDTO> getUserShowFieldList() {
        List<FieldDTO> userShowFieldList = this.baseDao.getUserSaveFieldList(SecurityUser.getUserId());
        if (CollectionUtil.isEmpty(userShowFieldList)) {
            return this.getDefaultShowFieldList();
        }
        return userShowFieldList;
    }

    @Override
    public List<FieldDTO> getFieldList(List<Long> ids) {
        return this.baseDao.getFieldList(ids);
    }

    @Override
    public void userShowFieldBatchSave(List<ResultFieldDTO> list) {
        if (CollectionUtil.isEmpty(list)) {
            return;
        }
        ValidatorUtils.validateEntity(list);
        final List<FieldDTO> userShowFieldList = this.baseDao.getUserSaveFieldList(SecurityUser.getUserId());
        final List<String> existList = userShowFieldList.stream().map(e -> e.getTableCode() + e.getFieldCode()).collect(Collectors.toList());
        final List<ResultFieldDTO> collect = list.stream().filter(e -> nonContain(e, existList)).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(collect)) {
            final Integer curMaxSort = userShowFieldList.stream().map(FieldDTO::getSort).max(Integer::compareTo).orElse(0);
            for (int index = 0; index < collect.size(); index++) {
                final ResultFieldDTO e = collect.get(index);
                e.setSort(curMaxSort + index + 1);
                e.setIsDefault(BooleanEnum.FALSE.getCode());
                e.setUserId(SecurityUser.getUserId());
                initialization(e);
            }
            final List<ResultFieldEntity> entities = ConvertUtils.sourceToTarget(collect, ResultFieldEntity.class);
            this.insertBatch(entities);
        }
    }


    @Override
    public void updateResultField(ResultFieldDTO dto) {
        //效验数据
        ValidatorUtils.validateEntity(dto, UpdateGroup.class, DefaultGroup.class);
        this.update(dto);
    }

    @Override
    public void defaultTitleReset() {
        //重置：删除用户自定义配置项
        this.baseDao.delete(Wrappers.<ResultFieldEntity>lambdaQuery()
                .eq(ResultFieldEntity::getUserId, SecurityUser.getUserId())
                .eq(ResultFieldEntity::getIsDefault, BooleanEnum.FALSE.getCode())
        );
    }

    @Override
    public void sort(ValidList<SortDTO> list) {
        ValidatorUtils.validateEntity(list);
        list.forEach(e -> {
            this.baseDao.update(new ResultFieldEntity(), Wrappers.<ResultFieldEntity>lambdaUpdate()
                    .eq(ResultFieldEntity::getId, e.getId())
                    .set(ResultFieldEntity::getSort, e.getSort()));
        });
    }

    @Override
    public List<FieldDTO> getDefaultShowFieldList() {
        return this.baseDao.getDefaultShowFieldList();
    }

    @Override
    public void defaultShowFieldBatchSave(ValidList<ResultFieldDTO> list) {
        if (CollectionUtil.isEmpty(list)) {
            return;
        }
        ValidatorUtils.validateEntity(list);
        final List<FieldDTO> defaultFieldList = this.getDefaultShowFieldList();
        final List<String> existList = defaultFieldList.stream().map(e -> e.getTableCode() + e.getFieldCode()).collect(Collectors.toList());
        final List<ResultFieldDTO> collect = list.stream().filter(e -> nonContain(e, existList)).collect(Collectors.toList());
        if (CollectionUtil.isNotEmpty(collect)) {
            final Integer curMaxSort = defaultFieldList.stream().map(FieldDTO::getSort).max(Integer::compareTo).orElse(0);
            for (int index = 0; index < collect.size(); index++) {
                final ResultFieldDTO e = collect.get(index);
                e.setSort(curMaxSort + index + 1);
                e.setIsDefault(BooleanEnum.TRUE.getCode());
                e.setUserId(SecurityUser.getUserId());
                initialization(e);
            }
            final List<ResultFieldEntity> entities = ConvertUtils.sourceToTarget(collect, ResultFieldEntity.class);
            this.insertBatch(entities);
        }
    }

    @Override
    public List<Long> getNeedUpdateConfigIds(List<String> tfCodeList) {
        return this.baseDao.getNeedUpdateConfigIds(tfCodeList);
    }

    /**
     * 不包含
     *
     * @param e
     * @param existList
     * @return
     */
    private boolean nonContain(ResultFieldDTO e, List<String> existList) {
        return !existList.contains(e.getTableCode() + e.getFieldCode());
    }


    /**
     * 初始化
     *
     * @param dto
     */
    private void initialization(ResultFieldDTO dto) {
        dto.setId(null);

        //字典控制
        if (EsConstant.MS_VISIT_RECORD.equals(dto.getTableCode())
                && EsConstant.VISIT_TYPE.equals(dto.getFieldCode())) {
            dto.setIsDict(BooleanEnum.TRUE.getCode());
            dto.setDictType(EsConstant.VISIT_TYPE);
        } else {
            dto.setIsDict(BooleanEnum.FALSE.getCode());
        }

        //isBasic的控制
        if (EsConstant.MS_VISIT_RECORD.equals(dto.getTableCode()) &&
                (EsConstant.PATIENT_ID.equals(dto.getFieldCode()) || EsConstant.PATIENT_NAME.equals(dto.getFieldCode()))) {
            dto.setIsBasic(BooleanEnum.TRUE.value());
            dto.setIsVisitBasic(BooleanEnum.TRUE.value());
        } else {
            dto.setIsBasic(BooleanEnum.FALSE.getCode());
            dto.setIsVisitBasic(BooleanEnum.FALSE.getCode());
        }
    }

}