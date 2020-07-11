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

<div class="layui-card">
    <div class="layui-form">
        <div class="layui-form-item">
            <div class="layui-inline" id="pageName"></div>
            <div class="layui-inline">
                <input type="text" id="entityName" placeholder="请输入内容" autocomplete="off"
                       class="layui-input">
            </div>
            <div class="layui-inline">
                <button class="layui-btn layui-btn-radius layui-btn-normal" id="entity_search">
                    <i class="layui-icon layui-icon-search"></i>
                </button>
            </div>
            <div class="layui-inline">
                <button class="layui-btn layui-btn-radius layui-btn-normal" onclick="windowOpen('form.jsp?url=/student/add')">添加</button>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-radius layui-btn-normal" href="../Grade/list.jsp">查看班级信息</a>
            </div>
        </div>
    </div>
    <div class="layui-card-body">
        <table id="datatable" lay-filter="datatable"></table>
    </div>
</div>

<script src="${pn}/static/layui/layui.js"></script>
<script type="text/html" id="table_bar">
    <div class="layui-btn-container">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </div>
</script>
<script type="text/javascript">

    layui.use(['table','util'], function () {
        var $ = layui.$,
            table = layui.table,
            util = layui.util;
        //第一个实例
        table.render({
            elem: '#datatable'
            , height: 400
            , url: '/sag/findAll' //数据接口
            , page: true //开启分页
            , limits:[3,5,10,20]
            , cols: [[ //表头
                {field: 'sId', title: 'ID', width: 80, sort: true, fixed: 'left'}
                , {field: 'sName', title: '学生姓名'}
                , {field: 'age', title: '年龄', sort: true}
                , {field: 'phone', title: '电话'}
                , {field: 'home', title: '所在城市'}
                , {field: 'gName', title: '班级名称'}
                , {
                    field: 'createDate', title: '班级创建日期',
                    templet: function (d) {
                        return util.toDateString(d.createDate, 'yyyy-MM-dd')
                    }
                }
                , {fixed: 'right', title: '操作', align: 'center', toolbar: '#table_bar'}
            ]]
            , where: {'sName': $("#entityName").val()}
        });
        //监听搜索
        $("#entity_search").on('click', function (data) {
                //执行重载
                table.reload('datatable', {
                    method: 'post'
                    , where: {'sName': $("#entityName").val()}
                    , page: {curr: 1}
                });
            }
        );

        //监听行工具事件
        table.on('tool(datatable)', function (obj) { //注：tool 是工具条事件名，zq_table 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            switch (layEvent) {
                case 'del':
                    layer.confirm('您确定删除id：' + data.sId + '的数据吗？', function (index) {
                        $.post("/student/delete", {sId: data.sId}, function (ret) {
                            layer.msg(ret.msg);
                            if (ret.status == 1) {//删除成功，刷新当前页表格
                                $("#entity_search").click();
                                layer.close(index);
                            }
                        });
                    });
                    break;
                case 'edit':
                    windowOpen("form.jsp?url=/student/update&sId="+data.sId);
                    break;
            }
        });
    });

    var windowsOpen={};//定义全局变量

    function windowOpen(url) {
        var l = (screen.availWidth - 375) / 2;
        var t = (screen.availHeight - 667) / 2;
        windowsOpen=window.open(url,'','height=500, width=600, top=' + t + ', left=' + l + ', toolbar=no, ' +
            'menubar=no, scrollbars=no, resizable=no,location=no, status=no');
    }
</script>

</body>
</html>