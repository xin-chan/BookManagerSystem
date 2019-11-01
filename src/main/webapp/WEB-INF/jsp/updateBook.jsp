<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/managerHead.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆——修改图书界面</title>
    <script>
        function update(){
            alert("修改成功！");
        }
    </script>
    <style>
        .add_code{
            color: black;
            font-family: "楷体";
            font-size: 25px;
            text-align:justify;
            padding: 10px;
            position: relative;
            right: -300px;
        }
        .add_codeve{
            padding-top: 20px;
            padding-right:20px;
            padding-bottom:20px;
            padding-left:20px;
            position: relative;
            right: -405px;
            background: #3498db;
            color: #4476A7;
            background: #F3F3F3;
            border: 1px #DADADA solid;
            padding: 2px 8px ;
            border-radius: 10px;
            font-size: 12pt;
            outline: none;
            padding: 4px 20px;
            font-family:"黑体";
        }
    </style>
    <script>
        function update(){
            alert("修改成功！");
        }
    </script>
</head>
<body>
<div class="main-wrap">
    <div class="crumb-wrap">
        <div class="crumb-list"><i class="icon-font"></i><a href="/jsp/first.html">首页</a><span
                class="crumb-step">&gt;</span><span class="crumb-name">更新图书</span></div>
    </div>
    <div class="search-wrap">
        <div class="search-content">
            <form method="post" action="/jsp/doupdateBook.html">
                <input class="add_code" name="id" type="hidden" value="${book.id}"/>
                <div class="add_code">
                    <label>书的编码
                        <input type="text" name="bookCode" value="${book.bookCode}"/>
                    </label>
                </div>
                <div class="add_code">
                    <label>书的名称
                        <input name="bookName" type="text" value="${book.bookName}"/>
                    </label>
                </div>
                <div class="add_code">
                    <label>图书类型
                        <select style="width: 272px;height: 28px" name="type" class="common-text2" id="cateId" required>
                            <option value="0">请选择</option>
                            <option value="1" selected>其它</option>
                            <option value="2">名著</option>
                            <option value="3">科技</option>
                            <option value="4">小说</option>
                            <option value="5">散文</option>
                            <option value="6">文集</option>
                        </select>
                    </label>
                </div>
                <div class="add_code">
                    <label>语&nbsp&nbsp&nbsp&nbsp言
                        <input name="language" type="text" value="${book.language}"/>
                    </label>
                </div>
                <div class="add_code">
                    <label>作&nbsp&nbsp&nbsp&nbsp者
                        <input name="author" type="text" value="${book.author}"/>
                    </label>
                </div>
                <div class="add_code">
                    <label>出&nbsp版&nbsp社
                        <input name="press" type="text" value="${book.press}"/>
                    </label>
                </div>
                <div class="add_code">
                    <label>出版日期
                        <input name="pub" type="text" value="<fmt:formatDate value="${book.pubTime}" pattern="yyyy-MM-dd"/>"/>
                    </label>
                </div>
                <div class="add_code">
                        <label>修&nbsp改&nbsp人
                            <input name="modifyBy" type="text"/>
                        </label>
                </div>
                <div class="add_code">
                    <label>库&nbsp存&nbsp量
                        <input name="inventory" type="number" value="${book.inventory}"/>
                    </label>
                </div>
                <div class="add_code">
                    <label>简&nbsp&nbsp&nbsp&nbsp介
                        <input name="introduction" type="text" value="${book.introduction}"/>
                    </label>
                </div>
                <p>
                <p>

                </p>
                </p>
                <button class="add_codeve" type="submit" onclick="update()">更新</button>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a class="add_codeve" href="/jsp/booklist.html">取消</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
