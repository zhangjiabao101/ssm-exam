package com.aaa.controller;

import com.aaa.entity.DO.Student;
import com.aaa.service.StudentService;
import com.aaa.util.LayuiPageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 张家宝
 * @date 2020-07-11
 */
@Controller
@RequestMapping("/student")
public class StudentController extends BaseController {
    @Autowired
    public StudentController(StudentService studentService) {
        init(studentService);
    }

    @RequestMapping("/findAll")
    public ModelAndView findAll(Student student, LayuiPageHelper page) {
        return super.findPage(page, student);
    }

    @RequestMapping("/add")
    public ModelAndView add(Student student) {
        return super.add(student);
    }

    @RequestMapping("/delete")
    public ModelAndView delete(Student student) {
        return super.delete(student);
    }

    @RequestMapping("/findOne")
    public ModelAndView findOne(Student student) {
        return super.findOne(student);
    }

    @RequestMapping("/update")
    public ModelAndView update(Student student) {
        return super.update(student);
    }
}
