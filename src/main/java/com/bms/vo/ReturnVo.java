package com.bms.vo;

import com.bms.dto.Return;
import com.bms.dto.Users;

import java.util.List;

public class ReturnVo extends Users {
   private List<Return> returns;

    public ReturnVo() {
    }

    public ReturnVo(List<Return> returns) {
        this.returns = returns;
    }

    public List<Return> getReturns() {
        return returns;
    }

    public void setReturns(List<Return> returns) {
        this.returns = returns;
    }

    @Override
    public String toString() {
        return "ReturnVo{" +
                "returns=" + returns +
                '}';
    }
}
