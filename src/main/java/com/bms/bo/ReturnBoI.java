package com.bms.bo;

import com.bms.dto.Return;
import com.bms.vo.ReturnVo;

import java.text.ParseException;
import java.util.Date;

public interface ReturnBoI {
    Integer addReturn(Return returns, String returnTime) throws ParseException;

    ReturnVo queryReturn(Long userId);
}
