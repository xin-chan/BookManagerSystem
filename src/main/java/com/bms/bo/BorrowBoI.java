package com.bms.bo;

import com.bms.vo.BorrowVo;

import java.util.List;

public interface BorrowBoI {
    List<BorrowVo> queryBorrowList(Long id);

    Integer borrowCount(Long userId);

}
