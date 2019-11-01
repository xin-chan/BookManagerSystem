package com.bms.dto;

import java.util.Date;

public class Books {
    private Long id;

    private String bookCode;

    private String bookName;

    private Integer type;

    private String language;

    private String author;

    private String press;

    private Date pubTime;

    private String createBy;

    private Date createTime;

    private String modifyBy;

    private Date modifyTime;

    private Long inventory;

    private Long inventoryCopy;

    private String introduction;

    private String typeName;

    public Books(Long id, String bookCode, String bookName, Integer type, String language, String author, String press, Date pubTime, String createBy, Date createTime, String modifyBy, Date modifyTime, Long inventory, Long inventoryCopy, String introduction, String typeName) {
        this.id = id;
        this.bookCode = bookCode;
        this.bookName = bookName;
        this.type = type;
        this.language = language;
        this.author = author;
        this.press = press;
        this.pubTime = pubTime;
        this.createBy = createBy;
        this.createTime = createTime;
        this.modifyBy = modifyBy;
        this.modifyTime = modifyTime;
        this.inventory = inventory;
        this.inventoryCopy = inventoryCopy;
        this.introduction = introduction;
        this.typeName = typeName;
    }

    public Books() {
        super();
    }

    public Long getInventoryCopy() {
        return inventoryCopy;
    }

    public void setInventoryCopy(Long inventoryCopy) {
        this.inventoryCopy = inventoryCopy;
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
        this.bookCode = bookCode == null ? null : bookCode.trim();
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language == null ? null : language.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press == null ? null : press.trim();
    }

    public Date getPubTime() {
        return pubTime;
    }

    public void setPubTime(Date pubTime) {
        this.pubTime = pubTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy == null ? null : createBy.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(String modifyBy) {
        this.modifyBy = modifyBy == null ? null : modifyBy.trim();
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Long getInventory() {
        return inventory;
    }

    public void setInventory(Long inventory) {
        this.inventory = inventory;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "Books{" +
                "id=" + id +
                ", bookCode='" + bookCode + '\'' +
                ", bookName='" + bookName + '\'' +
                ", type=" + type +
                ", language='" + language + '\'' +
                ", author='" + author + '\'' +
                ", press='" + press + '\'' +
                ", pubTime=" + pubTime +
                ", createBy='" + createBy + '\'' +
                ", createTime=" + createTime +
                ", modifyBy='" + modifyBy + '\'' +
                ", modifyTime=" + modifyTime +
                ", inventory=" + inventory +
                ", introduction='" + introduction + '\'' +
                ", typeName=" + typeName +
                '}';
    }
}