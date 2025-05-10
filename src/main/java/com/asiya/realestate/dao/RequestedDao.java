package com.asiya.realestate.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asiya.realestate.entity.Requested;
import com.asiya.realestate.entity.Users;
@Repository
public interface RequestedDao extends JpaRepository<Requested, Integer> {
	public List<Requested>  findByUsers(Users users);

}
