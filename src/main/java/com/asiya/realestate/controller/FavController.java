package com.asiya.realestate.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.asiya.realestate.entity.Favourite;
import com.asiya.realestate.entity.PropRequest;
import com.asiya.realestate.entity.Property;
import com.asiya.realestate.entity.Users;
import com.asiya.realestate.enums.Status;
import com.asiya.realestate.service.FavouriteService;
import com.asiya.realestate.service.PropertyService;
import com.asiya.realestate.service.RequestService;
import com.asiya.realestate.service.UserService;

@Controller
@RequestMapping("/user")
public class FavController {

	@Autowired
	private FavouriteService favouriteService;

	@Autowired
	private UserService userService;
	@Autowired
	private PropertyService propertyService;
	@Autowired
	private RequestService requestService;

	@GetMapping("/my-fav/{id}")
	public String favProps(@PathVariable int id, Principal p,RedirectAttributes ra,Model m) {
	    Users users = userService.getUserbyUsername(p.getName());
	    if (users == null) {
	        return "redirect:/login";
	    }

	    Property property = propertyService.getById(id);

	    List<Favourite> favList = favouriteService.getByUser(users);
	    
	    // Check if the property is already in the user's favorites
//	    Favourite existingFav = favList.stream()
//	                                    .filter(fav -> fav.getProperty().getId() == property.getId())
//	                                    .findFirst()
//	                                    .orElse(null);
//	    
//	    if (existingFav != null) {
//	        // Update the added_date of the existing favorite
//	        existingFav.setAdded_Date(LocalDateTime.now());
//	        favouriteService.saveFav(existingFav);
//	        ra.addFlashAttribute("already" ,"Already added to the favourites");
// Save the updated favorite
	    
//	    List<PropRequest> request=requestService.getByUser(users);
//	    for(PropRequest req:request) {
//	    	if(req.getStatus()==Status.DECLINED) {
//	    		
//	    	}
//	    }
	    
	        // If not found, create a new favorite and save it
	        Favourite newFav = new Favourite();
	        newFav.setProperty(property);
	        newFav.setUsers(users);
	        newFav.setAdded_Date(LocalDateTime.now());
	        favouriteService.saveFav(newFav);
	        ra.addFlashAttribute("sent" ,"Added product to Favourite");
	  

	    return "redirect:/user/allProperties";
	}



	@GetMapping("/showFav/{id}")
	public String showFav(Model m, Principal p,@PathVariable int id) {
		
		Users user = userService.getById(id);
		List<Favourite> favs=favouriteService.getByUser(user);
		m.addAttribute("favourite",favs);
		m.addAttribute("prop",requestService.getAllRequest());

		return "Property/DisplayFav";
	}
	
//	@GetMapping("/showFav/{id}")
//	public String showFav(PathVariable int id, Model m, Principal p) {
//	  	    
//	    Users user = userService.getById(id);
//	  
//
//	    List<Favourite> favs = favouriteService.getByUser(user);
//	    m.addAttribute("favourite",favs); // Avoid null issues
//	    m.addAttribute("prop", requestService.getAllRequest());
//
//	    return "Property/DisplayFav";
//	}


@PostMapping("/delete/{id}")
public String deleteOneProperty(@PathVariable int id,Model m, Principal p,RedirectAttributes ra) {
	Favourite favourite=favouriteService.getById(id);
	if(favourite!=null) {
		favouriteService.deleteFav(favourite);
		
	}
	return "redirect:/user/allProperties";
}

@PostMapping("/deleteall/{id}")
public String deleteAllProperty(@PathVariable int id, Model m,Principal p) {
	userService.getUserbyUsername(p.getName());
	Users user=userService.getById(id);
	
List<Favourite> favs=favouriteService.getByUser(user);
if(!favs.isEmpty()) {
	favouriteService.deleteAll(favs);
}
return"redirect:/user/allProperties";
	
}

}
