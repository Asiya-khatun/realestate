package com.asiya.realestate.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.asiya.realestate.entity.Property;
import com.asiya.realestate.entity.Users;
import com.asiya.realestate.service.FUploadService;
import com.asiya.realestate.service.PropertyService;
import com.asiya.realestate.service.UserService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin")
public class PropertyController {
	@Autowired
	private PropertyService propertyService;
	@Autowired
	private FUploadService fUploadService;
	@Autowired
	private UserService userService;

	@GetMapping("/addProperty")
	public String addProperty(Principal p, Model m) {
		String username = p.getName();
		m.addAttribute("users", username);
		m.addAttribute("properties", propertyService.getAllProperties());
		return "Property/AddProperty";
	}

	@PostMapping("/addProperty")
	public String addingProperty(@Valid @ModelAttribute Property property, Model m, RedirectAttributes ra,
			BindingResult br) {
if(br.hasErrors()) {
	m.addAttribute("errors",br);
	return"admin/addProperty";
}
		if (fUploadService.uploadImage(property.getiFile(), "image")) {
			String image = "image/" + property.getiFile().getOriginalFilename();
			property.setImageName(image);
			propertyService.save(property);
			// ra.addFlashAttribute("property_success",)
			return "redirect:/admin/showProperty";
		}

		return "redirect:/admin/addProperty";
	}

	@GetMapping("/showProperty")
	public String showProperty(Model m) {
		List<Property> property = propertyService.getAllProperties();
		m.addAttribute("properties", property);
		return "Property/ShowProperty";
	}

	@GetMapping("/edit/{id}")
	public String editProperty(@PathVariable Integer id, Model m, Principal p) {
		Users users = userService.getUserbyUsername(p.getName());
		m.addAttribute("user", users);
		m.addAttribute("edit", true);
		m.addAttribute("property", propertyService.getById(id));
		m.addAttribute("propert_list", propertyService.getAllProperties());
		return "Property/AddProperty";

	}

	@PostMapping("/editProperty")
	public String updateProperty(@ModelAttribute Property property, @RequestParam("pevImage") String pevImg,
			RedirectAttributes redirectAttributes) {

		if (property.getiFile().isEmpty()) {
			property.setImageName(pevImg);
		} else {
			if (fUploadService.uploadImage(property.getiFile(), "image")) {
				String imageName = "image/" + property.getiFile().getOriginalFilename();
				property.setImageName(imageName);
			}
		}
		propertyService.update(property);
		return "redirect:/admin/showProperty";
	}

	@PostMapping("/deleteProperty/{id}")
	public String deleteProperty(@PathVariable Integer id, Model m) {

		Property property = propertyService.getById(id);
		if (property != null) {
			propertyService.delete(property);
			return "redirect:/admin/addProperty";
		}

		return "redirect:/admin/showProperty";
	}

}
