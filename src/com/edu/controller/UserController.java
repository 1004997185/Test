package com.edu.controller;

import com.edu.pojo.User;
import com.edu.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    
  /*//列表查询
    @RequestMapping("/allUser")
    public String list(Model model) {
        List<User> list = userService.queryAllUsers();
        model.addAttribute("list", list);
        return "allUser";
    }*/
    
    //分页列表查询
    @RequestMapping("/allUser")
    public String list(@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,User user,HttpSession httpSession,Model model) {
    	PageHelper.startPage(page, 6);
    	List<User> list = userService.queryAllUsers(user);
    	PageInfo<User> p= new PageInfo<User>(list);
    	if (user != null) {
    		httpSession.setAttribute("user", user);
		}
    	model.addAttribute("page", p);
        //model.addAttribute("list", list);
        return "allUser";
    }
    
    @RequestMapping("/del/{userId}")
    public String deleteUser(@PathVariable("userId") int userId) {
    	userService.deleteUserById(userId);
        return "redirect:/user/allUser";
    }
    
    @RequestMapping("/addUser")
    public String addUser(User user) {
        System.out.println(user);
        userService.addUser(user);
        return "redirect:/user/allUser";
    }   
    
    @RequestMapping("/updateUser")
    public String User(Model model,User user) {
        System.out.println(user);
        userService.updateUser(user);
        return "redirect:/user/allUser";
    }
    //模糊查询
    @RequestMapping("/searchUser")
    public String search(User user,HttpSession httpSession,Model model) {
    	List<User> list = userService.queryAllUsers(user);
    	if (user != null) {
    		httpSession.setAttribute("user", user);
		}
        model.addAttribute("list", list);
        return "allUser2";
    }
    //模糊查询-分页
    @RequestMapping("/searchUser2")
    public String search2(@RequestParam(required=false) String userNo,@RequestParam(required=false)String userName,@RequestParam(required=false) String userSex,@RequestParam(required=false) String gradeName,@RequestParam(required=true,defaultValue="1") Integer page,HttpServletRequest request,User user,HttpSession httpSession,Model model) {
    	PageHelper.startPage(page, 6);
    	//List<User> list = userService.queryAllUsers(user);
    	List<User> list = userService.queryUserById(userNo, userName, userSex, gradeName);
    	PageInfo<User> p= new PageInfo<User>(list);
    	request.getSession().removeAttribute("user");
    	if (user != null) {
    		httpSession.setAttribute("user", user);
		}
    	//model.addAttribute("user", user);
    	model.addAttribute("list", list);
        model.addAttribute("page", p);
        return "allUser2";
    }
    

}
