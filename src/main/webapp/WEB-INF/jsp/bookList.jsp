<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/managerHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆——图书管理页面</title>
    <style>
        .man_search{
            position: relative;
            right: -150px;
        }
        .man_bookName{
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
        .common-text2 {
            height: 23px;
            line-height: 23px;
            padding: 2px 4px;
            border: 1px solid #ccc;
            background: #fff;
            border-radius: 5px;
            position: relative;
            right: -100px;
        }
        .man_class{
            position: relative;
            right: -100px;
        }
        .result-list{
            float: right;
        }
        .man_td{
            text-align: center;
        }
        #col-title th{
            text-align: center;
        }
    </style>
</head>
<body>
<!--/sidebar-->
<div class="main-wrap">

    <div class="crumb-wrap">
        <div class="crumb-list"><i class="icon-font"></i><a href="/jsp/first.html">首页</a><span
                class="crumb-step">&gt;</span><span class="crumb-name">图书管理</span></div>
    </div>
    <div class="search-wrap">
        <!--用于查询得表单-->
        <div class="search-content">
            <form method="get" action="/jsp/booklist.html" id="searchForm">
                <div class="search-tab">
                    <label class="man_bookName">
                        书名:
                        <input class="common-text1" name="bookName" id="bookname" style="width:150px">
                    </label>
                    <label class="man_class">
                    选择分类:
                    </label>
                    <select name="type" class="common-text2" id="cateId">
                        <option value="0">请选择</option>
                        <option value="1">其它</option>
                        <option value="2">名著</option>
                        <option value="3">科技</option>
                        <option value="4">小说</option>
                        <option value="5">散文</option>
                        <option value="6">文集</option>
                    </select>
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
                <a href="/jsp/addbook.html"><i class="icon-font"></i>添加书籍</a>
            </div>
        </div>
        <div class="result-content">
            <table class="result-tab" width="100%">
                <thead>
                <tr id="col-title">
<%--                    <th class="tc" width="5%"><input id="allChoose" name="" type="checkbox"></th>--%>
                    <th>图书编码</th>
                    <th>名称</th>
                    <th>类型</th>
                    <th>语言</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>出版时间</th>
                    <th>创建人</th>
                    <th>创建时间</th>
                    <th>修改人</th>
                    <th>修改时间</th>
                    <th>当前量/库存量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${bookList}">
                    <tr class="man_td">
<%--                        <td class="tc"><input name="ids[]" value="${book.id}" type="checkbox" class="singleChoose"></td>--%>
                        <td>${book.bookCode}</td>
                        <td>${book.bookName}</td>
                        <td>${book.typeName}</td>
                        <td>${book.language}</td>
                        <td>${book.author}</td>
                        <td>${book.press}</td>
                        <td><span><fmt:formatDate value="${book.pubTime}" pattern="yyyy-MM-dd"/></span></td>
                        <td>${book.createBy}</td>
                        <td><span><fmt:formatDate value="${book.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
                        <td>${book.modifyBy}</td>
                        <td><span><fmt:formatDate value="${book.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></td>
                        <td>${book.inventory}/${book.inventoryCopy}</td>
                        <td align="center">
                            <a class="link-update btn btn-success btn2" href="/jsp/viewbook.html/${book.id}">查看</a>
                            <a class="link-update btn btn-warning btn2" href="/jsp/updatebook.html/${book.id}">修改</a>
                            <a class="link-del btn btn-danger btn2" onclick="if(confirm('确定删除?')==false)return false;" href="/jsp/deletebook.html?bookId=${book.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
                <div>
                <input type="hidden" id="totalPageCount" value="${pageInfo.pageAmount}"/>
                <c:import url="${pageContext.request.contextPath }/WEB-INF/jsp/rollpage.jsp">
                    <c:param name="totalCount" value="${pageInfo.amount}"/>
                    <c:param name="currentPageNo" value="${pageInfo.pageNo}"/>
                    <c:param name="totalPageCount" value="${pageInfo.pageAmount}"/>
                </c:import>
                </div>
    </div>
</div>
</body>
</html>
