package com.bms.dto;

import java.util.Date;

public class Return {
    private Long id;
    private String bookCode;
    private String bookName;
    private Date borrowTime;
    private Date actualTime;
    private Integer overStatus;
    private Long userId;

    public Return() {
    }

    public Return(Long id, String bookCode, String bookName, Date borrowTime, Date actualTime, Integer overStatus, Long userId) {
        this.id = id;
        this.bookCode = bookCode;
        this.bookName = bookName;
        this.borrowTime = borrowTime;
        this.actualTime = actualTime;
        this.overStatus = overStatus;
        this.userId = userId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public Date getActualTime() {
        return actualTime;
    }

    public void setActualTime(Date actualTime) {
        this.actualTime = actualTime;
    }

    public Integer getOverStatus() {
        return overStatus;
    }

    public void setOverStatus(Integer overStatus) {
        this.overStatus = overStatus;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Return{" +
                "id=" + id +
                ", bookCode='" + bookCode + '\'' +
                ", bookName='" + bookName + '\'' +
                ", borrowTime=" + borrowTime +
                ", actualTime=" + actualTime +
                ", overStatus=" + overStatus +
                ", userId=" + userId +
                '}';
    }
}
