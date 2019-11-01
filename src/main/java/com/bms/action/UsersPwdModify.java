package com.bms.action;

import com.bms.bo.UsersBoI;
import com.bms.dto.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/jsp")
public class UsersPwdModify {
    @Autowired
    private UsersBoI usersBoI;

    /*密码修改*/
    /*跳转至密码修改界面*/
    @RequestMapping("/pwdmodify.html")
    public String pwdModify(){
        return "pwdModify";
    }

    @RequestMapping("/userpwdModify.html")
    public String userpwdModify(){
        return "userpwdModify";
    }

    @RequestMapping(value = "/dopwdmodify.html",method = RequestMethod.POST)
    public String doPwdModify(@RequestParam("newPassword") String opassword,
                              @RequestParam("rnewPassword") String password,
                              @RequestParam("password") String oldPassword,
                              HttpSession session, Model model){

        Users user = (Users)session.getAttribute("userSession");
        if(user==null){
            return "forward:/index.jsp";
        }
        if (user.getUserType()==99){
            if(!oldPassword.equals(user.getPassword())){
                model.addAttribute("success","原密码输入错误");
            }else if(password==null||password.isEmpty()||password.trim().length()==0){
                model.addAttribute("success","修改的密码不能为空");
            }else if(!password.equals(opassword)){
                model.addAttribute("success","密码不一致");
            }else{
                usersBoI.pwdModify(password, user.getId());
                model.addAttribute("success", "密码修改成功");
            }
            return "pwdModify";
        }else{
            if(!oldPassword.equals(user.getPassword())){
                model.addAttribute("success","原密码输入错误");
            }else if(password==null||password.isEmpty()||password.trim().length()==0){
                model.addAttribute("success","修改的密码不能为空");
            }else if(!password.equals(opassword)){
                model.addAttribute("success","密码不一致");
            }else{
                usersBoI.pwdModify(password, user.getId());
                model.addAttribute("success", "密码修改成功");
            }
            return "userpwdModify";
        }
    }
}
