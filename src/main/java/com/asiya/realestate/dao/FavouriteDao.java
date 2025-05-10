package com.asiya.realestate.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asiya.realestate.entity.Favourite;
import com.asiya.realestate.entity.Users;

import jakarta.transaction.Transactional;

@Repository
@Transactional
public interface FavouriteDao  extends JpaRepository<Favourite, Integer>
{
public List<Favourite> findByUsers(Users users);	

}
