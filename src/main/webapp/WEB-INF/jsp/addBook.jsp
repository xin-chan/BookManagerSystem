<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="common/managerHead.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆——添加图书界面</title>
    <script>
        function save(){
             alert("添加成功！")
        }
    </script>
    <style>
        .add_code{
            color:black;
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
</head>
<body>
<div class="main-wrap">
    <div class="crumb-wrap">
        <div class="crumb-list"><i class="icon-font"></i><a href="/jsp/first.html">首页</a><span
                class="crumb-step">&gt;</span><span class="crumb-name">添加图书</span></div>
    </div>
    <div class="search-wrap">
        <div class="search-content">
            <form method="post" action="/jsp/doaddbook.html">
                <div class="add_code">
                    <label>书的编码
                        <input style="width: 172px;height: 28px" name="bookCode" type="text" required/>
                    </label>
                </div>
                <div class="add_code">
                    <label>书的名称
                        <input style="width: 172px;height: 28px" name="bookName" type="text" required/>
                    </label>
                </div>
                <div class="add_code">
                    <label>图书类型
                        <select style="width: 172px;height: 28px" name="type" class="common-text2" id="cateId" required>
                            <option value="0">请选择</option>
                            <option value="1">其它</option>
                            <option value="2">名著</option>
                            <option value="3">科技</option>
                            <option value="4">小说</option>
                            <option value="5">散文</option>
                            <option value="6">文集</option>
                        </select>
                    </label>
                </div>
                <div class="add_code"><label>语&nbsp&nbsp&nbsp&nbsp言
                    <input style="width: 172px;height: 28px" name="language" type="text" required/>
                </label>
                </div>
                <div class="add_code">
                    <label>作&nbsp&nbsp&nbsp&nbsp者
                        <input style="width: 172px;height: 28px" name="author" type="text" required/>
                    </label>
                </div>
                <div class="add_code" class="add_codev">
                    <label>出&nbsp版&nbsp社
                        <input style="height: 28px;width: 172px" name="press" type="text" required/>
                    </label>
                </div>
                <div class="add_code">
                    <label>出版日期
                        <input  style="width: 172px;height: 28px" name="pub" type="date" required/>
                    </label>
                </div>
                <div class="add_code">
                    <label>创&nbsp建&nbsp人
                        <input style="width: 172px;height: 28px" name="createBy" type="text" required/>
                    </label>
                </div>
                <div class="add_code">
                    <label>库&nbsp存&nbsp量
                        <input style="width: 172px;height: 28px" name="inventory" type="number" required/>
                    </label>
                </div>
                <div class="add_code">
                    <label>简&nbsp&nbsp&nbsp&nbsp介
                        <input style="width: 172px;height: 28px" name="introduction" type="text" required/>
                    </label>
                </div>
                <P>
                <p>

                </p>
                </P>
                &nbsp&nbsp&nbsp<button class="add_codeve" type="submit" onclick="save()">保&nbsp&nbsp存</button>
                <button class="add_codeve" type="reset">重&nbsp&nbsp置</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
