package com.bms.bo;

import com.bms.dto.Books;
import com.bms.dto.Borrow;

import java.util.List;

public interface BooksBoI {
    List<Books> queryBookList(String bookName, Integer type, Integer first, Integer pageSize);

    Integer bookCount();

    Integer addBook(Books book);

    Integer deleteBook(Long id);

    Integer updateBook(Books book);

    Books queryBookById(Long id);

    List<Books> queryUserBookList(String bookName, Integer type, Integer first, Integer pageSize);

    Integer deleteInventory(Long id, Borrow borrow, Long userId);

    Integer addInventory(Long bookId, Long id);

    Integer inventoryCount(Long id);
}
