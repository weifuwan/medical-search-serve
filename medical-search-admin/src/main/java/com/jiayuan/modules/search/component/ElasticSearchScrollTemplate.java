package com.jiayuan.modules.search.component;

import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchScrollHits;
import org.springframework.data.elasticsearch.core.mapping.IndexCoordinates;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;

import java.util.List;
import java.util.concurrent.*;
import java.util.stream.Collectors;

/**
 * scrollTemplate 模板，用于遍历整个Index的数据
 *
 * @author xiuzhu
 * @Date 2023/7/28 13:12
 */
@Slf4j
public class ElasticSearchScrollTemplate<T> {

    ExecutorService executorService = new ThreadPoolExecutor(1, 4,
            30, TimeUnit.SECONDS,
            new LinkedBlockingQueue<Runnable>(5),
            Executors.defaultThreadFactory(),
            new ThreadPoolExecutor.CallerRunsPolicy()
    );

    ElasticsearchRestTemplate elasticSearchRestTemplate;

    Class<T> cls;

    String indexName;

    public ElasticSearchScrollTemplate(
            ElasticsearchRestTemplate template,
            Class<T> cls,
            String indexName
    ) {
        this.elasticSearchRestTemplate = template;
        this.cls = cls;
        this.indexName = indexName;
    }

    @FunctionalInterface
    public interface Consumer<T> {
        public void accept(List<T> objects);
    }

    public void execute(Consumer<T> consumer) {
        //构建查询条件
        NativeSearchQueryBuilder query = new NativeSearchQueryBuilder();
        BoolQueryBuilder queryBuilder = QueryBuilders.boolQuery();

        query.withPageable(PageRequest.of(0, 300));
        query.withQuery(queryBuilder);

        //保留1分钟
        long scrollTimeInMillis = 600 * 1000;

        IndexCoordinates recordIndex = IndexCoordinates.of(indexName);
        SearchScrollHits<T> hits = elasticSearchRestTemplate.searchScrollStart(scrollTimeInMillis, query.build(), cls, recordIndex);

        // scrollId
        String scrollId = hits.getScrollId();
        List<T> recordEntityList = hits.stream().map(SearchHit::getContent).collect(Collectors.toList());
        long total = 0L;

        log.info("================ began scroll index={} ====================", indexName);

        executorService.submit(() -> {
            consumer.accept(recordEntityList);
        });

        total = total + recordEntityList.size();

        log.info("================  has scroll index={} total={} ====================", indexName, total);
        while (!hits.isEmpty()) {
            hits = elasticSearchRestTemplate.searchScrollContinue(scrollId, scrollTimeInMillis, cls, recordIndex);
            List<T> entities = hits.stream().map(SearchHit::getContent).collect(Collectors.toList());

            executorService.submit(() -> {
                consumer.accept(entities);
            });

            total = total + entities.size();
            try {
                //给系统留GC时间，不然容易内存溢出
                Thread.sleep(300);
            } catch (InterruptedException e) {
                log.error("sleep error", e);
            }
            log.info("================  has scroll index={} total={} ====================", indexName, total);
        }
        log.info("================ end scroll index={} ====================", indexName);
    }
}
