package com.asiya.realestate.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.asiya.realestate.entity.Property;
import com.asiya.realestate.entity.Users;

public interface PropertyDao  extends JpaRepository<Property, Integer>{
	
	public Property findByUsers(Users users);

}
