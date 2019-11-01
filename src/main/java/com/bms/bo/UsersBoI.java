package com.bms.bo;

import com.bms.dto.Users;

import java.util.List;

public interface UsersBoI {
    Users login(String userCode, String password, Integer userType);

    Integer userCount();

    List<Users> queryUserList(String userName, Integer first, Integer pageSize);

    Integer register(Users user);

    Integer updateUser(Users user);

    Users queryUserById(Long id);

    Integer pwdModify(String password, Long id);

    Boolean confirmCode(String userCode);
}
