<%@ page language="java" contentType="text/html; ISO-8859-1;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆系统</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap.min.css" >
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap-theme.min.css" >
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/bootstrap-admin-theme.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/static/css/style.css">

    <script type="application/javascript" src="${pageContext.request.contextPath }/static/js/bootstrap.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript" src="${pageContext.request.contextPath }/static/js/login.js"></script>

    <style>
        .sub-container {
            background: url("static/images/login0.jpg") no-repeat;
            background-size: 1550px 720px;
            overflow: hidden;
        }
    </style>
</head>
<body class="bootstrap-admin-without-padding">
<div class="sub-container">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div id="first" class="alert alert-info">
                    欢迎登录大耳朵图书馆系统
                </div>
                <form class="bootstrap-admin-login-form" method="post" action="/login.html">
                    <div class="info">${error}</div>
                    <div class="form-group">
                        <label class="control-label" for="userCode">账&nbsp;号</label> <input
                            type="text" class="form-control" id="userCode" name="userCode"
                            placeholder="请输入账号"/> <label
                            class="control-label" for="userCode" style="display: none;"></label>
                    </div>
                    <div class="form-group">
                        <label class="control-label" for="password">密&nbsp;码</label> <input
                            type="password" class="form-control" id="password"
                            name="password" placeholder="请输入密码"/> <label
                            class="control-label" for="userCode" style="display: none;"></label>
                    </div>
                    <div>
                        <label>
                            <input type="radio" name="userType" value="0" checked/>普通用户
                        </label>
                        <label class="man">
                            <input type="radio" name="userType" value="99"/>管理员
                        </label>
                    </div>
                    <br/>
                    <label class="control-label" for="password">没有账号请<a
                            href="/jsp/register.html" style="color: blue;">注册</a>
                    </label> <br>
                    <input id="login_submit" type="submit" class="btn btn-lg btn-primary"
                           value="登&nbsp;&nbsp;&nbsp;&nbsp;录"/>
                    <input id="res" type="reset" class="btn btn-lg btn-primary"
                           value="重&nbsp;&nbsp;&nbsp;&nbsp;置"/>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
