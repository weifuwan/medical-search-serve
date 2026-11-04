package com.jiayuan.modules.template.dao;

import com.baomidou.dynamic.datasource.annotation.DS;
import com.jiayuan.modules.template.entity.TableEntity;
import com.jiayuan.modules.template.entity.TableFieldEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @Title: MetaSyncDao
 * @Package: com.jiayuan.modules.template.dao
 * @Description: 元数据同步dao
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/9
 */
@DS("meta")
@Mapper
public interface MetaSyncDao {

    /**
     * 查询表列表
     *
     * @param regex    正则表达式
     * @param negation 是否取反
     * @param dbType   数据库类型
     * @return
     */
    List<TableEntity> selectTableList(@Param("regex") String regex,
                                      @Param("negation") boolean negation,
                                      @Param("dbType") String dbType);


    /**
     * 查询字段列表
     *
     * @param tableCode
     * @param dbType
     * @return
     */
    List<TableFieldEntity> selectColumnList(@Param("tableCode") String tableCode,
                                            @Param("dbType") String dbType);


    /**
     * query field info according to table name
     */
    List<TableFieldEntity> queryMetaOrder(String upperTableName);

}
