 $(function () {
     onclick();
     $("#password").pstrength();//密码强度
     $('#email').autoMail();//邮箱自动
     //短信验证
     var refreshId = cusSetInterval(vcodetips, 1000, "mphone_messagesend_btn", refreshId, "重新获取", "mphone_messagesend_btn", "mphone_messagesend_btn");
     //密码强度
     $(".strengthMeter").hide();
     $("#password").keyup(function () {
         if ($("#password").val() != "") {
             $(".strengthMeter").show();
         } else {
             $(".strengthMeter").hide();
         }
     })
 });



        function clickFn(){
        $("newbutton").click(function () {
            if(!$('#user-reg-fm').valid()){
                return
            }
            var sfzhVal=$("#sfzh").val();
            var showSfzhStr=sfzhVal.substring(0,6)+" "+sfzhVal.substring(6,14)+" "+sfzhVal.substring(14);


        })
        }


