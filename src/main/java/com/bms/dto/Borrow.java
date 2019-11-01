package com.bms.dto;

import java.util.Date;

public class Borrow {
    private Long id;

    private Date borrowTime;

    private Long limitLength;

    private Date returnTime;

    private Date actualTime;

    private Long remainTime;

    private Long bookId;

    private Long userId;

    public Borrow(Long id, Date borrowTime, Long limitLength, Date returnTime, Date actualTime, Long remainTime, Long bookId, Long userId) {
        this.id = id;
        this.borrowTime = borrowTime;
        this.limitLength = limitLength;
        this.returnTime = returnTime;
        this.actualTime = actualTime;
        this.remainTime = remainTime;
        this.bookId = bookId;
        this.userId = userId;
    }

    public Borrow() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public Long getLimitLength() {
        return limitLength;
    }

    public void setLimitLength(Long limitLength) {
        this.limitLength = limitLength;
    }

    public Date getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }

    public Date getActualTime() {
        return actualTime;
    }

    public void setActualTime(Date actualTime) {
        this.actualTime = actualTime;
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRemainTime() {
        return remainTime;
    }

    public void setRemainTime(Long remainTime) {
        this.remainTime = remainTime;
    }
}