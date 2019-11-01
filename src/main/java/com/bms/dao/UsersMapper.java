package com.bms.dao;

import com.bms.dto.Users;
import com.bms.dto.UsersExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UsersMapper {
    long countByExample(UsersExample example);

    int deleteByExample(UsersExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Users record);

    int insertSelective(Users record);

    List<Users> selectByExample(UsersExample example);

    Users selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Users record, @Param("example") UsersExample example);

    int updateByExample(@Param("record") Users record, @Param("example") UsersExample example);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);

    Integer userCount();

    List<Users> findUserList(@Param("userName") String userName, @Param("first") Integer first, @Param("pageSize") Integer pageSize);

    Integer updateUser(Users user);

    Integer pwdModify(@Param("password") String password, @Param("id") Long id);
}