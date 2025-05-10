package com.asiya.realestate.controller;


import java.security.Principal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;

import org.eclipse.angus.mail.handlers.image_gif;
import org.hibernate.sql.results.graph.instantiation.internal.ArgumentDomainResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.configurers.oauth2.client.OAuth2LoginConfigurer.RedirectionEndpointConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.asiya.realestate.entity.Favourite;
import com.asiya.realestate.entity.PropRequest;
import com.asiya.realestate.entity.Property;
import com.asiya.realestate.entity.Requested;
import com.asiya.realestate.entity.Users;
import com.asiya.realestate.enums.Status;
import com.asiya.realestate.service.FavouriteService;
import com.asiya.realestate.service.MailService;
import com.asiya.realestate.service.PropertyService;
import com.asiya.realestate.service.RequestService;
import com.asiya.realestate.service.RequestedService;
import com.asiya.realestate.service.UserService;

@Controller
public class RequestController {
	
	@Autowired
	private RequestService requestService;
	@Autowired
	private UserService userService;
	
	@Autowired
	private PropertyService propertyService;
	@Autowired
	private MailService mailService;
	@Autowired
	private FavouriteService favouriteService;
	@Autowired
	private RequestedService requestedService;
	
	@GetMapping("/admin/requests")
	public String viewRequests(Model model,Principal p) {
		Users user= userService.getUserbyUsername(p.getName());
		model.addAttribute("user",user);
		List<PropRequest> request=requestService.getAllPendingRequests();
		model.addAttribute("request",request);
		return"admin/ShowRequest";
	}

	
	@PostMapping("/user/sendrequest/{id}")
	public String sendRequest(@ModelAttribute PropRequest propRequest,Model m,Principal p,@PathVariable int id,RedirectAttributes ra) throws Exception {
		Users user=userService.getUserbyUsername(p.getName());
		Property property=propertyService.getById(id);
		List<PropRequest> request=requestService.getByUser(user);
	 
		propRequest.setProperty(property);
		propRequest.setReq_Date(LocalDate.now());
		propRequest.setUser(user);
		propRequest.setStatus(Status.PENDING);
		requestService.saveReq(propRequest);
		ra.addFlashAttribute("added","Sent Request to the Owner");
			return"redirect:/user/showFav/" + user.getId();
	}
	
	@PostMapping("/admin/accept/{id}")
	public String response(Principal p, Model m, @PathVariable int id, RedirectAttributes ra) {
	    Users adminUser = userService.getUserbyUsername(p.getName()); 
	    PropRequest request = requestService.approveRequest(id);
	    Users requestedUser = request.getUser(); 

	    ra.addFlashAttribute("message", "Request Approved");	    
	    if (request.getStatus() == Status.APPROVED) {
	       
	        List<Favourite> favList = favouriteService.getByUser(requestedUser);

	        for (Favourite fav : favList) {
	            if (fav.getProperty().getId() == request.getProperty().getId()) {
	                favouriteService.deleteFav(fav);
	             
	                break; 
	            }
	        }

	    }
	    // Send email notification
	    String subject = "Visit Request Confirmed";
	    String message = "Visit request " + request.getStatus() +
	                     "\nLocation: " + request.getProperty().getLocation() +
	                     "\nCategory: " + request.getProperty().getCategory() +
	                     "\nPrice: " + request.getProperty().getPrice() +
	                     "\nRequested on: " + request.getReq_Date();

	    mailService.sendMail(requestedUser.getEmail(), subject, message);

	    return "redirect:/admin/requests";
	}

	
	@PostMapping("/admin/decline/{id}")
	public String decline(@PathVariable int id, Model m,RedirectAttributes ra)
	{
		PropRequest request=requestService.declineRequest(id);
		ra.addFlashAttribute("message","Request Declined");
		String subject="Visit Request";
		Users requestedUser=request.getUser();
		if(request.getStatus()==Status.DECLINED) {
			List<Favourite> favProperty=favouriteService.getByUser(requestedUser);
			
			for(Favourite favItem:favProperty) {
				if(favItem.getProperty().getId()==request.getProperty().getId()) {
					request.setStatus(Status.PENDING);
					favouriteService.deleteFav(favItem);
					requestService.deleteReq(request);
				}
			}
		}
		String message="Visit request has been"+ request.getStatus()+" \n Location: "+ request.getProperty().getLocation()+ "\n Category:"+ request.getProperty().getCategory()
				+	"\n Of Price" + request.getProperty().getPrice() +"\n Requested on:"+request.getReq_Date();
			mailService.sendMail(request.getUser().getEmail(), subject,message);
		return"redirect:/admin/requests";
	}
	
	//for displaying the response result to the user
	@GetMapping("/user/my-response")
	public String MyResponse(Principal p, Model m) {
		
		Users user=userService.getUserbyUsername(p.getName());
		List<PropRequest> request=requestService.getByUser(user);
		m.addAttribute("request",request);
	
		return"user/MyResponse";
				
		
	}
	@GetMapping("/admin/responded")
	public String AdminResponded(Model m, Principal p) {
	    m.addAttribute("user", userService.getUserbyUsername(p.getName()));

	    List<PropRequest> myRequest = requestService.getAllRequest();

//	    if (myRequest != null) {
//	        Date requestDate = myRequest.getReq_Date();  
//	        if (requestDate != null) {
//	            Calendar calendar = Calendar.getInstance();
//	            calendar.setTime(requestDate);  
//	            calendar.add(Calendar.DATE, 7);  
//	            myRequest.getReq_Date(calendar.getTime()); 
//	        }
//	    }

	    m.addAttribute("myrequest", myRequest);
	    return "admin/Allrequests";
	}

	

}
