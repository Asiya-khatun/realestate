package com.asiya.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asiya.realestate.dao.RequestedDao;
import com.asiya.realestate.entity.Requested;
import com.asiya.realestate.entity.Users;
@Service
public class RequestedServiceImpl implements RequestedService{
@Autowired
private RequestedDao requestedDao;

@Override
public void save(Requested requested) {
	// TODO Auto-generated method stub
	requestedDao.save(requested);
	
}

@Override
public void delete(Requested requested) {
	// TODO Auto-generated method stub
	requestedDao.delete(requested);
	
}

@Override
public List<Requested> getAllList() {
	// TODO Auto-generated method stub
	return requestedDao.findAll();
}

@Override
public List<Requested> getByUser(Users user) {
	// TODO Auto-generated method stub
	return requestedDao.findByUsers(user);
}
	

}
