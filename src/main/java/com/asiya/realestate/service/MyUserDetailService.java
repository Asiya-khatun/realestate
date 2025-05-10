//package com.asiya.realestate.service;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.asiya.realestate.dao.UserDao;
//import com.asiya.realestate.entity.UserPrincipal;
//import com.asiya.realestate.entity.Users;
//
//@Service
//public class MyUserDetailService  implements UserDetailsService{
//	@Autowired
//	private UserDao userDao;
//
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		// TODO Auto-generated method stub
//		Users user=userDao.findByUsername(username);
//		if(user==null) {
//			System.out.println("user not found");
//			throw new UsernameNotFoundException("user not found");
//		}
//		return new UserPrincipal(user);
//	}
//
//}
