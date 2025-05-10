package com.asiya.realestate.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asiya.realestate.entity.PropRequest;

import java.util.List;
import com.asiya.realestate.entity.Users;
import com.asiya.realestate.enums.Status;

import jakarta.transaction.Transactional;


@Repository
@Transactional
public interface RequestDao extends JpaRepository<PropRequest, Integer> {
	
	public PropRequest findById(int id);
	public List<PropRequest> findByUser(Users user);
	List<PropRequest> findByStatus(Status status);
	

}
