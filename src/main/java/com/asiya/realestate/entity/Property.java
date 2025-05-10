package com.asiya.realestate.entity;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
@Entity
@Table(name="property")
public class Property implements Serializable {
		
	private  static final long serialVersionUID=1l;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="property_id")
	private int id;
	
	@NotNull(message = "Location is required")
	@Size(min=3, max=100, message="Location must be between 3 and 100 characters")
	@Pattern(regexp="^[a-zA-z0-9,\\s]+$",message = "Location contains only alphabets and numbers")
//	@Column(name="location")
	private String location;
	
	
	@NotNull(message = "Area is reuqired")
	@Size(min=3, max=10, message="Location must be between 3 and 10 characters")
	@Pattern(regexp="^[0-9,\\s]+$",message = "Area contains only numbers")
//	@Column(name="Total_area")
	private int area;
	
	@NotNull(message="Description is required")
	@Size(min=3, max=10, message="Location must be between 3 and 100 characters")
	@Pattern(regexp="^[a-zA-z0-9,\\s]+$",message = "Description contains  alphabets and numbers only")
//	@Column(name="description")
	private String description;
	
//	@Column(name="image_name")
	@Transient
	@NotNull(message= "Upload a propery image")
	private MultipartFile iFile;
    @Size(max = 255, message = "Image name cannot exceed 255 characters")

	private String imageName;
	
	
	
	
	@NotNull(message = "Price is required")
	@Size(min=3, max=100, message="Location must be between 3 and 100 characters")
	@Pattern(regexp="^[0-9,\\s]+$",message = "Price contains numbers")
//	@Column(name="targeted_price")
	private double price;
	
//	@Column(name="property_lists,nullable")
//	private PropertyList propertyList;
//	
//	
//	private enum PropertyList{
//        PARKING, ROOMS 
//	}
	
	@Enumerated(EnumType.STRING)
	@Column(name="category")
	private Category category;
	
	private enum Category{
		RESIDENTAL,
		COMMERCIAL,
		INDUSTRIAL,
		AGRICULTURE,
		SPECIAL_PURPOSE
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="user_id")
	private Users users;
	
	public Property() {
		super();
	}
	
	public Property(int id, String location, int area, String description, MultipartFile iFile, String imageName,
			String citi_image, double price, Category category) {
		super();
		this.id = id;
		this.location = location;
		this.area = area;
		this.description = description;
		this.iFile = iFile;
		this.imageName = imageName;
		this.price = price;
		this.category = category;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public int getArea() {
		return area;
	}


	public void setArea(int area) {
		this.area = area;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public MultipartFile getiFile() {
		return iFile;
	}


	public void setiFile(MultipartFile iFile) {
		this.iFile = iFile;
	}


	public String getImageName() {
		return imageName;
	}


	public void setImageName(String imageName) {
		this.imageName = imageName;
	}


	


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public Category getCategory() {
		return category;
	}


	public void setCategory(Category category) {
		this.category = category;
	}
	
	
	
	
	
	
	
	
		
	
	
}
