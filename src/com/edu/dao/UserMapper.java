package com.edu.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edu.pojo.User;

public interface UserMapper {

    //查询全部User,返回list集合
    List<User> queryAllUsers(User user);
    
    //增加一个User
    int addUser(User user);

    //根据id删除一个User
    int deleteUserById(@Param("userId") int userId);

    //更新User
    int updateUser(User user);

    //根据id查询,返回一个User
    List<User> queryUserById(@Param("userNo") String userNo,@Param("userName") String userName,@Param("userSex") String userSex,@Param("gradeName") String gradeName);
}
