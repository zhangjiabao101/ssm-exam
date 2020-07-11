<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setAttribute("pn", pageContext.getServletContext().getContextPath());%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>表单数据</title>
    <link rel="stylesheet" href="${pn}/static/layui/css/layui.css">
</head>
<body>

<div class="layui-card">
    <div class="layui-form">
        <input type="hidden" id="gId" value="0"/>
        <div class="layui-form-item">
            <label class="layui-form-label">班级名称</label>
            <div class="layui-input-inline">
                <input type="text" id="gName" lay-verify="required" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">教室</label>
                <div class="layui-input-block">
                    <input type="text" id="address" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">创建日期</label>
                <div class="layui-input-block">
                    <input type="datetime-local" id="createDate" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <input class="layui-btn layui-btn-radius layui-btn-normal" type="button" id="submit"
                   value="添加">
            <input class="layui-btn layui-btn-radius layui-btn-primary" type="button" id="reset"
                   onclick="closeSelf()" value="取消">
        </div>
    </div>
</div>
<script src="${pn}/static/layui/layui.js" charset="UTF-8"></script>
<script src="${pn}/static/jquery-1.8.3.min.js" charset="UTF-8"></script>
<script>
    //获取URL中的参数id
    function getQueryVariable(variable) {
        const query = window.location.search.substring(1);
        const vars = query.split("&");
        for (var i = 0; i < vars.length; i++) {
            var pair = vars[i].split("=");
            if (pair[0] == variable) {
                return pair[1];
            }
        }
        return (false);
    }
    //获取当前URL中的提交链接
    const elemUrl = getQueryVariable('url')
    //判断是否需要修改链接，若是修改链接则向后台请求当前数据详情
    if(elemUrl.indexOf("update") != -1){
        $.ajax({
            url: "/grade/findOne",
            type: 'post',
            dataType: 'json',
            async: false,//设置阻断
            data: {
                "gId": getQueryVariable('gId'),
            },
            success: function (data) {
                $("#gId").val(data.data.gId);
                $("#gName").val(data.data.gName)
                $("#address").val(data.data.address)
                $("#createDate").val(data.data.createDate)
            }
        });
    }

    layui.use(['layer','form'], function () {
        var $ = layui.$,
            form = layui.form,
            layer = layui.layer;

        //监听提交
        $("#submit").on('click', function (data) {
            $.ajax({
                url: elemUrl,
                type: 'post',
                dataType: 'json',
                async: false,//设置阻断
                data: {
                    "gId":$("#gId").val(),
                    "gName": $("#gName").val(),
                    "address": $("#address").val(),
                    "createDate": $("#createDate").val()
                },
                success: function (data) {
                    layer.msg(data.msg);
                    //父窗口刷新
                    window.opener.location.reload();
                    //关闭当前窗口
                    window.close()
                }
            });
        });
    })
</script>
</body>
</html>