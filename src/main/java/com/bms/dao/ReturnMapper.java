package com.bms.dao;

import com.bms.dto.Return;
import com.bms.vo.ReturnVo;

public interface ReturnMapper {
    ReturnVo findReturnList(Long userId);

    Integer addReturn(Return returns);
}
