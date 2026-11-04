package com.jiayuan.modules.template.dao;

import com.baomidou.mybatisplus.annotation.InterceptorIgnore;
import com.jiayuan.common.dao.BaseDao;
import com.jiayuan.modules.searchv2.component.TableFieldInfo;
import com.jiayuan.modules.template.dto.TableDTO;
import com.jiayuan.modules.template.entity.TableEntity;
import com.jiayuan.modules.template.request.MetaSearchRequest;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 表
 *
 * @author lijiankui
 * @since 1.0.0 2022-11-09
 */
@Mapper
public interface TableDao extends BaseDao<TableEntity> {

    /**
     * 表备份
     *
     * @param timestamp
     */
    void metaDataBackupOfTable(@Param(value = "timestamp") String timestamp);

    /**
     * 字段备份
     *
     * @param timestamp
     */
    void metaDataBackupOfField(@Param(value = "timestamp") String timestamp);

    /**
     * 删除
     *
     * @param msVisitRecord
     */
    @InterceptorIgnore(blockAttack = "true")
    void deleteAll(@Param(value = "msVisitRecord") String msVisitRecord);

    /**
     * 查询表信息
     *
     * @param request
     * @return
     */
    List<TableDTO> findTableInfo(MetaSearchRequest request);

    /**
     * 查询表缓存信息
     *
     */
    List<TableFieldInfo> findTableMeta();
}