package com.jiayuan.common.component;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

/**
 * @Title: EmptyPage
 * @Package: com.jiayuan.common.component
 * @Description: size=0的实现
 * @Author: 李建奎
 * @Date: 创建时间 2022/12/16
 */
public class EmptyPage implements Pageable {

    public static final EmptyPage INSTANCE = new EmptyPage();

    @Override
    public int getPageNumber() {
        return 0;
    }

    @Override
    public int getPageSize() {
        return 0;
    }

    @Override
    public long getOffset() {
        return 0;
    }

    @Override
    public Sort getSort() {
        return null;
    }

    @Override
    public Pageable next() {
        return null;
    }

    @Override
    public Pageable previousOrFirst() {
        return null;
    }

    @Override
    public Pageable first() {
        return null;
    }

    @Override
    public Pageable withPage(int pageNumber) {
        return null;
    }

    @Override
    public boolean hasPrevious() {
        return false;
    }
}
