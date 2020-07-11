package com.aaa.controller;

import com.aaa.entity.DTO.StudentAndGrade;
import com.aaa.service.StudentAndGradeService;
import com.aaa.util.LayuiPageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 张家宝
 * @date 2020-07-03
 */
@Controller
@RequestMapping("/sag")
public class StudentAndGradeController extends BaseController {

    @Autowired
    public StudentAndGradeController(StudentAndGradeService service) {
        init(service);
    }

    @RequestMapping("/findAll")
    public ModelAndView findAll(StudentAndGrade student, LayuiPageHelper page) {
        return super.findPage(page, student);
    }

    @RequestMapping("/add")
    public ModelAndView add(StudentAndGrade student) {
        return super.add(student);
    }

    @RequestMapping("/delete")
    public ModelAndView delete(StudentAndGrade student) {
        return super.delete(student);
    }

    @RequestMapping("/findOne")
    public ModelAndView findOne(StudentAndGrade student) {
        return super.findOne(student);
    }

    @RequestMapping("/update")
    public ModelAndView update(StudentAndGrade student) {
        return super.update(student);
    }

}
