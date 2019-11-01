<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="common/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>大耳朵图书馆系统——借阅列表</title>
    <style>
        p {
            color: black;
            font-family: 微软雅黑;
            font-size: 1.2em;
        }

        .col-title th {
            text-align: center;
            font-size: 1.2em;
        }

        table td {
            text-align: center;
            font-size: 1.2em;
        }
        .return_table{
            margin-top: 50px;
        }
    </style>
</head>
<body>
<!-- 中心展示内容 -->
<div class="hrms_main_ad col-sm-10">
    <div class="panel panel-success">
        <div class="search-wrap">
            <div class="search-content">
                <p>已借阅图书</p>
                <div class="result-content">
                    <table class="result-tab" style="margin-top: 20px;" width="100%">
                        <thead>
                        <tr class="col-title">
                            <th><b>序号</b></th>
                            <th><b>图书编号</b></th>
                            <th><b>图书名称</b></th>
                            <th><b>作&nbsp;&nbsp;&nbsp;&nbsp;者</b></th>
                            <th><b>借阅时间</b></th>
                            <th><b>应当归还时间</b></th>
                            <th><b>剩余时间</b></th>
                            <th><b>操&nbsp;&nbsp;&nbsp;&nbsp;作</b></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${borrowList}" var="book" varStatus="s">
                            <tr class="col-data">
                                <td>${s.index+1}</td>
                                <td>${book.bookCode}</td>
                                <td>《${book.bookName}》</td>
                                <td>${book.author}</td>
                                <td><fmt:formatDate value="${book.borrowTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><fmt:formatDate value="${book.returnTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${book.remainTime}</td>
                                <td>
                                    <a class="link-update btn btn-success btn2"
                                       href="/jsp/returnbook.html?borrowId=${book.id}
                                    &bookId=${book.bookId}&returnTime=${book.returnTime}&borrowTime=${book.borrowTime}&bookCode=${book.bookCode}&bookName=${book.bookName}">
                                        归还
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <hr/>
                    <div class="return_table">
                        <p>已归还图书</p>
                        <table class="result-tab" style="margin-top: 20px;" width="100%">
                            <thead>
                            <tr class="col-title">
                                <th>序号</th>
                                <th>书籍编码</th>
                                <th>书籍名称</th>
                                <th>借阅时间</th>
                                <th>实际归还时间</th>
                                <th>归还状态</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="returns" items="${returnList}" varStatus="s">
                                <tr>
                                    <td>${s.index+1}</td>
                                    <td>${returns.bookCode}</td>
                                    <td>${returns.bookName}</td>
                                    <td><fmt:formatDate value="${returns.borrowTime}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td><fmt:formatDate value="${returns.actualTime}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                        <c:if test="${returns.overStatus==1}">未超时</c:if>
                                        <c:if test="${returns.overStatus==2}">超时</c:if>
                                        <c:if test="${returns.overStatus==3}">未归还</c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
<%--                    <div class="list-page">--%>
<%--                        <c:set var="params" value="${type=='search'?queryParams:''}">--%>
<%--                        </c:set>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        $(".glyphicon glyphicon-search").click(function (e) {--%>
<%--            window.open("")--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>

