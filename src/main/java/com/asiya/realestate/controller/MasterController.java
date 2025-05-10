package com.asiya.realestate.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.asiya.realestate.entity.Users;
import com.asiya.realestate.service.UserService;

@ControllerAdvice
public class MasterController {
	@Autowired 
	private UserService userService;
	
	@ModelAttribute("user")
	public Users showloginUser(Principal p) {
		if(p!=null) {
		String userName=p.getName();
		Users users=userService.getUserbyUsername(userName);				
		return users;
		}
		return null;
	}

}
