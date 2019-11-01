$(function () {


    $('#login_submit').click(function () {
        if (!validLogin()) {
            return;
        }
    });
});

function validLogin() {
    var flag = true;

    var username = $.trim($("#userCode").val());
    if (username == "") {
        $('#userCode').parent().addClass("has-error");
        $('#userCode').next().text("请输入账号");
        $("#userCode").next().show();
        flag = false;
    } else if (username.length < 2 || username.length > 15) {
        $("#userCode").parent().addClass("has-error");
        $("#userCode").next().text("账号长度必须在2~15之间");
        $("#userCode").next().show();
        flag = false;
    } else {
        $('#userCode').parent().removeClass("has-error");
        $('#userCode').next().text("");
        $("#userCode").next().hide();
    }

    var password = $.trim($("#password").val());
    if (password == "") {
        $('#password').parent().addClass("has-error");
        $('#password').next().text("请输入密码");
        $("#password").next().show();
        flag = false;
    } else if (password.length < 3 || password.length > 15) {
        $("#password").parent().addClass("has-error");
        $("#password").next().text("密码长度必须在3~15之间");
        $("#password").next().show();
        flag = false;
    } else {
        $('#password').parent().removeClass("has-error");
        $('#password').next().text("");
        $("#password").next().hide();
    }
    return flag;
}
