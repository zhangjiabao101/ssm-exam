package com.aaa.service;

import com.aaa.mapper.BaseMapper;
import com.aaa.util.LayuiPageHelper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service层模板
 * @author 淮南King
 * @date 2020-07-04
 */
@Service
public abstract class BaseService<T> {
    /**
     * 用于获取Mapper
     * @return
     */
    public abstract BaseMapper<T> getDao();

    public int insert(T entity) {
        return getDao().insert(entity);
    }

    public int update(T entity) {
        return getDao().update(entity);
    }

    public int delete(T entity) {
        return getDao().delete(entity);
    }

    public List<T> findPage(T t, LayuiPageHelper page, Object... objects) {
        return getDao().findPage(t, page, objects);
    }

    public T findOne(T entity) {
        return getDao().findOne(entity);
    }

    public int dataCount(T entity, Object... objects) {
        return getDao().dataCount(entity, objects);
    }
}
