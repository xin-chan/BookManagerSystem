package com.bms.dao;

import com.bms.dto.Borrow;
import com.bms.dto.BorrowExample;
import com.bms.vo.BorrowVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BorrowMapper {
    long countByExample(BorrowExample example);

    int deleteByExample(BorrowExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Borrow record);

    int insertSelective(Borrow record);

    List<Borrow> selectByExample(BorrowExample example);

    Borrow selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Borrow record, @Param("example") BorrowExample example);

    int updateByExample(@Param("record") Borrow record, @Param("example") BorrowExample example);

    int updateByPrimaryKeySelective(Borrow record);

    int updateByPrimaryKey(Borrow record);

    List<BorrowVo> findBorrowList(Long id);

    Integer addBorrow(Borrow borrow);

    Integer deleteBorrow(Long id);

    Integer borrowCount(Long userId);
}