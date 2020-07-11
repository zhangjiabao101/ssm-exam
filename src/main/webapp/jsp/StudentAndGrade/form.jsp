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
        <input type="hidden" id="sId" value="0"/>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学生姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="sName" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline">
                    <input type="number" min="10" max="80" id="age" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">所在城市</label>
                <div class="layui-input-inline">
                    <input type="text" id="home" lay-verify="required" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">班级名称</label>
            <div class="layui-input-inline">
                <select id="GradeId" lay-filter="GradeId">
                    <c:forEach items="${grades }" var="map">
                        <option value="${map.gId}"
                                selected="${student.GId==map.gId?'selected':''}">${map.gName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <input class="layui-btn layui-btn-radius layui-btn-normal" type="button" id="submit"
                   value="提交">
            <input class="layui-btn layui-btn-radius layui-btn-primary" type="button" id="reset"
                   onclick="self.close()" value="取消">
        </div>
    </div>
</div>
<script src="${pn}/static/layui/layui.js"></script>
<script src="${pn}/static/jquery-1.8.3.min.js"></script>
<script>
    //获取参数id
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

    const elemUrl = getQueryVariable('url')

    //下拉框初始化
    $.ajax({
        url: '/grade/findAll',
        type: 'get',
        dataType: 'json',
        data: {"page": 1, "limit": 1000000},
        async: false,//设置阻断
        success: function (data) {
            //将下拉框中添加数据
            var modelList = data.data;
            console.log(modelList)
            if (modelList && modelList.length != 0) {
                for (var i = 0; i < modelList.length; i++) {
                    var option = "<option value=\"" + modelList[i].gId + "\"";
                    option += ">" + modelList[i].gName + "</option>";  //动态添加数据
                    $('#GradeId').append(option);
                }
            }
        }
    })

    if (elemUrl.indexOf("update") != -1) {
        $.ajax({
            url: "/student/findOne",
            type: 'post',
            dataType: 'json',
            async: false,//设置阻断
            data: {
                "sId": getQueryVariable('sId'),
            },
            success: function (data) {
                $("#sId").val(data.data.sId);
                $("#sName").val(data.data.sName)
                $("#home").val(data.data.home)
                $("#phone").val(data.data.phone)
                $("#age").val(data.data.age)
                $("#GradeId").find("option[value=" + data.data.gId + "]").prop("selected", true);

            }
        });
    }

    layui.use(['layer','form'], function () {
        const $ = layui.$,
            layer = layui.layer,
            form = layui.form;

        //监听提交
        $("#submit").on('click', function (data) {
            $.ajax({
                url: elemUrl,
                type: 'post',
                dataType: 'json',
                async: false,//设置阻断
                data: {
                    "sName": $("#sName").val(),
                    "sId": $("#sId").val(),
                    "home": $("#home").val(),
                    "phone": $("#phone").val(),
                    "age": $("#age").val(),
                    "gId": $("#GradeId").val()
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