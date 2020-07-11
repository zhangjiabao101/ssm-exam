package com.aaa.service;

import com.aaa.entity.DTO.StudentAndGrade;
import com.aaa.mapper.BaseMapper;
import com.aaa.mapper.StudentAndGradeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 张家宝
 * @date 2020-07-03
 */
@Service
public class StudentAndGradeService extends BaseService<StudentAndGrade> {
    @Autowired StudentAndGradeMapper mapper;

    @Override
    public BaseMapper<StudentAndGrade> getDao() {
        return mapper;
    }

}
