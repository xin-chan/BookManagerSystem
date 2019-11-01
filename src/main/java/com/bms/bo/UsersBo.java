package com.bms.bo;

import com.bms.dao.UsersMapper;
import com.bms.dto.Users;
import com.bms.dto.UsersExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class UsersBo implements UsersBoI {
    @Autowired
    private UsersMapper usersMapper;

    @Override
    public Users login(String userCode, String password, Integer userType) {
        UsersExample usersExample = new UsersExample();
        UsersExample.Criteria criteria = usersExample.createCriteria();

        /*用于验证账号和密码*/
        criteria.andUserCodeEqualTo(userCode);
        criteria.andPasswordEqualTo(password);
        criteria.andUserTypeEqualTo(userType);
        List<Users> users = usersMapper.selectByExample(usersExample);
        if (users.size() == 1) {
            return users.get(0);
        } else {
            return null;
        }
    }

    @Override
    public Integer userCount() {
        return usersMapper.userCount();
    }

    //查询用户表
    @Override
    public List<Users> queryUserList(String userName, Integer first, Integer pageSize) {
        return usersMapper.findUserList(userName, first, pageSize);
    }

    @Override
    public Integer register(Users user) {
        //设置注册日期为当前时间
        user.setRegisterTime(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));
        user.setUserType(0);
        return usersMapper.insert(user);
    }

    @Override
    public Integer updateUser(Users user) {
        return usersMapper.updateUser(user);
    }

    @Override
    public Users queryUserById(Long id) {
        Users users = usersMapper.selectByPrimaryKey(id);

        //获取date中的年份
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(users.getBirthday());
        Integer y = calendar.get(Calendar.YEAR);

        //年龄=当前年份-生日年份
        Integer age = LocalDate.now().getYear() - y;
        users.setAge(age);

        return users;
    }

    @Override
    public Integer pwdModify(String password, Long id) {
        return usersMapper.pwdModify(password, id);
    }

    //验证注册的用户名是否存在
    @Override
    public Boolean confirmCode(String userCode) {
        UsersExample usersExample = new UsersExample();
        UsersExample.Criteria criteria = usersExample.createCriteria();
        criteria.andUserCodeEqualTo(userCode);

        List<Users> users = usersMapper.selectByExample(usersExample);
        if (users.size() == 1) {
            return false;
        } else {
            return true;
        }
    }
}
