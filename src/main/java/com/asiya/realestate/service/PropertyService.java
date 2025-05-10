package com.asiya.realestate.service;

import java.util.List;

import com.asiya.realestate.entity.Property;
import com.asiya.realestate.entity.Users;

public interface PropertyService {
	
	public void save(Property property);
	public Property getById(int id);
	public List<Property> getAllProperties();
	public void delete(Property property);
	public void update(Property property);
	public void deleteAll(Property property);
	public List<Property> findByUser(Users users);
	
//	public void getPropertyByCategory(String category);

}
