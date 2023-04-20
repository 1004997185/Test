package com.edu.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.pojo.Admin;
import com.edu.service.AdminService;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    @Qualifier("AdminServiceImpl")
    private AdminService adminService;
    
    @RequestMapping("/login")
    public String loginAdmin(Model model,HttpSession httpSession,String adminName,String adminPwd) {
        Admin admin = adminService.loginAdmin(adminName, adminPwd);
        System.out.println(admin);
        if(admin!=null) {
        	httpSession.setAttribute("admin", admin);
        	return "main";
        }else{
			String error="账号或密码输入错误!";
			model.addAttribute("error", error);
			return "index";
		}
    }
}
