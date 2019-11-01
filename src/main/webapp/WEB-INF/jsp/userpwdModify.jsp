<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/head.jsp" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>大耳朵图书馆——修改密码</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <style>
        .layui-form-item .layui-input-company {
            width: 100px;
            padding-right: 10px;
            line-height: 38px;
        }
    </style>
    <style type=t"text/css"> td, #col-title th {
        text-align: center;
    }
    </style>
    <style>
        #passwordPosition {
            position: relative;
            top: -100px;
            left: 70px;

        }
        .pwd_success {
            color: red;
            font-size: 1.5em;
            position: relative;
            top:50px;
            right: -150px;
        }
        .hrms_footer{
            position: relative;
            bottom: -20px;
        }
        .main-wrap{
            position: relative;
            left: 100px;
        }
    </style>

</head>
<body>
<!-- 中心展示内容 -->
<div class="main-wrap">
    <div class="layuimini-container">
        <form method="post" action="/jsp/dopwdmodify.html">
            <div class="layuimini-main">
                <div id="passwordPosition" class="layui-form layuimini-form">
                    <div class="layui-form-item">
                        <label id="pwd_old" class="layui-form-label required">旧的密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" lay-verify="required" lay-reqtext="旧的密码不能为空"
                                   placeholder="请输入旧的密码" value="" class="layui-input">
                            <tip>填写自己账号的旧的密码。</tip>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label required">新的密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="newPassword" lay-verify="required" lay-reqtext="新的密码不能为空"
                                   placeholder="请输入新的密码" class="layui-input" minlength="6" maxlength="16">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label required">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="rnewPassword" lay-verify="required" lay-reqtext="新的密码不能为空"
                                   placeholder="请确认新的密码" class="layui-input"  minlength="6" maxlength="16">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="saveBtn" type="submit">确认修改</button>
                            <button type="reset" class="layui-btn">重置密码</button>
                        </div>
                        <div class="pwd_success">${success}</div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</div>
</div>
<div class="hrms_footer" style="text-align: center;">
    <address>
        <strong>Copyright&copy;大耳朵图书馆.Inc</strong><br>
        长安街1号<br>
        <abbr title="Phone">P:</abbr> (123) 010-88888888
    </address>
</div>
</body>
</html>
