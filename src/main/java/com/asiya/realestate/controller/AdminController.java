package com.asiya.realestate.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.asiya.realestate.entity.Users;
import com.asiya.realestate.service.UserService;

@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	
	
	@GetMapping("/admin/home")
	public String adminHome() {
		return"admin/admindash";
	}
	@GetMapping("/admin/newUser")
	public String displayNewUsers(Principal p, Model m, @ModelAttribute Users user) {
//		Users users=userService.getUserbyUsername(p.getName());
		m.addAttribute("users",userService.getOnlyUsersByRole());
		
		return"admin/userRole";
		
	}
	

}
