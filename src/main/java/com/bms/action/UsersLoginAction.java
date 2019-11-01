package com.bms.action;

import com.bms.bo.UsersBoI;
import com.bms.dto.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UsersLoginAction {
    @Autowired
    private UsersBoI usersBoI;

    /*用户登录*/
    @RequestMapping("/login.html")
    public String login(@RequestParam("userCode") String userCode, @RequestParam("password") String password,
                        @RequestParam("userType") Integer userTyppe,
                        HttpSession session, HttpServletRequest request, Model model) {
        Users user = usersBoI.login(userCode, password, userTyppe);

        session.setAttribute("userSession", user);
        if (user != null && userTyppe == 99) {
            return "managerFrame";
        } else if (user != null && userTyppe == 0) {
//            session.setAttribute("userSession", user);
//            model.addAttribute("user", user);
            return "userFrame";
        } else {
            request.setAttribute("error", "账号或者密码错误！");
            return "forward:/index.jsp";
        }
    }

    /*用户退出*/
    @RequestMapping("/logout.html")
    public String logout(HttpSession session) {
        session.invalidate();//会话失效
        return "forward:/index.jsp";
    }
}
