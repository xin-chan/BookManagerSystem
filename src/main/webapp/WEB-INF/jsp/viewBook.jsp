<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/managerHead.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆——查看图书</title>
    <style>
        .add_code{
            color: black;
            font-family: "楷体";
            font-size: 25px;
            text-align:justify;
            padding: 15px;
            position:relative;
            right: -300px;
        }
        .add_codee{
            color: black;
            font-family: "楷体";
            font-size: 25px;
            text-align:justify;
            position:relative;
            right: -312px;
        }

        .add_codevv{
            border: 2px solid cornflowerblue;
            padding:10px;
            margin:20px;
            font-size: 0.8em;
            width:700px;
            text-indent: 2em;
        }
        body{
            overflow: hidden;
        }
    </style>
</head>
<body>
<div class="main-wrap">
    <div class="crumb-wrap">
        <div class="crumb-list"><i class="icon-font"></i><a href="/jsp/first.html">首页</a><span
                class="crumb-step">&gt;</span><span class="crumb-name">查看图书</span></div>
    </div>
    <div class="search-wrap">
        <div class="search-content">
            <div class="add_code">
                <label>书的编码:
                    <span>${bookView.bookCode}</span>
                </label>
            </div>
            <div class="add_code">
                <label>书的名称:
                    <span>${bookView.bookName}</span>
                </label>
            </div>
            <div class="add_code">
                <label>作&nbsp&nbsp&nbsp&nbsp者:
                    <span>${bookView.author}</span>
                </label>
            </div>
            <div class="add_code">
                <label>出&nbsp版&nbsp社:
                    <span>${bookView.press}</span>
                </label>
            </div>
            <div class="add_code">
                <label>出版时间:
                    <span><fmt:formatDate value="${bookView.pubTime}" pattern="yyyy-MM-dd"/></span>
                </label>
            </div>
            <div class="add_codee">
                <label>简&nbsp&nbsp&nbsp&nbsp介：
                    <p><div class="add_codevv" t="">${bookView.introduction}</div></p>
                </label>
            </div>
        </div>
    </div>
</div>
</body>
</html>
