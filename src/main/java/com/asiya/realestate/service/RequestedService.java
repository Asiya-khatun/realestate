package com.asiya.realestate.service;

import java.util.List;

import com.asiya.realestate.entity.Requested;
import com.asiya.realestate.entity.Users;

public interface RequestedService {
	public void save(Requested requested);
	public void delete(Requested requested);
	public List<Requested> getAllList();
	public List<Requested> getByUser(Users user);
	
	

}
