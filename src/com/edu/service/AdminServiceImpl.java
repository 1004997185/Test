package com.edu.service;


import com.edu.dao.AdminMapper;
import com.edu.pojo.Admin;

public class AdminServiceImpl implements AdminService{
    //调用dao层的操作，设置一个set接口，方便Spring管理
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }
    
	@Override
	public Admin loginAdmin(String adminName, String adminPwd) {
		return adminMapper.loginAdmin(adminName, adminPwd);
	}

}
