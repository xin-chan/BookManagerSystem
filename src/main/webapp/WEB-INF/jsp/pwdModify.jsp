<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="common/managerHead.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>大耳朵图书馆——修改密码界面</title>
    <style>
        #passwordPosition {
            position: relative;
            top: -600px;
            left: -70px;
        }

        .pwd_success {
            color: red;
            font-size: 1.5em;
            position: relative;
            right: -100px;
        }
        label{
            position: relative;
            top: 43px;
        }
        input{
            position: relative;
            right: -30px;
        }
        tip{
            position: relative;
            right: -30px;
        }
        button:nth-child(1){
            position: relative;
            right: -30px;
        }
        button:nth-child(2){
            position: relative;
            right: -60px;
        }
    </style>
</head>
<body>

<!--/sidebar-->
<div class="main-wrap">

    <div class="crumb-wrap">
        <div class="crumb-list"><i class="icon-font"></i><a href="/jsp/first.html">首页</a><span
                class="crumb-step">&gt;</span><span class="crumb-name">修改密码</span></div>
    </div>

    <div class="layuimini-container">
        <form method="post" action="/jsp/dopwdmodify.html">
            <div class="layuimini-main">
                <div id="passwordPosition" class="layui-form layuimini-form">
                    <div class="layui-form-item">
                        <label id="pwd_old" class="layui-form-label required">旧的密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="password" lay-verify="required" lay-reqtext="旧的密码不能为空"
                                   placeholder="请输入旧的密码" value="" class="layui-input">
                            <tip>填写自己账号的旧的密码。</tip>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label required">新的密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="newPassword" lay-verify="required" lay-reqtext="新的密码不能为空"
                                   placeholder="请输入新的密码" class="layui-input" minlength="6" maxlength="16">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label required">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="rnewPassword" lay-verify="required" lay-reqtext="新的密码不能为空"
                                   placeholder="请确认新的密码" class="layui-input"  minlength="6" maxlength="16">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="saveBtn" type="submit">确认修改</button>
                            <button type="reset" class="layui-btn">重置密码</button>
                        </div>
                        <div class="pwd_success">${success}</div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <%--    <script src="${pageContext.request.contextPath }/static/lib/layui-v2.5.4/layui.js" charset="utf-8"></script>--%>
    <%--    <script>--%>
    <%--        layui.use(['form'], function () {--%>
    <%--            var form = layui.form--%>
    <%--                , layer = layui.layer;--%>

    <%--            //监听提交--%>
    <%--            form.on('submit(saveBtn)', function (data) {--%>
    <%--                layer.alert(JSON.stringify(data.field), {--%>
    <%--                    title: '最终的提交信息'--%>
    <%--                })--%>
    <%--                return false;--%>
    <%--            });--%>

    <%--        });--%>
    <%--    </script>--%>
</body>
</html>

