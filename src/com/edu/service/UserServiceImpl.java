package com.edu.service;

import com.edu.dao.UserMapper;
import com.edu.pojo.User;

import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {

    //调用dao层的操作，设置一个set接口，方便Spring管理
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }


    public List<User> queryAllUsers(User user) {
        return userMapper.queryAllUsers(user);
    }
    
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    public int deleteUserById(int userId) {
        return userMapper.deleteUserById(userId);
    }

    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    public List<User> queryUserById(String userNo,String userName,String userSex,String gradeName) {
        return userMapper.queryUserById(userNo, userName, userSex, gradeName);
    }
}
