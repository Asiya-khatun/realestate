package com.asiya.realestate.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="favourite")
public class Favourite  implements Serializable{
	private static final long serialVersionUID=1l;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	@Column(name="fav_id")
	private int fav_id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private Users users;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="property_id")
	private Property property;
	
	@Column(name="added_date")
	private LocalDateTime added_Date;

	public Favourite() {
		super();
	}

	public Favourite(int fav_id, Users users, Property property, LocalDateTime added_Date) {
		super();
		this.fav_id = fav_id;
		this.users = users;
		this.property = property;
		this.added_Date = added_Date;
	}

	public int getFav_id() {
		return fav_id;
	}

	public void setFav_id(int fav_id) {
		this.fav_id = fav_id;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	public LocalDateTime getAdded_Date() {
		return added_Date;
	}

	public void setAdded_Date(LocalDateTime added_Date) {
		this.added_Date = added_Date;
	}
	
	
	

}
