package com.aaa.mapper;

import com.aaa.util.LayuiPageHelper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Mapper模板
 * @author 淮南King
 * @date 2020-07-04
 */
public interface BaseMapper<T> {
    int insert(@Param("beans") T t);

    int update(@Param("beans") T t);

    int delete(@Param("beans") T t);

    List<T> findPage(@Param("beans") T t, @Param("page") LayuiPageHelper page, @Param("obj") Object... objects);

    int dataCount(@Param("beans") T t, @Param("obj") Object... objects);

    T findOne(@Param("beans") T t);

}
