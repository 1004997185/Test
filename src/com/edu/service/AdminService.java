package com.edu.service;

import com.edu.pojo.Admin;

public interface AdminService {
	 //管理员登录
	 Admin loginAdmin(String adminName,String adminPwd);
}
