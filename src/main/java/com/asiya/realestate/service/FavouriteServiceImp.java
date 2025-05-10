package com.asiya.realestate.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.asiya.realestate.dao.FavouriteDao;
import com.asiya.realestate.entity.Favourite;
import com.asiya.realestate.entity.PropRequest;
import com.asiya.realestate.entity.Users;

@Service
public class FavouriteServiceImp implements FavouriteService {
	@Autowired
	private FavouriteDao favouriteDao;

	@Override
	public void saveFav(Favourite favourite) {
		// TODO Auto-generated method stub
		favouriteDao.save(favourite);
	}

	@Override
	public void deleteFav(Favourite favourite) {
		// TODO Auto-generated method stub
		favouriteDao.delete(favourite);
	}

	@Override
	public List<Favourite> getAllFavourites() {
		// TODO Auto-generated method stub
		return favouriteDao.findAll();
	}

	@Override
	public void deleteAll(List<Favourite> favs) {
		// TODO Auto-generated method stub
		favouriteDao.deleteAll();
	}

	@Override
	public Favourite getById(int id) {
		// TODO Auto-generated method stub
		return favouriteDao.findById(id).get();
	}

	@Override
	public void updateFav(Favourite favourite) {
		// TODO Auto-generated method stub
		favouriteDao.saveAndFlush(favourite);
	}

	@Override
	public List<Favourite> getByUser(Users users) {
		// TODO Auto-generated method stub
		return favouriteDao.findByUsers(users);
	}


}
