package com.sid.java.springbootmvchibernatedemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import com.sid.java.springbootmvchibernatedemo.entity.Admin;
import com.sid.java.springbootmvchibernatedemo.entity.User;
import com.sid.java.springbootmvchibernatedemo.service.AdminService;
import com.sid.java.springbootmvchibernatedemo.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private UserService userService;

	@Autowired
	private AdminService adminService;

	public AdminController() {
		// TODO Auto-generated constructor stub
	}

	@GetMapping("admin-signup")
	public String adminsignup() {
		return "admin-signup";
	}

	@PostMapping("adminlogin")
	public String handler1(@ModelAttribute Admin admin) {
		Admin admin1 = adminService.getAdmin(admin.getName());
		if (admin1 == null) {
			adminService.addAdmin(admin);
			return "adminlogin";
		} else {
			return "exc1";
		}
	}

	@GetMapping("admin-login")
	public String adminlogin() {
		return "adminlogin";
	}

	@PostMapping("admin-logout")
	public String adminlogout() {
		return "adminlogin";
	}

	@PostMapping("admin-dashboard")
	public String admindashboard(@ModelAttribute Admin admin, Model model) {
		Admin admin1 = adminService.getAdmin(admin.getName());
		if (admin1 == null)
			return "exc1";
		int b1 = admin.getName().compareTo(admin1.getName());
		b1 += admin.getPassword().compareTo(admin1.getPassword());
		if (b1 == 0) {
			List<User> users = userService.getAllUser();
			model.addAttribute("users", users);
			return "admin-dashboard";
		} else {
			return "exc1";
		}
	}

	@PostMapping("deleteuser")
	public String deletuser(@RequestParam(value = "name", required = true) String name, Model model) {
		userService.deleteuser(name);
		return "redirect:/admin-login";
	}
}
