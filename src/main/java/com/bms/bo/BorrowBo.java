package com.bms.bo;

import com.bms.dao.BorrowMapper;
import com.bms.dto.Borrow;
import com.bms.vo.BorrowVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class BorrowBo implements BorrowBoI {
    @Autowired
    private BorrowMapper borrowMapper;

    @Override
    public List<BorrowVo> queryBorrowList(Long id) {
        List<BorrowVo> borrowList = borrowMapper.findBorrowList(id);
        for (BorrowVo borrowVo:borrowList) {
            long returnTime = borrowVo.getReturnTime().getTime();
            long time = new Date().getTime();

            //剩余时间（天数）=应当归还时间-当前时间
            long retainT = returnTime-time ;

            long days = retainT / (1000 * 60 * 60 * 24);

            borrowVo.setRemainTime(days);
        }
        return borrowList;
    }

    @Override
    public Integer borrowCount(Long userId) {
        return borrowMapper.borrowCount(userId);
    }

}
