package com.bms.action;

import com.bms.bo.UsersBoI;
import com.bms.dto.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/jsp")
public class UsersRegisterAction {
    @Autowired
    private UsersBoI usersBoI;

    private int flag = 0;

    /*用户注册*/
    /*跳转至注册页面*/
    @RequestMapping("/register.html")
    public String register(Model model) {
        if (flag == 1) {
            model.addAttribute("register", "用户名已经存在");
            flag = 0;
        }
        if (flag == 2) {
            model.addAttribute("register", "信息未填写");
            flag = 0;
        }
        return "register";
    }

    @RequestMapping(value = "/doRegister.html", method = RequestMethod.POST)
    public String doRegister(Users user, @RequestParam("bir") String bir) throws ParseException {
        System.out.println(user);
        if (user.getUserCode() != "" && usersBoI.confirmCode(user.getUserCode())) {

            Date date = new SimpleDateFormat("yyyy-MM-dd").parse(bir);
            user.setBirthday(date);
            usersBoI.register(user);
            return "redirect:/index.jsp";

        } else if (!usersBoI.confirmCode(user.getUserCode())) {
            flag = 1;
            return "redirect:/jsp/register.html";
        } else {
            flag = 2;
            return "redirect:/jsp/register.html";
        }
    }
}
