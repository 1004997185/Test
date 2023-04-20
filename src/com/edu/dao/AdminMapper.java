package com.edu.dao;

import org.apache.ibatis.annotations.Param;

import com.edu.pojo.Admin;

public interface AdminMapper {
    //管理员登录
    Admin loginAdmin(@Param("adminName") String adminName , @Param("adminPwd") String adminPwd);
}
