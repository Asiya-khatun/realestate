package com.asiya.realestate.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asiya.realestate.entity.Users;

@Repository
public interface UserDao extends JpaRepository<Users,Integer>{
	 Users findByUsername(String username);
	 Users findByEmail(String email);
	 
//	 @Query("SELECT u FROM Users u WHERE u.userRole.role = :role")


}
