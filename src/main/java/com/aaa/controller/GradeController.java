package com.aaa.controller;

import com.aaa.entity.DO.Grade;
import com.aaa.service.GradeService;
import com.aaa.util.LayuiPageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 张家宝
 * @date 2020-07-04
 */
@Controller
@RequestMapping("/grade")
public class GradeController extends BaseController {

    @Autowired
    public GradeController(GradeService service) {
        init(service);
    }

    @RequestMapping("/findAll")
    public ModelAndView findAll(Grade grade, LayuiPageHelper page){
        return findPage(page,grade);
    }

    @RequestMapping("/add")
    public ModelAndView add(Grade grade){
        return super.add(grade);
    }
    @RequestMapping("/delete")
    public ModelAndView delete(Grade grade){
        return super.delete(grade);
    }

    @RequestMapping("/findOne")
    public ModelAndView findOne(Grade grade){
       return super.findOne(grade);
    }

    @RequestMapping("/update")
    public ModelAndView update(Grade grade){
        return super.update(grade);
    }
}
