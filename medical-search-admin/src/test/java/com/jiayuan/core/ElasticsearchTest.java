
package com.jiayuan.core;

import com.jiayuan.modules.search.component.SearchComponent;
import com.jiayuan.modules.search.request.SearchRequest;
import com.jiayuan.modules.template.service.MetaSyncService;
import com.jiayuan.modules.template.service.TableFieldService;
import com.jiayuan.modules.template.service.TableService;
import com.jiayuan.modules.ws.dto.EmrDTO;
import com.jiayuan.modules.ws.service.EmrService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Title: ElasticsearchTest
 * @Package: com.jiayuan.core
 * @Description: Elasticsearch测试
 * @Author: 李建奎
 * @Date: 创建时间 2022-11-10
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ElasticsearchTest {


    @Resource
    private SearchComponent searchComponent;

    @Resource
    private TableService tableService;

    @Resource
    private TableFieldService tableFieldService;


    @Resource
    private MetaSyncService metaSyncService;

    @Resource
    private EmrService emrService;


    private Long superAdminId = 1067246875800000001L;


    @Test
    public void test11() {
        SearchRequest param = new SearchRequest();
        param.setExpression("张三*[基础信息.姓名] and [基础信息.年龄]>23 or (*新冠肺炎[门诊信息.诊断] AND \"检验科\"[住院信息.住院科室])");
        param.setDimension(1);
        searchComponent.search(param);
    }

    @Test
    public void test12() {
        SearchRequest param = new SearchRequest();
        param.setExpression("7696[患者基础信息.患者个人信息标识]");
        param.setDimension(0);
        searchComponent.search(param);

    }

    /**
     * 公司环境元数据同步
     */
    @Test
    public void metaOfCom() {
        //公司测试环境：cdr_% 、patient、就诊主表
//        metaSyncService.execute(CollectionUtil.newArrayList("cdr_"),null,null);
//        metaSyncService.execute(null,null,CollectionUtil.newArrayList("patient","就诊主表"));
    }


    /**
     * 中心医院环境元数据同步
     */
    @Test
    public void metaOfZXYY() {
        //中心医院测试环境：^(?!test|count_|temp).*$, patient、就诊主表
//        metaSyncService.execute("^test|^count_|^temp",true,"mysql");
    }


    @Test
    public void test111() {
        SearchRequest param = new SearchRequest();
        String expression = "\"57539\"[发药信息.患者个人信息标识] " +
                "OR \"57539\"[门诊就诊.患者ID] " +
                "OR \"57539\"[挂号.患者ID] " +
                "OR \"57539\"[检查申请.患者ID] " +
                "OR \"57539\"[检验申请.患者ID] " +
                "OR \"57539\"[检查报告.患者ID]";
        param.setExpression(expression);
        param.setDimension(0);
        searchComponent.search(param);
    }


    @Test
    public void getIndexMapping() {
        final Map<String, Object> indexMapping = searchComponent.getIndexMapping();
        System.out.println(indexMapping);
    }

    @Test
    public void merge() {
        metaSyncService.merge(null);
    }


    @Test
    public void metaDataBackup() {
        //中心医院测试环境：^(?!test|count_|temp).*$, patient、就诊主表
        tableService.metaDataBackup();
    }


    @Test
    public void test() {
        emrService.queryEmr(EmrDTO.builder().patientId("172927").domainId("01").visitNo("X0013609").build());
    }
}
