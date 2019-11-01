package com.bms.action;

import com.bms.bo.BooksBoI;
import com.bms.bo.ReturnBoI;
import com.bms.bo.UsersBoI;
import com.bms.dto.Books;
import com.bms.dto.Users;
import com.bms.ro.PageInfo;
import com.bms.vo.ReturnVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/jsp")
public class ManagerAction {
    @Autowired
    private UsersBoI usersBoI;
    @Autowired
    private BooksBoI booksBoI;
    @Autowired
    private ReturnBoI returnBoI;

    @RequestMapping("/first.html")
    public String first() {
        return "managerFrame";
    }

    /*用户列表*/
    @RequestMapping("/userlist.html")
    public String userList(Model model, @RequestParam(value = "userName", required = false) String userName,
                           @RequestParam(value = "pageIndex", required = false) Integer pageIndex) {
        int pageNo = 1;//当前页
        if (pageIndex != null) {
            pageNo = pageIndex;
        }
        int pageSize = 5;//页容量
        int amount = usersBoI.userCount();

        PageInfo page = PageInfo.of(pageNo, pageSize, amount);//计算分页信息
        List<Users> userList = usersBoI.queryUserList(userName, page.getFirst(), pageSize);//数据库按条件查找数据

        model.addAttribute("page", page);
        model.addAttribute("userList", userList);

        return "userList";
    }

    /*查看用户*/
    @RequestMapping("/viewuser.html")
    public String viewUser(Model model, @RequestParam("userId") Long id) {
        ReturnVo returnVo = returnBoI.queryReturn(id);
        Users users = usersBoI.queryUserById(id);
        model.addAttribute("users", users);

        if (returnVo != null) {
            model.addAttribute("message", "");
            model.addAttribute("returnVo", returnVo.getReturns());
        } else if (users.getUserType() == 99) {
            model.addAttribute("message", "管理员暂无借阅权限");
        } else {
            model.addAttribute("message", "用户暂无归还记录");
        }
        return "viewUser";
    }


    /*图书列表*/
    @RequestMapping("/booklist.html")
    public String bookList(Model model, @RequestParam(value = "bookName", required = false) String bookName,
                           @RequestParam(value = "type", required = false) Integer type,
                           @RequestParam(value = "pageIndex", required = false) Integer pageIndex) {
        int pageNo = 1;
        if (pageIndex != null) {
            pageNo = pageIndex;
        }
        int pageSize = 5;
        int amount = booksBoI.bookCount();

        PageInfo pageInfo = PageInfo.of(pageNo, pageSize, amount);
        List<Books> bookList = booksBoI.queryBookList(bookName, type, pageInfo.getFirst(), pageSize);

        model.addAttribute("bookList", bookList);
        model.addAttribute(pageInfo);

        return "bookList";
    }

    /*增加图书*/
    /*跳转图书添加界面*/
    @RequestMapping("/addbook.html")
    public String addBook() {
        return "addBook";
    }

    @RequestMapping(value = "/doaddbook.html", method = RequestMethod.POST)
    public String doAddBook(Books book,String pub) throws ParseException {
        if (book == null) {
            return "addBook";
        }
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(pub);
        book.setPubTime(date);

        booksBoI.addBook(book);
        return "redirect:/jsp/booklist.html";
    }

    /*删除图书*/
    @RequestMapping("/deletebook.html")
    public String deleteBook(@RequestParam("bookId") Long id) {
        booksBoI.deleteBook(id);
        return "redirect:/jsp/booklist.html";
    }

    /*修改图书*/
    //跳转页面
    @RequestMapping("/updatebook.html/{id}")
    public String updateBook(Model model, @PathVariable("id") Long id) {
        Books book = booksBoI.queryBookById(id);
        model.addAttribute("book", book);
        return "updateBook";
    }

    @RequestMapping(value = "/doupdateBook.html", method = RequestMethod.POST)
    public String doUpdateBook(Books book, String pub,HttpSession session) throws ParseException {
        Users user = (Users) session.getAttribute("userSession");
        if(user==null){
            return "redirect:/index.jsp";
        }

        //如果修改人为空，就默认为当前登录的管理员
        if (book.getModifyBy() == null || book.getModifyBy() == "") {
            book.setModifyBy(user.getUserName());
        }

        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(pub);
        book.setPubTime(date);

        booksBoI.updateBook(book);
        return "redirect:/jsp/booklist.html";
    }

    /*查看图书*//*用户和管理员*/
    @RequestMapping("/viewbook.html/{bookId}")
    public String viewBook(@PathVariable("bookId") Long id, Model model, HttpSession session) {
        Users users = (Users) session.getAttribute("userSession");
        if (users == null) {
            return "redirect:/index.jsp";
        }
        Books book = booksBoI.queryBookById(id);
        if (users.getUserType() == 0) {
            model.addAttribute("bookView", book);
            return "userViewBook";
        } else {
            model.addAttribute("bookView", book);
            return "viewBook";
        }
    }
}
