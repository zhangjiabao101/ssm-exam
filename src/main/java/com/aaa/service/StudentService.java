package com.aaa.service;

import com.aaa.entity.DO.Student;
import com.aaa.mapper.BaseMapper;
import com.aaa.mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 张家宝
 * @date 2020-07-11
 */
@Service
public class StudentService extends BaseService<Student> {

    @Autowired StudentMapper mapper;

    @Override
    public BaseMapper<Student> getDao() {
        return mapper;
    }
}
