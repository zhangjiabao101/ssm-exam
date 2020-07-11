<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setAttribute("pn", pageContext.getServletContext().getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>展示信息</title>
    <link rel="stylesheet" href="${pn}/static/layui/css/layui.css">
</head>
<body>
<!-- layui-card 包括整个页面 -->
<div class="layui-card">
    <!-- 表头搜索部分 -->
    <div class="layui-form">
        <div class="layui-form-item">
            <!-- 文本输入框，用于模糊查询 -->
            <div class="layui-inline">
                <input type="text" id="entityName" placeholder="请输入内容" autocomplete="off"
                       class="layui-input">
            </div>
            <!-- 搜索按钮 -->
            <div class="layui-inline">
                <button class="layui-btn layui-btn-radius layui-btn-normal" id="entity_search">
                    <i class="layui-icon layui-icon-search"></i>
                </button>
            </div>
            <!-- 新增按钮 -->
            <div class="layui-inline">
                <button class="layui-btn layui-btn-radius layui-btn-normal"
                        onclick="windowOpen('form.jsp?url=/grade/add')">添加
                </button>
            </div>
            <!-- 查看学生信息列表 -->
            <div class="layui-inline">
                <a class="layui-btn layui-btn-radius layui-btn-normal" href="../StudentAndGrade/list.jsp">查看学生信息</a>
            </div>
        </div>
    </div>
    <!-- table部分 -->
    <div class="layui-card-body">
        <table id="datatable" lay-filter="datatable"></table>
    </div>
</div>

<script src="${pn}/static/layui/layui.js"></script>
<!-- table表格尾部的按钮元素 -->
<script type="text/html" id="table_bar">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </div>
</script>
<script type="text/javascript">
    // layui 部分
    layui.use(['table', 'util'], function () {
        var $ = layui.$,
            table = layui.table,
            util = layui.util;
        //表格配置
        table.render({
            elem: '#datatable'
            , height: 400
            , url: '/grade/findAll' //数据接口
            , page: true //开启分页
            , limits: [3, 5, 10, 20]
            , cols: [[ //表头
                {field: 'gId', title: 'ID', width: 80, fixed: 'left'}
                , {field: 'gName', title: '班级名称'}
                , {field: 'address', title: '教室'}
                , {
                    field: 'createDate', title: '班级创建日期',
                    templet: function (d) {
                        return util.toDateString(d.createDate, 'yyyy-MM-dd HH:mm:ss')
                    }
                }
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#table_bar'}
            ]]
            , where: {'gName': $("#entityName").val()}
        });

        //监听搜索按钮
        $("#entity_search").on('click', function (data) {
            //刷新表格中的内容
            table.reload('datatable', {
                method: 'post'
                , where: {'gName': $("#entityName").val()}
                , page: {curr: 1}
            });
        });

        //监听行工具事件
        table.on('tool(datatable)', function (obj) { //注：tool 是工具条事件名，zq_table 是 table 原始容器的属性 lay-filter="对应的值"
            const data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            const tr = obj.tr; //获得当前行 tr 的DOM对象
            switch (layEvent) {
                case 'del':
                    layer.confirm('您确定删除id：' + data.gId + '的数据吗？', function (index) {
                        $.post("/grade/delete", {gId: data.gId}, function (ret) {
                            layer.msg(ret.msg);
                            if (ret.status == 1) {//删除成功，刷新当前页表格
                                $("#entity_search").click();
                                layer.close(index);
                            }
                        });
                    });
                    break;
                case 'edit':
                    windowOpen("form.jsp?url=/grade/update&gId=" + data.gId);
                    break;
            }
        });
    });


    var windowsOpen = {};//定义全局变量

    //开启一个窗口
    function windowOpen(url) {
        const l = (screen.availWidth - 375) / 2;
        const t = (screen.availHeight - 667) / 2;
        windowsOpen = window.open(url, '', 'height=500, width=600, top=' + t + ', left=' + l + ', toolbar=no, ' +
            'menubar=no, scrollbars=no, resizable=no,location=no, status=no');
    }
</script>

</body>
</html>