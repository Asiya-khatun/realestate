package com.asiya.realestate.service;

import java.util.List;

import com.asiya.realestate.entity.Favourite;
import com.asiya.realestate.entity.PropRequest;
import com.asiya.realestate.entity.Users;

public interface FavouriteService {
	
	public void saveFav(Favourite favourite);
	public void deleteFav(Favourite favourite);
	public List<Favourite> getAllFavourites();
	public void deleteAll(List<Favourite> favs);
	public Favourite getById(int id);
	public void updateFav(Favourite favourite);
	public List<Favourite> getByUser(Users users);
	

}
