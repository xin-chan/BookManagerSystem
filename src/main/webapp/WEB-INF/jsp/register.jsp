<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en" style="margin-top: 0px;">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>
        注册|大耳朵图书馆系统
    </title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="icon" href="${pageContext.request.contextPath }/static/images/logo2.jpg" type="image/x-icon">
    <link rel="stylesheet" href="https://t1.chei.com.cn/common/ch/iconfont.css">
    <link rel="stylesheet" href="https://t1.chei.com.cn/common/plugins/dialog/6.0.5/css/ui-dialog.css">
    <link rel="stylesheet" href="https://t3.chei.com.cn/account/css/custom/account-1.0.0.min.css?20191016">

    <script async="" src="//www.google-analytics.com/analytics.js"></script>
    <script src="https://t1.chei.com.cn/common/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://t1.chei.com.cn/common/plugins/validation/jquery.validate.min.js"></script>

    <script src="https://t4.chei.com.cn/account/js/account/jqueryloading-1.0.3.js"></script>
    <script src="https://t1.chei.com.cn/common/wap/js/wap.min.js"></script>
    <script>
        if (wapFn()) {
            addFile('css', 'https://t1.chei.com.cn/account/css/custom/account_wap-1.0.0.min.css?20190827');
        }
    </script>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-100524-4', {'sampleRate': 1});
        ga('send', 'pageview');
    </script>
    <style>
        .validate-tips{
            color: red;
        }
    </style>
</head>

<body>

<div class="outer-layer">
    <div class="outer-layer-content">
        <div class="header">
            <div class="wrap1180 clearfix">
                <div class="location">
                    <img src="${pageContext.request.contextPath }/static/images/logo1.jpg"/>
                    欢迎来到大耳朵图书馆
                </div>
                <div class="user-info">
                    <td class="account">已有账户?&nbsp;&nbsp;</td>
                    <td class="login"><a href="/index.jsp">登录</a></td>
                </div>
            </div>
        </div>

        <div class="bg">
            <div class="innter-container">
                <div class="form-container">
                    <div class="regist-tips-box" style="display:;">
                        <i class="iconfont toggle-icon-wap" data-flag="1"></i>
                    </div>

                    <form class="user_reg_fm" name="user_reg_fm" action="/jsp/doRegister.html" method="post"
                          autocomplete="off"
                          novalidate="novalidate">
                        <table>
                            <tbody>
                            <tr>
                                <th class="td-second">
                                    <span class="required" aria-required="true">*</span>用户名&nbsp;
                                </th>
                                <td>
                                    <input type="text" name="userCode" minlength="6" maxlength="18" value
                                           id="userCode"
                                           class="smzc-input has-error" autocomplete="off"
                                           aria-required="true"
                                           aria-describedby="userCode-error">
                                </td>
                                <td class="validate-tips" colspan="3">
                                    ${register}
                                </td>
                            </tr>
                            <tr>
                                <th><span class="required" aria-required="true">*</span>姓&nbsp;&nbsp;&nbsp;名&nbsp;
                                </th>
                                <td>
                                    <input type="text" name="userName" value="" id="xm"
                                           class="smzc-input has-error" autocomplete="off"
                                           aria-required="true" aria-describedby="xm-error" required/>
                                </td>
                                <td class="validate-tips" colspan="3">
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="required" aria-required="true">*</span>性&nbsp;&nbsp;&nbsp;别&nbsp;
                                </th>
                                <td>
                                    <input type="radio" class="not" name="gender" value="0"/>保密
                                    <input type="radio" class="man" name="gender" value="1"checked/>男
                                    <input type="radio" class="falman" name="gender" value="2"/>女
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="required" aria-required="true>">*</span>生&nbsp;&nbsp;&nbsp;日&nbsp;
                                </th>
                                <td>
                                    <input type="date" class="birthday" name="bir" required
                                           minlength="12" maxlength="60"/>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <span class="required" aria-required="true">*</span>邮&nbsp;&nbsp;&nbsp;箱&nbsp;
                                </th>
                                <td>
                                    <input type="text" name="email" value="" id="email"
                                           class="smzc-input has-error" onblur="checkEmail()"
                                           autocomplete="off" aria-invalid="true"
                                           aria-describedby="email-error" required/>
                                </td>
                                <td class="validate-tips" colspan="3" id="email-msg">
                                </td>
                            </tr>
                            <th class="td-first">
                                <span class="required" aria-required="true">*</span>手机号&nbsp;
                            </th>
                            <td class="td-input">
                                <input type="text" name="phone" maxlength="11" value="" id="mphone"
                                       class="smzc-input has-error" autocomplete="off" aria-required="true"
                                       aria-describedby="mphone-error" required/>
                            </td>
                            <td class="validate-tips" colspan="3">
                            </td>
                            </tr>
                            <tr>
                                <th><span class="required" aria-required="true">*</span>证件类型</th>
                                <td class="clearfix">
                                    <div class="yhm-select">
                                        <select name="idType" id="credentialtype" required>
                                            <option value="0" selected>居民身份证</option>
                                            <option value="1">港澳台证</option>
                                            <option value="2">华侨身份证/护照</option>
                                            <option value="3">其他</option>
                                        </select>
                                    </div>
                                </td>
                                <td class="validate-tips" colspan="3">
                                    中国大陆地区用户推荐设置居民身份证。
                                </td>
                            </tr>
                            <tr>
                                <th><span class="required" aria-required="true">*</span>证件号码&nbsp;</th>
                                <td>
                                    <input type="text" name="idCard" value="" id="sfzh"
                                           class="smzc-input has-error"
                                           autocomplete="off" aria-required="true"
                                           aria-describedby="sfzh-error" required/>
                                </td>
                                <td class="validate-tips" colspan="3">

                            </tr>
                            <tr>
                                <th><span class="required" aria-required="true">*</span>密&nbsp;&nbsp;&nbsp;码&nbsp;
                                </th>
                                <td>
                                    <input type="password" name="password" id="password"
                                           class="smzc-input valid" aria-required="true"
                                           aria-describedby="password-error password-error"
                                           aria-invalid="false" required/>
                                </td>
                                <td class="validate-tips" colspan="3">

                            </tr>
                            <tr>
                                <th><span class="required" aria-required="true">*</span>密码确认&nbsp;</th>
                                <td>
                                    <input type="password" name="password1" id="password1"
                                           class="smzc-input has-error" aria-required="true"
                                           aria-describedby="password1-error" required/>
                                </td>
                                <td class="validate-tips" colspan="3"></td>
                            </tr>
                            <tr>
                                <th class="wap-hide">&nbsp;</th>
                                <td colspan="4">
                                    <input type="hidden" name="continueurl" value=""
                                           id="user_reg_fm_continueurl">
                                    <input type="hidden" name="serviceId" value=""
                                           id="user_reg_fm_serviceId">
                                    <input type="hidden" name="serviceNote_res" id="serviceNote_ajax_res"
                                           value="0">
                                    <label for="serviceNote_yes" class="color666">
                                        <input type="checkbox" name="serviceNote" id="serviceNote_yes"
                                               value="1"
                                               checked="checked" style="margin-bottom: 2px;">
                                        我已阅读并同意“服务条款”
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <th class="wap-hide">&nbsp;</th>
                                <td colspan="4">
                                    <input type="submit" id="newbutton" name="newbutton" value="确认注册"
                                           class="enter-btn">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>


                </div>
            </div>


        </div>
    </div>

    <script src="https://t4.chei.com.cn/account/js/account/vcodetimehold-1.0.0.js"></script>
    <script src="https://t3.chei.com.cn/account/js/jquery/jquery.pstrength-chsi-2.1.js"></script>
    <script src="https://t3.chei.com.cn/account/js/automail.js"></script>
    <script src="https://t2.chei.com.cn/account/js/account-sfzh.js"></script>
    <script src="https://t4.chei.com.cn/account/js/account/registerbysfzh-2.0.3.js"></script>

    <script>
        $(function () {
            clickFn();
            $("#password").pstrength();//密码校验强度
            $('#email').autoMail();//邮箱自动完成
            //获取短信验证码
            var refreshId = cusSetInterval(vcodetips, 1000, "mphone_messagesend_btn", refreshId,
                "重新获取", "mphone_messagesend_btn", "mphone_messagesend_btn");
            serviceNote('user_reg_fm', 'serviceNote_yes', 'newbutton');//是否同意服务条款
            //checkEmail('email','email-msg');

            //默认密码强度条隐藏
            $(".strengthMeter").hide();
            $("#password").keyup(function () {
                if ($("#password").val() != "") {
                    $(".strengthMeter").show();
                } else {
                    $(".strengthMeter").hide();
                }
            });

            if (wapFn()) {
                $(".regist-tips-box").insertAfter("#user_reg_fm");
                //折叠效果
                $(".toggle-icon-wap").click(function () {
                    var $this = $(this);
                    if ($this.attr("data-flag") === "1") {
                        $this.html("&#xe602;").siblings(".regist-tip-detail").show();
                        $this.siblings("h2").css({
                            "white-space": "normal",
                            "width": "auto"
                        });
                        $this.attr("data-flag", "0");
                    } else {
                        $this.html("&#xe600;").siblings(".regist-tip-detail").hide();
                        $this.siblings("h2").css({
                            "white-space": "nowrap",
                            "width": "90%"
                        });
                        $this.attr("data-flag", "1");
                    }
                });
            }
        });

        function clickFn() {
            // 用户提交表单的操作处理
            $("#newbutton").click(function () {
                if (!$('#user_reg_fm').valid()) {
                    return;
                }
                var sfzhVal = $("#sfzh").val();
                var showSfzhStr = sfzhVal.substring(0, 6) + " " + sfzhVal.substring(6, 14) + " " + sfzhVal.substring(14);
                var regMessageConfig = "<div class='dialog-msgbox'><span class='dialog-title'>姓名：</span><span>" + $("#xm").val() + "</span><br/>";
                regMessageConfig += "<span class='dialog-title'>证件号码：</span><span>" + showSfzhStr + "</span></div>";

                var regStr_ = /(^[a-zA-Z]+[\u4e00-\u9fa5]+([\u4e00-\u9fa5]|[a-zA-Z])*$)|(^[\u4e00-\u9fa5]+[a-zA-Z]+([\u4e00-\u9fa5]|[a-zA-Z])*$)/;
                var v_ = $("#xm").val();
                if (regStr_.test(v_)) {
                    regMessageConfig += "<span class='error'>您的姓名同时含有中英文，可能会影响学信档案的操作，确认提交吗?</span>";
                }
                var getJymDialog = dialog({
                    title: '提示',
                    content: regMessageConfig,
                    button: [
                        {
                            value: '确定',
                            callback: function () {
                                if ($('#user_reg_fm').valid()) {
                                    $("#user_reg_fm").submit();
                                }
                                this.close();
                            },
                            autofocus: true
                        },
                        {
                            value: '取消',
                            callback: function () {
                                this.close();
                            }
                        }
                    ]
                });
                getJymDialog.showModal();
                return false;
            });

        }

        //检查邮箱
        function checkEmail() {
            if (!$("#user_reg_fm").valid()) {
                return false;
            }
            var $this = $("#email");
            var email = $.trim($this.val());
            if (email == null || email == '') {
                return false;
            }
            $.ajax({
                type: "POST",
                data: {
                    dataInfo: function () {
                        return email;
                    },
                    optType: function () {
                        return "REGISTER";
                    }
                },
                url: "/account/checkusername.action",
                success: function (data) {
                    var jsData = eval('(' + data + ')');
                    if (jsData.status == 1) {
                        return true;
                    } else {
                        var errorType = jsData.errorType;
                        errorType = errorType.substr(1, errorType.length - 2);
                        var info = jsData.info;
                        info = info.substr(1, info.length - 2);
                        var $msg = $('#email-msg');
                        if (errorType == '1') {
                            var notice1 = "<span class='email-tip'>该邮箱已经注册，可直接&nbsp;<a href='https://account.chsi.com.cn/passport/login'>登录</a></span>";
                            $msg.html(notice1);
                        } else if (errorType == '2') {
                            var notice2 = "<span class='email-tip'>该邮箱已经注册，正在等待激活，<a href='https://account.chsi.com.cn/account/getactivatecode.action?activateName=" + email + "'>重新发送激活邮件</a></span>";
                            $msg.html(notice2);
                        } else if (errorType == '4') {
                            $msg.html("<span class='email-tip'>" + info + "</span>");
                        } else {
                            $msg.html("<span class='email-tip'>" + info + "</span>");
                        }
                        return false;
                    }
                }
            });
        }
    </script>
</div>
</div>

<script type="text/JavaScript">
    $("select.site-utility-footer-language-select").change(function () {
        var request_locale = $(this).val()
        var location = "";

        var from = '';

        location = "/account/preregister.action?from=" + from + "&request_locale=" + request_locale;

        if ("" == location) {
            $(".site-utility-footer-language").submit();
        } else {
            window.location = location;
        }
    });
</script>
</div>


</div>
<script src="https://t1.chei.com.cn/common/plugins/dialog/6.0.5/dialog-min.js"></script>
<script src="https://t2.chei.com.cn/account/js/common/ie-prompt.min.js"></script>

<div id="loader" style="display: none;"><img
        src="https://t1.chei.com.cn/account/images/theme/normal/loading.gif"
        alt="加载中..."></div>
<div id="mailBox" style="top: 762px; left: 434.6px; width: 318px; display: none;"><p>请选择邮箱类型</p>
    <ul>
        <li>12312341236@163.com</li>
        <li>12312341236@126.com</li>
        <li>12312341236@qq.com</li>
        <li>12312341236@sina.com</li>
        <li>12312341236@sina.cn</li>
        <li>12312341236@gmail.com</li>
        <li>12312341236@hotmail.com</li>
        <li>12312341236@foxmail.com</li>
        <li>12312341236@139.com</li>
        <li>12312341236@wo.com.cn</li>
        <li>12312341236@189.cn</li>
        <li>12312341236@yahoo.com</li>
    </ul>
</div>
</body>
</html>


