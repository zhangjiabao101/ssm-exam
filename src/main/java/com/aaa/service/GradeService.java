package com.aaa.service;

import com.aaa.entity.DO.Grade;
import com.aaa.mapper.BaseMapper;
import com.aaa.mapper.GradeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 张家宝
 * @date 2020-07-04
 */
@Service
public class GradeService extends BaseService<Grade> {

    @Autowired GradeMapper mapper;
    @Override
    public BaseMapper<Grade> getDao() {
        return mapper;
    }

}
