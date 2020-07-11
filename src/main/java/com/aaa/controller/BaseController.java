package com.aaa.controller;

import com.aaa.service.BaseService;
import com.aaa.util.LayuiPageHelper;
import com.alibaba.fastjson.support.spring.FastJsonJsonView;
import org.springframework.web.servlet.ModelAndView;

/**
 * 对于layui的Controller层模板<br>
 * code：layui接收的唯一验证<br>
 * status：用于业务判断<br>
 * msg：向页面发送信息<br>
 * icon：页面图标<br>
 * data: 传输数据<br>
 * @author 淮南King
 */
public class BaseController {

    private BaseService service = null;

    public void init(BaseService service) {
        this.service = service;
    }

    /**
     * 添加模板
     * 传入继承BaseService的类
     *
     * @param entity 传入实体类
     * @param <T>
     * @return
     */
    public <T> ModelAndView add(T entity) {
        // 创建一个用于格式化json数据的对象，方便向前台发送json数据
        FastJsonJsonView view = new FastJsonJsonView();
        // 进行持久层操作
        int status = service.insert(entity);
        // 向view对象中添加数据
        view.addStaticAttribute("code", 0);
        if (status > 0) {
            view.addStaticAttribute("status", status);
            view.addStaticAttribute("icon", 1);
            view.addStaticAttribute("msg", "添加成功");
        } else {
            view.addStaticAttribute("status", status);
            view.addStaticAttribute("icon", 2);
            view.addStaticAttribute("msg", "添加失败");
        }
        // 返回json数据
        return new ModelAndView(view);
    }

    /**
     * 修改模板
     *
     * @param entity
     * @param <T>
     * @return
     */
    public <T> ModelAndView update(T entity) {
        // 创建一个用于格式化json数据的对象，方便向前台发送json数据
        FastJsonJsonView view = new FastJsonJsonView();
        // 进行持久层操作
        int status = service.update(entity);
        // 向view对象中添加数据
        view.addStaticAttribute("code", 0);
        if (status > 0) {
            view.addStaticAttribute("status", status);
            view.addStaticAttribute("icon", 1);
            view.addStaticAttribute("msg", "修改成功");
        } else {
            view.addStaticAttribute("status", status);
            view.addStaticAttribute("icon", 2);
            view.addStaticAttribute("msg", "修改失败");
        }

        // 返回json数据
        return new ModelAndView(view);
    }

    /**
     * 删除模板
     *
     * @param entity
     * @param <T>
     * @return
     */
    public <T> ModelAndView delete(T entity) {
        // 创建一个用于格式化json数据的对象，方便向前台发送json数据
        FastJsonJsonView view = new FastJsonJsonView();
        // 进行持久层操作
        int status = 0;
        // 规避删除时一对多时删除父表内容时删除失败
        try {
            status = service.delete(entity);
        } catch (Exception e) {
            status = 0;
        }
        // 向view对象中添加数据
        view.addStaticAttribute("code", 0);
        if (status > 0) {
            view.addStaticAttribute("status", status);
            view.addStaticAttribute("icon", 1);
            view.addStaticAttribute("msg", "删除成功！");
        } else {
            view.addStaticAttribute("status", status);
            view.addStaticAttribute("icon", 2);
            view.addStaticAttribute("msg", "删除失败！");
        }
        // 返回json数据
        return new ModelAndView(view);
    }

    /**
     * 查询一条数据
     *
     * @param entity
     * @param <T>
     * @return
     */
    public <T> ModelAndView findOne(T entity) {
        // 去查询
        Object one = service.findOne(entity);
        // 创建一个用于格式化json数据的对象，方便向前台发送json数据
        FastJsonJsonView view = new FastJsonJsonView();
        // 向view对象中添加数据
        view.addStaticAttribute("code", 0);
        view.addStaticAttribute("status", 1);
        view.addStaticAttribute("data", one);
        // 返回json数据
        return new ModelAndView(view);
    }

    /**
     * 分页查询方法
     *
     * @param page
     * @param entity
     * @param objects
     * @param <T>
     * @return
     */
    public <T> ModelAndView findPage(LayuiPageHelper page, T entity, Object... objects) {
        // 创建一个用于格式化json数据的对象，方便向前台发送json数据
        FastJsonJsonView view = new FastJsonJsonView();
        // 创建pageHelper对象，用于分页
        LayuiPageHelper pages = new LayuiPageHelper();
        // 从数据库查询总数
        pages.setCount(service.dataCount(entity, objects));
        // 设置当前页
        pages.setPageNow(page.getPageNow() == 0 ? 1 : Integer.valueOf(page.getPageNow()));
        // 设置页大小
        pages.setPageSize(page.getPageSize() == 0 ? 5 : Integer.valueOf(page.getPageSize()));
        // 向view对象中添加数据
        view.addStaticAttribute("code", 0);
        view.addStaticAttribute("message", "查询成功");
        view.addStaticAttribute("count", pages.getCount());
        // -----------------------------------从数据查询数据信息
        view.addStaticAttribute("data", service.findPage(entity, pages, objects));
        // 返回json数据
        return new ModelAndView(view);
    }

}
