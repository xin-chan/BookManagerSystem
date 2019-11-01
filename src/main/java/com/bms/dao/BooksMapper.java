package com.bms.dao;

import com.bms.dto.Books;
import com.bms.dto.BooksExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BooksMapper {
    long countByExample(BooksExample example);

    int deleteByExample(BooksExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Books record);

    int insertSelective(Books record);

    List<Books> selectByExample(BooksExample example);

    Books selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Books record, @Param("example") BooksExample example);

    int updateByExample(@Param("record") Books record, @Param("example") BooksExample example);

    int updateByPrimaryKeySelective(Books record);

    int updateByPrimaryKey(Books record);

    Integer bookCount();

    List<Books> findBookList(@Param("bookName") String bookName, @Param("type") Integer type, @Param("first") Integer first, @Param("pageSize") Integer pageSize);

    Integer updateBook(Books book);

    List<Books> findUserBookList(@Param("bookName") String bookName, @Param("type") Integer type, @Param("first") Integer first, @Param("pageSize") Integer pageSize);

    Integer deleteInventory(Long id);

    Integer addInventory(Long bookId);

    Integer inventoryCount(Long id);

    Books findBookById(Long id);
}