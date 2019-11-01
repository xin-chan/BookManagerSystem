<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/managerHead.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆——查看用户</title>
    <style>
        .add_code {
            color: black;
            font-family: "仿宋";
            font-size: 25px;
            text-align: justify;
            padding: 15px;
            position: relative;
            right: -200px;
        }

        .add_codeve {
            padding: 8px;
            position: relative;
            right: -305px;
            top: -20px;
            background: #3498db;
            color: #4476A7;
            background: #F3F3F3;
            border: 3px black solid;
            border-radius: 10px;
            font-weight: bold;
            font-size: 12pt;
            outline: none;
            font-family: "黑体";
            text-align: center;
        }
        .add_codeve th {
            text-align: center;
            border: 2px solid black;
            font-size: 1.5em;
            font-family: 微软雅黑;
            background-color: #c0a16b;
            height: 20px;
        }

        .add_codeve td{
            border: 1px solid black;
            padding: 10px;
            font-size: 1.2em;
            line-height: 20px;
        }

        .view_u {
            font-family: "微软雅黑";
        }
        .view_m{
            margin-top: 20px;
            padding: 15px;
            position: relative;
            right: -250px;
            font-size: 1.2em;
            color: red;
        }
    </style>
</head>
<body>
<div class="main-wrap">
    <div class="crumb-wrap">
        <div class="crumb-list"><i class="icon-font"></i><a href="/jsp/first.html">首页</a><span
                class="crumb-step">&gt;</span><span class="crumb-name">查看用户</span></div>
    </div>
    <div class="search-wrap">
        <div class="search-content">
            <div class="add_code">
                <label>姓名:
                    <span class="view_u">${users.userName}</span>
                </label>
            </div>
            <div class="add_code">
                <label>性别:
                    <span class="view_u">
                    <c:if test="${users.gender==0}">保密</c:if>
                    <c:if test="${users.gender==1}">男</c:if>
                    <c:if test="${users.gender==2}">女</c:if>
                    </span>
                </label>
            </div>
            <div class="add_code">
                <label>年龄:
                    <span class="view_u">${users.age}</span>
                </label>
            </div>
            <div class="add_code">
                <label>电话:
                    <span class="view_u">${users.phone}</span>
                </label>
            </div>

            <c:if test="${message!=null}">
                <div class="add_code">
                    用户书籍借阅信息：
                    <div class="view_m">
                            ${message}
                    </div>
                </div>
            </c:if>
            <c:if test="${message==''}">
                <table class="add_codeve">
                    <thead>
                    <tr>
                        <th>书籍编码</th>
                        <th>书籍名称</th>
                        <th>借阅时间</th>
                        <th>归还时间</th>
                        <th>归还状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="returns" items="${returnVo}" varStatus="s">
                        <tr>
                            <td>${returns.bookCode}</td>
                            <td>${returns.bookName}</td>
                            <td><fmt:formatDate value="${returns.borrowTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td><fmt:formatDate value="${returns.actualTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>
                                    <c:if test="${returns.overStatus==1}">未超时</c:if>
                                    <c:if test="${returns.overStatus==2}">超时</c:if>
                                    <c:if test="${returns.overStatus==3}">未归还</c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>

