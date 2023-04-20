package com.edu.service;

import java.util.List;

import com.edu.pojo.User;

//UserService:底下需要去实现,调用dao层
public interface UserService {
    //查询全部User,返回list集合
    List<User> queryAllUsers(User user);
    //增加一个User
    int addUser(User user);
    //根据id删除一个User
    int deleteUserById(int userId);
    //更新User
    int updateUser(User user);
    //根据id查询,返回一个User
    List<User> queryUserById(String userNo,String userName,String userSex,String gradeName);
}
