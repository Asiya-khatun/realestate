package com.asiya.realestate.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.metamodel.mapping.internal.InFlightEntityMappingType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.asiya.realestate.entity.Favourite;
import com.asiya.realestate.entity.Property;
import com.asiya.realestate.entity.UserRole;
import com.asiya.realestate.entity.Users;
import com.asiya.realestate.service.FavouriteService;
import com.asiya.realestate.service.PropertyService;
import com.asiya.realestate.service.RequestService;
import com.asiya.realestate.service.UserService;

import jakarta.validation.Valid;


@Controller
public class UserController {
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private UserService userService;
	@Autowired
	private PropertyService propertyService;
	@Autowired
	private FavouriteService favouriteService;
	@Autowired
	private RequestService requestService;
	
	
	
	@GetMapping("/login")
	public String loginPage() {
		return"user/login";
	}
	
	@GetMapping("/registerUser")
	public String registerUser(Model m) {
		m.addAttribute("users",new Users());
		return"user/register";
	}
	
	
	@PostMapping("/register")
	public String register(Model m, Principal p, @Valid @ModelAttribute Users users, RedirectAttributes rda, BindingResult bResult) {
	    if (bResult.hasErrors()) {
	        Map<String, String> validationErrors = new HashMap<>();
	        
	        // Storing field-specific errors in the map
	        for (FieldError error : bResult.getFieldErrors()) {
	            validationErrors.put(error.getField(), error.getDefaultMessage());
	        }
	        
	        // Add map to the model for JSP access
	        m.addAttribute("valid_errors", validationErrors);
	        return "user/register"; // Ensure the view name is correct
	    }
	    
	    users.setPassword(passwordEncoder.encode(users.getPassword()));
	    UserRole userRole = new UserRole();
	    userRole.setRole("ROLE_USER");
	    users.setEnable("1");
	    userRole.setUser(users);
	    users.setUserRole(userRole);
	    rda.addFlashAttribute("register", "Registration Successful");
	    userService.saveUser(users);
	    
	    return "redirect:/login";
	}

	
	@GetMapping("/user/homePage")
	public String userHome(Principal p, Model m) {
		Users users=userService.getUserbyUsername(p.getName());
		m.addAttribute("user",users);
		return"user/userdash";
	}
	
	@GetMapping("/dashboard")
	public String  HomePageMain(Principal p, Model m) {
		if(p==null) {
			return"redirect:/login";
		}
		Users users=userService.getUserbyUsername(p.getName());
		if(users.getUserRole().getRole().equals("ROLE_ADMIN"))
		{
			return"redirect:/admin/home";
		}
		else if(users.getUserRole().getRole().equals("ROLE_USER"))
		{
		return"redirect:/user/homePage";
	}
		return"home";
	}
		
	@GetMapping("user/MyProfile")
	public String myProfile(Principal p, Model m) {
		Users users=userService.getUserbyUsername(p.getName());
		m.addAttribute("users",users);
		return"user/ProfileUpdate";
	}
	
	@PostMapping("/user/updateProfile")
	public String updateProfile(@ModelAttribute Users user, Principal p, Model m) {
	Users users=userService.getUserbyUsername(p.getName());
	if(users!=null) {
		users.setName(user.getName());
		users.setAddress(user.getAddress());
		users.setAge(user.getAge());
		users.setCiti_no(user.getCiti_no());
		users.setEmail(user.getEmail());
		user.setUsername(user.getUsername());
		userService.update(users);
	}
	return"redirect:/user/MyProfile";
}
	
	@PostMapping("/user/updatePassoword/{id}")
	public String updatePassoword(@PathVariable int id, 
			@RequestParam(name="newPass") String newPassword,
			@RequestParam(name="conPass") String confirmPassword,
			RedirectAttributes ra)
	{
		Users users=userService.getById(id);
		if(passwordEncoder.matches(newPassword, users.getPassword())) {
			if(passwordEncoder.matches(confirmPassword, users.getPassword())) {
				ra.addFlashAttribute("passwordchange","Password same as previous");
			}
			else {
				users.setPassword(passwordEncoder.encode(newPassword));
				userService.saveUser(users);
				ra.addFlashAttribute("successPass","Passwprd changed successfuly");
			}
			 
				ra.addFlashAttribute("noChange","Error changing password");
			}
			return"redirect:/user/MyProfile";
		}
	
	@PostMapping("/user/deleteAccount/{id}")
	public String deleteAccount(@PathVariable int id,Principal p, Model m) {
		Users users=userService.getById(id);
				if(users!=null) {
					userService.delete(users);
				}
				return"redirect:/login";
	}
	//display the properties to the user
	@GetMapping("user/allProperties")
	public String showProperties(Model model,Principal p) {
		if(p!=null) {
			Users users=userService.getUserbyUsername(p.getName());
			model.addAttribute("user",users);
			model.addAttribute("fav", favouriteService.getByUser(users)); 
			model.addAttribute("req",requestService.getByUser(users));
		}
	    List<Property> properties = propertyService.getAllProperties();
	    model.addAttribute("properties", properties); 
	    return "Property/AllProperties";
	}
	
	//details about the property
	@GetMapping("user/propertiesdetails/{id}")
	public String showProperties(@PathVariable int id,Model model,Principal p) {
		if(p!=null) {
			Users users=userService.getUserbyUsername(p.getName());
			model.addAttribute("user",users);
		}
	   // Property properties = propertyService.getById(id);
	    model.addAttribute("pro", propertyService.getById(id)); 
	    return "Property/ShowPropertyDetails";
	}
	
}