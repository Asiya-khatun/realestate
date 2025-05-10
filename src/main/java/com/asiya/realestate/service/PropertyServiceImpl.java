package com.asiya.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asiya.realestate.dao.PropertyDao;
import com.asiya.realestate.entity.Property;
import com.asiya.realestate.entity.Users;

@Service
public class PropertyServiceImpl  implements PropertyService{
	
	@Autowired
	private PropertyDao propertyDao;

	@Override
	public void save(Property property) {
		// TODO Auto-generated method stub
		propertyDao.save(property);
		
	}

	@Override
	public List<Property> getAllProperties() {
		// TODO Auto-generated method stub
		return propertyDao.findAll();
	}

	@Override
	public void delete(Property property) {
		// TODO Auto-generated method stub
		propertyDao.delete(property);
	}

	@Override
	public void update(Property property) {
		// TODO Auto-generated method stub
		propertyDao.saveAndFlush(property);
	}

	@Override
	public void deleteAll(Property property) {
		// TODO Auto-generated method stub
		propertyDao.deleteAll();
		
	}

	@Override
	public Property getById(int id) {
		// TODO Auto-generated method stub
		 return propertyDao.findById(id).get();
	}

	@Override
	public List <Property> findByUser(Users users) {
		// TODO Auto-generated method stub
		return (List<Property>) propertyDao.findByUsers(users);
	}

//	@Override
//	public void getPropertyByCategory(String category) {
//		// TODO Auto-generated method stub
//		
//		propertyDao.findById(category);
//		
//	}

}
