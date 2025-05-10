package com.asiya.realestate.service;


import java.util.List;


import com.asiya.realestate.entity.Users;

public interface UserService{
	
	public void saveUser(Users users);
	public void delete(Users users);
	public List<Users> getAllUsers();
	public void update(Users users);
	public Users getUserbyUsername(String username);
	public void changePassword(Users users);
	public Users getById(int id);
	public List<Users> getOnlyUsersByRole();

	
	

}
