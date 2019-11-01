<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/head.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>大耳朵图书馆系统-图书库</title>

    <style>
        td, #col-title th {
            text-align: center;
        }

        .book_limitNum {
            width: 23px;
            height: 23px;
        }

        .books_qiaozhi {
            float: right;
        }

        .book_beyond {
            position: relative;
            right: 500px;
            color: red;
            font-size: 1.5em;
        }

        .hrms_footer {
            position: relative;
            bottom: -130px;
        }

    </style>

</head>
<body>
<div class="hrms_main_ad col-sm-10">
    <div class="panel panel-success">
        <form method="get" action="/jsp/userbooklist.html">
            书的名称：<input name="userBookName" type="text" class="book_name">
            <span>
            书的类型：<select name="type" class="book_type">
            <option value="0">请选择</option>
            <option value="1">其它</option>
            <option value="2">名著</option>
            <option value="3">科技</option>
            <option value="4">小说</option>
            <option value="5">散文</option>
            <option value="6">文集</option>
        </select>
        </span>
            <span>
            <input type="hidden" id="pageIndex" name="pageIndex"/>
            <button class="link-update btn btn-success btn2">查询</button>
        </span>
        </form>
    </div>
    <div class="hrms_main_ad col-sm-13">
        <div class="panel panel-success">
            <%--            <form class="book_form" method="post" action="/jsp/borrowing.html">--%>
            <%--                <div class="book_tables">请选择借阅时限：--%>
            <%--                    <select class="book_limitLength" name="limitLength">--%>
            <%--                        <option value="10">10天</option>--%>
            <%--                        <option value="15">15天</option>--%>
            <%--                        <option value="30">30天</option>--%>
            <%--                    </select>--%>
            <%--                </div>--%>
            <%--            </form>--%>
            <span class="books_qiaozhi">
                        <span class="book_beyond">${beyondLimit}</span>
                        <span class="text-right">当前借阅量/借阅数:&nbsp;</span>
                        <span class="book_borrowNum">
             						<span class="book_borrowCount">${borrowCount}
                                    </span>/<input class="book_limitNum" value="5" name="limitNum"
                                                   readonly/></span></span>
        </div>
    </div>

    <div class="result-content">
        <table class="result-tab" width="100%">
            <tr id="col-title">
                <th>序号</th>
                <th>图书编码</th>
                <th>图书名称</th>
                <th>类型</th>
                <th>语言</th>
                <th>作者</th>
                <th>出版社</th>
                <th>出版日期</th>
                <th>当前量/库存量</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach varStatus="s" var="userBook" items="${userBookList}">
                <tr>
                    <td>${s.index+1}</td>
                    <td>${userBook.bookCode}</td>
                    <td>${userBook.bookName}</td>
                    <td>${userBook.typeName}</td>
                    <td>${userBook.language}</td>
                    <td>${userBook.author}</td>
                    <td>${userBook.press}</td>
                    <td><span><fmt:formatDate value="${userBook.pubTime}" pattern="yyyy-MM-dd"/></span>
                    </td>
                    <td class="book_number">${userBook.inventory}/${userBook.inventoryCopy}</td>
                    <td>
                        <a class="link-update btn btn-success btn2" href="/jsp/viewbook.html/${userBook.id}">查看</a>
                        <a class="link-update btn btn-success btn2"
                           href="/jsp/borrowing.html?bookId=${userBook.id}&limitNum=5&limitLength=10">借阅</a>
                    </td>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <%--<div class="book_page">
        <input type="hidden" id="totalPageCount" value="${page.pageAmount}"/>
        <c:import url="${pageContext.request.contextPath }/WEB-INF/jsp/rollpage.jsp">
            <c:param name="totalCount" value="${page.amount}"/>
            <c:param name="currentPageNo" value="${page.pageNo}"/>
            <c:param name="totalPageCount" value="${page.pageAmount}"/>
        </c:import>
    </div>--%>
</div>

<%--<div class="hrms_footer" style="text-align: center;">
    <address>
        <strong>Copyright&copy;大耳朵图书馆.Inc</strong><br>
        长安街1号<br>
        <abbr title="Phone">P:</abbr> (123) 010-88888888
    </address>
</div>--%>
</body>
</html>