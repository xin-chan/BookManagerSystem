package com.bms.bo;

import com.bms.dao.ReturnMapper;
import com.bms.dto.Return;
import com.bms.utils.DateTimeConverter;
import com.bms.vo.ReturnVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@Service
public class ReturnBo implements ReturnBoI {
    @Autowired
    private ReturnMapper returnMapper;

    @Override
    public Integer addReturn(Return returns,String returnTime) throws ParseException {
        //设置归还时间为当前时间
        returns.setActualTime(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));

        if(new Date().getTime()- new DateTimeConverter().convert(returnTime).getTime()>0){
            returns.setOverStatus(2);//超时
        }else{
            returns.setOverStatus(1);//未超时
        }
        return returnMapper.addReturn(returns);
    }

    @Override
    public ReturnVo queryReturn(Long userId) {
        return returnMapper.findReturnList(userId);
    }
}
