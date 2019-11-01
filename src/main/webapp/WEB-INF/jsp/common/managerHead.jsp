<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆管理系统</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/main.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/pagination.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/lib/layui-v2.5.4/css/modules/layer/default/layer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/lib/layui-v2.5.4/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/public.css" media="all">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/style.css">

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/libs/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/layer.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/dateFormat.js"></script>
    <style>
        .layui-form-item .layui-input-company {width: 100px;padding-right: 10px;line-height: 38px;}
    </style>
    <style type=t"text/css"> td,#col-title th{text-align: center;}
        .userSession{
            font-size: 1.2em;
            font-family: "楷体";
        }
    </style>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a href="/jsp/first.html" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li>欢迎管理员&nbsp;<span class="userSession">${userSession.userName}</span></li>
                <li><a href="/logout.html">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <ul class="sidebar-list">
                        <li><a href="/jsp/userlist.html">用户列表</a></li>
                        <li><a href="/jsp/booklist.html">图书列表</a></li>
                        <li><a href="/jsp/pwdmodify.html">修改密码</a></li>
                        <li><a href="/logout.html">退出</a></li>
                    </ul>
                </li>
            </ul>
            </li>
            </ul>
        </div>
    </div>
    <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
    <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>
</body>
</html>
