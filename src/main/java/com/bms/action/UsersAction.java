package com.bms.action;

import com.bms.bo.BooksBoI;
import com.bms.bo.BorrowBoI;
import com.bms.bo.ReturnBoI;
import com.bms.dto.Books;
import com.bms.dto.Borrow;
import com.bms.dto.Return;
import com.bms.dto.Users;
import com.bms.ro.PageInfo;
import com.bms.vo.BorrowVo;
import com.bms.vo.ReturnVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping("/jsp")
public class UsersAction {
    @Autowired
    private BooksBoI booksBoI;
    @Autowired
    private BorrowBoI borrowBoI;
    @Autowired
    private ReturnBoI returnBoI;

    private Integer borrowCount = 0;
    private int flag = 0;

    //跳转至首页
    @RequestMapping("/firstPage.html")
    public String firtPage() {
        return "userFrame";
    }

    /*用户——图书列表*/
    @RequestMapping("/userbooklist.html")
    public String userBookList(Model model, @RequestParam(value = "userBookName", required = false) String userBookName,
                               @RequestParam(value = "type", required = false) Integer type,
                               @RequestParam(value = "pageIndex", required = false) Integer pageIndex, HttpSession session) {
        Users user = (Users) session.getAttribute("userSession");
        if (user == null) {
            return "forward:/index.jsp";
        }
        Long userId = user.getId();

        int pageNo = 1;
        if (pageIndex != null) {
            pageNo = pageIndex;
        }
        int pageSize = 5;
        int amount = booksBoI.bookCount();

        borrowCount = borrowBoI.borrowCount(userId);//查询当前用户借阅的图书实时数
        model.addAttribute("borrowCount", borrowCount);//动态显示借阅实时数

        if (flag == 2) {
            model.addAttribute("beyondLimit", "图书库存量不足，请稍后借阅！");
            flag = 0;
        }
        if (flag == 1) {
            model.addAttribute("beyondLimit", "超出规定借阅量（5本）");//超出借阅限定的处理
            flag = 0;
        }
        PageInfo upage = PageInfo.of(pageNo, pageSize, amount);//计算分页

        List<Books> userBookList = booksBoI.queryUserBookList(userBookName, type, upage.getFirst(), amount);

        model.addAttribute("page", upage);
        model.addAttribute("userBookList", userBookList);

        return "userBookList";
    }

    /*用户借阅*/
    @RequestMapping(value = "/borrowing.html")
    public String borrowing(@RequestParam("bookId") Long id, Borrow borrow/*需要传入借阅时限*/,
                            @RequestParam("limitNum") Integer limitNum, HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("userSession");
        if (user == null) {
            return "forward:/index.jsp";
        }

        Long userId = user.getId();//获取当前用户id
        Integer inventoryCount = booksBoI.inventoryCount(id);//获取当前图书库存量


        if (inventoryCount <= 0) {
            flag = 2;
        } else if (borrowCount >= limitNum) {
            flag = 1;
        } else {
            booksBoI.deleteInventory(id, borrow, userId);//将借阅书的信息加入借阅列表
        }

        return "redirect:/jsp/userbooklist.html";
    }

    /*用户借阅列表*/
    @RequestMapping("/borrowlist.html")
    public String brrowlist(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("userSession");
        if (user == null) {
            return "forward:/index.jsp";
        }
        //显示借阅信息
        Long id = user.getId();
        List<BorrowVo> borrowList = borrowBoI.queryBorrowList(id);
        model.addAttribute("borrowList", borrowList);

        //显示归还信息
        ReturnVo returnVo = returnBoI.queryReturn(id);
        if (returnVo != null) {
            model.addAttribute("returnList", returnVo.getReturns());
        }
        return "borrow";
    }

    /*用户归还*/
    @RequestMapping("/returnbook.html")
    public String returnBook(@RequestParam("bookId") Long bookId, @RequestParam("borrowId") Long id,
                             HttpSession session, Return returns, @RequestParam("returnTime") String returnTime) {
        Users user = (Users) session.getAttribute("userSession");
        if (user == null) {
            return "forward:/index.jsp";
        }
        booksBoI.addInventory(bookId, id);//图书增加库存，删除借阅表对应书籍
        returns.setUserId(user.getId());

        try {
            //将借阅书的信息加入归还列表
            returnBoI.addReturn(returns, returnTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "redirect:/jsp/borrowlist.html";
    }

}
