<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/managerHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆——用户管理</title>
    <style>
        .man_search {
            position: relative;
            right: -100px;
        }

        .man_bookName {
            position: relative;
            right: -30px;
        }

        .common-text1 {
            height: 23px;
            line-height: 23px;
            padding: 2px 4px;
            border: 1px solid #ccc;
            background: #fff;
            border-radius: 5px;
            position: relative;
            right: -30px;
        }

        .result-list {
            float: right;
        }
        tbody{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="main-wrap">

    <div class="crumb-wrap">
        <div class="crumb-list"><i class="icon-font"></i><a href="/jsp/first.html">首页</a><span
                class="crumb-step">&gt;</span><span class="crumb-name">用户列表</span></div>
    </div>
    <div class="search-wrap">
        <!--用于查询得表单-->
        <div class="search-content">
            <form method="get" action="/jsp/userlist.html" id="searchForm">
                <div class="search-tab">
                    <label class="man_bookName">
                        姓名:
                        <input class="common-text1" name="userName" placeholder="请输入用户姓名" id="bookname"
                               style="width:150px">
                    </label>
                    <span class="man_search">
                        <input type="hidden" id="pageIndex" name="pageIndex"/>
                         <button class="btn btn-primary btn2" style="padding-left:10px">查询</button>
                    </span>
                </div>
            </form>
        </div>
    </div>
    <div class="result-wrap">
        <div class="result-title">
            <div class="result-list">

        </div>
        <div class="result-content">
            <table class="result-tab" width="100%">
                <thead>
                <tr id="col-title">
                    <th class="tc" width="5%"><input id="allChoose" name="" type="checkbox"></th>
                    <th style="text-align: center;">序号</th>
                    <th style="text-align: center;">用户名</th>
                    <th style="text-align: center;">姓名</th>
                    <th style="text-align: center;">性别</th>
                    <th style="text-align: center;">生日</th>
                    <th style="text-align: center;">邮箱</th>
                    <th style="text-align: center;">手机号</th>
                    <th style="text-align: center;">证件类型</th>
                    <th style="text-align: center;">身份证号</th>
                    <th style="text-align: center;">用户类型</th>
                    <th style="text-align: center;">注册日期</th>
                    <th style="text-align: center;">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}" varStatus="s">
                    <tr>
                        <td class="tc"><input name="ids[]" value="${user.id}" type="checkbox" class="singleChoose"></td>
                        <td>${s.index+1}</td>
                        <td>${user.userCode}</td>
                        <td>${user.userName}</td>
                        <td>
                            <c:if test="${user.gender==0}">保密</c:if>
                            <c:if test="${user.gender==1}">男</c:if>
                            <c:if test="${user.gender==2}">女</c:if>
                        </td>
                        <td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                        <td>
                            <c:if test="${user.idType==0}">中国-大陆</c:if>
                            <c:if test="${user.idType==1}">中国-港澳台</c:if>
                            <c:if test="${user.idType==2}">军人证</c:if>
                            <c:if test="${user.idType==3}">国外证件</c:if>
                        </td>
                        <td>${user.idCard}</td>
                        <td>
                            <c:if test="${user.userType==99}">管理员</c:if>
                            <c:if test="${user.userType==0}">普通用户</c:if>
                        </td>
                        <td><fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td align="center">
                            <a title="用户借阅信息" class="link-update btn btn-success btn2" href="/jsp/viewuser.html?userId=${user.id}">查看</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <input type="hidden" id="totalPageCount" value="${page.pageAmount}"/>
            <c:import url="${pageContext.request.contextPath }/WEB-INF/jsp/rollpage.jsp">
                <c:param name="totalCount" value="${page.amount}"/>
                <c:param name="currentPageNo" value="${page.pageNo}"/>
                <c:param name="totalPageCount" value="${page.pageAmount}"/>
            </c:import>
        </div>
    </div>
</div>
</body>
</html>
