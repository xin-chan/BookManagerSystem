package com.bms.vo;

import com.bms.dto.Borrow;

public class BorrowVo extends Borrow {
   private String bookCode;
   private String bookName;
   private String author;

    public BorrowVo() {
    }

    public BorrowVo(String bookCode, String bookName, String author) {
        this.bookCode = bookCode;
        this.bookName = bookName;
        this.author = author;
    }

    public String getBookCode() {
        return bookCode;
    }

    public void setBookCode(String bookCode) {
        this.bookCode = bookCode;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
}
