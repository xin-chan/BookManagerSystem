package com.bms.bo;

import com.bms.dao.BooksMapper;
import com.bms.dao.BorrowMapper;
import com.bms.dto.Books;
import com.bms.dto.Borrow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

@Service
public class BooksBo implements BooksBoI {
    @Autowired
    private BooksMapper booksMapper;
    @Autowired
    private BorrowMapper borrowMapper;

    @Override
    public List<Books> queryBookList(String bookName, Integer type, Integer first, Integer pageSize) {
        return booksMapper.findBookList(bookName, type, first, pageSize);
    }

    @Override
    public Integer bookCount() {
        return booksMapper.bookCount();
    }

    @Override
    public Integer addBook(Books book) {
        //设置创建时间为当前时间
        book.setCreateTime(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));
        book.setInventoryCopy(book.getInventory());//副本库存与库存量初始值相等
        return booksMapper.insert(book);
    }

    @Override
    public Integer deleteBook(Long id) {

        return booksMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Integer updateBook(Books book) {
        //设置修改时间
        book.setModifyTime(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));
        book.setInventoryCopy(book.getInventory());

        return booksMapper.updateBook(book);
    }

    @Override
    public Books queryBookById(Long id) {
        return booksMapper.findBookById(id);
    }

    @Override
    public List<Books> queryUserBookList(String bookName, Integer type, Integer first, Integer pageSize) {
        return booksMapper.findUserBookList(bookName, type, first, pageSize);
    }

    /*借阅图书*/
    @Override
    public Integer deleteInventory(Long id, Borrow borrow, Long userId) {
        Integer i = booksMapper.deleteInventory(id);//图书库存减少

        /*设置借阅时间为当前时间*/
        borrow.setBorrowTime(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));
        if (id != null && userId != null) {
            borrow.setBookId(id);//设置对应的图书id
            borrow.setUserId(userId);//设置当前借阅用户的id
        }

        //计算归还时间=借阅时间+借阅时限
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            borrow.setReturnTime(simpleDateFormat.parse(simpleDateFormat.format(new Date(borrow.getBorrowTime().getTime()+borrow.getLimitLength()* 24 * 60 * 60 * 1000))));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Integer j = borrowMapper.addBorrow(borrow);//借阅增加图书
        if (i.intValue() == j.intValue()) {
            return 1;
        } else {
            return 0;
        }
    }

    /*归还图书*/
    @Override
    public Integer addInventory(Long bookId, Long id) {
        Integer i = booksMapper.addInventory(bookId);//图书库存增加
        Integer j = borrowMapper.deleteBorrow(id);//借阅减少图书
        if (i.intValue() == j.intValue()) {
            return 1;
        } else {
            return 0;
        }
    }

    /*查询当前图书库存量*/
    @Override
    public Integer inventoryCount(Long id) {
        return booksMapper.inventoryCount(id);
    }
}
