package com.asiya.realestate.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asiya.realestate.dao.UserDao;
import com.asiya.realestate.entity.Users;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	@Override
	public void saveUser(Users users) {
		// TODO Auto-generated method stub
		 userDao.save(users);
		
	}

	@Override
	public void delete(Users users) {
		// TODO Auto-generated method stub
		userDao.delete(users);
	}

	@Override
	public List<Users> getAllUsers() {
		// TODO Auto-generated method stub
		 return userDao.findAll();
		
		 
	}

	@Override
	public void update(Users users) {
		// TODO Auto-generated method stub
		userDao.saveAndFlush(users);
	}

	@Override
	public void changePassword(Users users) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Users getUserbyUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	public Users getById(int id) {
		// TODO Auto-generated method stub
		 return userDao.findById(id).get();
	}

	@Override
	public List<Users> getOnlyUsersByRole() {
		List<Users> role_users=new ArrayList<>();
		List<Users> allUsers=userDao.findAll();
		for (Users users : allUsers) {
			if(users.getUserRole().getRole().equals("ROLE_USER")) {
				role_users.add(users);
				System.out.println(users.getName());
				
			}
			
		}
		
	    return role_users; 
	}



}
