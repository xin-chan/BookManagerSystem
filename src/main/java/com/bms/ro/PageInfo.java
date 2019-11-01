package com.bms.ro;

public class PageInfo {
    private int pageNo;
    private int pageSize;
    private int amount;
    private int pageAmount;
    private int first;
    private int last;
    private boolean firstPage;
    private boolean lastPage;

    private PageInfo(int pageNo, int pageSize, int amount) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.amount = amount;
        firstPage = false;
        lastPage = false;
    }

    public static PageInfo of(int pageNo, int pageSize, int amount) {
        PageInfo page = new PageInfo(pageNo, pageSize, amount);

        /*页码总数计算*/
        if (amount % pageSize == 0) {
            page.pageAmount = amount / pageSize;
        } else {
            page.pageAmount = (amount / pageSize) + 1;
        }

        /*当前页码比较*/
        if (pageNo > page.pageAmount) {
            page.pageNo = page.pageAmount;
        }
        if (pageNo < 1) {
            page.pageNo = 1;
        }

        /*判断是否为第一页和最后一页*/
        page.firstPage = page.pageNo == 1;
        page.lastPage = page.pageNo == page.pageAmount;

        /*当前页第一条和最后一条的计算*/
        page.first = page.pageSize * (page.pageNo - 1);
        if (page.lastPage) {
            page.last = amount;
        } else {
            page.last = page.pageNo * pageSize;
        }

        return page;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPageAmount() {
        return pageAmount;
    }

    public void setPageAmount(int pageAmount) {
        this.pageAmount = pageAmount;
    }

    public int getFirst() {
        return first;
    }

    public void setFirst(int first) {
        this.first = first;
    }

    public int getLast() {
        return last;
    }

    public void setLast(int last) {
        this.last = last;
    }

    public boolean isFirstPage() {
        return firstPage;
    }

    public void setFirstPage(boolean firstPage) {
        this.firstPage = firstPage;
    }

    public boolean isLastPage() {
        return lastPage;
    }

    public void setLastPage(boolean lastPage) {
        this.lastPage = lastPage;
    }
}
